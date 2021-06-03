# You may need to restart the DB server manually on the console before to close open sessions
gcloud sql instances restart brokerage-master-12 --project=experimental-258714

# Delete existing
gcloud sql databases delete brokerage-master-database --instance=brokerage-master-12 --project=experimental-258714

# Create new empty
gcloud sql databases create brokerage-master-database --instance=brokerage-master-12 --project=experimental-258714

# make sure you have a recent db copy in experimental
gsutil cp gs://adtrac-db-backups/11-12-2020_00-00-sql-dump.gz gs://adtrac-experimental-db-backups/

# import
gcloud sql import sql brokerage-master-12 gs://adtrac-experimental-db-backups/11-12-2020_00-00-sql-dump.gz --database=brokerage-master-database --project=experimental-258714
