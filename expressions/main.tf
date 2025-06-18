terraform {
  
}
variable "hello" {
    type = string
}
variable "planets" {
  description = "The name of the planet"
  type        = string
}
variable "songs" {
  description = "Types of songs"
  type        = list
  
}
variable "sample_songs" {
    description = "Mapping songs"
    type = map
  
}

variable "splatzz" {
    description = "We want to see how splatz works"
    type = list
  
}