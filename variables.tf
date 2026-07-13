variable "team_memberses" {
  description = <<EOT
Map of team_memberses, attributes below
Required:
    - members (block):
        - role (optional)
        - username (required)
Optional:
    - team_id
    - team_slug
EOT

  type = map(object({
    team_id   = optional(string)
    team_slug = optional(string)
    members = list(object({
      role     = optional(string)
      username = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.team_memberses : (
        length(v.members) >= 1
      )
    ])
    error_message = "Each members list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.team_memberses : (
        v.team_slug == null || (length(trimspace(v.team_slug)) > 0)
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.team_memberses : (
        v.team_id == null || (length(trimspace(v.team_id)) > 0)
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

