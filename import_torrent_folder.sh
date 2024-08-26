#!/bin/bash

# Target clients
SONARR="sonar"
RADARR="radarr"

# Operations
NO_CONFIRM="no-confirm"
DRY_RUN="dry-run"



# TODO: Update list of directories or leave empty
RADARR_DIRECTORIES=(
"Caravaggios.Shadow.2022.BDREMUX.1080p.seleZen.mkv"
)

# TODO: Update list of directories or leave empty
SONARR_DIRECTORIES=(
"Beverly Hills, 90210"
)

# TODO: Update operation mode
OPERATION_MODE=$DRY_RUN



# Execute command
# TODO: Update path to script (if required)
cd $HOME/docker-apps/plex-media-server/blackhole-scripts

##################################################
# RADARR                                         #
##################################################

if [ "$OPERATION_MODE" -eq "dry-run" ]: then
    echo "RADARR: Dry Run Imports Started"
else
    echo "RADARR: Imports Started"
fi

echo
echo "__________________________________________________________________________________"

# Radar importing
for DIRECTORY in $RADARR_DIRECTORIES
do
    if [ "$DIRECTORY" != "" ]; then
        python3 import_torrent_folder.py --directory $DIRECTORY --$RADARR --$OPERATION_MODE
    fi
done

echo
echo

##################################################
# SONARR                                         #
##################################################

if [ "$OPERATION_MODE" -eq "dry-run" ]: then
    echo "SONARR: Dry Run Imports Started"
else
    echo "SONARR: Imports Started"
fi

echo
echo "__________________________________________________________________________________"

# Sonarr importing
for DIRECTORY in $SONARR_DIRECTORIES
do
    if [ "$DIRECTORY" != "" ]; then
        python3 import_torrent_folder.py --directory $DIRECTORY --$SONARR --$OPERATION_MODE
    fi
done

echo