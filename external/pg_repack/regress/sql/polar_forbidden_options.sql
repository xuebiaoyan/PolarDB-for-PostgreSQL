-- Some options are forbidden because they are dangerous or useless in PolarDB
-- Test them in this file.

--
-- tablespace option is forbidden because user cannot create tablespace in PolarDB
--
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --no-order --table=testts1 --tablespace testts
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --no-order --table=testts1 -s testts

--
-- --moveidx/-S option has to be used together with --tablespace option and it's forbidden since --tablespace is forbidden
--
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --no-order --table=testts1 --moveidx
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --no-order --table=testts1 -S
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --no-order --table=testts1 --tablespace testts --moveidx
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --no-order --table=testts1 -s testts -S

--
-- It's dangerous to repack all databases
--
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack -a
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --all --only-indexes
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack -a --schema=test_schema1
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --all --schema=test_schema1 --only-indexes
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --all --table=t1
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack -a --table=t1 --only-indexes

--
-- It's dangerous to repack the whole database
--
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --only-indexes

--
-- It's dangerous to repack schema
--
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack -c=test_schema1 --schema=test_schema2
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --schema=test_schema1 --only-indexes
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack -c=test_schema1 --table=tbl1
\! pg_repack -T 3600 -k -U polar_repack_superuser --dbname=contrib_regression_pg_repack --schema=exclude_extension_schema --exclude-extension=dummy_extension --exclude-extension=dummy_extension