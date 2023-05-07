
# パスワードマネージャー
echo "パスワードマネージャーへようこそ！"

while true; do
  # 選択肢の表示
  echo "次の選択肢から入力してください(Add Password / Get Password / Exit)："
  read choice

  # Add Password の場合
  if [ "$choice" = "Add Password" ]; then
    echo "サービス名を入力してください："
    read service_name
    echo "ユーザー名を入力してください："
    read username
    echo "パスワードを入力してください："
    read password

    # 入力された情報を一時的にファイルに書き込む
    echo "$service_name:$username:$password" > pass.txt

    # ファイルを暗号化する
     gpg --batch --yes --passphrase="$password" -c pass.txt

    echo "パスワードの追加は成功しました。"

  # Get Password の場合
  elif [ "$choice" = "Get Password" ]; then
    echo "サービス名を入力してください："
    read service_name

    # ファイルから該当するサービス名の情報を取得
    password_info=$(grep "^$service_name:" pass.txt)

    # サービス名が登録されていなかった場合
    if [ -z "$password_info" ]; then
      echo "そのサービスは登録されていません。"

    # サービス名が登録されていた場合
    else
      echo "${password_info}"
    fi

  # Exit の場合
  elif [ "$choice" = "Exit" ]; then
    echo "Thank you!"
    exit 0

  # それ以外の場合
  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done

