enum RepoResourceType { CACHE, NETWORK }

class RepoResource<T> {
  final T data;
  final RepoResourceType type;

  RepoResource(this.type, this.data);
}
