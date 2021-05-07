require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションのチェック" do
    subject { user.valid? }

    context "データが条件を満たす時" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "email が空の時" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end
    context "email が256文字以上の時" do
      let(:user) { build(:user, email: "a" * 256) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は255文字以内で入力してください"
      end
    end
    context "email がすでに存在する時" do
      before { create(:user, email: "abcd@example.com") }
      let(:user) { build(:user, email: "abcd@example.com") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "はすでに存在します"
      end
    end
    context "email がアルファベット英数文字のみの時" do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は不正な値です"
      end
    end
    context "password が空の時" do
      let(:user) { build(:user, password: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "を入力してください"
      end
    end
    context "username が空の時" do
      let(:user) { build(:user, username: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:username]).to include "を入力してください"
      end
    end
    context "username が31文字以上の時" do
      let(:user) { build(:user, username: "a" * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:username]).to include "は30文字以内で入力してください"
      end
    end
    context "age が文字列の時" do
      let(:user) { build(:user, age: "a") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:age]).to include "は数値で入力してください"
      end
    end
    context "age が151以上の時" do
      let(:user) { build(:user, age: 151) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:age]).to include "は一覧にありません"
      end
    end
    context "age が負の整数のとき" do
      let(:user) { build(:user, age: -1) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:age]).to include "は一覧にありません"
      end
    end
    context "height が文字列の時" do
      let(:user) { build(:user, height: "a") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:height]).to include "は数値で入力してください"
      end
    end
    context "weight が文字列の時" do
      let(:user) { build(:user, weight: "a") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:weight]).to include "は数値で入力してください"
      end
    end
    context "profile が1001文字以上の時" do
      let(:user) { build(:user, profile: "a" * 1001) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:profile]).to include "は1000文字以内で入力してください"
      end
    end
    context "target_weight が文字列の時" do
      let(:user) { build(:user, target_weight: "a") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:target_weight]).to include "は数値で入力してください"
      end
    end
    context "target_body が文字列の時" do
      let(:user) { build(:user, target_body: "a") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:target_body]).to include "は数値で入力してください"
      end
    end
  end
end