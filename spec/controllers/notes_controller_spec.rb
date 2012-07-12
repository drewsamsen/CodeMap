require 'spec_helper'

describe NotesController do
  it "displays an error message when asked for a missing note" do
    get :show, :id => "missing-note"
    response.should redirect_to(notes_path)
    flash[:alert].should eql("The note you were looking for could not be found.")
  end
end