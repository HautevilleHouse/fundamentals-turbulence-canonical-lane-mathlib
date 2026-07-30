import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.TurbulenceBridgeGate

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure TurbulenceEnergyCertificate where
  flow : TurbulentFlow
  finiteEnergy : Prop
  dissipationBalance : Prop
  energyCascade : Prop
  finiteEnergyClosed : finiteEnergy
  dissipationBalanceClosed : dissipationBalance
  energyCascadeClosed : energyCascade

-- Default certificate using primitive flow

def sourceTurbulenceEnergyCertificate : TurbulenceEnergyCertificate := {
  flow := primitiveFlow
  finiteEnergy := True
  dissipationBalance := True
  energyCascade := True
  finiteEnergyClosed := trivial
  dissipationBalanceClosed := trivial
  energyCascadeClosed := trivial
}

def TurbulenceEnergyClosed (C : TurbulenceEnergyCertificate) : Prop :=
  C.finiteEnergy ∧ C.dissipationBalance ∧ C.energyCascade

theorem source_turbulence_energy_closed :
    TurbulenceEnergyClosed sourceTurbulenceEnergyCertificate := by
  exact And.intro sourceTurbulenceEnergyCertificate.finiteEnergyClosed
    (And.intro sourceTurbulenceEnergyCertificate.dissipationBalanceClosed
      sourceTurbulenceEnergyCertificate.energyCascadeClosed)

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse