import FundamentalsTurbulenceCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3
abbrev VelocityField := VectorField
abbrev PressureField := ScalarField
abbrev VorticityField := VectorField

abbrev ReynoldsStress (u : VelocityField) (u' : VelocityField) : ScalarField :=
  fun t x => (u t x).0 * (u' t x).0 + (u t x).1 * (u' t x).1 + (u t x).2 * (u' t x).2

structure TurbulenceOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  convectiveDerivative : VectorField → VectorField → VectorField
  viscousStress : VectorField → ScalarField
  reynoldsStressOp : VelocityField → VelocityField → ScalarField
  idempotentViscous : ∀ u, viscousStress (viscousStress u) = viscousStress u

def primitiveTurbulenceOperators : TurbulenceOperators := {
  divergence := fun _ => fun _ _ => 0
  gradient := fun _ => fun _ _ _ => (0,0,0)
  laplacian := fun u => u
  timeDerivative := fun _ => fun _ _ _ => (0,0,0)
  convectiveDerivative := fun _ _ => fun _ _ _ => (0,0,0)
  viscousStress := fun _ => fun _ _ => 0
  reynoldsStressOp := fun u u' => ReynoldsStress u u'
  idempotentViscous := by intro u; ext t x; simp
}

structure TurbulentFlow where
  meanVelocity : VelocityField
  fluctuatingVelocity : VelocityField
  pressure : PressureField
  viscosity : ℝ
  density : ℝ
  operators : TurbulenceOperators

def primitiveTurbulentFlow : TurbulentFlow := {
  meanVelocity := fun _ _ _ => (0,0,0)
  fluctuatingVelocity := fun _ _ _ => (0,0,0)
  pressure := fun _ _ => 0
  viscosity := 1
  density := 1
  operators := primitiveTurbulenceOperators
}

def meanField (F : TurbulentFlow) : VelocityField := F.meanVelocity
def fluctuatingField (F : TurbulentFlow) : VelocityField := F.fluctuatingVelocity

def ReynoldsDecomposition (F : TurbulentFlow) : Prop :=
  meanField F = F.meanVelocity ∧ fluctuatingField F = F.fluctuatingVelocity

def IncompressibleMean (F : TurbulentFlow) : Prop :=
  F.operators.divergence F.meanVelocity = fun _ _ => 0

def ReynoldsEquation (F : TurbulentFlow) : Prop :=
  F.operators.timeDerivative F.meanVelocity =
    F.operators.convectiveDerivative F.meanVelocity F.meanVelocity

end HautevilleHouse
end FundamentalsTurbulenceCanonicalLaneLean
