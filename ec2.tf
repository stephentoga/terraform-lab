provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "patrollie-ec2" {
  ami           = "ami-09f2114fecbe506e2"
  instance_type = "t2.micro"
 key_name = "patronelli"
  security_groups = ["${aws_security_group.allow_rdp-2-patronelli.name}"]

}

resource "aws_security_group" "allow_rdp-2-patronelli" {
  name        = "allow_rdp-2-patronelli"
  description = "Allow rdp traffic"


  ingress {

    from_port   = 3389 
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}
