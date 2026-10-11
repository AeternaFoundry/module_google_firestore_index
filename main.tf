resource "google_firestore_index" "firestore_indices" {
  for_each = var.firestore_indices

  collection      = each.value.collection
  api_scope       = each.value.api_scope
  database        = each.value.database
  deletion_policy = each.value.deletion_policy
  density         = each.value.density
  multikey        = each.value.multikey
  project         = each.value.project
  query_scope     = each.value.query_scope
  skip_wait       = each.value.skip_wait
  unique          = each.value.unique

  dynamic "fields" {
    for_each = each.value.fields
    content {
      array_config = fields.value.array_config
      field_path   = fields.value.field_path
      order        = fields.value.order
      dynamic "search_config" {
        for_each = fields.value.search_config != null ? [fields.value.search_config] : []
        content {
          dynamic "geo_spec" {
            for_each = search_config.value.geo_spec != null ? [search_config.value.geo_spec] : []
            content {
              geo_json_indexing_disabled = geo_spec.value.geo_json_indexing_disabled
            }
          }
          dynamic "text_spec" {
            for_each = search_config.value.text_spec != null ? [search_config.value.text_spec] : []
            content {
              dynamic "index_specs" {
                for_each = text_spec.value.index_specs
                content {
                  index_type = index_specs.value.index_type
                  match_type = index_specs.value.match_type
                }
              }
            }
          }
        }
      }
      dynamic "vector_config" {
        for_each = fields.value.vector_config != null ? [fields.value.vector_config] : []
        content {
          dimension = vector_config.value.dimension
          dynamic "flat" {
            for_each = vector_config.value.flat != null ? [vector_config.value.flat] : []
            content {
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

