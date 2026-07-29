import DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.NonArchimedeanDynamics

/-!
# Non-Archimedean Fatou and Julia Sets Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure NonArchimedeanFatouPackage {D : NonArchimedeanDynamicsPackage} where
  fatouSet : Type u
  juliaSet : Type v
  equicontinuityOnFatou : Prop
  chaoticOnJulia : Prop
  fatouSetOpenNonempty : Prop
  juliaSetCompactPerfect : Prop

structure NonArchimedeanFatouEvidence {D : NonArchimedeanDynamicsPackage}
    (F : NonArchimedeanFatouPackage D) where
  equicontinuityOnFatouClosed : F.equicontinuityOnFatou
  chaoticOnJuliaClosed : F.chaoticOnJulia
  fatouSetOpenNonemptyClosed : F.fatouSetOpenNonempty
  juliaSetCompactPerfectClosed : F.juliaSetCompactPerfect

def NonArchimedeanFatouClosed {D : NonArchimedeanDynamicsPackage}
    (F : NonArchimedeanFatouPackage D) : Prop :=
  F.equicontinuityOnFatou ∧ F.chaoticOnJulia ∧
  F.fatouSetOpenNonempty ∧ F.juliaSetCompactPerfect

theorem non_archimedean_fatou_closed_from_evidence
    {D : NonArchimedeanDynamicsPackage} (F : NonArchimedeanFatouPackage D)
    (E : NonArchimedeanFatouEvidence F) : NonArchimedeanFatouClosed F := by
  exact And.intro E.equicontinuityOnFatouClosed
    (And.intro E.chaoticOnJuliaClosed
      (And.intro E.fatouSetOpenNonemptyClosed
        E.juliaSetCompactPerfectClosed))

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse