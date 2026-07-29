import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure NonArchimedeanDynamicalSystem where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  time : Type v
  timeOrder : PartialOrder time
  timeTopology : TopologicalSpace time
  valuationField : Type w
  valuationRing : Type x
  action : time → stateSpace → stateSpace
  continuity : ∀ t, Continuous (action t)
  valuationCompatible : Prop
  nonArchimedeanMetric : Prop
  nonArchimedeanMetricTerm : nonArchimedeanMetric

structure NonArchimedeanDynamicalSystemEvidence (S : NonArchimedeanDynamicalSystem) where
  continuityClosed : S.continuity = S.continuity
  valuationCompatibleClosed : S.valuationCompatible
  nonArchimedeanMetricClosed : S.nonArchimedeanMetric

def NonArchimedeanDynamicalSystemClosed (S : NonArchimedeanDynamicalSystem) : Prop :=
  S.valuationCompatible ∧ S.nonArchimedeanMetric

theorem non_archimedean_dynamical_system_closed_from_evidence
    (S : NonArchimedeanDynamicalSystem) (E : NonArchimedeanDynamicalSystemEvidence S) :
    NonArchimedeanDynamicalSystemClosed S := by
  exact And.intro E.valuationCompatibleClosed E.nonArchimedeanMetricClosed

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse