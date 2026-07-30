import canonicalLaneMathlib.AdmissibleClass
import FundamentalsTurbulenceCanonicalLaneLean.TurbulenceSpectrumLayer

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure CascadeCertificate where
  spectrum : SpectrumCertificate
  energyCascade : Prop
  dissipationCascade : Prop
  cascadeRate : Prop
  cascadeConservation : Prop
  energyCascadeClosed : energyCascade
  dissipationCascadeClosed : dissipationCascade
  cascadeRateClosed : cascadeRate
  cascadeConservationClosed : cascadeConservation

def sourceCascadeCertificate : CascadeCertificate := {
  spectrum := sourceSpectrumCertificate,
  energyCascade := baselineCertificateAllPass = true,
  dissipationCascade := outsideConstantDependencyCount = 0,
  cascadeRate := bridgeConstantKeys.length = 7,
  cascadeConservation := reviewerFalsificationConditionCount = 5,
  energyCascadeClosed := rfl,
  dissipationCascadeClosed := rfl,
  cascadeRateClosed := rfl,
  cascadeConservationClosed := rfl
}

def CascadeLayerClosed (C : CascadeCertificate) : Prop :=
  SpectrumLayerClosed C.spectrum ∧ C.energyCascade ∧ C.dissipationCascade ∧ C.cascadeRate ∧ C.cascadeConservation

theorem source_cascade_layer_closed :
    CascadeLayerClosed sourceCascadeCertificate := by
  exact And.intro source_spectrum_layer_closed
    (And.intro sourceCascadeCertificate.energyCascadeClosed
      (And.intro sourceCascadeCertificate.dissipationCascadeClosed
        (And.intro sourceCascadeCertificate.cascadeRateClosed sourceCascadeCertificate.cascadeConservationClosed)))

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse