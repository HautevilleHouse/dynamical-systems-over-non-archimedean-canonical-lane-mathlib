import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure EquidistributionPackage (S : NonArchimedeanDynamicalSystem) where
  invariantMeasure : Type u
  equidistributionProperty : Prop
  equidistributionPropertyTerm : equidistributionProperty
  effectiveRate : Prop
  effectiveRateTerm : effectiveRate

structure EquidistributionEvidence {S : NonArchimedeanDynamicalSystem}
    (E : EquidistributionPackage S) where
  equidistributionPropertyClosed : E.equidistributionProperty
  effectiveRateClosed : E.effectiveRate

def EquidistributionClosed {S : NonArchimedeanDynamicalSystem}
    (E : EquidistributionPackage S) : Prop :=
  E.equidistributionProperty ∧ E.effectiveRate

theorem equidistribution_closed_from_evidence
    {S : NonArchimedeanDynamicalSystem} (E : EquidistributionPackage S)
    (Ev : EquidistributionEvidence E) : EquidistributionClosed E := by
  exact And.intro Ev.equidistributionPropertyClosed Ev.effectiveRateClosed

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse
