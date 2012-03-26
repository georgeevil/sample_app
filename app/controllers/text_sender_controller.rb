class TextSenderController < ApplicationController
  def index
  end

  def send_text_message
    number_to_send_to = params[:number_to_send_to]
    message = params[:sms_message]
    if message.nil?
      message = "Sample message"
    end
    
    twilio_sid = "ACf98127f350404cdbaa123c83c15d62f8"
    twilio_token = "e626f07dc22d066327782c1d474f68a9"
    twilio_phone_number = "415-599-2671"
    twilio_pin = "89570938"

    begin
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body =>  twilio_pin +"sent to #{number_to_send_to}" + message
    )
    rescue StandardError => bang
      redirect_to :action => '.', 'msg' => "Error #{bang}"
      return
    end
      redirect_to :action => '', 'msg' => "Calling #{params['number']}..."
  end
end