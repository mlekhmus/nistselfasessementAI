NIST CSF 2.0 Manufacturing Compliance Tracker
A web-based cybersecurity maturity assessment tool with AI-powered guidance. Evaluate your organization against NIST CSF 2.0 controls with intelligent questionnaires and automated gap analysis.

🎯 What Makes This Different
Detailed Maturity Level Guidance: Each control includes specific, actionable descriptions for all 5 maturity levels (Initial → Optimized), not just generic scoring.

AI Assessor with Context: The AI doesn't just ask generic questions - it references your specific control definitions and maturity level guidance to provide targeted, relevant assessments.

This is what separates our NIST self-assessor from the rest.

<img width="1638" alt="image" src="https://github.com/user-attachments/assets/c5b9eef7-ff8c-4a1f-a6cd-00529164ef71" />

<img width="1393" alt="image" src="https://github.com/user-attachments/assets/be366754-a194-4d65-8324-8ce4beae1543" />


🚀 Quick Start
1. Setup Web Server
The app needs to run on a web server (not just opened as a file) for full functionality.

Option A: Python Server (Recommended)

bash
# Navigate to app directory
cd nist-csf-tracker

# Start web server
python -m http.server 8000

# Open browser to: http://localhost:8000
Option B: Node.js Server

bash
# Install and use serve
npm install -g serve
serve -s . -l 8000
Option C: Any other web server

Use Apache, Nginx, or your preferred server
Serve the HTML file from any port
2. Start AI Proxy (Optional but Recommended)
For AI-powered assessments, run the proxy in a separate terminal:

bash
# Start the Claude API proxy
python claude_proxy.py
You'll see:

🚀 Claude API Proxy running on http://localhost:8001
📡 Use http://localhost:8001/claude as your API endpoint
3. Open the Application
Navigate to: http://localhost:8000/nist_csf_tracker_complete.html
Upload CSV: Load the provided nist-csf-manufacturing-csv.txt file
Setup AI (if using proxy):
Click "🔍 Test API Connection"
Enter your Claude API key when prompted
Click test to verify connection
🎯 How to Use
Load Your Controls
Upload CSV: Use the file upload section to load NIST controls
Auto-populate: 89+ manufacturing controls load automatically
Dashboard Updates: See real-time metrics as you assess
Assess Controls
Manual Assessment:

Set Current Score (1-5 maturity level)
Set Target Score (desired maturity level)
Add Notes for documentation
AI-Powered Assessment:

Click 🤖 AI Assessment on any control
Interactive Chat: Answer AI questions about your implementation
Get Results: Receive maturity score and improvement recommendations
Save to Notes: Add AI assessment to your documentation
Track Progress
Dashboard: View completion %, average scores, and gaps
Filter/Search: Find specific controls quickly
Export Data: Save as JSON or CSV for reporting
Data Management
Auto-Save: All data saved to browser automatically
Export Complete: CSV export includes all original data + your assessments
Re-Import: Load exported CSVs to restore previous work
📋 What You Get
Files Included
nist_csf_tracker_complete.html - Main application
nist-csf-manufacturing-csv.txt - 89+ NIST controls with maturity guidance
claude_proxy.py - AI proxy server for Claude API
Key Features
✅ 89+ Manufacturing Controls with detailed maturity level descriptions
✅ Context-Aware AI Assessor that references your specific control definitions
✅ Comprehensive Maturity Guidance - not just scores, but actionable level descriptions
✅ Complete Export/Import Cycle - export includes all data, re-import restores everything
✅ Real-time Gap Analysis and progress dashboard
✅ Mobile Responsive design for assessments anywhere
🤖 AI Assessment Features
What separates this from other NIST assessors:

📋 Detailed Maturity Guidance
Each control includes comprehensive descriptions for all maturity levels:

Level 1 - Initial: "Security decisions are made without clear understanding..."
Level 2 - Developing: "Security teams are somewhat aware of business objectives..."
Level 3 - Defined: "Cybersecurity goals are formally aligned with business objectives..."
Level 4 - Managed: "Security risk management is embedded in enterprise governance..."
🤖 Context-Aware AI Assessor
The AI doesn't ask generic questions. Instead it:

References Specific Controls: "I'll be evaluating control GV.OC-01 - Organizational Context..."
Uses Your Maturity Definitions: Questions based on the exact Level 1-4 guidance you uploaded
Provides Targeted Analysis: Maps your responses to specific maturity characteristics
Gives Actionable Next Steps: "To reach Level 3, focus on documented frameworks..."
Example AI Question: "Could you describe how your cybersecurity team currently learns about and incorporates organizational business objectives into security planning and decision-making?"

No API Key? Use Demo Mode to see how AI assessments work.

Detailed Maturity Level Descriptions
Unlike generic NIST assessments, each control includes specific, actionable descriptions:

Level 1 - Initial: "Security decisions are made without clear understanding of organizational goals. Cybersecurity is treated as a separate function from business strategy."

Level 2 - Developing: "Security teams are somewhat aware of business objectives, but alignment is informal and driven by incident response needs."

Level 3 - Defined: "Cybersecurity goals are formally aligned with business objectives through documented frameworks. Security initiatives are mapped to mission priorities."

Level 4 - Managed: "Security risk management is embedded in enterprise governance. Strategy reviews incorporate cybersecurity input. Dashboards track alignment of controls with business KPIs."
This level of detail enables the AI to ask precise, relevant questions and provide targeted improvement guidance.

📊 CSV Format
Your CSV should include these columns:

Control_ID, Control_Title, Control_Description, Category, Subcategory,
Level_1_Maturity, Level_2_Maturity, Level_3_Maturity, Level_4_Maturity, [Level_5_Maturity]
The included sample file shows the exact format needed.

🛠️ Requirements
Web Server (Python, Node.js, Apache, etc.)
Modern Browser (Chrome, Firefox, Safari, Edge)
Python 3.6+ (for AI proxy server)
Claude API Key (optional, for AI features)
🆘 Troubleshooting
"File not found" errors:

Make sure you're using a web server, not opening the HTML file directly
Check that all files are in the same directory
AI not working:

Verify proxy server is running: python claude_proxy.py
Test API connection in the app
Try Demo Mode if no API key
CSV upload fails:

Check your CSV follows the required column format
Ensure no special characters in file path
Data not saving:

Enable JavaScript and local storage in browser
Don't use private/incognito mode
📈 Example Workflow
Start servers: python -m http.server 8000 and python claude_proxy.py
Open app: Navigate to http://localhost:8000/nist_csf_tracker_complete.html
Load controls: Upload the provided CSV file
Setup AI: Enter Claude API key and test connection
Begin assessment: Use AI or manual scoring for each control
Track progress: Monitor dashboard for completion and gaps
Export results: Save complete assessment as CSV or JSON
🚀 Ready to Start?
Clone this repo or download the files
Start your web server on port 8000
Run the proxy (if using AI): python claude_proxy.py
Open the app in your browser
Upload the CSV and start assessing!
Get your Claude API key at console.anthropic.com for full AI features.

