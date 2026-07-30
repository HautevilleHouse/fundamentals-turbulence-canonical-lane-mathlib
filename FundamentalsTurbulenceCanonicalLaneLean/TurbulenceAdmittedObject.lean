import canonicalLaneMathlib.AdmissibleClass
import FundamentalsTurbulenceCanonicalLaneLean.TurbulenceClosureLayer

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def turbulenceAdmittedObject : AdmittedTheoremObject := {
  object := theoremSpecificObject,
  localWitness := "Turbulence analytic certificate with Reynolds decomposition, energy cascade, and closure layer.",
  bridgeEvidence := "source-derived Lean certificate fields",
  sourceKeyChecked := rfl,
  theoremObjectChecked := rfl
}

def turbulenceAdmissibleClass : AdmissibleClass := {
  object := turbulenceAdmittedObject,
  endpointSatisfied := NavierStokesTurbulenceClosed primitiveFlow,
  remainderRecorded := formalizationCertificate.theoremBoundaryOpen = true,
  gateWitness := Or.inl primitive_flow_navier_stokes_turbulence_closed_checked
}

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse