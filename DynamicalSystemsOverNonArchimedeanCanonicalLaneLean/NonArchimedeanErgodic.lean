import DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.NonArchimedeanFatou

/-!
# Non-Archimedean Ergodic Theory Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure NonArchimedeanErgodicPackage {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} where
  invariantMeasure : Type u
  ergodicDecomposition : Prop
  mixingProperties : Prop
  measureTheoreticEntropy : Prop
  equidistribution : Prop

structure NonArchimedeanErgodicEvidence {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} (E : NonArchimedeanErgodicPackage F) where
  ergodicDecompositionClosed : E.ergodicDecomposition
  mixingPropertiesClosed : E.mixingProperties
  measureTheoreticEntropyClosed : E.measureTheoreticEntropy
  equidistributionClosed : E.equidistribution

def NonArchimedeanErgodicClosed {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} (E : NonArchimedeanErgodicPackage F) : Prop :=
  E.ergodicDecomposition ∧ E.mixingProperties ∧
  E.measureTheoreticEntropy ∧ E.equidistribution

theorem non_archimedean_ergodic_closed_from_evidence
    {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} (E : NonArchimedeanErgodicPackage F)
    (Ev : NonArchimedeanErgodicEvidence E) :
    NonArchimedeanErgodicClosed E := by
  exact And.intro Ev.ergodicDecompositionClosed
    (And.intro Ev.mixingPropertiesClosed
      (And.intro Ev.measureTheoreticEntropyClosed
        Ev.equidistributionClosed))

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse