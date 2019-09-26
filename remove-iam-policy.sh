 #!/usr/bin/env bash

delete_iam_member_binding () {

#prepare the member and role that needs to be removed
member="'user:<email address>'"
role="'roles/<rolename>'"
# ------------------------------------

#prepare the list of the project in the organisation
i=$(gcloud projects list | awk '{print $1}')
echo $i | sed '1d;$d' > list.txt

# ------------------------------------

#read a file, line-by-line to remove the member specifed  
for line in $(cat list.txt)
do
 gcloud projects remove-iam-policy-binding "$line" --member="$member" --role="$role"
done
}

# ------------------------------------

delete_iam_member_binding