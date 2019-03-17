module Response
  def json_response(object, code = 0, status = :ok)
    render json: {
      data: object.as_json(:except => [:created_at, :updated_at]),
      code: code
    }, status: status
  end
end