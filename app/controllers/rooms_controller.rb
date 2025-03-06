# チャットルームを管理するコントローラーです
# チャットルームの一覧表示、新規作成などの機能を提供します
class RoomsController < ApplicationController

  # チャットルームの一覧を表示するページを表示します
  def index
  end
  
  # 新しいチャットルームを作成するためのフォームを表示します
  def new
    @room = Room.new
  end

  # 新しいチャットルームを作成します
  # 作成が成功したら一覧ページに戻り、失敗したら作成フォームを再表示します
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # チャットルーム作成時に許可するパラメータを設定します
  # ルーム名と参加するユーザーのIDを保存できます
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end