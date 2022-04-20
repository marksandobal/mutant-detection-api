require 'rails_helper'

RSpec.describe Dna, type: :model do
  it { should belong_to(:subject) }
end
