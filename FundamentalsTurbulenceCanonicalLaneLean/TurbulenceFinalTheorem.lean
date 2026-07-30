import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.TurbulenceBridgeGate

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

def ConstrainedTurbulenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_turbulence_endgame (A : AdmissibleClass) :
    ConstrainedTurbulenceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse