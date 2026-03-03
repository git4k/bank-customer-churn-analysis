# 📸 Dashboard Screenshot Upload Instructions

## Where to Upload Your Power BI Dashboard Screenshot

### File Location
**Save your screenshot as:** `dashboard_screenshot.png`  
**In this folder:** `dashboard/`

---

## How to Create the Screenshot

### Option 1: Power BI Desktop
1. Open your completed Power BI dashboard
2. Press `Windows + Shift + S` (Snipping Tool)
3. Select the entire dashboard area
4. Save as `dashboard_screenshot.png`
5. Place in the `dashboard/` folder

### Option 2: Power BI Service (Online)
1. Publish your dashboard to Power BI Service
2. Open the dashboard in your browser
3. Take a full-page screenshot
4. Save as `dashboard_screenshot.png`
5. Place in the `dashboard/` folder

---

## Recommended Settings

- **Resolution:** 1920x1080 or higher
- **Format:** PNG (for best quality)
- **Content:** Full dashboard view showing all visuals
- **File name:** Exactly `dashboard_screenshot.png`

---

## After Saving the Screenshot

### If working locally:
```bash
git add dashboard/dashboard_screenshot.png
git commit -m "Add Power BI dashboard screenshot"
git push
```

### If uploading to GitHub directly:
1. Go to your repository on GitHub
2. Navigate to `dashboard/` folder
3. Click **Add file** → **Upload files**
4. Upload `dashboard_screenshot.png`
5. Commit changes

---

## Result

Once uploaded, your screenshot will automatically appear in the README.md under the "Dashboard Preview" section!

The README already has this code ready:
```markdown
![Dashboard Preview](dashboard/dashboard_screenshot.png)
```

---

## Dashboard Checklist

Before taking the screenshot, ensure your dashboard includes:

✅ Overall churn rate KPI card  
✅ Churn by geography (bar chart)  
✅ Age vs churn (box plot)  
✅ Balance distribution (histogram)  
✅ Active vs inactive members (donut chart)  
✅ DAX measures working correctly  
✅ Clean, professional layout  
✅ Proper titles and labels  

---

**Your dashboard screenshot will be the visual centerpiece of your GitHub repository!** 🎨
