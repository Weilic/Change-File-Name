#本脚本的作用是批量将文件名中的指定内容替换
$goalStr = Read-Host "请输入目标字符串"
$changeStr = Read-Host "请输入修改字符串"
while(1){
    $flag = Read-Host "是否在当前目录的子目录下查找替换(Y/N)"
    if($flag -eq "Y" -or $flag -eq "N"){
        break
    }
}#是否进行对文件夹递归遍历
if($flag -eq "Y"){
    ls -Recurse -Filter *$goalStr* | ForEach-Object{
        Rename-Item  -Force  $_.FullName   $_.FullName.Replace($goalStr,$changeStr)
    }
}
else{
    ls -Filter *$goalStr* | ForEach-Object{
        Rename-Item -Force  $_.Name   $_.Name.Replace($goalStr,$changeStr)
    }
}
