provider "aws" {
  region = "us-east-1"
}

# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "zero-outage-cluster"
}

# Security Group
resource "aws_security_group" "ecs_sg" {
  name        = "ecs-security-group"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ECS Task Definition
resource "aws_ecs_task_definition" "app" {
  family                   = "zero-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = "arn:aws:iam::681986853681:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name  = "zero-app"
      image = "681986853681.dkr.ecr.us-east-1.amazonaws.com/zero-app:latest"
      essential = true

      portMappings = [
        {
          containerPort = 3000
        }
      ]

      # 🔐 Secrets from AWS Secrets Manager
      secrets = [
        {
          name      = "API_KEY"
          valueFrom = "arn:aws:secretsmanager:us-east-1:681986853681:secret:zero-app-secrets-24tS8i:API_KEY::"
        },
        {
          name      = "DB_URL"
          valueFrom = "arn:aws:secretsmanager:us-east-1:681986853681:secret:zero-app-secrets-24tS8i:DB_URL::"
        }
      ]
    }
  ])
}

# ECS Service
resource "aws_ecs_service" "app" {
  name            = "zero-app-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets = [
      "subnet-0acd31257e3e2accc",
      "subnet-02c866a8e923c48d1"
    ]

    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}