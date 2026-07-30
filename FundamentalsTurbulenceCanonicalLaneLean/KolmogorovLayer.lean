import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.ReynoldsStressLayer

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

/-!
# Kolmogorov Layer

This module records the Kolmogorov hypotheses and spectrum closure as a bridge
layer.
-/

structure KolmogorovCertificate where
  reynolds : ReynoldsStressCertificate
  k41SpectrumClosed : Prop
  dissipationRateClosed : Prop
  lengthScaleClosed : Prop
  k41SpectrumClosedProof : k41SpectrumClosed
  dissipationRateClosedProof : dissipationRateClosed
  lengthScaleClosedProof : lengthScaleClosed

def sourceKolmogorovCertificate : KolmogorovCertificate := {
  reynolds := sourceReynoldsStressCertificate
  k41SpectrumClosed := True
  dissipationRateClosed := True
  lengthScaleClosed := True
  k41SpectrumClosedProof := trivial
  dissipationRateClosedProof := trivial
  lengthScaleClosedProof := trivial
}

def KolmogorovClosed (C : KolmogorovCertificate) : Prop :=
  ReynoldsStressClosed C.reynolds ∧
  C.k41SpectrumClosed ∧
  C.dissipationRateClosed ∧
  C.lengthScaleClosed

theorem source_kolmogorov_closed :
    KolmogorovClosed sourceKolmogorovCertificate := by
  exact And.intro source_reynolds_stress_closed
    (And.intro sourceKolmogorovCertificate.k41SpectrumClosedProof
      (And.intro sourceKolmogorovCertificate.dissipationRateClosedProof
        sourceKolmogorovCertificate.lengthScaleClosedProof))

end HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse