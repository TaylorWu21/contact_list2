require 'rails_helper'

RSpec.describe Person, type: :model do

	describe 'instance methods' do
    before(:each) do
      @person = Person.create(first_name: "row", last_name: "low")
    end
    it "Display name" do
	    expect(@person.name).to eq("#{@person.first_name} #{@person.last_name}")
    end
  end
end

RSpec.describe StateHelper, type: :module do

	describe 'StateHelper' do
		include StateHelper
		it { valid_states == ["Washington", 'Colorado', 'Oregon', 'Alaska']}
	end
end
