import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure BerkovichSpace (K : NonArchimedeanField) where
  points : Type u
  topology : TopologicalSpace points
  structureSheaf : Type v
  isAnalytic : Prop
  isHausdorff : Prop
  isLocallyCompact : Prop

structure BerkovichEvidence (K : NonArchimedeanField) (B : BerkovichSpace K) where
  isAnalyticClosed : B.isAnalytic
  isHausdorffClosed : B.isHausdorff
  isLocallyCompactClosed : B.isLocallyCompact

def BerkovichClosed (K : NonArchimedeanField) (B : BerkovichSpace K) : Prop :=
  B.isAnalytic ∧ B.isHausdorff ∧ B.isLocallyCompact

theorem berkovich_closed_from_evidence (K : NonArchimedeanField) (B : BerkovichSpace K) (E : BerkovichEvidence K B) : BerkovichClosed K B := by
  exact And.intro E.isAnalyticClosed (And.intro E.isHausdorffClosed E.isLocallyCompactClosed)

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse