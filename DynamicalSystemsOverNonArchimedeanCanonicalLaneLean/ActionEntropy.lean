import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure ActionEntropyPackage where
  spaceType : Type u
  topology : TopologicalSpace spaceType
  actionMap : spaceType → ℕ → spaceType
  invariantMeasure : Set spaceType → ℝ
  entropyValue : ℝ

def ActionEntropyClosed (A : ActionEntropyPackage) : Prop :=
  A.entropyValue > 0

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse
