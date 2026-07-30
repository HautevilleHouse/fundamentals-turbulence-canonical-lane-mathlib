import canonicalLaneMathlib.AdmissibleClass
import FundamentalsTurbulenceCanonicalLaneLean.TurbulenceCascadeLayer

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure TurbulenceClosureCertificate where
  cascade : CascadeCertificate
  reynoldsStressClosure : Prop
  dissipationClosure : Prop
  turbulenceModelClosed : Prop
  boundaryCarried : Prop
  reynoldsStressClosureProof : reynoldsStressClosure
  dissipationClosureProof : dissipationClosure
  turbulenceModelClosedProof : turbulenceModelClosed
  boundaryCarriedProof : boundaryCarried

def sourceTurbulenceClosureCertificate : TurbulenceClosureCertificate := {
  cascade := sourceCascadeCertificate,
  reynoldsStressClosure := ReynoldsDecomposition primitiveFlow,
  dissipationClosure := TurbulentEnergyBalance primitiveFlow,
  turbulenceModelClosed := NavierStokesTurbulenceClosed primitiveFlow,
  boundaryCarried := formalizationCertificate.theoremBoundaryOpen = true,
  reynoldsStressClosureProof := primitive_flow_reynolds_decomposition_checked,
  dissipationClosureProof := primitive_flow_turbulent_energy_balance_checked,
  turbulenceModelClosedProof := primitive_flow_navier_stokes_turbulence_closed_checked,
  boundaryCarriedProof := rfl
}

def TurbulenceClosureLayerClosed (C : TurbulenceClosureCertificate) : Prop :=
  CascadeLayerClosed C.cascade ∧ C.reynoldsStressClosure ∧ C.dissipationClosure ∧ C.turbulenceModelClosed ∧ C.boundaryCarried

theorem source_turbulence_closure_layer_closed :
    TurbulenceClosureLayerClosed sourceTurbulenceClosureCertificate := by
  exact And.intro source_cascade_layer_closed
    (And.intro sourceTurbulenceClosureCertificate.reynoldsStressClosureProof
      (And.intro sourceTurbulenceClosureCertificate.dissipationClosureProof
        (And.intro sourceTurbulenceClosureCertificate.turbulenceModelClosedProof sourceTurbulenceClosureCertificate.boundaryCarriedProof)))

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse