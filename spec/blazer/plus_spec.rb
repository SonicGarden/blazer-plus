# frozen_string_literal: true

RSpec.describe Blazer::Plus do
  it 'has a version number' do
    expect(Blazer::Plus::VERSION).not_to be nil
  end

  it 'The initial value of Blazer::Plus.enabled is true' do
    expect(Blazer::Plus.enabled).to eq(true)
  end
end
