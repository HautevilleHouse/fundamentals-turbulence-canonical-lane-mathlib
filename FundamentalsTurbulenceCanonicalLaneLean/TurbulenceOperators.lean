import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure TurbulenceOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  ReynoldsStress : VectorField → VectorField
  dissipation : VectorField → VectorField
  reynoldsStressIdempotent : ∀ u, ReynoldsStress (ReynoldsStress u) = ReynoldsStress u

def primitiveOperators : TurbulenceOperators := {
  divergence := fun _ => zeroScalarField,
  gradient := fun _ => zeroVectorField,
  laplacian := fun u => u,
  timeDerivative := fun _ => zeroVectorField,
  transport := fun _ => zeroVectorField,
  ReynoldsStress := fun u => u,
  dissipation := fun u => u,
  reynoldsStressIdempotent := by intro u; rfl
}

structure TurbulenceFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  operators : TurbulenceOperators

def primitiveFlow : TurbulenceFlow := {
  velocity := zeroVectorField,
  pressure := zeroScalarField,
  viscosity := 1,
  operators := primitiveOperators
}

def Incompressible (F : TurbulenceFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def ReynoldsDecomposition (F : TurbulenceFlow) : Prop :=
  F.operators.ReynoldsStress F.velocity = F.operators.dissipation F.velocity

def TurbulentEnergyBalance (F : TurbulenceFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity

def NavierStokesTurbulenceClosed (F : TurbulenceFlow) : Prop :=
  Incompressible F ∧ ReynoldsDecomposition F ∧ TurbulentEnergyBalance F

theorem primitive_reynolds_stress_idempotent_checked (u : VectorField) :
    primitiveOperators.ReynoldsStress (primitiveOperators.ReynoldsStress u) = primitiveOperators.ReynoldsStress u := by
  rfl

theorem primitive_flow_incompressible_checked :
    Incompressible primitiveFlow := by
  rfl

theorem primitive_flow_reynolds_decomposition_checked :
    ReynoldsDecomposition primitiveFlow := by
  rfl

theorem primitive_flow_turbulent_energy_balance_checked :
    TurbulentEnergyBalance primitiveFlow := by
  rfl

theorem primitive_flow_navier_stokes_turbulence_closed_checked :
    NavierStokesTurbulenceClosed primitiveFlow := by
  exact And.intro primitive_flow_incompressible_checked
    (And.intro primitive_flow_reynolds_decomposition_checked primitive_flow_turbulent_energy_balance_checked)

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse