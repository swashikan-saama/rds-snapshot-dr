data "aws_db_cluster_snapshot" "db_snapshot" {
   for_each              = toset(var.snapshot_names)
   db_cluster_identifier = each.value
   most_recent           = true
}

resource "aws_rds_cluster_instance" "default" {
  for_each                = toset(var.snapshot_names)
  identifier              = "dr-rds-db-${each.key}-instance"
  cluster_identifier      = aws_rds_cluster.default[each.key].id
  instance_class          = var.db_instance_class
  engine                  = var.engine
}

resource "aws_rds_cluster_instance" "default_1" {
  for_each                = toset(var.snapshot_names)
  identifier              = "dr-rds-db-${each.key}-instance-reader"
  cluster_identifier      = aws_rds_cluster.default[each.key].id
  instance_class          = var.db_instance_class
  engine                  = var.engine
}

resource "aws_rds_cluster" "default" {
  for_each                     = toset(var.snapshot_names)
  cluster_identifier           = "dr-rds-db-${each.key}-cluster"
  snapshot_identifier          = data.aws_db_cluster_snapshot.db_snapshot[each.key].id
  db_subnet_group_name         = var.db_subnet_group_name
  engine                       = var.engine
  engine_version	       = var.engine_version
  final_snapshot_identifier    = var.final_snapshot_name
  skip_final_snapshot          = true
}

