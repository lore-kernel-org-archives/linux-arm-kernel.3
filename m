Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13418ECD9AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 22:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSe1MS03T8BW9ZubjvfneKpDOJEdsi+I8lH8q1oaCb4=; b=1UsiF/iYv8//JjUZS2fiP0AQ6f
	6BUCYORmkaNurilhTLbAULTzeNuQ3sbDQZmzONLXXrx2LaMOeNuLE39pIhVGAJufhxO32TLhuASvP
	h4golqKPFj+Ca/YwsT07xOHN7TZnSdJx7PRYVejG4sdNDiPiuRFlam6pJaetKixOLFPDL16YTl9AY
	0o53fdi8seeRGycDasBbYh6OAKbwft5V39i88gZNmiOnH36H8DN134NnQxzwLuxXzqum85fdeOmwf
	gXdMTFkWsmr6wRH6s+06I496edGtZ8Mmz4CRXiWkyPmx4r9w5RUd1ox0bEVmTkBTFGSDtVTPni11r
	cyTb4Cqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo7Ql-0000000AYSO-0zRZ;
	Thu, 05 Feb 2026 22:02:31 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo7QH-0000000AYQu-02Kp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 22:02:17 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso2439636a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 14:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770328919; x=1770933719; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSe1MS03T8BW9ZubjvfneKpDOJEdsi+I8lH8q1oaCb4=;
        b=Hg2yBxWN9DHzaBTlMl7+luNl/cbaEaUpr0GvTDOyjSVnErGcYhjBM3tC7DGI4zu1ta
         Vg5upDqJ54yN8ttXOEJdKrVAHbLCFEHX893dTDfeNtHdw6tokaPboEbOlZDNNWrEWsW/
         neLLswRrOlN7Il9bjpD5XSHET7AMK04ZRF1uoWEnd2vJkyfDzhUA3QFFfQiMyS7J0yIz
         fU9ujHI7TxvrW012rPDxxkpVBx3uaqv4eCljTBLTeETD0FooAjtgvvQvucggVECW5XKt
         QFztsJZiZbdG0IrimS/Tlo2g3kGz+3HS4IDVldJ/dtnR1IseOB86p94srccYf3/2mGtz
         XV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770328919; x=1770933719;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSe1MS03T8BW9ZubjvfneKpDOJEdsi+I8lH8q1oaCb4=;
        b=VxJvwF8un2d+jqigw8bwG8vx8kcXQa2fUW6cZHrtLV52FCmD3mLQ4a2XtQDPeU337t
         1J0KTdZc6UA/lLhptsfhbhCxe/BpzWzZw4HGX6nvYblsvCGUbercREd1THsN9jOIq8J7
         GJi7t7WL3OuzhpBXHOaklnkbq2P5L2ssbp2a7bNDKwISb3nD4jw8LoyiXAlgJDOdNDs/
         8QqAbAhjNbzoLiQTqJMWblBT/TCmmmxhJBY8FrBU9+IUWAyRT0BRDXjIoHPK4NsYSdVI
         meR2RLLTeM00AykqrCufscWNMqIBrV/0pli2IZbX1TBQcNutWTMNL7NY03p9BDeZsTZM
         snlA==
X-Forwarded-Encrypted: i=1; AJvYcCXcPil9e/osmh+uHGzCbHxs1jFzJgbBa01ropDlvDVBLCmUmo/ill/khBGhQ1HnfHsvOUck7FsydMCdvWk5Nyeo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6IuK9JVGsEcYwfy7raRGyTtpdACLJMGR9BtOrDwct/GU1fyr8
	kqMjWV8uTksg9lNRFMPTa+na2wCzj8vGURsrryOwBO/CUv6KwjSa3Bnno+SpRunJ7qw=
