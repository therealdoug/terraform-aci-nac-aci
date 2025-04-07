module "aci_data_plane_policing_policy" {
  source  = "netascode/nac-aci/aci//modules/terraform-aci-data-aci-data-plane-policing-policy"
  version = ">= 0.8.0"

  name            = "dpp-pol1"
  adminSt         = true
  type            = "1R2C"
  mode            = "bits"
  sharingMode     = "dedicated"
  peak_rate       = "10"
  peak_rateUnit   = "giga"
  rate            = "9"
  rateUnit        = "giga"
  be              = "9100"
  beUnit          = "mega"
  burst           = "0"
  burstUnit       = "unspecified"
  conformAction   = "transmit"
  conformMarkCos  = "unspecified"
  conformMarkDscp = "unspecified"
  exceedAction    = "mark"
  exceedMarkCos   = "3"
  exceedMarkDscp  = "18"
  violateAction   = "mark"
  violateMarkCos  = "2"
  violateMarkDscp = "38"
}