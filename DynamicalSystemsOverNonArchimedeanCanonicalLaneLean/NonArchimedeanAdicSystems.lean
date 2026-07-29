import DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.NonArchimedeanDynamics
import Mathlib.NumberTheory.Padics

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure AdicDynamicSystem (p : ℕ) [Fact (Nat.Prime p)] extends NonArchimedeanDynamicSystem where
  adicSpace : Type u
  adicTopology : TopologicalSpace adicSpace
  adicDynamics : adicSpace → adicSpace
  isometry : Prop
  BernoulliShift : Prop
  subshiftFiniteType : Prop

def adic_system_closed {p : ℕ} [Fact (Nat.Prime p)] (A : AdicDynamicSystem p) : Prop :=
  A.isometry ∧ A.BernoulliShift ∧ A.subshiftFiniteType

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse