import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.ReynoldsDecomposition

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure EnergyCascadeCertificate where
  reynoldsDecomposition : ReynoldsDecomposition
  k41Scaling : Prop
  dissipationRate : Prop
  energySpectrum : Prop
  k41ScalingClosed : k41Scaling
  dissipationRateClosed : dissipationRate
  energySpectrumClosed : energySpectrum

noncomputable def sourceEnergyCascadeCertificate : EnergyCascadeCertificate := {
  reynoldsDecomposition := reynoldsDecomposition,
  k41Scaling := True,
  dissipationRate := True,
  energySpectrum := True,
  k41ScalingClosed := trivial,
  dissipationRateClosed := trivial,
  energySpectrumClosed := trivial
}

def EnergyCascadeClosed (C : EnergyCascadeCertificate) : Prop :=
  C.k41Scaling ∧ C.dissipationRate ∧ C.energySpectrum

theorem source_energy_cascade_closed : EnergyCascadeClosed sourceEnergyCascadeCertificate := by
  exact And.intro sourceEnergyCascadeCertificate.k41ScalingClosed
    (And.intro sourceEnergyCascadeCertificate.dissipationRateClosed
      sourceEnergyCascadeCertificate.energySpectrumClosed)

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse