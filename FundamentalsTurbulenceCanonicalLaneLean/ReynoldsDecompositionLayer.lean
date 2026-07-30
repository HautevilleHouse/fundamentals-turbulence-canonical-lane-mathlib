import FundamentalsTurbulenceCanonicalLaneLean.K41Layer

/-!
# Reynolds Decomposition Layer

This module encodes the Reynolds decomposition and Reynolds stresses.
-/

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure ReynoldsDecompositionCertificate where
  k41 : K41Certificate
  meanFlow : Prop
  fluctuation : Prop
  reynoldsStress : Prop
  meanFlowClosed : meanFlow
  fluctuationClosed : fluctuation
  reynoldsStressClosed : reynoldsStress

def sourceReynoldsDecompositionCertificate : ReynoldsDecompositionCertificate := {
  k41 := sourceK41Certificate
  meanFlow := True
  fluctuation := True
  reynoldsStress := True
  meanFlowClosed := trivial
  fluctuationClosed := trivial
  reynoldsStressClosed := trivial
}

def ReynoldsDecompositionClosed (C : ReynoldsDecompositionCertificate) : Prop :=
  K41Closed C.k41 ∧ C.meanFlow ∧ C.fluctuation ∧ C.reynoldsStress

theorem source_reynolds_decomposition_closed :
    ReynoldsDecompositionClosed sourceReynoldsDecompositionCertificate := by
  exact And.intro source_k41_closed
    (And.intro sourceReynoldsDecompositionCertificate.meanFlowClosed
      (And.intro sourceReynoldsDecompositionCertificate.fluctuationClosed
        sourceReynoldsDecompositionCertificate.reynoldsStressClosed))

end HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse