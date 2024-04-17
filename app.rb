require "sinatra"
require "sinatra/reloader"

## SQUARE
get("/square/new") do
  erb(:new_square_calc)
end

get '/square/results' do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num**2
  erb(:square_results)
end

## SQUARE ROOT
get("/square_root/new") do
  erb(:new_square_root_calc)
end

get '/square_root/results' do
  @the_num2 = params.fetch("users_number").to_f

  @the_result2 = @the_num2**0.5
  erb(:square_root_results)
end

## PAYMENT
get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @monthly_rate = @apr/12/100
  @periods = params.fetch("years").to_i*12
  @principal = params.fetch("principal").to_i
  @numerator = @principal * @monthly_rate
  @denominator = (1-(1+@monthly_rate)**-@periods)

  @the_result3 = @numerator / @denominator
  erb(:payment_results)
end

## Random
get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @the_result4 = rand(@min..@max)

  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
