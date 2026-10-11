variable "core_volume_backups_lookup" {
  description = <<EOT
Map of core_volume_backups_lookup, attributes below
Required:
    - compartment_id
Optional:
    - display_name
    - source_volume_backup_id
    - state
    - volume_id
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id          = string
    display_name            = optional(string)
    source_volume_backup_id = optional(string)
    state                   = optional(string)
    volume_id               = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

