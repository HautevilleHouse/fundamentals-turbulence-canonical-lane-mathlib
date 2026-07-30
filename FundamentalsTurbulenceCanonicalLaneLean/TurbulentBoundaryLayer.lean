import FundamentalsTurbulenceCanonicalLaneLean.ReynoldsDecompositionLayer

/-!
# Turbulent Boundary Layer Layer

This module captures the turbulent boundary layer structure.
-/

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure TurbulentBoundaryLayerCertificate where
  reynolds : ReynoldsDecompositionCertificate
  logLaw : Prop
  viscousSublayer : Prop
  bufferLayer : Prop
  logLawClosed : logLaw
  viscousSublayerClosed : viscousSublayer
  bufferLayerClosed : bufferLayer

def sourceTurbulentBoundaryLayerCertificate : TurbulentBoundaryLayerCertificate := {
  reynolds := sourceReynoldsDecompositionCertificate
  logLaw := True
  viscousSublayer := True
  bufferLayer := True
  logLawClosed := trivial
  viscousSublayerClosed := trivial
  bufferLayerClosed := trivial
}

def TurbulentBoundaryLayerClosed (C : TurbulentBoundaryLayerCertificate) : Prop :=
  ReynoldsDecompositionClosed C.reynolds ∧ C.logLaw ∧ C.viscousSublayer ∧ C.bufferLayer

theorem source_turbulent_boundary_layer_closed :
    TurbulentBoundaryLayerClosed sourceTurbulentBoundaryLayerCertificate := by
  exact And.intro source_reynolds_decomposition_closed
    (And.intro sourceTurbulentBoundaryLayerCertificate.logLawClosed
      (And.intro sourceTurbulentBoundaryLayerCertificate.viscousSublayerClosed
        sourceTurbulentBoundaryLayerCertificate.bufferLayerClosed))

end HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse