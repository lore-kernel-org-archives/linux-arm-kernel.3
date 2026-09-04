Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82579C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWVY1uMj4PCC62NWVYIfzX5Mbc8Yyn+zUzGlrLMkZwU=; b=b7YBXgf8ghzaItD+WuJvAHiAgX
	qABKLnedBTx9JG+C4oHGkVaTewxrt7uvipB5GdN1rAFhiwvarCYkMRjJ2zvWw+LE7MCvGVPlo8aGP
	hlhSshqhRrukhp5iixSx3OB46SPHEkwro5Q+18XxEpgm33RE98vQ7T5ldPTa9NG/95PWZieG9plN1
	/Ox6zcHAeaCGlBtyvMu9ou/lWJPoIbO2bUPdKkpbR2kkKge434ROEHiJ74ukea5iY+RDUS61RBqd4
	SSErdefluSjt7OauYfn5yuBUPIXMPCL6G4CznuDaV6wQ0FPo5grglsa5tTu+V9KC0gkxJBGPBSw3+
	hAlwoZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Qur-00000001d9A-1dll;
	Fri, 04 Sep 2026 10:13:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Quo-00000001d7w-2DVz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:12:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so6571025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516777; x=1789121577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWVY1uMj4PCC62NWVYIfzX5Mbc8Yyn+zUzGlrLMkZwU=;
        b=chnK8r0Dl8elhF5CBpjSV+LByq3Gm3/1tI24Px0j4TS22rHr/caTa3Me8MJLhfOo82
         TROfgSdCe8cPHBP7iBpKd28nciMqbcPMpfDo+3WSz8wQ+pyqIpz9V0B9r2NpR74DF6u0
         CXYI6gR/MaR4DBuIBEpgsOvZDVG3+drPgW2Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516777; x=1789121577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWVY1uMj4PCC62NWVYIfzX5Mbc8Yyn+zUzGlrLMkZwU=;
        b=LXARQK1b6kxBb/8OuAOh4RvEQ+aq9VQ49q9C5Uhf5buoRKYADTuD/Slq2eiOFW+Clo
         KKPSL4o4bkRZ5mhM7xl99mEnJA7LCx5OMnn6r1tAopD0DUdUIVoG93Udwyz+lNIhLJxm
         bfLK0zLriDviu1JqIuKjjlxmoF63r95l8MI5mrQCAUp0ETRBBJMlcnQOw+Wt+MG/xEcy
         1ciRwDoKvkRFRnqnFE8g4F434Vlmylsm9bg2JU9sLMn1MprIp1eJTIMwu8G1fQpPd4Y8
         5tX2IR/6YuJD9Rf3vt+rQ9ZWClYClcwjfN2tamNKwTIxdzmeFOiWDgw7pTNWf8LHiBuu
         YeBw==
X-Forwarded-Encrypted: i=1; AKwUvBxfB1LAiixtJRuU56MbkqWeJXO0f0vQJMXB9UeL9N5UrsfxJRiYarSTLzMMfoCPYPwbzJeRhH4y6ciHCOQftYcn@lists.infradead.org
X-Gm-Message-State: AFuF++kGO/DP6vOuoXWE/zQH2SM/BpvZDTBrPgrPU1C9fb9m0b1mxf2+
	Kq0Z6iBrCXztaGqOMUZvzDeg51jBT2e6zD+Ul6+k8md/XR/CuB+eufjFpNoowOiZ5I0w6gnI0+s
	WsVqF+rc=
X-Gm-Gg: AYBFou3dgEvquF3PwyrCi7e4noUeswZfQ/1ZGkbQa39n/mqKo+tGvLbGMMxvfOoAviQ
	05Gi2wENIZ+ZGyRl6iwDcuMNbkos1vHkUNUfV7W9zFWYpPM1eErBL3acRiZOQL1riHQr+U9plBh
	Hvkh7u9U6sJor2a5XdePpvPWmluITT40j5t2kLZMPMIEvOaV0xS0UQxKeNFG9gzhkPH2Fxbx/2k
	9GKhi2hNThjLu7QCLUQ+h7xciYFtzau3yLaviqEUiUU3pc6mVMnKjtTaFvsvGUFe85h+TQfyVBz
	X9gLBwc2+Naom5yfuXSorphMotnudzfx+vHKkS+q6s68TFDXOInM8ypYbjrPO+8KgQb3ckaHZEF
	JLHtl2XS32HcFLx2hXVQ9IpAD9gpaPSqut4hRF1yfHhGC8jRJCllgevsrYtidNZL+jJCkA6yXSm
	0JSZDrpR1Zio5ChPWs9ndVS6xoA2wrg50x9qfTJPGW3IHnhUx81CXork/t8HgrlUCMIhDeFXp7Q
	yc0fC9g31btNQSkzfWJczJsODauPWp5ho+3SXA5qrU9AlkTfW3lrQjYrfBa80vRb8zdGHdslfJj
	3PkA+P53GzoOVzioX90/EcwKCLAf43Jj3B0NgelZapJZjNnsT6AI2dA=
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr44990695e9.16.1788516776720;
        Fri, 04 Sep 2026 03:12:56 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock generation
