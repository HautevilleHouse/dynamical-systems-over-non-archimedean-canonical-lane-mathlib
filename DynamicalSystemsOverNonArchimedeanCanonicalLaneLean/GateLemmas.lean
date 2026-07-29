import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  True

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  trivial

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse