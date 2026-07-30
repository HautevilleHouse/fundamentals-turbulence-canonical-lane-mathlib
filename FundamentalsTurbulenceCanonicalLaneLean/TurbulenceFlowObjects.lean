import FundamentalsTurbulenceCanonicalLaneLean.AdmissibleClass
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
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveTurbulenceOperators : TurbulenceOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  pressureProjection := fun u => u
  pressureProjectionIdempotent := by intro u; rfl
}

structure TurbulenceFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  operators : TurbulenceOperators

def primitiveTurbulenceFlow : TurbulenceFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  viscosity := 1
  operators := primitiveTurbulenceOperators
}

def Incompressible (F : TurbulenceFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def TurbulenceReynoldsClosure (F : TurbulenceFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity

def PressureProjected (F : TurbulenceFlow) : Prop :=
  F.operators.pressureProjection F.velocity = F.velocity

def TurbulenceEquationClosed (F : TurbulenceFlow) : Prop :=
  Incompressible F ∧ TurbulenceReynoldsClosure F ∧ PressureProjected F

theorem primitive_pressure_projection_idempotent_checked (u : VectorField) :
    primitiveTurbulenceOperators.pressureProjection (primitiveTurbulenceOperators.pressureProjection u) =
      primitiveTurbulenceOperators.pressureProjection u := by
  rfl

theorem primitive_flow_incompressible_checked :
    Incompressible primitiveTurbulenceFlow := by
  rfl

theorem primitive_flow_turbulence_reynolds_closure_checked :
    TurbulenceReynoldsClosure primitiveTurbulenceFlow := by
  rfl

theorem primitive_flow_pressure_projected_checked :
    PressureProjected primitiveTurbulenceFlow := by
  rfl

theorem primitive_flow_equation_closed_checked :
    TurbulenceEquationClosed primitiveTurbulenceFlow := by
  exact And.intro primitive_flow_incompressible_checked
    (And.intro primitive_flow_turbulence_reynolds_closure_checked primitive_flow_pressure_projected_checked)

end HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse