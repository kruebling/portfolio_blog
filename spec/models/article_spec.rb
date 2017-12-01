require 'rails_helper'

describe Article, 'validation' do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end

describe Article, 'association' do
  it { should have_many :comments }
  it { should belong_to :user }
end

describe Article, 'column_specification' do
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:body).of_type(:text) }
end
