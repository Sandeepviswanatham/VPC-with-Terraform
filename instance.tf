resource "aws_instance" "apache" {
  ami           = "ami-094bbd9e922dc515d"

  instance_type = "t2.micro"
  key_name = "sandeep"
  vpc_security_group_ids = [aws_security_group.alb-sg.id]
  user_data = <<EOF
             #!/bin/bash
             yum update -y
             yum install httpd -y 
             systemctl enable httpd
             systemctl start httpd
             echo "this is valiball" >/var/www/html/valiball/index.html/
       EOF

  tags = {
    Name = "apache-ec2"
  }
}