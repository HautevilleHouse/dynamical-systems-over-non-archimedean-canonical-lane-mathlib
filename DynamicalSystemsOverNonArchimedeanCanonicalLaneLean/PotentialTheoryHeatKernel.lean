import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.BerkovichSpaceDynamics

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure PotentialTheoryHeatKernel {S : NonArchimedeanDynamicalSystem}
    (B : BerkovichSpaceDynamics S) where
  kernel : B.berkovichSpace → B.berkovichSpace → ℝ
  semigroupProperty : Prop
  nonArchimedeanTransition : Prop
  liouvilleProperty : Prop
  regularizingProperty : Prop

structure PotentialTheoryHeatKernelEvidence {S : NonArchimedeanDynamicalSystem}
    {B : BerkovichSpaceDynamics S} (P : PotentialTheoryHeatKernel B) where
  semigroupPropertyClosed : P.semigroupProperty
  nonArchimedeanTransitionClosed : P.nonArchimedeanTransition
  liouvillePropertyClosed : P.liouvilleProperty
  regularizingPropertyClosed : P.regularizingProperty

def PotentialTheoryHeatKernelClosed {S : NonArchimedeanDynamicalSystem}
    {B : BerkovichSpaceDynamics S} (P : PotentialTheoryHeatKernel B) : Prop :=
  P.semigroupProperty ∧ P.nonArchimedeanTransition ∧
  P.liouvilleProperty ∧ P.regularizingProperty

theorem potential_theory_heat_kernel_closed_from_evidence
    {S : NonArchimedeanDynamicalSystem} {B : BerkovichSpaceDynamics S}
    (P : PotentialTheoryHeatKernel B) (E : PotentialTheoryHeatKernelEvidence P) :
    PotentialTheoryHeatKernelClosed P := by
  exact And.intro E.semigroupPropertyClosed
    (And.intro E.nonArchimedeanTransitionClosed
      (And.intro E.liouvillePropertyClosed E.regularizingPropertyClosed))

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse