class PhonesController < ApplicationController

  def index
    @phones = Phone.all
  end

  def new
  end

  def show
    # ユーザーエージェント取得
    @ua = request.user_agent
    @ip = request.remote_ip
  end
end
