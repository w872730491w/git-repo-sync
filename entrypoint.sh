git remote add target http://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#http://}

case "${GITHUB_EVENT_NAME}" in
    push)
        git pull
        git push --all target
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        ;;
    *)
        break
        ;;
esac
