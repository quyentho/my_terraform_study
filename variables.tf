variable "ports" {
  type = list(number)
  default = [22,80,433]
}
variable "path_to_public_key" {
  type = string
  default = "C:\\Users\\QuyenTho\\AWS\\mykey.pub"
}

variable "path_to_private_key" {
  type = string
  default = "C:\\Users\\QuyenTho\\AWS\\mykey"
}