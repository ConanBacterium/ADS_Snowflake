import pandas as pd 
import matplotlib.pyplot as plt 
import seaborn as sns

query_analysis_df = pd.read_csv("analyse_query_history_result.csv", header=0)
name_queryhash_df = pd.read_csv("snowflake_tpch_query_hashes.csv", header=0)

df = pd.merge(query_analysis_df, name_queryhash_df, on="QUERY_PARAMETERIZED_HASH", how="outer")

df["AVG(MB_SCANNED)"] = df["AVG(BYTES_SCANNED)"].apply(lambda x: x / 1000000)

df["WAREHOUSE"] = df["NAME"].apply(lambda x: "_".join(x.split("_")[:3]))
df["QUERY"] = df["NAME"].apply(lambda x: "_".join(x.split("_")[3:4]))
df["SCALEFACTOR"] = df["NAME"].apply(lambda x: "_".join(x.split("_")[4:5]))

print(df.head())

q1 = df[df['QUERY'] == 'Q1']
q5 = df[df['QUERY'] == 'Q5']
q18 = df[df['QUERY'] == 'Q18'] 

# What do I want to show? Scalefactor vs warehouse? mb_scanned vs execution time?
q1_scalefactor1 = q1[q1["SCALEFACTOR"] == "SF1"]
q1_scalefactor10 = q1[q1["SCALEFACTOR"] == "SF10"]
q1_scalefactor100 = q1[q1["SCALEFACTOR"] == "SF100"]
q1_scalefactor1000 = q1[q1["SCALEFACTOR"] == "SF1000"]

print(q1_scalefactor1[["MEAN_ELAPSED_TIME", "WAREHOUSE"]])

# warehouse_dfs = {name: group for name, group in df.groupby('WAREHOUSE')}
# # print(q1_warehouse_dfs["BISON_WH_XS"])
# mb_vs_time(warehouse_dfs["BISON_WH_XS"], "BISON_WH_XS")


warehouses = df['WAREHOUSE'].unique()

# Create a separate figure for each warehouse
for warehouse in warehouses:
    warehouse_data = df[df['WAREHOUSE'] == warehouse]

    # First create pivot table with queries as columns and scalefactors as rows
    pivot_df = warehouse_data.pivot(index='SCALEFACTOR', columns='QUERY', values='MEAN_ELAPSED_TIME')

    # Normalize by row (each scalefactor)
    normalized_pivot = pivot_df.div(pivot_df.max(axis=1), axis=0)
    # This means the slowest query for each scale factor will be 1.0
    # Other queries will show their relative speed (e.g., 0.5 means half as slow)

    # Create heatmap
    plt.figure(figsize=(10, 8))
    sns.heatmap(normalized_pivot, annot=True, fmt='.2f', cmap='YlOrRd_r')
    plt.title(f'Relative Query Performance by Scale Factor for Warehouse {warehouse}')
    plt.xlabel('Query')
    plt.ylabel('Scale Factor')
    plt.savefig(f"figs/relative_query_performance_by_scalefactor_for_warehouse_{warehouse}.png")
    # plt.show()

    # Also print the raw values if needed
    print("\nRaw execution times:")
    print(pivot_df)
    print("\nNormalized values:")
    print(normalized_pivot)


######## by warehouse see
# First get unique warehouses
warehouses = df['WAREHOUSE'].unique()

# Create a separate figure for each warehouse
for warehouse in warehouses:
    warehouse_data = df[df['WAREHOUSE'] == warehouse]
    
    n_scalefactors = len(warehouse_data['SCALEFACTOR'].unique())
    
    # Add extra height for the title
    fig, axes = plt.subplots(1, n_scalefactors, figsize=(6*n_scalefactors, 7))
    
    if n_scalefactors == 1:
        axes = [axes]
    
    for (idx, (scalefactor, group)) in enumerate(warehouse_data.groupby('SCALEFACTOR')):
        group.plot(kind='bar',
                  x='QUERY',
                  y='MEAN_ELAPSED_TIME',
                  ax=axes[idx],
                  title=f'{scalefactor}')
        
        axes[idx].set_xlabel('Query')
        axes[idx].set_ylabel('Mean Execution Time (ms)')
        axes[idx].tick_params(axis='x', rotation=45)
        axes[idx].grid(True, axis='y')
    
    # Add title with padding
    plt.suptitle(f'Query Execution Times - {warehouse}', y=0.95, fontsize=16)
    
    # Adjust layout with additional padding at the top
    plt.tight_layout()
    plt.subplots_adjust(top=0.90)  # Make space for the title
    
    plt.savefig(f"figs/query_execution_times_{warehouse}.png", bbox_inches='tight', pad_inches=0.3)
    plt.close()  # Close the figure to free memory

##########


correlations = []

for (warehouse, query), group in df.groupby(['WAREHOUSE', 'QUERY']):
    correlation = group['AVG(MB_SCANNED)'].corr(group['MEAN_ELAPSED_TIME'])
    correlations.append({
        'WAREHOUSE': warehouse,
        'QUERY': query,
        'CORRELATION': correlation,
        'DATA_POINTS': len(group) 
    })

corr_df = pd.DataFrame(correlations)

print("\nDetailed Correlations:")
print(corr_df)



# plt.show()