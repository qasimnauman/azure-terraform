subscription = {
  "merchant" = {
    subscription_id    = "11111111-aaaa-bbbb-cccc-111111111111"
    resource_group     = "zpayd-online-resource"
    aks_name           = "zpayd-online"
    user_object_ids    = ["f5025280-72d3-46c5-8dc1-39485cd00355"] # arslan
  },
  "online"={
    subscription_id    = "22222222-aaaa-bbbb-cccc-222222222222"
    resource_group     = "prod-rg"
    aks_name           = "prod-aks"
    user_object_ids    = ["f1234567-aaaa-bbbb-cccc-123456789000"] # another user
  }
}