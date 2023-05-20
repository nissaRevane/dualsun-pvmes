# frozen_string_literal: true

# curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost:3000/pvmes_forms

class PvmesFormsController < ApplicationController
  def create
    payload = JSON.parse(params[:body], symbolize_names: true)
    constructor = PvmesFormConstructor.new(payload)
    created_id = constructor.call

    if created_id
      render json: { id: created_id }, status: :created
    else
      render json: { errors: constructor.errors }, status: :unprocessable_entity
    end
  end
end
