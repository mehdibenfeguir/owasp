ls | grep html
repo=https://github.com/openstack/bandit.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/opt/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /opt/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/opt/scanrepo" -e owasp_report_file="/opt/reports/owasp-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
