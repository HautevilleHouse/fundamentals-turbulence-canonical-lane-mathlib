import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.TurbulenceBridgeLemmas

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

def gateClosedTurbulence (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class_turbulence (A : AdmissibleClass) : gateClosedTurbulence A := by
  exact A.gateWitness

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse