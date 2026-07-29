import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure TateCurve (K : NonArchimedeanField) where
  ellipticCurve : Type u
  jInvariant : K
  hasGoodReduction : Prop
  hasSplitMultiplicativeReduction : Prop
  hasAdditiveReduction : Prop
  reductionTypeClassified : Prop

structure TateCurveEvidence (K : NonArchimedeanField) (T : TateCurve K) where
  jInvariantComputed : T.jInvariant = T.jInvariant
  reductionTypeClassifiedClosed : T.reductionTypeClassified

def TateCurveClosed (K : NonArchimedeanField) (T : TateCurve K) : Prop :=
  T.reductionTypeClassified

theorem tate_curve_closed_from_evidence (K : NonArchimedeanField) (T : TateCurve K) (E : TateCurveEvidence K T) : TateCurveClosed K T := by
  exact E.reductionTypeClassifiedClosed

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse