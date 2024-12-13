import sys

NO_CACHE = 'ALTER SESSION SET USE_CACHED_RESULT=FALSE;'

def getUniqueQuery(queryNum, identifier): 
    if queryNum == 1: 
        return f'''
            select
                '{identifier}'
                l_returnflag,
                l_linestatus,
                sum(l_quantity) as sum_qty,
                sum(l_extendedprice) as sum_base_price,
                sum(l_extendedprice * (1-l_discount)) as sum_disc_price,
                sum(l_extendedprice * (1-l_discount) * (1+l_tax)) as sum_charge,
                avg(l_quantity) as avg_qty,
                avg(l_extendedprice) as avg_price,
                avg(l_discount) as avg_disc,
                count(*) as count_order
            from
                lineitem
            where
                l_shipdate <= dateadd(day, -90, to_date('1998-12-01'))
            group by
                l_returnflag,
                l_linestatus
            order by
                l_returnflag,
                l_linestatus;'''
    elif queryNum == 5: 
        return f'''
            SELECT '{identifier}', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
            FROM customer, orders, lineitem, supplier, nation, region
            WHERE c_custkey = o_custkey
            AND l_orderkey = o_orderkey
            AND l_suppkey = s_suppkey
            AND c_nationkey = s_nationkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'ASIA'
            AND o_orderdate >= to_date('1994-1-1')
            AND o_orderdate < dateadd(year, 1, to_date('1994-1-1'))
            --    AND o_orderdate >= MDY(1,1,1994)
            --    AND o_orderdate < MDY(1,1,1994) + 1 UNITS YEAR
            GROUP BY n_name
            ORDER BY revenue DESC;'''
    elif queryNum==18:
        return f'''
            select
                '{identifier}'
                c_name,
                c_custkey,
                o_orderkey,
                o_orderdate,
                o_totalprice,
                sum(l_quantity)
            from
                customer,
                orders,
                lineitem
            where
                o_orderkey in (
                select
                l_orderkey
                from
                lineitem
                group by
                l_orderkey having
                    sum(l_quantity) > 300
                )
                and c_custkey = o_custkey
                and o_orderkey = l_orderkey
            group by
                c_name,
                c_custkey,
                o_orderkey,
                o_orderdate,
                o_totalprice
            order by
                o_totalprice desc,
                o_orderdate;'''
    else: 
        print("querynum must be 1, 5 or 18!!")
        sys.exit()

warehouses = ["BISON_WH_XS", "BISON_WH_S", "BISON_WH_M", "BISON_WH_L"]
scalefactors = [1, 10, 100, 1000]

n_iterations = int(sys.argv[1])

SQL_SCRIPT = "use database SNOWFLAKE_SAMPLE_DATA;\n"

for warehouse in warehouses: 
    SQL_SCRIPT += f"USE WAREHOUSE {warehouse};\n"

    for scalefactor in scalefactors: 
        SQL_SCRIPT += f"use schema snowflake_sample_data.tpch_sf{scalefactor};\n"

        for i in range(n_iterations): 
            SQL_SCRIPT += NO_CACHE
            SQL_SCRIPT += "\n"
            SQL_SCRIPT += getUniqueQuery(1, f"{warehouse}_Q1_SF{scalefactor}")

            SQL_SCRIPT += NO_CACHE
            SQL_SCRIPT += "\n"
            SQL_SCRIPT += getUniqueQuery(5, f"{warehouse}_Q5_SF{scalefactor}")

            SQL_SCRIPT += NO_CACHE
            SQL_SCRIPT += "\n"
            SQL_SCRIPT += getUniqueQuery(18, f"{warehouse}_Q18_SF{scalefactor}")
            SQL_SCRIPT += "\n"

with open("tphc_script.sql", "w") as outfile: 
    outfile.write(SQL_SCRIPT)