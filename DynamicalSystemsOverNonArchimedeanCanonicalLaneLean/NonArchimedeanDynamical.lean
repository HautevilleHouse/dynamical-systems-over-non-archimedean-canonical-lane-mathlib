import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure NonArchimedeanField where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  norm : carrier → ℝ
  isNonArchimedean : Prop
  isComplete : Prop
  isValuedField : Prop

structure NonArchimedeanDynamicalSystem (K : NonArchimedeanField) where
  stateSpace : Type v
  topology : TopologicalSpace stateSpace
  dynamics : K → stateSpace → stateSpace
  isContinuous : Prop
  isAnalytic : Prop
  isBounded : Prop

structure NonArchimedeanDynamicalEvidence (K : NonArchimedeanField) (S : NonArchimedeanDynamicalSystem K) where
  isContinuousClosed : S.isContinuous
  isAnalyticClosed : S.isAnalytic
  isBoundedClosed : S.isBounded

def NonArchimedeanDynamicalClosed (K : NonArchimedeanField) (S : NonArchimedeanDynamicalSystem K) : Prop :=
  S.isContinuous ∧ S.isAnalytic ∧ S.isBounded

theorem non_archimedean_dynamical_closed_from_evidence (K : NonArchimedeanField) (S : NonArchimedeanDynamicalSystem K) (E : NonArchimedeanDynamicalEvidence K S) : NonArchimedeanDynamicalClosed K S := by
  exact And.intro E.isContinuousClosed (And.intro E.isAnalyticClosed E.isBoundedClosed)

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse