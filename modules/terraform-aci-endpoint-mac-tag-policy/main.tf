resource "aci_rest_managed" "fvEpMacTag" {
  dn         = "uni/tn-${var.tenant}/eptags/epmactag-${var.mac_address}-[${var.bridge_domain}]"
  class_name = "fvEpMacTag"

  content = {
    rn      = "epmactag-${var.mac_address}-[${var.bridge_domain}]"
    mac     = var.mac
    bdName  = var.bridge_domain == "all" ? "*" : var.bridge_domain
    ctxName = var.bridge_domain == "all" ? var.vrf : null
  }
}