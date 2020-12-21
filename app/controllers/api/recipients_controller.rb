class Api::RecipientsController < ApplicationController
  def index
    render json: Recipient.serialized_for_api.to_json
  end
end
