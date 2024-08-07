variable "bd_learn_disable" {
  description = "Action: BD Learn Disable."
  type        = bool
  default     = false
}

variable "port_disable" {
  description = "Action: Port Disable."
  type        = bool
  default     = true
}

variable "admin_state" {
  description = "Admin state."
  type        = bool
  default     = false
}

variable "detection_interval" {
  description = "Detection interval. Minimum value: 30. Maximum value: 300."
  type        = number
  default     = 60

  validation {
    condition     = var.detection_interval >= 30 && var.detection_interval <= 300
    error_message = "Minimum value: 30. Maximum value: 300."
  }
}

variable "detection_multiplier" {
  description = "Detection multiplier. Minimum value: 1. Maximum value: 255."
  type        = number
  default     = 4

  validation {
    condition     = var.detection_multiplier >= 1 && var.detection_multiplier <= 255
    error_message = "Minimum value: 1. Maximum value: 255."
  }
}
