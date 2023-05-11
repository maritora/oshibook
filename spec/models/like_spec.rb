require 'rails_helper'

RSpec.describe Like, type: :model do 
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Profileモデルとの関係' do
      it 'N:1となっている' do
        expect(Like.reflect_on_association(:profile).macro).to eq :belongs_to
      end
    end
  end
end