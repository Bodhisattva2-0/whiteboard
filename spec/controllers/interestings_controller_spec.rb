require 'rails_helper'
describe InterestingsController do
  describe "index" do
    it "should be success" do
     get :index
     expect(response).to be_success
   end

   it "lists all the interestings" do
    2.times {|n| Interesting.create(title: "interesting #{n}", description: "description #{n}", user_name: "user #{n}")}
    get :index
    expect(assigns(:interestings)[0].title).to eq "interesting 1"
    expect(assigns(:interestings)[1].title).to eq "interesting 0"
   end
 end

 describe "new" do
    it "should be success" do
      get :new
      expect(response).to be_success
      expect(assigns(:interesting)).to be_instance_of Interesting
    end
 end

 describe "create" do
    before do
      get :create, interesting: {title: "new interesting", description: "interesting description", user_name: "payton"}
    end

    it "should be success" do
      expect(response).to redirect_to(interestings_url)
    end

    it "creates a new interesting" do
      expect(Interesting.last.title).to eq "new interesting"
      expect(Interesting.last.description).to eq "interesting description"
      expect(Interesting.last.user_name).to eq "payton"
    end
  end
end