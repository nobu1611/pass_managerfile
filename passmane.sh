echo "パスワードマネージャーへようこそ！"

echo "パスワードマネージャーへようこそ！"
read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" user
read -p "パスワードを入力してください：" password

echo "$service:$user:$password" >> passmane_list.txt

echo "Thank you!"
