# variable "sql_flexible_server_name" {
#   description = "Name of the SQL Flexible Server"
#   type        = string
# }

variable "sql_backup_retention_days" {
    description = "Number of days to retain backups"
    type        = number
}

variable "sql_geo_redundant_backup_enabled" {
    description = "Enable geo-redundant backup"
    type        = bool
}

variable "sql_replication_role" {
    description = "Replication role of the server"
    type        = string
}

variable "sql_sku_name" {
    description = "SKU name of the server"
    type        = string
}

variable "sql_storage_auto_grow_enabled" {
    description = "Enable auto grow for storage"
    type        = bool
}

variable "sql_io_scaling_enabled" {
    description = "Enable IO scaling"
    type        = bool
}

variable "sql_iops" {
    description = "IOPS for the server"
    type        = number
}

variable "sql_storage_size_gb" {
    description = "Storage size in GB"
    type        = number
}

variable "sql_version" {
    description = "Version of the SQL server"
    type        = string
}

# variable "sql_tags" {
#     description = "Tags for the SQL server"
#     type        = map(string)
# }

# variable "sql_admin_name" {
#     description = "Administrator login name for the SQL server"
#     type        = string
# }

# variable "sql_admin_password" {
#     description = "Administrator password for the SQL server"
#     type        = string
# }