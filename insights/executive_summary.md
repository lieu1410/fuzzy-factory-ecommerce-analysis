# 📊 Executive Summary
## Fuzzy Factory — E-Commerce Analytics Report
**Period:** Mar 2012 – Mar 2015  
**Prepared by:** Nguyen Thi Lieu

---

## 1. BUSINESS CONTEXT
Fuzzy Factory là cửa hàng bán gấu bông trực tuyến.
Project này phân tích 3 năm dữ liệu nhằm:
- Xác định bottleneck trong conversion funnel
- Đánh giá hiệu quả các kênh marketing
- Đo lường performance của từng sản phẩm

---

## 2. DATASET OVERVIEW
| Metric | Value |
|--------|-------|
| Thời gian | 36 tháng (Mar 2012 – Mar 2015) |
| Total Sessions | 472,871 |
| Total Orders | 32,313 |
| Total Revenue | $1,938,508 |
| Products | 4 sản phẩm |

---

## 3. BUSINESS PERFORMANCE OVERVIEW
| KPI | Value |
|-----|-------|
| Overall Conv Rate | 6.8% |
| Avg Order Value | $59.99 |
| Avg Profit Margin | 62.7% |
| Overall Refund Rate | 4.3% |

**Growth Highlights:**
- Conversion rate tăng từ **3.2% → 8.7%** trong 3 năm
- Revenue tăng từ **~$3K/tháng → ~$144K/tháng**
- Tăng trưởng **5.7x** sau khi launch 3 sản phẩm mới
- Seasonality rõ ràng — đỉnh tháng **11-12** hàng năm

---

## 4. KEY FINDINGS

### Finding 1 — Funnel Bottleneck [HIGH IMPACT]

**Observation:**
- Home funnel: 7.0% overall conversion | 137,576 sessions
- Lander funnel: 6.7% overall conversion | 335,295 sessions
- Top 2 bottlenecks:
  - Entry→Products: **46.1% drop** (lander) vs 41.7% (home)
  - MrFuzzy→Cart: **~42% drop** ở cả 2 funnels

**Explanation:**
- Lander drop cao hơn home vì home có navigation/search
  giúp user tự tìm products, trong khi lander 
  single-focus — nếu message không match intent → bounce
- MrFuzzy→Cart drop ~42% ở cả 2 funnels → vấn đề 
  nằm ở product page (thiếu thông tin, shipping cost
  chưa transparent)

**Business Impact:**
- Nếu fix lander conv rate bằng home funnel:
  **+$49,087 estimated revenue opportunity**

**Recommendation:**
1. A/B test lander page với CTA rõ ràng hơn
2. Reduce clicks từ lander đến product page
3. Add reviews, size guide, shipping info 
   trực tiếp trên product page

---

### Finding 2 — Channel Performance [HIGH IMPACT]

**Observation:**
| Channel | Sessions | Conv Rate |
|---------|----------|-----------|
| bsearch brand | 7,914 | **8.86%** ← Cao nhất |
| gsearch brand | 33,329 | 7.53% |
| Organic/Direct | 83,328 | 7.34% |
| bsearch nonbrand | 54,909 | 6.95% |
| gsearch nonbrand | 282,706 | 6.66% |
| socialbook desktop | 5,590 | 5.15% |
| socialbook pilot | 5,095 | **1.08%** ← Thấp nhất |

**Explanation:**
- bsearch brand hiệu quả nhất vì Bing users có
  demographic lớn tuổi hơn, thu nhập cao hơn,
  ít price-sensitive → purchase intent cao
- Organic/Direct (7.34%) > gsearch nonbrand (6.66%)
  → Free traffic convert tốt hơn một số paid traffic
- Socialbook pilot 1.08% — thấp hơn 6x average

**Business Impact:**
- Socialbook pilot: nếu reallocate 5,095 sessions
  sang gsearch → **+284 orders** estimated

**Recommendation:**
1. Tăng budget bsearch brand — ROI tốt nhất
2. Dừng socialbook pilot ngay lập tức
3. Giữ socialbook desktop (5.15% — chấp nhận được)
4. Đầu tư SEO để tăng organic traffic

---

### Finding 3 — Product Concentration [MEDIUM IMPACT]

**Observation:**
| Product | Revenue | Margin | Refund Rate |
|---------|---------|--------|-------------|
| The Original Mr. Fuzzy | $1,211,058 (62.6%) | 61.0% | 5.11% |
| The Forever Love Bear | $347,702 (17.9%) | 62.5% | 2.23% |
| The Birthday Sugar Panda | $229,260 (11.8%) | **68.5%** | **6.04%** |
| The Hudson River Mini Bear | $150,490 (7.8%) | 68.4% | 1.28% |

**Mr. Fuzzy % of total revenue:**
- 2012: 100% → 2013: 78.2% → 2014: 56.3% → 2015: 49.5%

**Explanation:**
- Mr. Fuzzy giảm % không phải do thất bại mà do
  các sản phẩm mới chia thị phần
- Total revenue vẫn tăng 5.7x → healthy diversification
- Revenue concentration risk đang giảm dần

**Business Impact:**
- Mr. Fuzzy vẫn chiếm ~50% revenue → concentration risk
- Nếu Mr. Fuzzy gặp vấn đề → business mất 50% revenue

**Recommendation:**
1. Maintain Mr. Fuzzy as cash cow
2. Tập trung thúc đẩy Forever Love Bear 
   (đang tăng mạnh trong 2015)
3. Tiếp tục diversify product portfolio

---

### Finding 4 — Sugar Panda Refund [MEDIUM IMPACT]

**Observation:**
- Sugar Panda refund rate: **6.04%**
- Average refund rate: ~3-4%
- Sugar Panda cao hơn **1.5x average**

**Explanation:**
- Hypothesis: Price-value mismatch
  Sugar Panda có profit margin cao nhất (68.5%)
  → Có thể pricing quá cao so với perceived value
- Cần investigate thêm để confirm

**Business Impact:**
- Total refunds: 301 units × $46 avg = **$13,846 refund cost**
- Ảnh hưởng đến uy tín và profit margin

**Recommendation:**
1. Investigate nguyên nhân refund rate cao
2. Check product quality và customer feedback
3. Review pricing strategy của Sugar Panda
4. Add detailed product description để
   set đúng customer expectation

---

## 5. PRIORITIZED RECOMMENDATIONS

### Quick Wins (1-2 tuần):
1. **Dừng Socialbook pilot** → Reallocate budget
   → Expected: +284 orders
2. **A/B test lander page CTA**
   → Expected: +$49,087 revenue opportunity

### Medium Term (1-3 tháng):
1. **Investigate Sugar Panda refund** 
   → Protect $13,846 refund cost
2. **Đầu tư SEO/organic traffic**
   → Free traffic đang convert tốt hơn paid

### Long Term (3-6 tháng):
1. **Diversify products** 
   → Giảm dependency vào Mr. Fuzzy (50% revenue)
2. **Optimize product pages**
   → Fix website-wide ~42% drop tại product→cart

---

## 6. METRICS TO MONITOR
| KPI | Current | Target |
|-----|---------|--------|
| Overall Conv Rate | 6.8% | 8.0%+ |
| Lander Conv Rate | 6.7% | 7.5%+ |
| Sugar Panda Refund Rate | 6.04% | <3% |
| Organic Traffic % | 17.6% | 25%+ |
| Mr. Fuzzy Revenue % | ~50% | <40% |
| Monthly Revenue | $144K | $180K+ |

---

*Analysis performed using SQL Server & Power BI*  
*Dataset: Fuzzy Factory*
