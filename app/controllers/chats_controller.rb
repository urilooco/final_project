class ChatsController < AuthorizationsController
  # before_action :set_chat, only: %i[ show edit update destroy ]
  before_action :set_chat, only: %i[ show ]

  # GET /chats or /chats.json
  def index
    @chats = Chat.all
    # @chats = ChatsUser.where("user_id = #{current_user.id}")
  end

  # GET /chats/1 or /chats/1.json
  def show
    @chats = Chat.all
    # @chats = ChatsUser.where("user_id = #{current_user.id}")
    # @chats = current_user.chats.order(created_at: :desc)
    render "index"
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  # def edit
  # end

  # POST /chats or /chats.json
  def create
    @chat = Chat.new(chat_params)
    # @chat = current_user.chats.new(chat_params)

    # @chat_users = []
    # @chat_users << current_user.id
    # @chat_users << user.id

    respond_to do |format|
      if @chat.save
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully created." }
        format.json { render :show, status: :created, location: @chat }
        ChatsUser.create!(:user_id => current_user.id, :chat_id => @chat.id)
        ChatsUser.create!(:user_id => user.id, :chat_id => @chat.id)
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  # def update
  #   respond_to do |format|
  #     if @chat.update(chat_params)
  #       format.html { redirect_to chat_url(@chat), notice: "Chat was successfully updated." }
  #       format.json { render :show, status: :ok, location: @chat }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @chat.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /chats/1 or /chats/1.json
  # def destroy
  #   @chat.destroy

  #   respond_to do |format|
  #     format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit()
    end
end
