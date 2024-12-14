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

# First create a numeric scale factor column by removing 'SF' and converting to int
df['NUMERIC_SCALEFACTOR'] = df['SCALEFACTOR'].str.replace('SF', '').astype(int)

# Now create the new column
df['TIME_PER_SCALE'] = df['MEAN_ELAPSED_TIME'] / df['NUMERIC_SCALEFACTOR']








warehouses = df['WAREHOUSE'].unique()

# Create one figure with 4 subplots
fig, axes = plt.subplots(2, 2, figsize=(15, 12))
axes = axes.flatten()

# For each warehouse
for idx, warehouse in enumerate(warehouses):
   warehouse_data = df[df['WAREHOUSE'] == warehouse]

   # For each query
   for query in sorted(warehouse_data['QUERY'].unique()):
       query_data = warehouse_data[warehouse_data['QUERY'] == query]
       
       # Calculate mean for each scale factor
       means = query_data.groupby('NUMERIC_SCALEFACTOR')['MEAN_ELAPSED_TIME'].mean()
       
       axes[idx].plot(means.index, means.values, marker='o', label=f'Query {query}')

   axes[idx].set_xscale('log')  # Log scale for scale factor
   axes[idx].set_yscale('log')  # Log scale for time
   axes[idx].grid(True)
   axes[idx].set_xlabel('Scale Factor (log scale)')
   axes[idx].set_ylabel('Mean Execution Time ms (log scale)')
   axes[idx].set_title(f'{warehouse}')
   axes[idx].legend()

plt.suptitle('Query Execution Time vs Scale Factor by Warehouse', y=0.95, fontsize=16)
plt.tight_layout()
plt.subplots_adjust(top=0.90)
plt.savefig("figs/query_scaling_comparison.png", bbox_inches='tight', pad_inches=0.3)
plt.close()#

input("enter to continue")

queries = df['QUERY'].unique()
warehouses = df['WAREHOUSE'].unique()

def sort_scalefactor(x):
    return int(x.replace('SF', ''))

# Create a figure for each query
for query in queries:
    fig, axes = plt.subplots(2, 2, figsize=(15, 12))
    axes = axes.flatten()
    
    # For each warehouse
    for idx, warehouse in enumerate(warehouses):
        # Get data for this query and warehouse
        data = df[(df['QUERY'] == query) & (df['WAREHOUSE'] == warehouse)]
        
        # Sort scale factors
        data = data.sort_values(by='SCALEFACTOR', key=lambda x: x.map(sort_scalefactor))
        
        # Normalize execution times relative to SF100
        sf100_time = data[data['SCALEFACTOR'] == 'SF100']['MEAN_ELAPSED_TIME'].values[0]
        data = data.copy()
        # Subtract 1 to get negative values when faster than SF100
        data['NORMALIZED_TIME'] = (data['MEAN_ELAPSED_TIME'] / sf100_time) - 1
        
        # Create bar plot
        data.plot(kind='bar',
                 x='SCALEFACTOR',
                 y='NORMALIZED_TIME',
                 ax=axes[idx],
                 title=f'{warehouse}')
        
        # Customize subplot
        axes[idx].set_xlabel('Scale Factor')
        axes[idx].set_ylabel('Relative Execution Time\n(0 = SF100, -0.5 = 50% faster, 0.5 = 50% slower)')
        axes[idx].tick_params(axis='x', rotation=45)
        axes[idx].grid(True, axis='y')
        
        # Add actual times as text on bars
        for i, v in enumerate(data['MEAN_ELAPSED_TIME']):
            y_pos = data['NORMALIZED_TIME'].iloc[i]
            # Adjust text position based on whether bar is positive or negative
            va = 'bottom' if y_pos >= 0 else 'top'
            axes[idx].text(i, y_pos, 
                         f'{v:,.0f}ms', 
                         ha='center', 
                         va=va)
    
    plt.suptitle(f'Query {query} Execution Times by Warehouse and Scale Factor\n(Normalized with SF100 as baseline, negative = faster)', 
                 y=0.95, fontsize=16)
    plt.tight_layout()
    plt.subplots_adjust(top=0.90)
    plt.savefig(f"figs/query_{query}_comparison_normalized_sf100.png", bbox_inches='tight', pad_inches=0.3)
    plt.close()

input("Press enter to continue")




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