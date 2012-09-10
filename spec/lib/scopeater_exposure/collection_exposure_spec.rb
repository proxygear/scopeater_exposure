require 'spec_helper'

describe 'Collection exposure' do
  let(:controller) { PostsController.new }
  let(:tag) { Tag.new }
  
  before(:each) do
    Tag.stub(:find_by_name).and_return tag
    Tag.stub(:first).and_return tag
  end

  it 'respond to collection' do
    controller.should respond_to(:posts)
  end

  describe 'call' do
    it 'triggers all hooks once' do
      [:taged_hook, :pagination_hook, :order_hook].each do |hook|
        controller.should_receive(hook).ordered
      end
      controller.posts
    end

    it 'returns a scopeater' do
      controller.posts.should be_kind_of(Scopeater::Base)
    end
  end
end