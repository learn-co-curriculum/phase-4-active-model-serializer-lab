require 'rails_helper'

RSpec.describe "route specs", type: :routing do
  it 'does not have profiles route' do
    expect(get: '/profiles').not_to be_routable
  end

  it 'does not have profile route' do
    expect(get: '/profiles/1').not_to be_routable
  end

end
