variable "service" {
  type    = string
  default = "app-gitops"
}

variable "url" {
  type    = string
  default = "https://gitlab.com"
}

variable "gitlab_token" {
  type = string
  # default = ""
}
