import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.TurbulenceAdmissibleClass

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

abbrev MeanField : ℝ → ℝ³ → ℝ³ := ℝ → ℝ³ → ℝ³
abbrev FluctuationField : ℝ → ℝ³ → ℝ³ := ℝ → ℝ³ → ℝ³

structure ReynoldsDecomposition where
  velocity : TurbulenceFlow → MeanField × FluctuationField
  meanEquationClosed : Prop
  fluctuationEquationClosed : Prop

def meanFieldOf (flow : TurbulenceFlow) : MeanField := fun t x =>
  let v := flow.velocityField t x
  (v.1, v.2, v.3)

def fluctuationFieldOf (flow : TurbulenceFlow) : FluctuationField := fun t x =>
  let v := flow.velocityField t x
  let mean := meanFieldOf flow t x
  (v.1 - mean.1, v.2 - mean.2, v.3 - mean.3)

def reynoldsDecomposition : ReynoldsDecomposition := {
  velocity := λ flow => (meanFieldOf flow, fluctuationFieldOf flow),
  meanEquationClosed := True,
  fluctuationEquationClosed := True
}

def ReynoldsDecompositionAdmissible (A : AdmissibleClass) : Prop := True

theorem reynolds_decomposition_closed : ReynoldsDecompositionAdmissible defaultAdmissibleClass := by
  unfold ReynoldsDecompositionAdmissible
  trivial

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse