ssh_add_list(){
    if [ `ssh-add -l | grep "RSA" | wc -l` -eq 0 ]; then
        find ${SSHDIR} -name "github_rsa" | xargs ssh-add > /dev/null 2>&1
        find ${SSHDIR} -name "id_rsa_pz" | xargs ssh-add > /dev/null 2>&1
        echo "ssh-add を実行しました"
    fi
}
