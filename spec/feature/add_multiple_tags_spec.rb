require 'spec_helper'

  feature 'add multiple tags' do
    scenario 'user can add multiple tags to a link' do
      add_multi_tag
      link = Link.first
      expect(link.tags.map(&:tag)).to include('window', 'dog')
    end
  end