X-Gm-Gg: AZuq6aLUy6vZBz6fUIb21ydtxWyFbp3VmE3Cc+cVxb2d9bHSHUxHofvK9ZMDeYaqKGN
	ioEvNI1cQAG/jid/lV4DqtmBFVKZEDMkVn5WvNw7eT9WTokO/1+O9bQklh9YC4Tk2XB7RoE8bJq
	vFWWMRzdKITsymODq6oIzvQx8IcXp3tLZcyE4bmjItz0c9HFvoyVN1zB/akRpdmca4mHIE+Q5cO
	e5jhMZ2BMfCcZueEdO/a04dmHLhN3XAoeQyR/Dhi+cBt3LjNJGyN/i2paWgq54AUTKB/aIhoBwh
	2CVCeN2zPClo3Pk2yE4g6tEEgv2b85bBeb+DEa/UemfJdDWOWqJih6hg0WmpsLlldnPUMKkZRjr
	2ASb0xASGyOpq1o5Da4spSTPSWlaPw9rSTxf3XJRoI3vv8dCWA6kazvD8uQ+Gyy0NYeM4Jg15VL
	kw3KhIFOrzjeV3GzOEtVrOV4YdssMRnm5Wl8l/C+hyxzD2nmMjiyjV6aPun61bHP5uwW77VVikl
	l8BpA==
X-Received: by 2002:a17:907:6d1e:b0:b8e:12f9:5fce with SMTP id a640c23a62f3a-b8edf4636b0mr25927466b.61.1770328918709;
        Thu, 05 Feb 2026 14:01:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda748963sm22893366b.12.2026.02.05.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 14:01:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 22:01:57 +0000
Subject: [PATCH] clk: samsung: gs101: harmonise symbol names (clock arrays)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-clk-gs101-symbol-names-v1-1-a7d9a7a4d108@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFQThWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3eScbN30YkMDQ93iytyk/BzdvMTc1GJdA3NzEwsLC9Pk5MQkJaD
 mgqLUtMwKsMHRsbW1ALdxm+xoAAAA
X-Change-ID: 20260123-clk-gs101-symbol-names-07748885ccab
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_140215_244779_C661648B 
X-CRM114-Status: GOOD (  11.90  )
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

Most symbols for the clock descriptions (arrays) don't have a cmu_
prefix and all symbols have a _clks suffix where appropriate.

Update the few outliers to also fall into this same scheme for
consistency.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 52 ++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 44a8ecd332fddce7d4e162219528462ce3c8c03f..d2bcd3a9daf8939157640c4e7a00da3d39ac309e 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -339,7 +339,7 @@
 #define GENERALIO_ACD_CHANNEL_3				0x3f0c
 #define GENERALIO_ACD_MASK				0x3f14
 
