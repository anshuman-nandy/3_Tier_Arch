resource "aws_security_group" "nat" {
  name        = "vpc_nat"
  description = "Can access both subnets"
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "NATSG"
  }

  ingress = [

    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.private_subnet_cidr]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },

    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [var.private_subnet_cidr]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },

    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    {
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]

  egress = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.vpc_cidr]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    {
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]

}

resource "aws_security_group" "web" {
  name        = "vpc_web"
  description = "Allow incoming HTTP connections."
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "WebServerSG"
  }

  ingress = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    {
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]
  egress = [
    { # MySQL
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = [var.private_subnet_cidr]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]

}


resource "aws_security_group" "db" {
  name        = "vpc_db"
  description = "Allow incoming database connections."
  vpc_id      = aws_vpc.main_vpc.id

  tags = {
    Name = "DBServerSG"
  }

  ingress = [
    { # MySQL
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      security_groups  = [aws_security_group.web.id]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      cidr_blocks      = [var.vpc_cidr]
    },

    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.vpc_cidr]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },

    {
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = [var.vpc_cidr]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]

  egress = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "NA"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]

}
