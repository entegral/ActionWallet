require 'rails_helper'

describe User do
  it { should validate_presence_of :username }
  it { should have_many :accounts }
end
