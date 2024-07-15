resource "aci_rest_managed" "macsecParamPol" {
  dn         = "uni/infra/macsecpcont/paramp-${var.name}"
  class_name = "macsecParamPol"
  content = {
    name          = var.name
    descr         = var.description
    confOffset    = var.confidentiality_offset
    keySvrPrio    = var.key_server_priority
    cipher_Suite   = var.cipher_Suite
    replayWindow  = var.window_size
    sakExpiryTime = var.key_expiry_time
    secPolicy     = var.security_policy
  }
}
