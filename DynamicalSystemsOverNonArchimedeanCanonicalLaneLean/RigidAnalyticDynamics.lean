import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure RigidAnalyticDynamicsPackage (K : NonArchimedeanField) (B : BerkovichSpace K) where
  flow : K → B.points → B.points
  isRigidAnalytic : Prop
  isCompatibleWithStructureSheaf : Prop
  fixedPointsClassified : Prop
  periodicPointsDense : Prop

structure RigidAnalyticDynamicsEvidence (K : NonArchimedeanField) (B : BerkovichSpace K) (R : RigidAnalyticDynamicsPackage K B) where
  isRigidAnalyticClosed : R.isRigidAnalytic
  isCompatibleWithStructureSheafClosed : R.isCompatibleWithStructureSheaf
  fixedPointsClassifiedClosed : R.fixedPointsClassified
  periodicPointsDenseClosed : R.periodicPointsDense

def RigidAnalyticDynamicsClosed (K : NonArchimedeanField) (B : BerkovichSpace K) (R : RigidAnalyticDynamicsPackage K B) : Prop :=
  R.isRigidAnalytic ∧ R.isCompatibleWithStructureSheaf ∧ R.fixedPointsClassified ∧ R.periodicPointsDense

theorem rigid_analytic_dynamics_closed_from_evidence (K : NonArchimedeanField) (B : BerkovichSpace K) (R : RigidAnalyticDynamicsPackage K B) (E : RigidAnalyticDynamicsEvidence K B R) : RigidAnalyticDynamicsClosed K B R := by
  exact And.intro E.isRigidAnalyticClosed (And.intro E.isCompatibleWithStructureSheafClosed (And.intro E.fixedPointsClassifiedClosed E.periodicPointsDenseClosed))

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse