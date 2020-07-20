##############################################################################
# IBM Cloud Provider
##############################################################################

provider "ibm" {
ibmcloud_api_key = var.ibmcloud_api_key
region = var.ibm_region
generation = 2
ibmcloud_timeout = 60
}

provider "ibm" {
alias = "replica_region"
region = var.replica_region
ibmcloud_api_key = var.ibmcloud_api_key
generation = 2
ibmcloud_timeout = 60
}

##############################################################################
# Resource Group
##############################################################################
data "ibm_resource_group" "group" {
name = var.resource_group
}

##############################################################################
# PostgreSQL Master
##############################################################################
resource "ibm_database" "psql" {
name = var.unique_id
plan = "standard"
location = var.ibm_region
service = "databases-for-postgresql"
resource_group_id = data.ibm_resource_group.group.id
service_endpoints = var.service_endpoint
members_memory_allocation_mb = var.memory_allocation_mb
members_disk_allocation_mb = var.disk_allocation_mb
version = var.db_version
adminpassword = "xxxxxxxxxxxxxxxxxx"
users {
name = "postgres"
password = "xxxxxxxxxxxxxxxxxxx"
}
}

##############################################################################

##############################################################################
# PostgreSQL Replica
##############################################################################
resource "ibm_database" "psql_replica" {
count = var.replica_enabled ? 1 : 0
name = "${var.unique_id}-s1"
plan = "standard"
location = var.replica_region
service = "databases-for-postgresql"
resource_group_id = data.ibm_resource_group.group.id
service_endpoints = var.service_endpoint
members_memory_allocation_mb = var.memory_allocation_mb
members_disk_allocation_mb = var.disk_allocation_mb
remote_leader_id = ibm_database.psql.id
}

##############################################################################
