class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)
  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    letters = params[:letters].split(" ")
    @word = params[:word]
    result = @word.chars.all? { |letter| letters.include?(letter) }
    if result == true
      @result = "Vous avez gagné"
    else
      @result = "Vous avez perdu"
    end
  end
end
