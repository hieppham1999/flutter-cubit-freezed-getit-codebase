abstract class Mapper<E, M> {
  M mapToModel(E entity);
  E mapToEntity(M model);
}