output "team_memberses_id" {
  description = "Map of id values across all team_memberses, keyed the same as var.team_memberses"
  value       = { for k, v in github_team_members.team_memberses : k => v.id }
}
output "team_memberses_members" {
  description = "Map of members values across all team_memberses, keyed the same as var.team_memberses"
  value       = { for k, v in github_team_members.team_memberses : k => v.members }
}
output "team_memberses_team_id" {
  description = "Map of team_id values across all team_memberses, keyed the same as var.team_memberses"
  value       = { for k, v in github_team_members.team_memberses : k => v.team_id }
}
output "team_memberses_team_slug" {
  description = "Map of team_slug values across all team_memberses, keyed the same as var.team_memberses"
  value       = { for k, v in github_team_members.team_memberses : k => v.team_slug }
}

