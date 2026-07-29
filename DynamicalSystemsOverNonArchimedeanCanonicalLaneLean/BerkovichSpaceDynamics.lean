import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.UltrametricBallDecomposition

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure BerkovichSpaceDynamics (S : NonArchimedeanDynamicalSystem) where
  berkovichSpace : Type u
  topology : TopologicalSpace berkovichSpace
  actionBerkovich : S.time → berkovichSpace → berkovichSpace
  continuousAction : ∀ t, Continuous (actionBerkovich t)
  extendsAction : Prop
  fixedPoints : Set berkovichSpace
  classification : Prop

structure BerkovichSpaceDynamicsEvidence {S : NonArchimedeanDynamicalSystem}
    (B : BerkovichSpaceDynamics S) where
  continuousActionClosed : B.continuousAction = B.continuousAction
  extendsActionClosed : B.extendsAction
  fixedPointsClosed : B.fixedPoints = B.fixedPoints
  classificationClosed : B.classification

def BerkovichSpaceDynamicsClosed {S : NonArchimedeanDynamicalSystem}
    (B : BerkovichSpaceDynamics S) : Prop :=
  B.extendsAction ∧ B.classification

theorem berkovich_space_dynamics_closed_from_evidence
    {S : NonArchimedeanDynamicalSystem} (B : BerkovichSpaceDynamics S)
    (E : BerkovichSpaceDynamicsEvidence B) :
    BerkovichSpaceDynamicsClosed B := by
  exact And.intro E.extendsActionClosed E.classificationClosed

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse