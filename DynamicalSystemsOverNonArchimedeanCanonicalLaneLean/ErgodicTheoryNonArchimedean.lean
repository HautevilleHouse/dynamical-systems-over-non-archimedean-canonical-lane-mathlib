import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.UltrametricBallDecomposition

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure ErgodicTheoryNonArchimedean (S : NonArchimedeanDynamicalSystem) where
  invariantMeasure : Set (Measure S.stateSpace)
  ergodicMeasures : Set (Measure S.stateSpace)
  uniqueErgodicity : Prop
  mixingProperty : Prop
  spectralProperties : Prop

structure ErgodicTheoryNonArchimedeanEvidence {S : NonArchimedeanDynamicalSystem}
    (E : ErgodicTheoryNonArchimedean S) where
  invariantMeasureClosed : E.invariantMeasure ≠ ∅
  ergodicMeasuresClosed : E.ergodicMeasures ⊆ E.invariantMeasure
  uniqueErgodicityClosed : E.uniqueErgodicity
  mixingPropertyClosed : E.mixingProperty
  spectralPropertiesClosed : E.spectralProperties

def ErgodicTheoryNonArchimedeanClosed {S : NonArchimedeanDynamicalSystem}
    (E : ErgodicTheoryNonArchimedean S) : Prop :=
  E.uniqueErgodicity ∧ E.mixingProperty ∧ E.spectralProperties

theorem ergodic_theory_non_archimedean_closed_from_evidence
    {S : NonArchimedeanDynamicalSystem} (E : ErgodicTheoryNonArchimedean S)
    (Ev : ErgodicTheoryNonArchimedeanEvidence E) :
    ErgodicTheoryNonArchimedeanClosed E := by
  exact And.intro Ev.uniqueErgodicityClosed
    (And.intro Ev.mixingPropertyClosed Ev.spectralPropertiesClosed)

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse