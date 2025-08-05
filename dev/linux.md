* File commands  

| Command               | Details                                                                       |
| --------------------- | ----------------------------------------------------------------------------- |
| cmd > allout.txt 2>&1 | redirect all output of cmd execution (including error messages) to allout.txt |
| ls -a                 | list hidden files                                                             |
| touch                 | create a file                                                                 |
| cat                   | show file content                                                             |
| head -n 20            | show first 20 lines of file content                                           |
| tail                  | show last lines of file content                                               |
| tail -f file          | show the tail of file interactively                                           |
  
* System commands  

| Command                                                   | Details                                                                     |
| --------------------------------------------------------- | --------------------------------------------------------------------------- |
| cp -r                                                     | copy directory recursively                                                  |
| su admindev                                               | change user to admindev                                                     |
| df -h                                                     | disk drive usage                                                            |
| du -sh .                                                  | disk usage of current directory and show unit                               |
| ctrl+r                                                    | search in executed commands history                                         |
| top                                                       | show Mem CPU and running processes interactively                            |
| ps ux                                                     | show running processes for current user                                     |
| ps fax                                                    | show running processes for all user                                         |
| kill -9 pid1 pid2                                         | kill the mentioned processes                                                |
| sudo sh -c "sync; sudo echo 1 > /proc/sys/vm/drop_caches" | free the cach that kernel is keeping and its amount is shown in top command |
| $? 	                                                    | Exit code of recently executed foreground program                           |

  
* Grepping  

| Command | Details   |
| --------| --------- |
| grep -nir --include=\*.{h,hpp,cpp} --exclude-dir={prop_core\*,prop_lib\*} pattern path | \-n : show line numberinclude<br>\-i : ignore case<br>\-r : find in folder recursivly<br>\--include : file name should match specified regex<br>\--exclude-dir : subdirectory name should match specified regex    |
| grep -v | exclude a pattern    |
| grep -e first -e second -e third file| check that first and second and third are in line of file    |
| grep -w 'first\|second\|third’ file  | grep using regex|
| grep '^[a-z]cc:\*[0-9]\$'   | ^ : beginning of line<br>^[a-z] : first character should be lowercase alphabetic<br>cc\* : “cc” chars should be found in second and third position followed by any other chars <br> \$ : end of line ;<br>[0-9]\$ : last char should be numeric |
| grep -o first file \| wc -l| for each line containing “first” print just “first” and not all the line, so that wc -l return the number of matching lines   |
| grep “#[0-9A-Za-z]\\{1,9\\}” file    | grep all lines containing a hash folowed by one to nine chars that are alphanumeric   |
  
* Sftp
  
| Command | Details   |
| --------| --------- |
| sftp {user}@{host}:{remoteFileName} {localFileName}    | one line command to get a file |
| sftp {user}@{host}:{remote_dir} <<< \$'put {local_file_path}'   | one line command to put a file |
| \$ cd localFolder/<br>\$ sftp omar.rekik@server-name<br>sftp> cd dir_stream_server/<br>sftp> put dir_stream_server<br>sftp> quit | connect using sftp to the destination server to where the file will be copied<br>Enter the remote folder in which we will copy files of local folder<br>put command will copy the file from work dir in local machine to remote folder |
| sftp> get dir_stream_server<br>sftp> quit      | connect using sftp to the source server from where the file will be copied<br>Get remote folder to local folder|
| sftp> lcd      | cd a directory in local machine|
| sftp> lpwd     | print working directory in local machine|

* sed -i ‘s/51/55/g’ file.xml :	replace all “51” by “55” in file.xml
* sort -k2,2	sort starting from colomn 2 and end in colomn 2
* uniq -c	tells how many times a line was repeated by displaying a number as a prefix with the line
* Parsing  
  
| Command | Details   |
| --------| --------- |
| cut -f2 -d','    | get second colomn of lignes with comma delimiter, default delimiter is \\t   |
| awk -F "SourceAddress" '{print $2}' log/file.log \| cut -f1 -d '#'      | Use awk -F if delimiter is string and not char, get the value between string “SourceAddress" and character # |
| awk -F "Delim[[]0[]] = " '{print \$2}' \| awk -F " # " '{print \$1}'   | to skip special characters in regex, mention it between two square bracket<br>Awk action like print should be mentioned inside curly bracket<br> \$2 means second colomn of separated values with mentioned delimiter (default delimiter is tab \\t)   |
| awk 'function getField(field,i,sep) { if (index($i,field) !=0) { field_str=substr($i,index($i,field)+length(field)); field_str=substr(field_str,1,index(field_str,sep)-1); return field_str } return "\*"} {print getField("ExFieldName=", 13, ",")}' file.txt | awk script is defined between two cotes ‘ ‘ and then applied on input file file.txt<br>Function getField is defined and then used inside awk script<br>Input file should be tab separated value, and ‘i’ parameter is the index of column on which we will search the field<br>Returned value is the field value which is between field parameter (begin of field value) and sep parameter (end of field value) |
| awk 'NR==FNR{a[$1];next;}{if(!($1 in a)){print $1}}' file1.txt file2.txt > list.txt      | find lines in files2.txt that does not exist in file1.txt    |
| join -1 1 -2 2 file.txt ref.txt \| head  | join column 1 of file 1 with column 2 of file 2 and as column 1 is filtred the second will be filtred     |
  
