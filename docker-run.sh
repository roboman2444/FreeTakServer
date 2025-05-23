#!/bin/bash

# Sharing for FTSConfig.yaml
if [[ ! -f "/opt/fts/FTSConfig.yaml" ]]
  then
    python -c "from FreeTAKServer.core.configuration.configuration_wizard import autogenerate_config; autogenerate_config()"
fi

#hack to get it to start
touch /opt/fts/FTSDataBase.db
mkdir /opt/fts/Logs/

python -m FreeTAKServer.controllers.services.FTS
