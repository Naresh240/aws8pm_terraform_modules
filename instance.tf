resource "aws_instance" "example" {
  count         = var.inst_count
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "Helloworld"
  }
}