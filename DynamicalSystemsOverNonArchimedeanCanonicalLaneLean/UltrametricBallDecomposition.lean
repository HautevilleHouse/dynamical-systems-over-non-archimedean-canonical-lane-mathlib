import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.NonArchimedeanDynamicalSystem

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure UltrametricBallDecomposition (S : NonArchimedeanDynamicalSystem) where
  center : S.stateSpace
  radius : ℚ
  ballSet : Set S.stateSpace
  clopenProperty : IsClopen ballSet
  translationInvariant : ∀ t : S.time, S.action t '' ballSet = ballSet
  nestingProperty : Prop
  partitionProperty : Prop

structure UltrametricBallDecompositionEvidence {S : NonArchimedeanDynamicalSystem}
    (U : UltrametricBallDecomposition S) where
  clopenPropertyClosed : U.clopenProperty
  translationInvariantClosed : U.translationInvariant
  nestingPropertyClosed : U.nestingProperty
  partitionPropertyClosed : U.partitionProperty

def UltrametricBallDecompositionClosed {S : NonArchimedeanDynamicalSystem}
    (U : UltrametricBallDecomposition S) : Prop :=
  U.clopenProperty ∧ U.translationInvariant ∧ U.nestingProperty ∧ U.partitionProperty

theorem ultrametric_ball_decomposition_closed_from_evidence
    {S : NonArchimedeanDynamicalSystem} (U : UltrametricBallDecomposition S)
    (E : UltrametricBallDecompositionEvidence U) :
    UltrametricBallDecompositionClosed U := by
  exact And.intro E.clopenPropertyClosed
    (And.intro E.translationInvariantClosed
      (And.intro E.nestingPropertyClosed E.partitionPropertyClosed))

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse