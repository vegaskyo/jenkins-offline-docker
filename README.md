# 🚀 Offline Jenkins Docker Setup 

[![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=flat&logo=docker&logoColor=white)](https://www.docker.com)
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=Jenkins&logoColor=white)](https://www.jenkins.io)

A secure, air-gapped Jenkins Docker image with pre-installed plugins and disabled update checks. Perfect for restricted network environments! 🔒🌐

## 📦 Features
- ✅ 100% Offline operation
- 🔌 50+ Essential plugins pre-installed
- 🛑 Update checks disabled
- 🔒 Security-first configuration
- 🐳 Docker-in-Docker support
- 📜 Jenkins Configuration as Code (JCasC) ready

## ⚙️ Prerequisites
- Docker 20.10+
- 4GB RAM (minimum)
- 10GB Disk space

## 🚦 Quick Start

### 1. Generate plugins.txt
```bash
# Install plugin manager
sudo apt install jenkins-plugin-cli

# Generate plugin list from existing Jenkins (optional)
jenkins-plugin-cli --list --output txt > plugins.txt
```

### 2. Download Plugins
```bash
mkdir plugins
jenkins-plugin-cli --plugin-download-directory ./plugins \
  --plugin-file plugins.txt \
  --war /usr/share/jenkins/jenkins.war
```

### 3. Build Image
```bash
docker build -t my-offline-jenkins:1.0 .
```

### 4. Run Container
```bash
docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  --name offline-jenkins \
  my-offline-jenkins:1.0
```

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

## 🤝 Contributing
PRs welcome! Please follow:
1. Fork repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Open PR

## 📄 License
MIT License - see [LICENSE](LICENSE) file

---

Made with ❤️ by [Your Name] | 🐳 Happy DevOps-ing!
