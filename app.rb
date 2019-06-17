require_relative 'config/environment'

class App < Sinatra::Base
  
  get '/reversename/:name' do
    @name_to_reverse = params[:name]
    @name_to_reverse.reverse
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{@num ** 2}"
  end

  get '/say/:number/:phrase' do
    @phrase = params[:phrase] + "<br>"
    @num = params[:number].to_i
    @phrase * @num
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1] + " "
    @word2 = params[:word2] + " "
    @word3 = params[:word3] + " "
    @word4 = params[:word4] + " "
    @word5 = params[:word5]

    @word1 + @word2 + @word3 + @word4 + @word5 + '.'
  end

  get '/:operation/:number1/:number2' do
    case params[:operation]
    when "add"
      @operation = :+
    when "subtract"
      @operation = :-
    when "multiply"
      @operation = :*
    when "divide"
      @operation = :/
    end

    result = params[:number1].to_i.send(@operation, params[:number2].to_i)
    "#{result}"
  end





end