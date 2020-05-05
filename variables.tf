variable "ssh-key" {
  description = "The file name of the ssh key in ~/.ssh"
}

variable "nodes" {
  type        = list(string)
  description = "The list of nodes eg: ['node1.example.com', '192.168.0.100']"
}

variable "user" {
  description = "The user name that we'll use to connect"
  default     = "ubuntu"
}

variable "outfile" {
  description = "The file that we'll write"
  default     = "cloud-tmux"
}

variable "ssh-args" {
  description = "Any SSH Args that you want to pass"
  default     = "-o ForwardAgent=yes -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
}

