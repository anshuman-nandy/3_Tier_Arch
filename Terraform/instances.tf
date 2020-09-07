resource "aws_instance" "nat" {
  ami                         = "ami-09b89ad3c5769cca2"
  availability_zone           = "eu-west-2b"
  instance_type               = "m1.small"
  key_name                    = "my_test_key"
  vpc_security_group_ids      = [aws_security_group.nat.id]
  subnet_id                   = aws_subnet.sn-public.id
  associate_public_ip_address = true
  source_dest_check           = false

  tags = {
    Name = "VPC NAT"
  }
}

resource "aws_instance" "web-1" {
  ami                         = var.amis
  availability_zone           = "eu-west-2b"
  instance_type               = "m1.small"
  key_name                    = "my_test_key"
  vpc_security_group_ids      = [aws_security_group.web.id]
  subnet_id                   = "aws_subnet.sn-public.id"
  associate_public_ip_address = true
  source_dest_check           = false


  tags = {
    Name = "Web Server 1"
  }
}

resource "aws_instance" "db-1" {
  ami                    = var.amis
  availability_zone      = "eu-west-2b"
  instance_type          = "m1.small"
  key_name               = "my_test_key"
  vpc_security_group_ids = [aws_security_group.db.id]
  subnet_id              = "aws_subnet.sn-private.id"
  source_dest_check      = false

  tags = {
    Name = "DB Server 1"
  }
}
