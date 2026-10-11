variable "firestore_indices" {
  description = <<EOT
Map of firestore_indices, attributes below
Required:
    - collection
    - fields (block):
        - array_config (optional)
        - field_path (optional)
        - order (optional)
        - search_config (optional, block):
            - geo_spec (optional, block):
                - geo_json_indexing_disabled (required)
            - text_spec (optional, block):
                - index_specs (required, block):
                    - index_type (optional)
                    - match_type (optional)
        - vector_config (optional, block):
            - dimension (optional)
            - flat (optional, block):
Optional:
    - api_scope
    - database
    - deletion_policy
    - density
    - multikey
    - project
    - query_scope
    - skip_wait
    - unique
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    collection      = string
    api_scope       = optional(string)
    database        = optional(string)
    deletion_policy = optional(string)
    density         = optional(string)
    multikey        = optional(bool)
    project         = optional(string)
    query_scope     = optional(string)
    skip_wait       = optional(bool)
    unique          = optional(bool)
    fields = list(object({
      array_config = optional(string)
      field_path   = optional(string)
      order        = optional(string)
      search_config = optional(object({
        geo_spec = optional(object({
          geo_json_indexing_disabled = bool
        }))
        text_spec = optional(object({
          index_specs = list(object({
            index_type = optional(string)
            match_type = optional(string)
          }))
        }))
      }))
      vector_config = optional(object({
        dimension = optional(number)
        flat = optional(object({
        }))
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.firestore_indices : (
        length(v.fields) >= 1
      )
    ])
    error_message = "Each fields list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.firestore_indices : (
        alltrue([for item in v.fields : (item.search_config == null || (item.search_config.text_spec == null || (length(item.search_config.text_spec.index_specs) >= 1)))])
      )
    ])
    error_message = "Each index_specs list must contain at least 1 items"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

