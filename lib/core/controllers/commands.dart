abstract class AsyncCommand<I, O> {
  Future<O> execute(I param);
}

abstract class AsyncListCommand<I, D> implements AsyncCommand<I, List<D>> {}

abstract class AsyncVoidCommand<I> implements AsyncCommand<I, void> {}