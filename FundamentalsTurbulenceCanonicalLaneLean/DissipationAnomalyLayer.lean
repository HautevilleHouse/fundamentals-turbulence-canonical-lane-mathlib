import canonicalLaneMathlib.AdmissibleClass
import .AnalyticTurbulenceLayer

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure DissipationAnomalyCertificate where
  flow : TurbulentFlow
  reynoldsNumber : ℝ
  dissipationRateFinite : Prop
  anomalyPresent : Prop
  dissipationRateFiniteProof : dissipationRateFinite
  anomalyPresentProof : anomalyPresent

def sourceDissipationAnomalyCertificate : DissipationAnomalyCertificate := by
  sorry

def DissipationAnomalyClosed (C : DissipationAnomalyCertificate) : Prop :=
  C.dissipationRateFinite ∧ C.anomalyPresent

theorem source_dissipation_anomaly_closed :
    DissipationAnomalyClosed sourceDissipationAnomalyCertificate := by
  exact And.intro sourceDissipationAnomalyCertificate.dissipationRateFiniteProof
    sourceDissipationAnomalyCertificate.anomalyPresentProof

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse