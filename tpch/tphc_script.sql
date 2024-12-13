use database SNOWFLAKE_SAMPLE_DATA;
USE WAREHOUSE BISON_WH_XS;
use schema snowflake_sample_data.tpch_sf1;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf10;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF10'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf100;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF100'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf1000;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_XS_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_XS_Q18_SF1000'
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
                o_orderdate;
USE WAREHOUSE BISON_WH_S;
use schema snowflake_sample_data.tpch_sf1;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf10;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF10'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf100;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF100'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf1000;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_S_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_S_Q18_SF1000'
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
                o_orderdate;
USE WAREHOUSE BISON_WH_M;
use schema snowflake_sample_data.tpch_sf1;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf10;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF10'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf100;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF100'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf1000;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_M_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_M_Q18_SF1000'
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
                o_orderdate;
USE WAREHOUSE BISON_WH_L;
use schema snowflake_sample_data.tpch_sf1;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf10;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF10'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF10'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF10', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF10'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf100;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF100'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF100'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF100', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF100'
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
                o_orderdate;
use schema snowflake_sample_data.tpch_sf1000;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1000'
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
                o_orderdate;
ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q1_SF1000'
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
                l_linestatus;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            SELECT 'BISON_WH_L_Q5_SF1000', n_name, SUM(l_extendedprice * (1 - l_discount)) AS revenue
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
            ORDER BY revenue DESC;ALTER SESSION SET USE_CACHED_RESULT=FALSE;

            select
                'BISON_WH_L_Q18_SF1000'
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
                o_orderdate;
