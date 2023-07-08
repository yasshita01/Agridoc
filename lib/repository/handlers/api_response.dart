enum Status { LOADING, COMPLETED, ERROR }

class ApiResponse<T> {
  late Status status;
  late T data;
  late String message;

  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.message) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
}
