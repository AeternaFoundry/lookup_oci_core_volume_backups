data "oci_core_volume_backups" "core_volume_backups_lookup" {
  for_each = var.core_volume_backups_lookup

  compartment_id          = each.value.compartment_id
  display_name            = each.value.display_name
  source_volume_backup_id = each.value.source_volume_backup_id
  state                   = each.value.state
  volume_id               = each.value.volume_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

