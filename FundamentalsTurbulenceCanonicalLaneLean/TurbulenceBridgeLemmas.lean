import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.TurbulenceAdmissibleClass

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

def bridgeClosedTurbulence (A : AdmissibleClass) : Prop :=
  NativeBridgeClosedTurbulence turbulenceAdmittedObject

theorem bridge_from_admissible_class_turbulence (A : AdmissibleClass) : bridgeClosedTurbulence A := by
  exact native_bridge_closed_turbulence_checked

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse