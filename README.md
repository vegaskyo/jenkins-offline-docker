# 🚀 Offline Jenkins Docker Setup 

[![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=flat&logo=docker&logoColor=white)](https://www.docker.com)
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=Jenkins&logoColor=white)](https://www.jenkins.io)

A secure, air-gapped Jenkins Docker image with pre-installed plugins and disabled update checks. Perfect for restricted network environments! 🔒🌐

## 📦 Features
- ✅ 100% Offline operation
- 🔌 50+ Essential plugins pre-installed (Include Gitlab, Kubernetes and essential ones)
- 🛑 Update checks disabled
- 🔒 Security-first configuration
- 🐳 Docker-in-Docker support
- 📜 Jenkins Configuration as Code (JCasC) ready

## ⚙️ Prerequisites
- Docker 20.10+
- 4GB RAM (minimum)
- 10GB Disk space


## 🔧 Customization

### Add Plugins
1. Edit `plugins.txt`
```txt
# Format: plugin-id:version
ansicolor:1.0.2
docker-workflow:521.v1a_a_dd2073b_2e
```

2. Rebuild image
```bash
docker build -t my-offline-jenkins:1.1 .
```

## 🛠️ Building Offline Image
1. Transfer these files to offline environment:
   - Dockerfile
   - plugins.txt
   - plugins/ directory
   - init.groovy.d/

2. Build without internet:
```bash
docker build -t offline-jenkins \
  --network none \
  .
```

## 🔒 Security Configuration
- Default security enabled
- No anonymous access
- Built-in role strategy support
- LDAP/Active Directory ready

## 🚨 Troubleshooting
**Q:** Getting plugin dependency errors?
```bash
# Regenerate plugins with dependencies
jenkins-plugin-cli --plugin-download-directory ./plugins \
  --plugin-file plugins.txt \
  --view-security-warnings \
  --available-updates
```

**Q:** Container restarting unexpectedly?
```bash
# Check logs
docker logs offline-jenkins

# Verify storage permissions
docker run ... -u root:root ...
```


Made with ❤️ by [vegaskyo] | 🐳 Happy DevOps-ing!
