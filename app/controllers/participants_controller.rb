class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def show
    @goaled_participants = Goal.all
  end

  def new
    # QRタグの文字列（ID）が参加者テーブルに存在するかどうか
    # する！
    if @participant = Participant.find_by(:tag => params[:tag])
        # @participant.count = @participant.count + 1
        #FIXME　これはまずいインクリメントカウンター使おう
        # render :text => "#{@participant.count}"
        # @participant.save
    # しない
    else
        # render :text => "id = #{params[:id]}"
        @participant = Participant.new
        @participant.tag = params[:tag]
        @participant.count = 0
        @participant.save
    end
    @participants = Participant.all
  end

  def classification
    # どのクイズか
    @participant = Participant.find_by(:tag => params[:tag])
    # render :text => "#{@participant.tag}"
    # @ua = request.user_agent #ユーザーエージェント取得
    # if @phone = Phone.find_by(:identification=> @ua)
    @ip = request.remote_ip # Get ip address
    if @phone = Phone.find_by(:identification=> @ip)
      redirect_to :controller => 'quizzes',
                  :action => 'show',
                  :id => @phone.quiz_id,
                  :tag => @participant.tag
    else
      Participant.increment_counter(:count, @participant.id)
      @goal = Goal.new
      @goal.participant = @participant.tag
      @goal.time = Time.zone.now
      @goal.save
      @msg = @participant.tag
    end
  end
end
