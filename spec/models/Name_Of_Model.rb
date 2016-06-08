require 'rails_helper'

RSpec.describe NameOfModel, type: :model do


	describe 'Person' do
    it { should serialize(:items)}
  end

  describe 'instance methods' do
    before(:each) do
      @person = Person.create(first_name: "row", last_name: "low")
    end
    	it "Display name" do
        expect(@person.name).to eq("#{@person.first_name} #{@person.last_name}")
    end
  end
end
