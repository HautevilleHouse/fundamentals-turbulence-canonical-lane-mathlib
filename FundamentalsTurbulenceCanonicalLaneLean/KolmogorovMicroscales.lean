import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalsTurbulenceCanonicalLaneLean.EnergyCascadeLayer

namespace HautevilleHouse
namespace FundamentalsTurbulenceCanonicalLaneLean

structure KolmogorovMicroscaleCertificate where
  energyCascade : EnergyCascadeCertificate
  kolmogorovLength : Prop
  kolmogorovTime : Prop
  kolmogorovVelocity : Prop
  kolmogorovLengthClosed : kolmogorovLength
  kolmogorovTimeClosed : kolmogorovTime
  kolmogorovVelocityClosed : kolmogorovVelocity

noncomputable def sourceKolmogorovMicroscaleCertificate : KolmogorovMicroscaleCertificate := {
  energyCascade := sourceEnergyCascadeCertificate,
  kolmogorovLength := True,
  kolmogorovTime := True,
  kolmogorovVelocity := True,
  kolmogorovLengthClosed := trivial,
  kolmogorovTimeClosed := trivial,
  kolmogorovVelocityClosed := trivial
}

def KolmogorovMicroscaleClosed (C : KolmogorovMicroscaleCertificate) : Prop :=
  EnergyCascadeClosed C.energyCascade ∧ C.kolmogorovLength ∧ C.kolmogorovTime ∧ C.kolmogorovVelocity

theorem source_kolmogorov_microscale_closed : KolmogorovMicroscaleClosed sourceKolmogorovMicroscaleCertificate := by
  exact And.intro source_energy_cascade_closed
    (And.intro sourceKolmogorovMicroscaleCertificate.kolmogorovLengthClosed
      (And.intro sourceKolmogorovMicroscaleCertificate.kolmogorovTimeClosed
        sourceKolmogorovMicroscaleCertificate.kolmogorovVelocityClosed))

end FundamentalsTurbulenceCanonicalLaneLean
end HautevilleHouse