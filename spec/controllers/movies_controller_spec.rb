require 'spec_helper'

describe MoviesController do
  describe "finding similar movies" do
    before :each do
      @fake_results = mock("fake", :director => "asdf")
    end

    it "should call the model method that performs the search" do
      Movie.should_receive(:find_by_id).with('3').and_return(@fake_results)
      post :similar, {:id => '3'}
    end
    it "should select the Similar Movies template for rendering" do
      Movie.should_receive(:find_by_id).with('3').and_return(@fake_results)
      post :similar, {:id => '3'}
      response.should render_template('similar')
    end
    it "should make the search results available to that template" do
      Movie.stub(:find_by_id).and_return(@fake_results)
      post :similar, {:id => '3'}
      assigns(:movies)
    end
  end
end