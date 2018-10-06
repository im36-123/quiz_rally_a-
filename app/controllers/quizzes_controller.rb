# coding: utf-8
class QuizzesController < ApplicationController
  def index
    # 普通にviwe追加すればいいよ
    # Controllerにアクションの追加と
    # routes.erbにルートの追加忘れずに
    # redirect_to "http://www.rubyonrails.org"
    @test = Participant.where(count: 1, cp_one: nil)
  end

  def show
    @participant = Participant.find_by(:tag=> params[:tag])
    @quiz_id = params['id']
    # case @participant.count
    # when 0 then
    #   @quiz = Quiz.where(count: 0, quiz_num: @quiz_id)
    # end
    # when 1 then
    #   @quiz = Quiz.where(count: 1, quiz_num: @quiz_id)
    # end
    if @participant.count > 1
        @participant.count = @participant.count % 2
    end
    @quiz = Quiz.where(count: @participant.count, quiz_num: @quiz_id)
    @choices = Choice.where(quiz_id: @quiz_id, choice_count: @participant.count)
    @ans = Answer.find_by(:id=> params['id'])
    # @quiz = Quiz.find_by(:quiz_num=> params['id'])
    # @choice = Choice.find_by(:id=> params['id'])
    # @ans_id = params['id']
    # @ans = Answer.where(id: @ans_id)
  end

  def judge
    # redirect_to :back
    @choice = Choice.find_by(:id=> params['id'])
    logger.debug("@choice: #{@choice}")
      # FIXME 比較はBoolean型にしたほうがいい？
    @participant = Participant.find_by(:tag => params['tag'])
if @participant.count == 0 then
    case @choice.quiz_id
      when 1 then
        @participant.update_attributes( :cp_one => @choice.id )
        # @participant.cp_one = @choice.id
        # @participant.save
      when 2 then
        @participant.update_attributes( :cp_two => @choice.id )
        # @participant.cp_two = @choice.id
        # @participant.save
      when 3 then
        @participant.update_attributes( :cp_three => @choice.id )
        # @participant.cp_tree = @choice.id
        # @participant.save
      when 4 then
        @participant.update_attributes( :cp_four => @choice.id )
        # @participant.cp_four = @choice.id
        # @participant.save
      when 5 then
        @participant.update_attributes( :cp_five => @choice.id )
        # @participant.cp_five = @choice.id
        # @participant.save
    end
elsif @participant.count == 1
    case @choice.quiz_id
      when 1 then
        @participant.update_attributes( :cp_one_second => @choice.id )
      when 2 then
        @participant.update_attributes( :cp_two_second => @choice.id )
      when 3 then
        @participant.update_attributes( :cp_three_second => @choice.id )
      when 4 then
        @participant.update_attributes( :cp_four_second => @choice.id )
      when 5 then
        @participant.update_attributes( :cp_five_second => @choice.id )
    end
else
    case @choice.quiz_id
      when 1 then
        @participant.update_attributes( :cp_one_third => @choice.id )
      when 2 then
        @participant.update_attributes( :cp_two_third => @choice.id )
      when 3 then
        @participant.update_attributes( :cp_three_third => @choice.id )
      when 4 then
        @participant.update_attributes( :cp_four_third => @choice.id )
      when 5 then
        @participant.update_attributes( :cp_five_third => @choice.id )
    end
end

    if @choice.correct_flag == 1
        redirect_to action: :correct,
        :id => @choice['quiz_id']
    elsif @choice.correct_flag == 0
        redirect_to action: :incorrect,
        :id => @choice['quiz_id']
    end
      # @answer.correct_flag == 1 ? (redirect_to action: :correct) : (redirect_to action: :incorrect)
  end

  def correct
    #TODO DBに人数記録
  end

  def incorrect
    #TODO DBに人数記録
    @answer = Answer.where(quize_id: params['id'])
    @exp = Answer.find_by(:id=> params['id'])

  end
end
