variable "key_name" {
  description = "Shubham-instance"
  type        = string
  default     = "Shubham-instance"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH"
  type        = string
  default     = "54.245.179.51" # Replace with your IP for better security
}
