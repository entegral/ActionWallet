require 'rails_helper'

describe Account do
  it { should validate_presence_of :name }
  it { should belong_to :user }
end
