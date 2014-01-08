  class CabinetController < ApplicationController

  before_filter :authenticate_user!
	layout 'cabinet'

  def index
  	@colors = ["one","two", "three", "four", "five", "six", "seven", "eight"]
  	@logos = Logo.where( :user_id => current_user.id )
  end

  def intro

  end

  def intro_show
    @quantity = params[:quantity]
  	a = Intro.new( params[:quantity] )
		a.generate_logo
		@logo = a.logo
		@number = a.number
    a.clear
  end

  def training
    intro = Intro.new(1)
    intro.clear_full_number
  end

  def training_show
    @quantity = params[:quantity]
    intro = Intro.new(params[:quantity])
    puts intro.full_number.empty?
    if !intro.full_number.empty?
      puts intro.full_number.to_s
      puts get_input_values.to_s
      if check_train_results( intro.full_number, get_input_values) == 0
        intro.generate_logo
        @number = intro.number
        @logo = intro.logo
        @res = 1
        # flash[:success] = "Logotype succefully decoded"
      else
        # flash[:error] = "Error decodeing logotype. Please? try again."
        @number = intro.full_number
        @logo = intro.check_logo
        @res = 2
        # head :ok
      end
    else
      intro.generate_logo
      @number = intro.number
      @logo = intro.logo
    end
  end

  def get_input_values
    arr = Array.new(10)
    arr[1] = params[:number1].to_i if params[:number1].present?
    arr[2] = params[:number2].to_i if params[:number2].present?
    arr[3] = params[:number3].to_i if params[:number3].present?
    arr[4] = params[:number4].to_i if params[:number4].present?
    arr[5] = params[:number5].to_i if params[:number5].present?
    arr[6] = params[:number6].to_i if params[:number6].present?
    arr[7] = params[:number7].to_i if params[:number7].present?
    arr[8] = params[:number8].to_i if params[:number8].present?
    arr[9] = params[:number9].to_i if params[:number9].present?
    arr[10] = params[:number10].to_i if params[:number10].present?
    return arr
  end

  def test
    test = TestMode.new
    # @time = test.stage
    test.reset_stage
    test.clear_full_number
  end

  def test_show
    @time = params[:time]
    @tmp_time = @time.to_f*1000
    gon.time = @tmp_time.to_i
    test_mode = TestMode.new
    @ggg = test_mode.number
    if !test_mode.full_number.empty?
      puts test_mode.full_number.to_s
      puts get_input_values.to_s
      if check_train_results( test_mode.full_number, get_input_values) == 0
        @number = test_mode.number
        test_mode.increase_stage if test_mode.full
        @res = 1
      else
        test_mode.reset_stage
        test_mode.reset_round
        @number = test_mode.full_number
        @res = 2
      end
    end
    # test_mode.generate_logo
    puts "in controller: #{test_mode.current_round} ? #{test_mode.round}"
    if (test_mode.current_round < test_mode.round) then
      test_mode.full ? test_mode.generate_full_logo : test_mode.generate_logo
    else
      test_mode.generate_logo
    end
    @stage = test_mode.stage
    @round = test_mode.round
    @cur_round = test_mode.current_round
    @full = test_mode.full

    @number = test_mode.number
    @logo = test_mode.logo
  end


  private

  def check_train_results( number, results )
    number <=> results
  end

end
