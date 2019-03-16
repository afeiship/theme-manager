module Response
  def json_response(object, code = 0, status = :ok)
    render json: {
      data: object,
      code: code
    }, status: status
  end
end