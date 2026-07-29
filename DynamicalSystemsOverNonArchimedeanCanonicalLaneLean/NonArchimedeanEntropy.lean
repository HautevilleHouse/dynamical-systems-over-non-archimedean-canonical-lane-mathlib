import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure NonArchimedeanEntropyPackage (K : NonArchimedeanField) (S : NonArchimedeanDynamicalSystem K) where
  topologicalEntropy : ℝ
  measureTheoreticEntropy : ℝ
  variationalPrincipleHolds : Prop
  entropyExpansive : Prop
  specificationProperty : Prop

structure NonArchimedeanEntropyEvidence (K : NonArchimedeanField) (S : NonArchimedeanDynamicalSystem K) (E : NonArchimedeanEntropyPackage K S) where
  variationalPrincipleHoldsClosed : E.variationalPrincipleHolds
  entropyExpansiveClosed : E.entropyExpansive
  specificationPropertyClosed : E.specificationProperty

def NonArchimedeanEntropyClosed (K : NonArchimedeanField) (S : NonArchimedeanDynamicalSystem K) (E : NonArchimedeanEntropyPackage K S) : Prop :=
  E.variationalPrincipleHolds ∧ E.entropyExpansive ∧ E.specificationProperty

theorem non_archimedean_entropy_closed_from_evidence (K : NonArchimedeanField) (S : NonArchimedeanDynamicalSystem K) (E : NonArchimedeanEntropyPackage K S) (Ev : NonArchimedeanEntropyEvidence K S E) : NonArchimedeanEntropyClosed K S E := by
  exact And.intro Ev.variationalPrincipleHoldsClosed (And.intro Ev.entropyExpansiveClosed Ev.specificationPropertyClosed)

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse