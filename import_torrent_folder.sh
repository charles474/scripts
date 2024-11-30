#!/bin/bash

# Operations
NO_CONFIRM="no-confirm"
DRY_RUN="dry-run"


# TODO: Update list of directories or leave empty
RADARR_DIRECTORIES=(
""
)

# TODO: Update list of directories or leave empty
SONARR_DIRECTORIES=(
""
)

# TODO: Update operation mode
OPERATION_MODE=$DRY_RUN

###################################################################################################
###################################################################################################
#                                                                                                 #
#                                          START OF EXECUTION                                     #
#                                                                                                 #
###################################################################################################
###################################################################################################

# TODO: Update path to script (if required)
cd $HOME/docker-apps/media-server/blackhole

##################################################
# RADARR EXECUTION                               #
##################################################

if [ "$OPERATION_MODE" == "dry-run" ]; then
    echo "RADARR: Dry Run Imports Started"
else
    echo "RADARR: Imports Started"
fi

echo "_____________________________________________"
echo

# Radar importing
for RADARR_DIRECTORY in "${RADARR_DIRECTORIES[@]}"
do
    if [ "$RADARR_DIRECTORY" != "" ]; then
        python3 import_torrent_folder.py --directory "$RADARR_DIRECTORY" --radarr --$OPERATION_MODE
    fi
done

echo

if [ "$OPERATION_MODE" == "dry-run" ]; then
    echo "RADARR: Dry Run Imports Completed"
else
    echo "RADARR: Imports Completed"
fi

echo
echo

##################################################
# SONARR EXECUTION                               #
##################################################

if [ "$OPERATION_MODE" == "dry-run" ]; then
    echo "SONARR: Dry Run Imports Started"
else
    echo "SONARR: Imports Started"
fi

echo "_____________________________________________"
echo

# Sonarr importing
for SONARR_DIRECTORY in "${SONARR_DIRECTORIES[@]}"
do
    if [ "$SONARR_DIRECTORY" != "" ]; then
        python3 import_torrent_folder.py --directory "$SONARR_DIRECTORY" --sonar --$OPERATION_MODE
    fi
done

echo

if [ "$OPERATION_MODE" == "dry-run" ]; then
    echo "SONARR: Dry Run Imports Completed"
else
    echo "SONARR: Imports Completed"
fi

echo