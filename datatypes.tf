#Data Types like list and Map: 
    
#From list: 
     
variable "myami" { 
   default = "ami-0230bd60aa48260c6" 
   type = string 
   description = "This is the ami-id of the instances" 
   sensitive = true 
} 
 
variable "mysizes" { 
  type = list(any) 
  default = [ "t2.micro","t3.micro","t2.nano" ] 
} 
 
resource "aws_instance" "new" { 
  ami           = var.myami 
  instance_type = var.mysizes[0] 
  tags = { 
    Name = "ec2-new" 
  } 
} 
 
resource "aws_instance" "new1" { 
  ami           = var.myami 
  instance_type = var.mysizes[1] 
  tags = { 
    Name = "ec2-new" 
  } 
} 
 
resource "aws_instance" "new2" { 
  ami           = var.myami 
  instance_type = var.mysizes[2] 
  tags = { 
    Name = "ec2-new" 
  } 
}

#

 #From Map: 
      
    variable "myami" { 
   default = "ami-0230bd60aa48260c6" 
   type = string 
   description = "This is the ami-id of the instances" 
   sensitive = true 
} 
 
variable "myinfo" { 
  type = map(any) 
  default = { 
    name1 = "new1" 
    type1 = "t2.small" 
    name2 = "new2" 
    type2 = "t3.small" 
    name3 = "new3" 
    type3 = "t3.micro" 
  } 
} 
 
resource "aws_instance" "new" { 
  ami           = var.myami 
  instance_type = var.myinfo.type1 
  tags = { 
    Name =  "My-${var.myinfo.name1}" 
  } 
} 
 
resource "aws_instance" "new1" { 
  ami           = var.myami 
  instance_type = var.myinfo.type2 
  tags = { 
    Name =  "My-${var.myinfo.name2}" 
  } 
} 
 
resource "aws_instance" "new2" { 
  ami           = var.myami 
  instance_type = var.myinfo.type3 
  tags = { 
    Name =  "MY-${var.myinfo.name3}" 
  } 
} 