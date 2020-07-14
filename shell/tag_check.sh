gitlabBranch="refs/tags/0.3.1"
gitlabActionType="TAG_PUSH"
echo ${gitlabActionType}

#gitlabBranch="refs/tags/10.13.1"

tag=`echo ${gitlabBranch} | sed -n -e 's/refs\/tags\///p'`

image_name="hub.fuxi.netease.com/ai-project/ruban-base:${tag}"

if ! [[ "${gitlabActionType}" == "TAG_PUSH" ]]; then
    echo 'not tag push'
    exit 0
fi
echo ${tag}
if ! [[ "${tag}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "tag[${tag}] is not a legal version name"
    exit 1
fi

echo "build image[${image_name}]"
    
