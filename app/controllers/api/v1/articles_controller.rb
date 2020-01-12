module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                @articles = Article.order('created_at DESC');
                render json: {status:'SUCCESS', message:'Loaded articles',data:@articles},status: :ok
            end

            def show
                @articles = Article.find(params[:id]);
                render json: {status:'SUCCESS', message:'Loaded article',data:@articles},status: :ok
            end

            def create 
                @article = Article.new(articles_params)

                if @article.save
                    render json: {status:'SUCCESS', message:'Loaded article',data:@article},status: :ok
                else
                    render json: {status:'ERROR', message:'Article Not Saved.',data:@article.errors},status: :unprocessable_entity
                end
            end 
            
            def update
                @article = Article.find(params[:id])

                if @article.update_attributes(articles_params)
                    render json: {status:'SUCCESS', message:'Article Updated',data:@article},status: :ok
                else
                    render json: {status:'ERROR', message:'Article Not Updated.',data:@article.errors},status: :unprocessable_entity
                end
            end
            
            def destroy
                @article = Article.find(params[:id])

                if @article.destroy
                    render json: {status:'SUCCESS', message:'Deleted article',data:@article},status: :ok
                 else
                    render json: {status:'ERROR', message:'Article Not Deleted.',data:@article.errors},status: :unprocessable_entity
                end
            end

            private

            def articles_params
                params.permit(:title,:body);
            end

        end
    end
end