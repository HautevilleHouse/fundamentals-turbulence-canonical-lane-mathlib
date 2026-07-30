import FundamentalsTurbulenceCanonicalLaneLean.TurbulentBoundaryLayerLayer

/-!
# Turbulence Closure Certificate

This module packages all layers into one certificate.
-/

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure TurbulenceClosureCertificate where
  substrate : MathlibPDESubstrate
  flowClosed : Prop
  k41Closed : Prop
  reynoldsClosed : Prop
  boundaryLayerClosed : Prop
  canonicalCarriageImported : Prop
  flowClosedProof : flowClosed
  k41ClosedProof : k41Closed
  reynoldsClosedProof : reynoldsClosed
  boundaryLayerClosedProof : boundaryLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceTurbulenceClosureCertificate : TurbulenceClosureCertificate := {
  substrate := mathlibPDESubstrate
  flowClosed := TurbulenceEquationClosed primitiveTurbulenceFlow
  k41Closed := K41Closed sourceK41Certificate
  reynoldsClosed := ReynoldsDecompositionClosed sourceReynoldsDecompositionCertificate
  boundaryLayerClosed := TurbulentBoundaryLayerClosed sourceTurbulentBoundaryLayerCertificate
  canonicalCarriageImported := True
  flowClosedProof := primitive_flow_equation_closed_checked
  k41ClosedProof := source_k41_closed
  reynoldsClosedProof := source_reynolds_decomposition_closed
  boundaryLayerClosedProof := source_turbulent_boundary_layer_closed
  canonicalCarriageImportedProof := trivial
}

def TurbulenceClosureCertificateClosed (C : TurbulenceClosureCertificate) : Prop :=
  C.flowClosed ∧ C.k41Closed ∧ C.reynoldsClosed ∧ C.boundaryLayerClosed ∧ C.canonicalCarriageImported

theorem source_turbulence_closure_certificate_closed :
    TurbulenceClosureCertificateClosed sourceTurbulenceClosureCertificate := by
  exact And.intro sourceTurbulenceClosureCertificate.flowClosedProof
    (And.intro sourceTurbulenceClosureCertificate.k41ClosedProof
      (And.intro sourceTurbulenceClosureCertificate.reynoldsClosedProof
        (And.intro sourceTurbulenceClosureCertificate.boundaryLayerClosedProof
          sourceTurbulenceClosureCertificate.canonicalCarriageImportedProof)))

end HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse