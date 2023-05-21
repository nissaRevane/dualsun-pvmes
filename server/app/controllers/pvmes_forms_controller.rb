# frozen_string_literal: true

class PvmesFormsController < ApplicationController
  def create
    payload = JSON.parse(request.body.read, symbolize_names: true)
    constructor = PvmesFormConstructor.new(payload)
    created_id = constructor.call

    if created_id
      render json: { id: created_id }, status: :created
    else
      render json: { errors: constructor.errors }, status: :unprocessable_entity
    end
  end
end
