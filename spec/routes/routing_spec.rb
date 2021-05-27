
require 'rails_helper'

RSpec.describe "route specs", type: :routing do
  it 'should not have profiles route' do
    expect(get: '/profiles').to_not be_routable
  end

  it 'should not have profile route' do
    expect(get: '/profiles/1').to_not be_routable
  end

end