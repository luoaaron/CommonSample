1.想要把SVN專案作轉移或複製時,舊的「.svn」真的是很煩人的東西,最快的方式是用終端機輸入
sudo find /Users/luoaaron/Aaron的/iosApp/CommonLib/ -name ".svn" -exec rm -r {} \;

