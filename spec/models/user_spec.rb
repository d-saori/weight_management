require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    context "データが条件を満たす時" do
      it "保存できる" do
      end
    end
    context "email が空の時" do
      it "エラーが発生する" do
      end
    end
    context "email が255文字以上の時" do
      it "エラーが発生する" do
      end
    end
    context "email がすでに存在する時" do
      it "エラーが発生する" do
      end
    end
    context "email がアルファベット英数文字のみの時" do
      it "エラーが発生する" do
      end
    end
    context "password が空の時" do
      it "エラーが発生する" do
      end
    end
    context "password がアルファベット英数文字以外の時" do
      it "エラーが発生する" do
      end
    end
    context "password が10文字以上の時" do
      it "エラーが発生する" do
      end
    end
    context "username が空の時" do
      it "エラーが発生する" do
      end
    end
    context "username が30文字以上の時" do
      it "エラーが発生する" do
      end
    end
    context "age が文字列の時" do
      it "エラーが発生する" do
      end
    end
    context "age が150以上の時" do
      it "エラーが発生する" do
      end
    end
    context "height が全角の時" do
      it "エラーが発生する" do
      end
    end
    context "weight が全角の時" do
      it "エラーが発生する" do
      end
    end
    context "profile が1000文字以上の時" do
      it "エラーが発生する" do
      end
    end
    context "target_weight が文字列の時" do
      it "エラーが発生する" do
      end
    end
    context "target_body が文字列の時" do
      it "エラーが発生する" do
      end
    end
  end

  context "ユーザーが削除された時" do
    it "そのユーザーのメッセージも削除される" do
    end
  end
end