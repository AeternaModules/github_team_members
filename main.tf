resource "github_team_members" "team_members" {
  for_each = var.team_members

  team_id   = each.value.team_id
  team_slug = each.value.team_slug

  dynamic "members" {
    for_each = each.value.members
    content {
      role     = members.value.role
      username = members.value.username
    }
  }
}

