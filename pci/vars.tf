variable "subscription" {
  type = map(object({
    subscription_id = string
    resource_group  = string
    aks_name        = string
    acr_name        = string
    user_object_ids = list(string)
  }))
}