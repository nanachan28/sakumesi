class BookmarksController < ApplicationController
    def create
        bookmark = current_user.bookmarks.create(restaurant_id: params[:restaurant_id]) 
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        bookmark = Bookmark.find_by(restaurant_id: params[:restaurant_id], user_id: current_user.id)
        bookmark.destroy
        redirect_back(fallback_location: root_path)
      end
end
