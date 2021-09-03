resource "aws_msk_cluster" "example" {
  cluster_name           = local.cluster_name
  kafka_version          = "2.6.2"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type   = "kafka.t3.small"
    ebs_volume_size = 1
    client_subnets  = module.vpc.private_subnets
    security_groups = [aws_security_group.msk.id]
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.example.name
      }
    }
  }
}

resource "aws_cloudwatch_log_group" "example" {
  name = "msk_broker_logs"
}

resource "aws_security_group" "msk" {
  name        = "${local.cluster_name}-kafka-brokers"
  vpc_id      = module.vpc.vpc_id
  description = "Allow Kafka traffic within VPC"

  ingress {
    from_port   = 9094
    to_port     = 9094
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
