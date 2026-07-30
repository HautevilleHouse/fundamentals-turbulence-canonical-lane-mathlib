import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  have h : A.object.sourceKey = sourceRepository ∧ A.object.theoremObject = sourceDescription :=
    And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked
  exact h

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse