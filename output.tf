output "aurora_db_snapshot_id" {
   value = {
     for snapshot_name in var.snapshot_names :
     snapshot_name => data.aws_db_cluster_snapshot.db_snapshot[snapshot_name].id
   }
}
