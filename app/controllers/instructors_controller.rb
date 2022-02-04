class InstructorsController < ApplicationController
    before_action :send_404, unless: :find_by_id, only: [:show, :update, :destroy]

    def index
        instructors = Instructor.all
        if instructors
            render json: instructors, status: :created
        else
            render json: {error: "Your request could not be completed"}, status: :not_found
        end
    end

    def show
        # instructor = Instructor.find_by(id: params[:id])
        # if instructor
            render json: @instructor, status: :created
        # else
        #     render json: {error: "Instructor not found"}, status: :not_found
        # end
    end

    def create
        instructor = Instructor.create(instructor_params)
        if instructor
            render json: instructor, status: :created
        else
            render json: {error: "New instructor could not be created"}, status: :unproccesable_entity
        end
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.update(instructor_params)
            render json: instructor, status: :created
        else
            render json: {error: "Instructor not found"}, status: :not_found
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else
            render json: {error: 'Instructor not found'}, status: :not_found
        end
    end

    private

    def send_404
        render json: {error: 'Instructor not found'}, status: :not_found
    end

    def find_by_id
        @instructor = Instructor.find_by(id: params[:id])
    end

    def instructor_params
        params.permit(:name)
    end

end

# def show
#     instructor = Instructor.find_by(id: params[:id])
#     if instructor
#         render json: instructor, status: :created
#     else
#         render json: {error: "Instructor not found"}, status: :not_found
#     end
# end