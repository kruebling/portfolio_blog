require 'rails_helper'

describe Comment, 'validation' do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :article_id }
  it { should validate_presence_of :body }
end

describe Comment, 'association' do
  it { should have_one(:user).through(:article) }
  it { should belong_to :article }
end

describe Comment, 'column_specification' do
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:article_id).of_type(:integer) }
  it { should have_db_column(:body).of_type(:text) }
end
