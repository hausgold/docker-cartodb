CREATE EXTENSION plpythonu;
CREATE EXTENSION postgis;
CREATE EXTENSION cartodb;
CREATE EXTENSION cdb_geocoder;
CREATE EXTENSION plproxy;
CREATE EXTENSION cdb_dataservices_server;
CREATE EXTENSION cdb_dataservices_client;

SELECT CDB_Conf_SetConf('redis_metadata_config', '{"redis_host": "localhost", "redis_port": 6379, "sentinel_master_id": "", "timeout": 0.1, "redis_db": 5}');
SELECT CDB_Conf_SetConf('redis_metrics_config', '{"redis_host": "localhost", "redis_port": 6379, "sentinel_master_id": "", "timeout": 0.1, "redis_db": 5}');

-- SELECT CDB_Conf_SetConf('heremaps_conf', '{"geocoder": {"app_id": "here_geocoder_app_id", "app_code": "here_geocoder_app_code", "geocoder_cost_per_hit": "1"}, "isolines" : {"app_id": "here_isolines_app_id", "app_code": "here_geocoder_app_code"}}');
SELECT CDB_Conf_SetConf('user_config', '{"is_organization": false, "entity_name": "geocoder"}');
-- SELECT CDB_Conf_SetConf('mapzen_conf', '{"routing": {"api_key": "valhalla_app_key", "monthly_quota": 999999}, "geocoder": {"api_key": "search_app_key", "monthly_quota": 999999}, "matrix": {"api_key": "[your_matrix_key]", "monthly_quota": 1500000}}');
SELECT CDB_Conf_SetConf('logger_conf', '{"geocoder_log_path": "/tmp/geocodings.log"}');

-- Environment to decide: rollbar message, which servers for third party use, etc. If not setted uses production by default (current behavior)
SELECT CDB_Conf_SetConf('server_conf', '{"environment": "development"}');
