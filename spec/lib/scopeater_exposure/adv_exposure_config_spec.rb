require 'spec_helper'

describe 'ADV exposure config' do
  let(:controller) { PostsController.new }
  let(:params) { {tag_name: :a_name} }
  let(:a_tag) { Tag.new }

  before(:each) do
    controller.stub(:params).and_return params
    Tag.stub(:first).and_return a_tag
  end

  describe 'tag call' do
    it 'triggers tag config hooks' do
      controller.should_receive(:tag_name_hook)
      controller.tag
    end
    
    it 'uses given finder' do
      Tag.should_receive(:first).and_return a_tag
      controller.tag
    end
    
    it 'returns a Tag' do
      controller.tag.should be_a(Tag)
    end
  end

  describe 'post call' do
    it 'trigger post config hooks' do
      [:current_user_hook, :taged_hook].each do |hook|
        controller.should_receive(hook).ordered
      end
      controller.post
    end
    
    it 'trigger tag call' do
      controller.should_receive(:tag).any_number_of_times
      controller.post
    end
  end
end