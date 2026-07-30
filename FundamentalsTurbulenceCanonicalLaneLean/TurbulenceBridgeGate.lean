import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.TurbulenceAnalyticObjects

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

-- Bridge: native closure from admissible object

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

-- Gate: endpoint satisfied or remainder recorded

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse