import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

/-!
# Turbulent Flow Objects

This module defines the basic analytic objects for turbulence: velocity fields,
pressure fields, eddy viscosity, Reynolds stress, and the Navier-Stokes operator
with turbulence closure.
-/

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3
abbrev TensorField := Time → Space3 → (Fin 3 → Fin 3 → ℝ)

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0
def zeroTensorField : TensorField := fun _ _ _ _ => 0

structure TurbulenceOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  reynoldsStress : VectorField → TensorField
  eddyViscosity : ScalarField

def primitiveTurbulenceOperators : TurbulenceOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  reynoldsStress := fun _ => zeroTensorField
  eddyViscosity := 0
}

structure TurbulentFlow where
  meanVelocity : VectorField
  pressure : ScalarField
  operators : TurbulenceOperators
  viscosity : ℝ

def primitiveTurbulentFlow : TurbulentFlow := {
  meanVelocity := zeroVectorField
  pressure := zeroScalarField
  operators := primitiveTurbulenceOperators
  viscosity := 1
}

def Incompressible (F : TurbulentFlow) : Prop :=
  F.operators.divergence F.meanVelocity = zeroScalarField

end HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse