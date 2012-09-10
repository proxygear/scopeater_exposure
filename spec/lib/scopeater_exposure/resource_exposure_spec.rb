require 'spec_helper'


describe 'Resource exposure' do
  let(:controller) { PostsController.new }
  let(:params) { {id: :an_id} }

  before(:each) do
    controller.stub(:params).and_return params
  end

  it 'responds to resource method' do
    controller.should respond_to(:post)
  end

  describe 'call' do
    it 'triggers all hooks once' do
      [:current_user_hook, :taged_hook].each do |hook|
        controller.should_receive(hook).ordered
      end
      controller.post
    end
  end
end