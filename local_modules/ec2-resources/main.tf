resource "aws_instance" "dy_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.dy_key.key_name
  # subnet_id     = var.public_subnet_ids[0]
  subnet_id       = var.public_subnet_ids[0]
  security_groups = [aws_security_group.dy_sg.id]

  tags = {
    Name = "dy-instance"
  }
}

resource "aws_key_pair" "dy_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "dy_sg" {
  name   = "dy_sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
        from_port   = ingress.value["from_port"]
        to_port     = ingress.value["to_port"]
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dy-security-group"
  }
}

