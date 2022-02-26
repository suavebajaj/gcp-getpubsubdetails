# This script will give you the details regarding all the Pub/Sub Queues in the GCP Projects
# Author Suave Bajaj
gcloud projects list | grep -e prd | awk -F " " '{print $1}' > pubsub.txt
for nameofproject in `cat pubsub.txt`;
do 
 echo "\n$nameofproject"
 pubsub=`gcloud pubsub subscriptions list --project=$nameofproject | grep -i name \  
 | cut -d'/' -f 4` 
 # Additonal you can use grep -v -e name to ignore specific words
 echo "\n$pubsub" 
done
