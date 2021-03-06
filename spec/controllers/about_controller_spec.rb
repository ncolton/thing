require 'rails_helper'

RSpec.describe AboutController, type: :request do
  describe 'index' do
    describe 'when not logged in' do
      it 'shows a sign up link' do
        visit '/'
        expect(page).to have_link('Sign up')
      end

      it 'shows a sign in link' do
        visit '/'
        expect(page).to have_link('Sign in')
      end
    end

    describe 'when logged in' do
      it 'should show a become instructor link when not an instructor' do
        log_in
        visit '/'
        expect(page).to have_link('Become an instructor')
      end

      it 'should show an update profile link for instructors' do
        log_in instructor: true
        visit '/'
        expect(page).to have_link('Update instructor profile')
      end
    end
  end
end
