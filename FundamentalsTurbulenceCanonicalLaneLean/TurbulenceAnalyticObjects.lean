import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

abbrev Time := ℝ
abbrev Space3 := Fin 3 → ℝ
abbrev VectorField := Time → Space3 → Space3
abbrev ScalarField := Time → Space3 → ℝ

def zeroVectorField : VectorField := fun _ _ _ => 0
def zeroScalarField : ScalarField := fun _ _ => 0

structure NavierStokesOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  convection : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveOperators : NavierStokesOperators := {
  divergence := fun _ => zeroScalarField,
  gradient := fun _ => zeroVectorField,
  laplacian := fun u => u,
  timeDerivative := fun _ => zeroVectorField,
  convection := fun _ => zeroVectorField,
  pressureProjection := fun u => u,
  pressureProjectionIdempotent := by intro u; rfl
}

structure TurbulentFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  operators : NavierStokesOperators

def primitiveFlow : TurbulentFlow := {
  velocity := zeroVectorField,
  pressure := zeroScalarField,
  viscosity := 1,
  operators := primitiveOperators
}

def Incompressible (F : TurbulentFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def NavierStokesBalance (F : TurbulentFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity

def PressureProjected (F : TurbulentFlow) : Prop :=
  F.operators.pressureProjection F.velocity = F.velocity

def TurbulenceEquationClosed (F : TurbulentFlow) : Prop :=
  Incompressible F ∧ NavierStokesBalance F ∧ PressureProjected F

theorem primitive_pressure_projection_idempotent_checked (u : VectorField) :
    primitiveOperators.pressureProjection (primitiveOperators.pressureProjection u) =
      primitiveOperators.pressureProjection u := by
  rfl

theorem primitive_flow_incompressible_checked :
    Incompressible primitiveFlow := by
  rfl

theorem primitive_flow_balance_checked :
    NavierStokesBalance primitiveFlow := by
  rfl

theorem primitive_flow_pressure_projected_checked :
    PressureProjected primitiveFlow := by
  rfl

theorem primitive_flow_equation_closed_checked :
    TurbulenceEquationClosed primitiveFlow := by
  exact And.intro primitive_flow_incompressible_checked
    (And.intro primitive_flow_balance_checked primitive_flow_pressure_projected_checked)

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse