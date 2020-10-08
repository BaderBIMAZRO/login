class UsersController < ApplicationController
    before_action :set_user, only: [ :edit, :update] # probably want to keep using this
 
    # GET /users
    def index
       @users=  User.paginate(page: params[:page]).where('admin !=?',true)
    end
   
    def filter
         # TODO: filter by gender
        if params[:gender].blank?
            @users = User.all.where('admin !=?',true)
          else  
              @gender = params[:gender]
              @users = User.filter(by_gender:@gender).where('admin !=?',true)
              end
    end

    # GET /users/1
    def search
       # TODO: search
        if params[:search].blank?  
            @users = User.all.where('admin !=?',true)
          else  
            @parameter = params[:search].downcase  
            @users = User.all.where("admin != TRUE AND lower(name) LIKE?", "%#{@parameter}%")
          end 
    end

    def excel
        @users = User.all.where('admin !=?',true)
         # TODO EXCELL Buttom
         respond_to do |format|
          format.xlsx {
            response.headers[
              'Content-Disposition'
            ] = "attachment; filename=Data.xlsx"
          }
          format.html { render :index }
        end
        end


    # GET /users/1/edit
    def edit
   
    end
   
    # PATCH/PUT /users/1
  
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to root_path, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        respond_to do |format|
          format.html { redirect_to root_url, notice: 'Place was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
   
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
      # this is for search form parameter
      def search_params
        params.require(:models).permit(:search)
      end
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:email, :name, :gender, :mobile_number, :upload)
      end
   
  end