-static const unsigned long cmu_top_clk_regs[] __initconst = {
+static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED0,
 	PLL_LOCKTIME_PLL_SHARED1,
 	PLL_LOCKTIME_PLL_SHARED2,
@@ -638,7 +638,7 @@ static const unsigned long cmu_top_clk_regs[] __initconst = {
 	GENERALIO_ACD_MASK,
 };
 
-static const struct samsung_pll_clock cmu_top_pll_clks[] __initconst = {
+static const struct samsung_pll_clock top_pll_clks[] __initconst = {
 	/* CMU_TOP_PURECLKCOMP */
 	PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
 	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
@@ -952,7 +952,7 @@ PNAME(mout_cmu_cmuref_p)	= { "mout_cmu_top_boost_option1",
  * For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
  */
 
-static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst = {
+static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
 	    PLL_CON0_PLL_SHARED0, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
@@ -1108,7 +1108,7 @@ static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst = {
 	    CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
 };
 
-static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
+static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLK_DOUT_CMU_BO_BUS, "dout_cmu_bo_bus", "gout_cmu_bo_bus",
 	    CLK_CON_DIV_CLKCMU_BO_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -1253,13 +1253,13 @@ static const struct samsung_div_clock cmu_top_div_clks[] __initconst = {
 	    "mout_pll_shared3", CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
 };
 
-static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
+static const struct samsung_fixed_factor_clock top_ffactor_clks[] __initconst = {
 	FFACTOR(CLK_DOUT_CMU_HSI0_USBDPDBG, "dout_cmu_hsi0_usbdpdbg",
 		"gout_cmu_hsi0_usbdpdbg", 1, 4, 0),
 	FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
 };
 
-static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
+static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CMU_BUS0_BOOST, "gout_cmu_bus0_boost",
 	     "mout_cmu_boost_option1", CLK_CON_GAT_CLKCMU_BUS0_BOOST, 21, 0, 0),
 	GATE(CLK_GOUT_CMU_BUS1_BOOST, "gout_cmu_bus1_boost",
@@ -1425,19 +1425,19 @@ static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
 };
 
 static const struct samsung_cmu_info top_cmu_info __initconst = {
-	.pll_clks		= cmu_top_pll_clks,
-	.nr_pll_clks		= ARRAY_SIZE(cmu_top_pll_clks),
-	.mux_clks		= cmu_top_mux_clks,
-	.nr_mux_clks		= ARRAY_SIZE(cmu_top_mux_clks),
-	.div_clks		= cmu_top_div_clks,
-	.nr_div_clks		= ARRAY_SIZE(cmu_top_div_clks),
-	.fixed_factor_clks	= cmu_top_ffactor,
-	.nr_fixed_factor_clks	= ARRAY_SIZE(cmu_top_ffactor),
-	.gate_clks		= cmu_top_gate_clks,
-	.nr_gate_clks		= ARRAY_SIZE(cmu_top_gate_clks),
+	.pll_clks		= top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
+	.mux_clks		= top_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(top_mux_clks),
+	.div_clks		= top_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks	= top_ffactor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(top_ffactor_clks),
+	.gate_clks		= top_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(top_gate_clks),
 	.nr_clk_ids		= CLKS_NR_TOP,
-	.clk_regs		= cmu_top_clk_regs,
-	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.clk_regs		= top_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
 	.auto_clock_gate	= true,
 	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
 	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
@@ -2434,15 +2434,15 @@ PNAME(mout_hsi0_usb31drd_p)		= { "fout_usb_pll",
 					    "dout_hsi0_usb31drd",
 					    "fout_usb_pll" };
 
-static const struct samsung_pll_rate_table cmu_hsi0_usb_pll_rates[] __initconst = {
+static const struct samsung_pll_rate_table hsi0_usb_pll_rates[] __initconst = {
 	PLL_35XX_RATE(24576000, 19200000, 150, 6, 5),
 	{ /* sentinel */ }
 };
 
-static const struct samsung_pll_clock cmu_hsi0_pll_clks[] __initconst = {
+static const struct samsung_pll_clock hsi0_pll_clks[] __initconst = {
 	PLL(pll_0518x, CLK_FOUT_USB_PLL, "fout_usb_pll", "oscclk",
 	    PLL_LOCKTIME_PLL_USB, PLL_CON3_PLL_USB,
-	    cmu_hsi0_usb_pll_rates),
+	    hsi0_usb_pll_rates),
 };
 
 static const struct samsung_mux_clock hsi0_mux_clks[] __initconst = {
@@ -2660,8 +2660,8 @@ static const struct samsung_fixed_rate_clock hsi0_fixed_clks[] __initconst = {
 };
 
 static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
-	.pll_clks		= cmu_hsi0_pll_clks,
-	.nr_pll_clks		= ARRAY_SIZE(cmu_hsi0_pll_clks),
+	.pll_clks		= hsi0_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(hsi0_pll_clks),
 	.mux_clks		= hsi0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(hsi0_mux_clks),
 	.div_clks		= hsi0_div_clks,
@@ -2791,7 +2791,7 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 #define QCH_CON_UFS_EMBD_QCH_FMP													0x3094
 #define QUEUE_CTRL_REG_BLK_HSI2_CMU_HSI2												0x3c00
 
-static const unsigned long cmu_hsi2_clk_regs[] __initconst = {
+static const unsigned long hsi2_clk_regs[] __initconst = {
 	PLL_CON0_MUX_CLKCMU_HSI2_BUS_USER,
 	PLL_CON1_MUX_CLKCMU_HSI2_BUS_USER,
 	PLL_CON0_MUX_CLKCMU_HSI2_MMC_CARD_USER,
@@ -3166,8 +3166,8 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.gate_clks		= hsi2_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(hsi2_gate_clks),
 	.nr_clk_ids		= CLKS_NR_HSI2,
-	.clk_regs		= cmu_hsi2_clk_regs,
-	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
+	.clk_regs		= hsi2_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(hsi2_clk_regs),
 	.sysreg_clk_regs	= dcrg_memclk_sysreg,
 	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260123-clk-gs101-symbol-names-07748885ccab

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


