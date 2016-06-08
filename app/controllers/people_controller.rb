class PeopleController < ApplicationController
	before_action :person, only: [:edit, :show, :update, :destroy]

  def generate_list
    name = person.name
    render partial: 'shopping_list', locals: { name: name}
  end
  def index
  	@people = Person.all
  end

  def new
  	@person = Person.new
  end

  def create
    @person = Person.new(person_params)
  	if person.save
  		redirect_to @person_path(person), flash: { notice: "Person on #{@person.email} created"}
  	else
      flash[:error] = @person
  		render :new, flash: { error: person.errors.full_messages}
  	end
  end

  def edit
  end

  def update
  	if @person.update(person_params)
  		redirect_to person_path(@person)
  	else
  		render :edit
  	end
  end

  def show
  end

  def destroy
  	if @person.destroy
  		redirect_to people_path
  	else
  		#send back error message
  		#redirect user to wherever i put delete button
  	end
  end
  private

  def person
  	@person = Person.find(params[:id])
  end

  def person_perams
    params.require(:person).permit(
       :email,
       :phone, 
       :first_name, 
       :last_name, 
       :age, 
       :relationship_status)
  end
end
