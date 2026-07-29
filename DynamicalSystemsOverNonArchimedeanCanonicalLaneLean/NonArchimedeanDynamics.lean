import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

structure NonArchimedeanDynamicsPackage where
  field : Type u
  valuation : field → ℝ
  dynamicsMap : field → field
  isContraction : Prop

def NonArchimedeanDynamicsClosed (P : NonArchimedeanDynamicsPackage) : Prop :=
  P.isContraction

theorem non_archimedean_dynamics_closed (P : NonArchimedeanDynamicsPackage) (h : P.isContraction) :
  NonArchimedeanDynamicsClosed P := by
  exact h

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse
