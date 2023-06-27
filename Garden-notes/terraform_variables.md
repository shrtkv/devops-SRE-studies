# Terraform Variables

## variable .tf types

 type   |   example
        |   
string  |   "lorem"
number  |   1
bool    |   true/false
any     |   (default)
        |
list    |   ["lorem", "ipsum"] (same datatype)
map     |   pet1 = lorem
        |   pet2 = ipsum
object  |   complex data structure { a : 1 , ...}
tuplee  |    list with multiples datatypes



### List

> declaring variables.tf
    variable "prefix" {
        default = ["mr", "mrs", "sir"]
        type = list
    }
#### Set

- list without duplicated values

variable "sets" {
    default = ["item1", "item2", "item3"]
    type = set(string)
}

> using main.tf
resource "random_pet" "pet" {
    prefix = var.prefix[0] 
}

> you can declare the type of the list
variable "prefix" {
    default = ["mr", "mrs", "sir"]
    type = list(string)
}
variable "number" {
    default = ["13", "242", "643"]
    type = list(number)
}

### Map

variable file-content {
    type = map
    default = {
        "statement1" = "Lorem ipsum"
        "statement2" = "Other ipsum"
        "statement3" = "No ipsum"
    }
}

resource local_file my-subject {
    filename = "./subjects/subjects.txt"
    content = var.file-content.["statement1"]
}

variable file-content {
    type = map(number)
    default = {
        "content1" = "111"
        "content2" = "222"
        "content3" = "333"
    }
}

### Objects

variable "subject1" {
    type = object ({
        prop_a = string
        prop_b = string
        prop_c = list(string)
        prob_d = bool
        ...
    })
}


### Tuple


variable subject {
type = tuple ([string, number, bool])
default = ["person", 5, true]
}



## Declaring / using variables


- interactive mode (input on apply)
- command-line mode (-var "filename=./file.txt" - var "content=blablabla"...)
- enviroment variables ($ export TF_VAR_filename="filename=./file.txt" | $ export content="blablabla" ...terraform apply )
- variable definition files (default is terraform.tfvars / terraform.vars.json or pass the custom $ terraform apply -var-file customname.tfvars )

