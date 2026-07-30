import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

abbrev FluidDomain := ℝ³
abbrev Time := ℝ
abbrev ScalarField := Time → FluidDomain → ℝ
abbrev VectorField := Time → FluidDomain → ℝ³

structure TurbulenceOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  ReynoldsStress : VectorField → VectorField
  dissipation : VectorField → ScalarField

structure TurbulentFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  operators : TurbulenceOperators

structure K41Constants where
  KolmogorovConstant : ℝ
  dissipationRate : ℝ
  integralLength : ℝ

structure TurbulentCascade where
  energySpectrum : ℝ → ℝ
  inertialRange : ℝ × ℝ
  k41 : K41Constants

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse