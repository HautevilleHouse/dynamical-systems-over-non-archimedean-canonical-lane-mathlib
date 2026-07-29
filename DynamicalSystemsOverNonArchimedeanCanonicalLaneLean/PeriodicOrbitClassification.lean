import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure PeriodicOrbitClassificationPackage (S : NonArchimedeanDynamicalSystem) where
  periodicOrbits : Set (S.baseSpace → Prop)
  orbitClassification : Prop
  orbitClassificationTerm : orbitClassification
  arityGapControlled : Prop
  arityGapControlledTerm : arityGapControlled

structure PeriodicOrbitClassificationEvidence {S : NonArchimedeanDynamicalSystem}
    (P : PeriodicOrbitClassificationPackage S) where
  orbitClassificationClosed : P.orbitClassification
  arityGapControlledClosed : P.arityGapControlled

def PeriodicOrbitClassificationClosed {S : NonArchimedeanDynamicalSystem}
    (P : PeriodicOrbitClassificationPackage S) : Prop :=
  P.orbitClassification ∧ P.arityGapControlled

theorem periodic_orbit_classification_closed_from_evidence
    {S : NonArchimedeanDynamicalSystem} (P : PeriodicOrbitClassificationPackage S)
    (E : PeriodicOrbitClassificationEvidence P) : PeriodicOrbitClassificationClosed P := by
  exact And.intro E.orbitClassificationClosed E.arityGapControlledClosed

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse
