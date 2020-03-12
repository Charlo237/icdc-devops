#!/bin/bash

serverList=$1
slack_url=$2
slackHeaders="\"Content-type: application/json\""

# POST function to send to Slack
post_message_to_slack(){
        curlCMD="curl --request POST --header $slackHeaders --data $payload $slack_url"
        slackError=$(eval $curlCMD)
        #echo "Slack Error:   $slackError"
        }

for i in $serverList
do
    graphURL="http://$i.nci.nih.gov:7474/graphql/"
    error=$(curl --write-out %{http_code} --silent --output /dev/null $graphURL)
    #echo $error

    if [[ $error -eq '200' ]] || [[ $error -eq '401' ]]
    then
        echo "The graph QL endpoint on $i is available"
    else
        echo "The graph QL endpoint on $i is NOT responding - please verify that this application is working"
        slack_message="The graph QL endpoint on $i is NOT responding - please verify that this application is working"
        payload="\"{\\\"text\\\":\\\"$slack_message\\\"}\""
        post_message_to_slack
    fi
done
