import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

-- Intermittency: non-Gaussian behavior of velocity increments
structure IntermittencyCertificate where
  flatnessFactor : ℝ
  skewnessFactor : ℝ
  flatnessExcess : flatnessFactor > 3
  skewnessNonzero : skewnessFactor ≠ 0
  flatnessExcessClosed : flatnessExcess
  skewnessNonzeroClosed : skewnessNonzero

def sourceIntermittencyCertificate : IntermittencyCertificate := {
  flatnessFactor := 4.0
  skewnessFactor := -0.3
  flatnessExcess := by norm_num
  skewnessNonzero := by norm_num
  flatnessExcessClosed := by norm_num
  skewnessNonzeroClosed := by norm_num
}

def IntermittencyClosed (C : IntermittencyCertificate) : Prop :=
  C.flatnessExcess ∧ C.skewnessNonzero

theorem source_intermittency_closed : IntermittencyClosed sourceIntermittencyCertificate := by
  exact And.intro sourceIntermittencyCertificate.flatnessExcessClosed sourceIntermittencyCertificate.skewnessNonzeroClosed

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse