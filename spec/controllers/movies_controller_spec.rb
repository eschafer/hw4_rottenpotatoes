require 'spec_helper'

describe MoviesController do
  describe "finding similar movies" do
    before :each do
      @fake_results = "fake results"
    end

    it "should call the model method that performs the search" do
      Movie.should_receive(:find_by_director).with('Alfred Hitchcock').and_return(@fake_results)
      post :find_similar, {:director => 'Alfred Hitchcock'}
    end
    it "should select the Similar Movies template for rendering" do
      Movie.should_receive(:find_by_director).with('Alfred Hitchcock').and_return(@fake_results)
      post :find_similar, {:director => 'Alfred Hitchcock'}
      response.should render_template('find_similar')
    end
    it "should make the search results available to that template" do
      Movie.stub(:find_by_director).and_return(@fake_results)
      post :find_similar, {:director => 'Alfred Hitchcock'}
      assigns(:movies).should == @fake_results
    end
  end
end