require 'rails_helper'

RSpec.describe "Likes", type: :system do
  describe 'いいねのテスト' do
    let(:user){FactoryBot.create(:user)}
    before do
      visit new_user_session_path
      fill_in "user_email", with: user.email
      fill_in 'user_password', with: user.password
      click_button 'ログイン'
      visit new_profile_path
      fill_in 'profile_oshi_name', with: "テスト2"
      fill_in 'profile_call', with: "テスト2"
      fill_in 'profile_job', with: "テスト2"
      fill_in 'profile_favorite_point', with: "テスト2"
      choose "profile_is_published_flag_true"
      click_on 'プロフィール作成する！'
    end
    context 'いいねをクリックした場合', js: true do
      it 'いいね登録・解除できる' do
        visit profiles_path
        find('.fa.fa-heart.like-btn').click
        expect(page).to have_css '.fa'
        expect(page).to have_css "td#likes_buttons_1", text: 'いいね1'
        find('.fa.fa-heart.unlike-btn').click
        expect(page).to have_css '.fa'
        expect(page).to have_css "td#likes_buttons_1", text: 'いいね0'
      end
    end
  end
end
