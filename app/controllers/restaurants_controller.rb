class RestaurantsController < ApplicationController
  before_action :set_q, only: [:index, :search]

    def index
      @forkeyvisual = Restaurant.order("RANDOM()").all
      @restaurant = Restaurant.all
      @tag = Tag.all
    end

    def about

    end

    def new
        @restaurant = Restaurant.new
    end
    
      def create
        restaurant = Restaurant.new(restaurant_params)
        restaurant.user_id = current_user.id
        if restaurant.save!
          redirect_to :action => "show", :id => restaurant.id
        else
          redirect_to :action => "new"
        end
      end

      def show
        @restaurant = Restaurant.find(params[:id])
        @comments = @restaurant.comments
        @comment = Comment.new
      end

      def edit
        @restaurant = Restaurant.find(params[:id])
      end

      def update
        restaurant = Restaurant.find(params[:id])
        if restaurant.update(restaurant_params)
          redirect_to :action => "show", :id => restaurant.id
        else
          redirect_to :action => "new"
        end
      end
    
      def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        redirect_to action: :index
      end

      def search
        day = Date.today.wday
        puts day
        @results = @q.result(distinct: true)
        @restaurant_tags = {}
        @results.each do |restaurant|
          @restaurant_tags[restaurant.id] = restaurant.tags
        end
        if params[:q][:tag_ids_in].present?
          @results = @results.joins(:tags).where(tags: { id: params[:q][:tag_ids_in] })
          @results = @results.group('restaurants.id').having('COUNT(tags.id) = ?', params[:q][:tag_ids_in].size)
        end
        if params[:latitude].present? && params[:longitude].present?
          latitude = params[:latitude].to_f
          longitude = params[:longitude].to_f
    
          @results = @results.near([latitude, longitude], 10)
        end

        if day == 0
          @results=@results.where(dayoffsun: false)
        elsif day == 1
          @results=@results.where(dayoffmon: false)
        elsif day == 2
          @results=@results.where(dayofftue: false)
        elsif day == 3
          @results=@results.where(dayoffwed: false)
        elsif day == 4
          @results=@results.where(dayoffthu: false)
        elsif day == 5
          @results=@results.where(dayofffri: false)
        else
          @results=@results.where(dayoffsat: false)
        end

        @current_time = Time.current.to_s(:time)

        @restaurant = Restaurant.all
        @tag = Tag.all
      end
                                          
      private

      def set_q
        if params[:q].present?    
          if params[:q][:name_or_about_or_genre_cont_all].present?
            params[:q][:name_or_about_or_genre_cont_all] = params[:q][:name_or_about_or_genre_cont_all].split(/[\p{blank}\s]+/)
          end
          @q = Restaurant.includes(:tags).ransack(params[:q])
        else
          @q = Restaurant.ransack(params[:q])
        end
      end  
                                                                                                                                                          
      def restaurant_params
        params.require(:restaurant).permit(:name, :genre, :address, :mapurl, :addresscode, :about, :image, :opentime, :endtime, :phone, :website, :whatsnew, :pay, :seattype, :dayoffmon, :dayofftue, :dayoffwed, :dayoffthu, :dayofffri, :dayoffsat, :dayoffsun, :latitude, :longitude, tag_ids: [], content: [])
      end
end