class FeedbacksController < ApplicationController
before_action :authenticate_user!

	def index 
		@q1 = ( Feedback.sum("q1").to_f ) / Feedback.select("q1").count.to_f
		@q2 = ( Feedback.sum("q2").to_f ) / Feedback.select("q2").count.to_f
		@q3 = ( Feedback.sum("q3").to_f ) / Feedback.select("q3").count.to_f
		@q4 = ( Feedback.sum("q4").to_f ) / Feedback.select("q4").count.to_f
		@q5 = ( Feedback.sum("q5").to_f ) / Feedback.select("q5").count.to_f
		@q6 = ( Feedback.sum("q6").to_f ) / Feedback.select("q6").count.to_f
		@q7 = ( Feedback.sum("q7").to_f ) / Feedback.select("q7").count.to_f
		@q8 = ( Feedback.sum("q8").to_f ) / Feedback.select("q8").count.to_f
		@q9 = ( Feedback.sum("q9").to_f ) / Feedback.select("q9").count.to_f
		@q10 = ( Feedback.sum("q10").to_f ) / Feedback.select("q10").count.to_f

		authorize! :view_feedback, current_user
	end

	def show

	end

	def new
		@feedback = Feedback.new
		authorize! :create_feedback, current_user
	end

	def create
		@feedback = Feedback.new(params_feedback)
		respond_to do |format|
	      if @feedback.save
	        format.html { redirect_to dashboards_path, notice: 'Thankyou for submitting feedback'}
	        format.json { render action: 'new', status: :created, location: @feedback }
	      else
	        flash.now.alert = @feedback.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @feedback.errors, status: :unprocessable_entity }
	      end
	    end

		authorize! :create_feedback, current_user
	end

	def edit

	end

	def update

	end

	def destroy

	end

private
	def params_feedback
		params.require(:feedback).permit!
	end
end
