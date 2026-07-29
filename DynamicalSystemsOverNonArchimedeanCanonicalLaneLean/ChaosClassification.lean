import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure ChaosClassificationPackage (S : NonArchimedeanDynamicalSystem) where
  sensitivityToInitialConditions : Prop
  topologicalTransitivity : Prop
  densePeriodicOrbits : Prop
  sensitivityTerm : sensitivityToInitialConditions
  transitivityTerm : topologicalTransitivity
  densePeriodicTerm : densePeriodicOrbits

structure ChaosClassificationEvidence {S : NonArchimedeanDynamicalSystem}
    (C : ChaosClassificationPackage S) where
  sensitivityClosed : C.sensitivityToInitialConditions
  transitivityClosed : C.topologicalTransitivity
  densePeriodicClosed : C.densePeriodicOrbits

def ChaosClassificationClosed {S : NonArchimedeanDynamicalSystem}
    (C : ChaosClassificationPackage S) : Prop :=
  C.sensitivityToInitialConditions ∧ C.topologicalTransitivity ∧ C.densePeriodicOrbits

theorem chaos_classification_closed_from_evidence
    {S : NonArchimedeanDynamicalSystem} (C : ChaosClassificationPackage S)
    (E : ChaosClassificationEvidence C) : ChaosClassificationClosed C := by
  exact And.intro E.sensitivityClosed
    (And.intro E.transitivityClosed E.densePeriodicClosed)

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse
