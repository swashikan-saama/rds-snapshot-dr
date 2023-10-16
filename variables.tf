variable "db_instance_class" {
  description = "we are giving db's instance type"
  type        = string
  default     = "db.t3.medium"
}

variable "engine" {
  description = "we are providing engine for our db"
  type        = string
  default     = "aurora-postgresql"
}

variable "db_subnet_group_name" {
  description = "we are providing db's subnet group name"
  type        = string
  default     = "default-vpc-0661b46f7a45fa2d9"
}

variable "engine_version" {
  description = "we are providing engine version for our db engine"
  type        = string
  default     = "12.8"
}

variable "final_snapshot_name" {
  description = "we are providing snapshot name when deleting DR db's"
  type        = string
  default     = "dr-final-snapshot"
}

variable "snapshot_names" {
  description = "We are providing the Aurora Cluster DB's snapshot's names"
  type        = list(string)
  default     = ["vishnu", "abbvie", "pfizer"]
}

variable "instance_counts" {
  description = "we are providing Instance counts here"
  default     = 2
}
