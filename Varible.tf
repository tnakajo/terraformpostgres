##############################################################################
# Account Variables
##############################################################################

variable "ibmcloud_api_key" {
description = "the IBM Cloud platform API key needed to deploy IAM enabled resources"
}

variable "resource_group" {
description = "the name of resource group"
default = "giurgp-npr-dst-qlikEn"
}

##############################################################################
# PostgreSQL variables
##############################################################################
variable "unique_id" {
description = "Unique prefix for the resources provisioned. Must begin with a letter"
default = "gie-qlik-dv1-dbp-001"
}

variable "service_endpoint" {
description = "Type of service endpoint to use. Options are public, private, or public-and-private."
default = "private"
}

variable "ibm_region" {
description = "The IBM Cloud region where the PostgreSQL DB will be provisioned."
default = "us-east"
}

variable "db_version" {
description = "Version of Database"
default = "9.6"
}

variable "memory_allocation_mb" {
description = "The memory size for the database in MB, split across all members. Min is 2048 (which is 2GB)."
default = "2048"
}

variable "disk_allocation_mb" {
description = "The disk size of the database in MB, split across all members. Min is 30720 (which is 30GB)."
default = "30720"
}

variable "replica_enabled" {
description = "Set to true if you want a slave/replica created for this database."
default = "false"
}

variable "replica_region" {
description = "The IBM Cloud region where the replica/slave will be provisioned."
default = "us-south"
}