Date: Fri,  4 Sep 2026 12:06:33 +0200
Message-ID: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_031258_621021_C63B465D 
X-CRM114-Status: GOOD (  26.01  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add support for spread spectrum clock (SSC) generation to the pll14xx
driver.

Tested on the video PLL of i.MX8MN and i.MX8MP based boards.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v14:
 - Rate limit the warnings on out of range SSC parameters, as they are
   re-evaluated on every rate change.
 - Add a comment on why the mrr computation cannot overflow.
 - Add Reviewed-by of Peng Fan.

Changes in v12:
 - Apply the SSC settings also from the set_spread_spectrum() callback
   to handle the case the clock framework skips set_rate() if the
   requested rate is unchanged.

Changes in v11:
 - Drop the dt-bindings/clock/clock.h include and use the enum
   clk_ssc_method values from clk-provider.h, as clk-scmi-oem.c does.
 - Disable SSC and clear the modulation fields in SSCG_CTRL when no
   spread method is configured, so that a setup left enabled by the
   bootloader is not kept active.
 - Skip the SSC setup instead of dividing by zero when modfreq_hz is
   zero or mfr truncates to zero.
 - Reject mfr and mrr values that do not fit the MFREQ_CTL and MRAT_CTL
   register fields instead of letting FIELD_PREP silently truncate
   them. This also prevents the 10000 * mfr multiplication from
   overflowing.
 - Compute the mfr divisor in 64-bit arithmetic, as the 32-bit product
   could wrap with out of range modfreq_hz values.

Changes in v10:
- Drop 'Reviewed-by' tag of Peng Fan.
- Adapt the driver to the new infrastructure. Implement the
  set_spread_spectrum() and get the modulation parameters from
  struct clk_spread_spectrum.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan.

 drivers/clk/imx/clk-pll14xx.c | 103 ++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..84e081193f24 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -13,6 +13,7 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/jiffies.h>
@@ -22,6 +23,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -33,6 +36,13 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_DOWN_SPREAD	0
+#define SEL_PF_UP_SPREAD	1
+#define SEL_PF_CENTER_SPREAD	2
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -44,6 +54,7 @@ struct clk_pll14xx {
 	int rate_count;
 	s16 delta_k;
 	spinlock_t lock;
+	struct clk_spread_spectrum ss_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -366,6 +377,62 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					       unsigned long parent_rate,
+					       unsigned int pdiv,
+					       unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_spread_spectrum *conf = &pll->ss_conf;
+	u32 sscg_ctrl, mfr, mrr, sel_pf;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &= ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	switch (conf->method) {
+	case CLK_SPREAD_CENTER:
+		sel_pf = SEL_PF_CENTER_SPREAD;
+		break;
+	case CLK_SPREAD_UP:
+		sel_pf = SEL_PF_UP_SPREAD;
+		break;
+	case CLK_SPREAD_DOWN:
+		sel_pf = SEL_PF_DOWN_SPREAD;
+		break;
+	default:
+		/* No spread: disable modulation and clear any stale state */
+		goto out;
+	}
+
+	if (!conf->modfreq_hz || !parent_rate || !pdiv)
+		goto out;
+
+	mfr = div64_u64(parent_rate, (u64)conf->modfreq_hz * pdiv * BIT(5));
+	if (!mfr || mfr > FIELD_MAX(MFREQ_CTL_MASK)) {
+		pr_warn_ratelimited("%s: SSC disabled, modulation frequency (%u Hz) out of range\n",
+				    clk_hw_get_name(hw), conf->modfreq_hz);
+		goto out;
+	}
+
+	/*
+	 * No overflow: the core limits spread_bp to 10000 and mdiv is a 10-bit
+	 * field, so the product is at most 10000 * 1023 * 64 < 2^32.
+	 */
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+	if (!mrr || mrr > FIELD_MAX(MRAT_CTL_MASK)) {
+		pr_warn_ratelimited("%s: SSC disabled, spread (%u permyriad) out of range\n",
+				    clk_hw_get_name(hw), conf->spread_bp);
+		goto out;
+	}
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, sel_pf);
+
+out:
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -390,6 +457,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +481,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +509,36 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = parent ? clk_hw_get_rate(parent) : 0;
+	unsigned long flags;
+	u32 div_ctl0;
+
+	spin_lock_irqsave(&pll->lock, flags);
+
+	pll->ss_conf = *ss_conf;
+
+	/*
+	 * Apply the configuration to the hardware right away, using the
+	 * current PLL dividers: the clock framework does not call set_rate()
+	 * if the requested rate is unchanged, so relying on it would leave
+	 * the SSC settings unapplied when the PLL is already at the target
+	 * rate (e.g. configured by the bootloader).
+	 */
+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	__clk_pll1443x_set_spread_spectrum(hw, parent_rate,
+					   FIELD_GET(PDIV_MASK, div_ctl0),
+					   FIELD_GET(MDIV_MASK, div_ctl0));
+
+	spin_unlock_irqrestore(&pll->lock, flags);
+
+	return 0;
+}
+
 static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -509,6 +611,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0


