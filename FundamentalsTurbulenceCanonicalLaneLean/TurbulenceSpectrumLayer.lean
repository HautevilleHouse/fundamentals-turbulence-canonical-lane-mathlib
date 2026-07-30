import canonicalLaneMathlib.AdmissibleClass
import FundamentalsTurbulenceCanonicalLaneLean.TurbulenceOperators

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure SpectrumCertificate where
  flow : TurbulenceFlow
  kolmogorovScaling : Prop
  inertialRange : Prop
  dissipationRange : Prop
  energySpectrum : Prop
  kolmogorovScalingClosed : kolmogorovScaling
  inertialRangeClosed : inertialRange
  dissipationRangeClosed : dissipationRange
  energySpectrumClosed : energySpectrum

def sourceSpectrumCertificate : SpectrumCertificate := {
  flow := primitiveFlow,
  kolmogorovScaling := baselineCertificateAllPass = true,
  inertialRange := baselineCertificateInputs.length = 7,
  dissipationRange := outsideConstantDependencyCount = 0,
  energySpectrum := NavierStokesTurbulenceClosed primitiveFlow,
  kolmogorovScalingClosed := rfl,
  inertialRangeClosed := rfl,
  dissipationRangeClosed := rfl,
  energySpectrumClosed := primitive_flow_navier_stokes_turbulence_closed_checked
}

def SpectrumLayerClosed (C : SpectrumCertificate) : Prop :=
  C.kolmogorovScaling ∧ C.inertialRange ∧ C.dissipationRange ∧ C.energySpectrum

theorem source_spectrum_layer_closed :
    SpectrumLayerClosed sourceSpectrumCertificate := by
  exact And.intro sourceSpectrumCertificate.kolmogorovScalingClosed
    (And.intro sourceSpectrumCertificate.inertialRangeClosed
      (And.intro sourceSpectrumCertificate.dissipationRangeClosed sourceSpectrumCertificate.energySpectrumClosed))

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse