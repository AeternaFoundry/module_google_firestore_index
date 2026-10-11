output "firestore_indices_id" {
  description = "Map of id values across all firestore_indices, keyed the same as var.firestore_indices except keys with no id are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.id if v.id != null && length(v.id) > 0 }
}
output "firestore_indices_api_scope" {
  description = "Map of api_scope values across all firestore_indices, keyed the same as var.firestore_indices except keys with no api_scope are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.api_scope if v.api_scope != null && length(v.api_scope) > 0 }
}
output "firestore_indices_collection" {
  description = "Map of collection values across all firestore_indices, keyed the same as var.firestore_indices except keys with no collection are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.collection if v.collection != null && length(v.collection) > 0 }
}
output "firestore_indices_database" {
  description = "Map of database values across all firestore_indices, keyed the same as var.firestore_indices except keys with no database are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.database if v.database != null && length(v.database) > 0 }
}
output "firestore_indices_deletion_policy" {
  description = "Map of deletion_policy values across all firestore_indices, keyed the same as var.firestore_indices except keys with no deletion_policy are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "firestore_indices_density" {
  description = "Map of density values across all firestore_indices, keyed the same as var.firestore_indices except keys with no density are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.density if v.density != null && length(v.density) > 0 }
}
output "firestore_indices_fields" {
  description = "Map of fields values across all firestore_indices, keyed the same as var.firestore_indices except keys with no fields are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.fields if v.fields != null && length(v.fields) > 0 }
}
output "firestore_indices_multikey" {
  description = "Map of multikey values across all firestore_indices, keyed the same as var.firestore_indices except keys with no multikey are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.multikey if v.multikey != null }
}
output "firestore_indices_name" {
  description = "Map of name values across all firestore_indices, keyed the same as var.firestore_indices except keys with no name are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.name if v.name != null && length(v.name) > 0 }
}
output "firestore_indices_project" {
  description = "Map of project values across all firestore_indices, keyed the same as var.firestore_indices except keys with no project are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.project if v.project != null && length(v.project) > 0 }
}
output "firestore_indices_query_scope" {
  description = "Map of query_scope values across all firestore_indices, keyed the same as var.firestore_indices except keys with no query_scope are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.query_scope if v.query_scope != null && length(v.query_scope) > 0 }
}
output "firestore_indices_skip_wait" {
  description = "Map of skip_wait values across all firestore_indices, keyed the same as var.firestore_indices except keys with no skip_wait are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.skip_wait if v.skip_wait != null }
}
output "firestore_indices_unique" {
  description = "Map of unique values across all firestore_indices, keyed the same as var.firestore_indices except keys with no unique are omitted"
  value       = { for k, v in google_firestore_index.firestore_indices : k => v.unique if v.unique != null }
}

