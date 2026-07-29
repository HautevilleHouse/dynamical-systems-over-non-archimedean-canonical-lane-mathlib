import DynamicalSystemsOverNonArchimedeanCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsOverNonArchimedeanCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure NonArchimedeanEndgameState where
  object : NonArchimedeanAdmittedObject

def nonArchimedeanProjection : Projection NonArchimedeanEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem non_archimedean_projection_idempotent (x : NonArchimedeanEndgameState) :
    nonArchimedeanProjection.toFun (nonArchimedeanProjection.toFun x) = nonArchimedeanProjection.toFun x := by
  exact nonArchimedeanProjection.idempotent x

end DynamicalSystemsOverNonArchimedeanCanonicalLaneLean
end HautevilleHouse