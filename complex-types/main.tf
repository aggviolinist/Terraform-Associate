terraform {
  
}
variable "complex_one" {
    type = list
    default = ["One","Two","Three","Four"] 
}
# var.complex_one

variable "complex_two" {
    type = map
    default = {
        "PlanA" = "10 USD"
        "PlanB" = "20 USD"
        "PlanC" = "30 USD"
        "PlanD" = "40 USD"
    }
}
# var.complex_two

variable "complex_three" {
    type = object({
      f-name = string
      l-name = string
      amount = number
    })
  default = {
    f-name = "Aggressive",
    l-name = "Violinist"
    amount = 39072829
  }
}
# var.complex_three

variable "complex_four" {
    type = tuple([string,number,bool])
    default = ["iq",500,false ] 
}
# var.complex_four