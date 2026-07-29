import DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure NonArchimedeanSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  valuation : carrier → ℚ

structure NonArchimedeanAdmittedObject where
  space : NonArchimedeanSpace
  dynamics : space.carrier → space.carrier
  valuationContracting : Prop
  topologicalMinimal : Prop
  modelSpace : Type
  modelTopology : TopologicalSpace modelSpace
  modeledDynamics : modelSpace → modelSpace
  conjugateToModel : Prop
  conclusion : conjugateToModel

def NonArchimedeanWitnessClosed (O : NonArchimedeanAdmittedObject) : Prop :=
  O.conjugateToModel

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse