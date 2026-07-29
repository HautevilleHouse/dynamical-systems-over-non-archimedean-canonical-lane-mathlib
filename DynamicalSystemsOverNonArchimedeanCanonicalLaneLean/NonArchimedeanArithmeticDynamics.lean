import DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.NonArchimedeanErgodic

/-!
# Non-Archimedean Arithmetic Dynamics Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure NonArchimedeanArithmeticDynamicsPackage {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} {E : NonArchimedeanErgodicPackage F} where
  heightFunction : Type u
  canonicalHeight : Prop
  northcottProperty : Prop
  uniformBounds : Prop
  arithmeticEntropy : Prop

structure NonArchimedeanArithmeticDynamicsEvidence
    {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} {E : NonArchimedeanErgodicPackage F}
    (A : NonArchimedeanArithmeticDynamicsPackage E) where
  canonicalHeightClosed : A.canonicalHeight
  northcottPropertyClosed : A.northcottProperty
  uniformBoundsClosed : A.uniformBounds
  arithmeticEntropyClosed : A.arithmeticEntropy

def NonArchimedeanArithmeticDynamicsClosed
    {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} {E : NonArchimedeanErgodicPackage F}
    (A : NonArchimedeanArithmeticDynamicsPackage E) : Prop :=
  A.canonicalHeight ∧ A.northcottProperty ∧
  A.uniformBounds ∧ A.arithmeticEntropy

theorem non_archimedean_arithmetic_dynamics_closed_from_evidence
    {D : NonArchimedeanDynamicsPackage}
    {F : NonArchimedeanFatouPackage D} {E : NonArchimedeanErgodicPackage F}
    (A : NonArchimedeanArithmeticDynamicsPackage E)
    (Ev : NonArchimedeanArithmeticDynamicsEvidence A) :
    NonArchimedeanArithmeticDynamicsClosed A := by
  exact And.intro Ev.canonicalHeightClosed
    (And.intro Ev.northcottPropertyClosed
      (And.intro Ev.uniformBoundsClosed
        Ev.arithmeticEntropyClosed))

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse