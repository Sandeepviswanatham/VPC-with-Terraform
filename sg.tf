resource "aws_security_group" "alb-sg" {
  name        = "allow_tls end user "
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-01c7b967e5a49ca88"

  ingress {
    description = "end user"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}


resource "aws_lb_target_group" "alb-tg" {
  name     = "jenkins-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.dev-vpc.id
}
