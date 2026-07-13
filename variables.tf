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
  # --- Unconfirmed validation candidates, derived from github_team_members's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: team_slug
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: team_id
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: members.role
  #   source:    validateValueFunc: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

