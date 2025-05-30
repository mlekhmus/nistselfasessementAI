# NIST CSF Self-Assessment AI

AI-powered cybersecurity maturity assessment tool for NIST CSF 2.0 with manufacturing-specific controls and intelligent guidance.

## 🚀 **One-Command Installation**

```bash
curl -sSL https://raw.githubusercontent.com/mlekhmus/nistselfasessementAI/main/install.sh | bash
```

**That's it!** The installer will:
- ✅ Download all files from GitHub
- ✅ Set up Docker environment  
- ✅ Build and start the application
- ✅ Open at `http://localhost:8000/nist_csf_tracker_complete.html`

## 🎯 Alternative Installation Methods

### Method 1: Git Clone
```bash
git clone https://github.com/mlekhmus/nistselfasessementAI.git
cd nistselfasessementAI
docker-compose up --build -d
```

### Method 2: Download and Extract
```bash
wget https://github.com/mlekhmus/nistselfasessementAI/archive/main.zip
unzip main.zip && cd nistselfasessementAI-main
docker-compose up --build -d
```

### Method 3: Manual Setup (if Docker not preferred)
```bash
git clone https://github.com/mlekhmus/nistselfasessementAI.git
cd nistselfasessementAI

# Start web server
python -m http.server 8000 &

# Start API proxy  
python claude_proxy.py &

# Open browser
open http://localhost:8000/nist_csf_tracker_complete.html
```

## 🤖 AI Features Setup

1. **Get Claude API Key**: Visit [console.anthropic.com](https://console.anthropic.com/)
2. **Set Environment Variable**:
   ```bash
   echo "CLAUDE_API_KEY=your_key_here" > .env
   docker-compose restart
   ```
3. **Or Enter in Web Interface**: Click "🔍 Test API Connection" in the app

## ✨ What You Get

### AI-Powered Assessment Features
- **Control-Specific Guidance**: AI references exact control definitions and maturity levels
- **Intelligent Questioning**: Targeted questions based on your uploaded control descriptions  
- **Maturity Mapping**: Automatically maps responses to specific maturity levels (1-5)
- **Actionable Recommendations**: Specific steps to reach the next maturity level

### 89+ Manufacturing Controls
Each control includes detailed maturity guidance:
- **Level 1 - Initial**: "Security decisions made without clear understanding..."
- **Level 2 - Developing**: "Security teams somewhat aware of business objectives..."  
- **Level 3 - Defined**: "Cybersecurity goals formally aligned with business objectives..."
- **Level 4 - Managed**: "Security risk management embedded in enterprise governance..."
- **Level 5 - Optimized**: "Real-time optimization and continuous improvement..."

### Complete Assessment Platform
- ✅ **Real-time Dashboard** with gap analysis and completion tracking
- ✅ **Export/Import** complete assessment data (CSV/JSON)
- ✅ **Mobile Responsive** - assess anywhere on any device
- ✅ **Local Storage** - no data leaves your environment
- ✅ **Docker Containerized** - consistent deployment anywhere

## 🎯 Quick Start Guide

1. **Run the installer** (one command above)
2. **Open browser** to `http://localhost:8000/nist_csf_tracker_complete.html`
3. **Upload CSV**: Load the included NIST controls file  
4. **Add API Key**: Enter your Claude API key for AI features
5. **Start Assessing**: Use manual scoring or AI-guided assessment
6. **Export Results**: Save your complete assessment

## 🔧 Management Commands

```bash
# View logs
docker-compose logs -f

# Stop services  
docker-compose down

# Restart services
docker-compose restart

# Update to latest version
git pull origin main
docker-compose up --build -d
```

## 📊 What Makes This Different

**This isn't just another NIST assessment tool.** Most tools give you generic questions and basic scoring. This tool provides:

### Detailed Maturity Guidance
Every control includes specific, actionable descriptions for all maturity levels - not just generic scores.

### Context-Aware AI  
The AI doesn't ask generic questions. It references your specific control definitions to provide targeted assessments.

### Manufacturing Focus
89+ controls specifically tailored for manufacturing environments with industry-relevant examples.

### Complete Data Lifecycle
Export includes all control definitions AND your assessment data - re-import later to restore everything exactly as it was.

## 🆘 Troubleshooting

**Container won't start:**
```bash
docker-compose logs
```

**Can't access localhost:8000:**
```bash
# Check if ports are in use
netstat -an | grep 8000
docker ps
```

**AI features not working:**
```bash
# Test proxy directly
curl http://localhost:8001/claude

# Check API key
docker-compose exec nist-csf-tracker env | grep CLAUDE
```

## 📈 Use Cases

- **Internal Security Assessments**: Evaluate organizational cybersecurity maturity
- **Compliance Preparation**: Prepare for audits with documented evidence
- **Gap Analysis**: Identify specific areas for security improvement  
- **Progress Tracking**: Monitor improvement over time with regular assessments
- **Training & Education**: Learn NIST CSF with interactive examples

## 🤝 Contributing

- **Report Issues**: [GitHub Issues](https://github.com/mlekhmus/nistselfasessementAI/issues)
- **Suggest Features**: [GitHub Discussions](https://github.com/mlekhmus/nistselfasessementAI/discussions)
- **Contribute Code**: Fork, develop, and submit pull requests

## 📄 License

[Add your license here]

---

## 🎉 Ready to Assess Your Cybersecurity Maturity?

**One command to get started:**
```bash
curl -sSL https://raw.githubusercontent.com/mlekhmus/nistselfasessementAI/main/install.sh | bash
```

Then open `http://localhost:8000/nist_csf_tracker_complete.html` and begin your AI-powered NIST CSF assessment!

---

*Built for the cybersecurity community • Powered by AI • Based on NIST CSF 2.0*
