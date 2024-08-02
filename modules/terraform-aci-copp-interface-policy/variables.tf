variable "name" {
  description = "CoPP Interface policy name."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.:-]{0,64}$", var.name))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `:`, `-`. Maximum characters: 64."
  }
}

variable "description" {
  description = "CoPP Interface policy description."
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]{0,128}$", var.description))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `\\`, `!`, `#`, `$`, `%`, `(`, `)`, `*`, `,`, `-`, `.`, `/`, `:`, `;`, `@`, ` `, `_`, `{`, `|`, }`, `~`, `?`, `&`, `+`. Maximum characters: 128."
  }
}

variable "protocol_policies" {
  description = "CoPP protocol policies."
  # description = "CoPP Interface Protocols to match on.  Allowed Values: `icmp`, `arp`, `stp`, `lldp`, `bgp`, `ospf`, `bfd`, `lacp`, `cdp`."
  type        = list(object({
    name = string
    rate = optional(string)
    burst = optional(string)
    match_protocols = optional(list(string))
  }))
  default     = []

  validation {
    condition     = alltrue([
      for pp in var.protocol_policies : can(regex("^[a-zA-Z0-9_.:-]{0,64}$", pp.name))
    ])
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `:`, `-`. Maximum characters: 64."
  }

  validation {
    condition = alltrue([
      for pp in var.protocol_policies : try(tonumber(pp.burst) >= 10, false) && try(tonumber(pp.burst) <= 549755813760, false)
    ])
    error_message = "Allowed Values: A number between 10 and 549,755,813,760."
  }

  validation {
    condition = alltrue([
      for pp in var.protocol_policies : try(tonumber(pp.rate) >= 10, false) && try(tonumber(pp.rate) <= 4398046510080, false)
    ])
    error_message = "Allowed Values: A number between 10 and 4,398,046,510,080."
  }

  validation {
    condition     = alltrue([for pp in var.match_protocols : contains(["icmp", "arp", "stp", "lldp", "bgp", "ospf", "bfd", "lacp", "cdp"], pp)])
    error_message = "Allowed Values: `icmp`, `arp`, `stp`, `lldp`, `bgp`, `ospf`, `bfd`, `lacp`, `cdp`."
  }
}