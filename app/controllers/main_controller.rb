class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    @religions = Religion.all
    @items = [
        {name: 'main1', subs: [
            {name: 'subs1', subs: %w[subsub1 subsub2]},
            {name: 'subs2', subs: %w[subsub3 subsub4]}
        ]},
        {name: 'main2', subs: [
            {name: 'subs3', subs: %w[subsub11 subsub12]},
            {name: 'subs4', subs: %w[subsub13 subsub14]}
        ]}
    ]
  end
end
