output "team_members_id" {
  description = "Map of id values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in github_team_members.team_members : k => v.id if v.id != null && length(v.id) > 0 }
}
output "team_members_members" {
  description = "Map of members values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in github_team_members.team_members : k => v.members if v.members != null && length(v.members) > 0 }
}
output "team_members_team_id" {
  description = "Map of team_id values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in github_team_members.team_members : k => v.team_id if v.team_id != null && length(v.team_id) > 0 }
}
output "team_members_team_slug" {
  description = "Map of team_slug values across all team_members, keyed the same as var.team_members"
  value       = { for k, v in github_team_members.team_members : k => v.team_slug if v.team_slug != null && length(v.team_slug) > 0 }
}

