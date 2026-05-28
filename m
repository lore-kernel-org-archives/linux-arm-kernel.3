Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101BACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yeYHRA7Uvd+ApWb0mxYDuX05x09Ixiae7OYtaETUCZ4=; b=H35AukLKePPD67XxLLzOHqYKOy
	Zuk13RVLuYnbtrAvMW0Dj8LUodZhWyLzmTZ60aC53YBCzsRSdz4mY2sH74n5rTA72XwLcVG0YEvWK
	P505whlToodP5n/EU6GWxWL8AUUKrmRmqZw0+mHi3Z+0Istm6OVSmkdYnZ4xGlv80/U8UnecGWkGT
	oUN1f/tEditkny732oxx/2Xv/keMJiyFIOQbfBnPAcLsFbKLsiwVQrVQp6AW/dazHEc9mNbJCNqLN
	L9FTd66XoBK/hyZjBh2Z94/sB/Ob14t6sc1l1vudiJguC+sTqpttMVevYho38cSXneBedB2BkDZc3
	A0/SeGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSh2X-00000006JSa-06yt;
	Thu, 28 May 2026 20:09:13 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSh2U-00000006JRk-14AF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:09:11 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-63133de7abcso4296177137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779998948; x=1780603748; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yeYHRA7Uvd+ApWb0mxYDuX05x09Ixiae7OYtaETUCZ4=;
        b=gtjtDKlDNUTFegvxndQVaAphItthQIDYJU9uvpwJepxEtHMj925sJcH3P/71dlOHHS
         PXPNMgSbb+JOU/XpZu8xIId+ay0hRfXBbWsgtuBFrHH6iRggJMzgDmmSoC3W3l2DhB7s
         jNDcM/IGE01z2GH58NA/X/t5xrOOGpcT6n3Tm87q52+3HASNIvqIKfPbU7OobuHTmGjV
         3juc/OzIvtpKN48a1dIolHm1fMdbVgyN5bhR0X/MRN6m4jWaQBO5TSGgchAW1j0CdpUx
         Sao6VG2jSIxkrjxG3dImkEAonFqWlACDrEoSg25E4uij4fo7abzjTgLm5MaH66OTecjd
         X5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779998948; x=1780603748;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeYHRA7Uvd+ApWb0mxYDuX05x09Ixiae7OYtaETUCZ4=;
        b=pnqRxxzImwe5H3J9Caj23IUiPt5UcGrb3I0xs9UyubCmBvuDo0hje+pvk2gjGGGByH
         FcafBf7JEZXvXZIjYphvVg0cBezvX3TNCdpYXZPlq04XSkno7Xn/Ciko7yotXXxgKtle
         wYlXaYmlDs/WRLuR+39m9IZZphsNjT29A7GlXwoQyuztsvirEJZY8K9F3shWG+V8rwEw
         LigctgcqPK7Xk+PvTTgTFlfxAfL5gB8AhHLNBieEqHG2oI/cIbUKwlXesEFqcEbu1ut7
         i0m5WkUtku3ypNVu8kuTz8aKM+MyCdrac+jMejhWYndLQQVDaXFjLaRty9z7xj2+zUKZ
         4H6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wxVbIEzxPr0+NAAQSXU+p74ysAfksHISb4W4keCQOtfpZq/veaMUfHxGJ3QkNDBN2wIRLOgnHFGkUgJoy+1DN@lists.infradead.org
X-Gm-Message-State: AOJu0YytNbcoEpUMn/MHj5+H1YAERngq6w9u7meXysps5njcPILrs0z0
	ehBs8beUtBIWXbgoAVpbY2SALiEJ+ZbN4E1GXnvk5seozIRhceBJHcsK
X-Gm-Gg: Acq92OF+rlh2yzfYsa9Z7xmhX/aL5zAipaJ/6OZyY7B2sjLIlv4HTqlq6Yc0Jje5oax
	ZNwyxRCeb5v0dsgCmBxuBGupK9kVYDjLb3zkX5nxtSg8rKuX9kGEH990rR8V2Pn2NSZCuETrph/
	MFnbNJTP4IEx7vhmXBdt61Dk/jVIUqu/jTqXC7JBJ3YjXtb1rzVpmleZ241yDnpsJ57zapYqLx+
	crPbNCGgbaBQu8PFenTjKgLQ7NwkZy0AnF7+YF/bSdwUwv3xOInNZ+ZoXTndjrjdL6+PQDcWwjk
	qZ05BS8mI2y5oWIsucITXXqdkVioG33A6uYQFA+Ey4JmQuLuHa4mfO61bMA80uLcDSbgySXt5S/
	WsATeS/wz2XcoTLZfu4sRSiizXDbJE7l0+BYi/zrmjx+A2I95S4ZvNlvMh3L9qpupCHE1IoHUSd
	YTwzm4XuIOBJxA1PQkCIKFN2E=
X-Received: by 2002:a05:6102:b01:b0:631:ea6b:23dc with SMTP id ada2fe7eead31-6be0521eca7mr179806137.2.1779998948250;
        Thu, 28 May 2026 13:09:08 -0700 (PDT)
Received: from [127.0.0.1] ([2a02:6ea0:5505:7199::29])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6beb8652221sm212137.2.2026.05.28.13.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:09:07 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 28 May 2026 15:09:01 -0500
Subject: [PATCH] clk: samsung: exynos990: Fix PERIC0/1 USI clock types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-perics-usi-v1-1-13a6ee4d1a6f@gmail.com>
X-B4-Tracking: v=1; b=H4sIANygGGoC/yXMQQqAIBCF4avErBNM0KKrRAuzqaaFiVMRSHfPa
 vnBe38CxkjI0BYJIp7EtPmMqizALdbPKGjMBiWVkVo1IuS9Y3EwCaNtPaEyg5QW8iFEnOj6Yl3
 /m49hRbe/BbjvB0Y4lwNuAAAA
X-Change-ID: 20260528-perics-usi-65a7fe26b00a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779998944; l=17919;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=iAJ7LjzKcdgIeRWt2hA/3B6ahxBFHWqAM4FQXrRQpkc=;
 b=eWjfjJZw6dk5bzHIaUlaClQjekGGOARa9Il7gVRF0yx9ZSNWF/f5Y8e9IIlxl5jXoGnhFHIZu
 iVTXquUCWEUB6driQUJnXWz2BiM1beNGct99sl4tiYtfCENHBrWU11C
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_130910_397245_7C49B6E7 
X-CRM114-Status: GOOD (  10.76  )
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

Use nMUX() for USI and UART user muxes to allow reparenting between
OSC and CMU IP output when changing rates, and use DIV_F() with
CLK_SET_RATE_PARENT on their dividers and gates so rate requests
propagate upward.

Consolidate identical USI parent arrays into shared
mout_peric0_nonbususer_p and mout_peric1_nonbususer_p.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 307 +++++++++++++++++++++++++++++++++++---------------------------------------
 1 file changed, 143 insertions(+), 164 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 6277dd557..4385c3b76 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -1546,54 +1546,44 @@ static const unsigned long peric0_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIC0 muxes */
 PNAME(mout_peric0_bus_user_p) = { "oscclk", "dout_cmu_peric0_bus" };
-PNAME(mout_peric0_uart_dbg_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi00_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi01_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi02_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi03_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi04_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi05_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi13_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi14_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi15_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
-PNAME(mout_peric0_usi_i2c_user_p) = { "oscclk", "dout_cmu_peric0_ip" };
+PNAME(mout_peric0_nonbususer_p) = { "oscclk", "dout_cmu_peric0_ip" };
 
 static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIC0_BUS_USER, "mout_peric0_bus_user",
 	    mout_peric0_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
 	    4, 1),
-	MUX(CLK_MOUT_PERIC0_UART_DBG, "mout_peric0_uart_dbg",
-	    mout_peric0_uart_dbg_p, PLL_CON0_MUX_CLKCMU_PERIC0_UART_DBG,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI00_USI_USER, "mout_peric0_usi00_usi_user",
-	    mout_peric0_usi00_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI00_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI01_USI_USER, "mout_peric0_usi01_usi_user",
-	    mout_peric0_usi01_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI01_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI02_USI_USER, "mout_peric0_usi02_usi_user",
-	    mout_peric0_usi02_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI02_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI03_USI_USER, "mout_peric0_usi03_usi_user",
-	    mout_peric0_usi03_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI03_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI04_USI_USER, "mout_peric0_usi04_usi_user",
-	    mout_peric0_usi04_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI04_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI05_USI_USER, "mout_peric0_usi05_usi_user",
-	    mout_peric0_usi05_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI05_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI13_USI_USER, "mout_peric0_usi13_usi_user",
-	    mout_peric0_usi13_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI13_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI14_USI_USER, "mout_peric0_usi14_usi_user",
-	    mout_peric0_usi14_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC0_USI15_USI_USER, "mout_peric0_usi15_usi_user",
-	    mout_peric0_usi15_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI15_USI_USER,
-	    4, 1),
+	nMUX(CLK_MOUT_PERIC0_UART_DBG, "mout_peric0_uart_dbg",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_UART_DBG,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI00_USI_USER, "mout_peric0_usi00_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI00_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI01_USI_USER, "mout_peric0_usi01_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI01_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI02_USI_USER, "mout_peric0_usi02_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI02_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI03_USI_USER, "mout_peric0_usi03_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI03_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI04_USI_USER, "mout_peric0_usi04_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI04_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI05_USI_USER, "mout_peric0_usi05_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI05_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI13_USI_USER, "mout_peric0_usi13_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI13_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI14_USI_USER, "mout_peric0_usi14_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI14_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC0_USI15_USI_USER, "mout_peric0_usi15_usi_user",
+	     mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI15_USI_USER,
+	     4, 1),
 	MUX(CLK_MOUT_PERIC0_USI_I2C_USER, "mout_peric0_usi_i2c_user",
-	    mout_peric0_usi_i2c_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI_I2C_USER,
+	    mout_peric0_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC0_USI_I2C_USER,
 	    4, 1),
 };
 
@@ -1602,42 +1592,42 @@ static const struct samsung_div_clock peric0_div_clks[] __initconst = {
 	    "mout_peric0_uart_dbg",
 	    CLK_CON_DIV_DIV_CLK_PERIC0_UART_DBG,
 	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
-	    "mout_peric0_usi00_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
-	    "mout_peric0_usi01_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
-	    "mout_peric0_usi02_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
-	    "mout_peric0_usi03_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
-	    "mout_peric0_usi04_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
-	    "mout_peric0_usi05_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI13_USI, "dout_peric0_usi13_usi",
-	    "mout_peric0_usi13_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI13_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI14_USI, "dout_peric0_usi14_usi",
-	    "mout_peric0_usi14_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC0_USI15_USI, "dout_peric0_usi15_usi",
-	    "mout_peric0_usi15_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC0_USI15_USI,
-	    0, 4),
+	DIV_F(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
+	      "mout_peric0_usi00_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
+	      "mout_peric0_usi01_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
+	      "mout_peric0_usi02_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
+	      "mout_peric0_usi03_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
+	      "mout_peric0_usi04_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
+	      "mout_peric0_usi05_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI13_USI, "dout_peric0_usi13_usi",
+	      "mout_peric0_usi13_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI13_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI14_USI, "dout_peric0_usi14_usi",
+	      "mout_peric0_usi14_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI14_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC0_USI15_USI, "dout_peric0_usi15_usi",
+	      "mout_peric0_usi15_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC0_USI15_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
 	DIV(CLK_DOUT_PERIC0_USI_I2C, "dout_peric0_usi_i2c",
 	    "mout_peric0_usi_i2c_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
@@ -2107,58 +2097,47 @@ static const unsigned long peric1_clk_regs[] __initconst = {
 
 /* Parent clock list for CMU_PERIC1 muxes */
 PNAME(mout_peric1_bus_user_p)  = { "oscclk", "dout_cmu_peric1_bus" };
-PNAME(mout_peric1_uart_bt_user_p) = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi06_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi07_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi08_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi09_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi10_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi11_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi12_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi18_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi16_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi17_user_p)  = { "oscclk", "dout_cmu_peric1_ip" };
-PNAME(mout_peric1_usi_i2c_user_p) = { "oscclk", "dout_cmu_peric1_ip" };
+PNAME(mout_peric1_nonbususer_p) = { "oscclk", "dout_cmu_peric1_ip" };
 
 static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PERIC1_BUS_USER, "mout_peric1_bus_user",
 	    mout_peric1_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_BUS_USER,
 	    4, 1),
-	MUX(CLK_MOUT_PERIC1_UART_BT_USER, "mout_peric1_uart_bt_user",
-	    mout_peric1_uart_bt_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_UART_BT_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI06_USI_USER, "mout_peric1_usi06_usi_user",
-	    mout_peric1_usi06_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI06_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI07_USI_USER, "mout_peric1_usi07_usi_user",
-	    mout_peric1_usi07_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI07_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI08_USI_USER, "mout_peric1_usi08_usi_user",
-	    mout_peric1_usi08_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI08_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI09_USI_USER, "mout_peric1_usi09_usi_user",
-	    mout_peric1_usi09_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI09_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI10_USI_USER, "mout_peric1_usi10_usi_user",
-	    mout_peric1_usi10_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI11_USI_USER, "mout_peric1_usi11_usi_user",
-	    mout_peric1_usi11_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI12_USI_USER, "mout_peric1_usi12_usi_user",
-	    mout_peric1_usi12_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI18_USI_USER, "mout_peric1_usi18_usi_user",
-	    mout_peric1_usi18_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI18_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI16_USI_USER, "mout_peric1_usi16_usi_user",
-	    mout_peric1_usi16_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI16_USI_USER,
-	    4, 1),
-	MUX(CLK_MOUT_PERIC1_USI17_USI_USER, "mout_peric1_usi17_usi_user",
-	    mout_peric1_usi17_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI17_USI_USER,
-	    4, 1),
+	nMUX(CLK_MOUT_PERIC1_UART_BT_USER, "mout_peric1_uart_bt_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_UART_BT_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI06_USI_USER, "mout_peric1_usi06_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI06_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI07_USI_USER, "mout_peric1_usi07_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI07_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI08_USI_USER, "mout_peric1_usi08_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI08_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI09_USI_USER, "mout_peric1_usi09_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI09_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI10_USI_USER, "mout_peric1_usi10_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI11_USI_USER, "mout_peric1_usi11_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI12_USI_USER, "mout_peric1_usi12_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI18_USI_USER, "mout_peric1_usi18_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI18_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI16_USI_USER, "mout_peric1_usi16_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI16_USI_USER,
+	     4, 1),
+	nMUX(CLK_MOUT_PERIC1_USI17_USI_USER, "mout_peric1_usi17_usi_user",
+	     mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI17_USI_USER,
+	     4, 1),
 	MUX(CLK_MOUT_PERIC1_USI_I2C_USER, "mout_peric1_usi_i2c_user",
-	    mout_peric1_usi_i2c_user_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI_I2C_USER,
+	    mout_peric1_nonbususer_p, PLL_CON0_MUX_CLKCMU_PERIC1_USI_I2C_USER,
 	    4, 1),
 };
 
@@ -2167,46 +2146,46 @@ static const struct samsung_div_clock peric1_div_clks[] __initconst = {
 	    "mout_peric1_uart_bt_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC1_UART_BT,
 	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI06_USI, "dout_peric1_usi06_usi",
-	    "mout_peric1_usi06_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI07_USI, "dout_peric1_usi07_usi",
-	    "mout_peric1_usi07_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI08_USI, "dout_peric1_usi08_usi",
-	    "mout_peric1_usi08_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI18_USI, "dout_peric1_usi18_usi",
-	    "mout_peric1_usi18_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI18_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI12_USI, "dout_peric1_usi12_usi",
-	    "mout_peric1_usi12_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI09_USI, "dout_peric1_usi09_usi",
-	    "mout_peric1_usi09_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI10_USI, "dout_peric1_usi10_usi",
-	    "mout_peric1_usi10_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI11_USI, "dout_peric1_usi11_usi",
-	    "mout_peric1_usi11_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI16_USI, "dout_peric1_usi16_usi",
-	    "mout_peric1_usi16_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI,
-	    0, 4),
-	DIV(CLK_DOUT_PERIC1_USI17_USI, "dout_peric1_usi17_usi",
-	    "mout_peric1_usi17_usi_user",
-	    CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI,
-	    0, 4),
+	DIV_F(CLK_DOUT_PERIC1_USI06_USI, "dout_peric1_usi06_usi",
+	      "mout_peric1_usi06_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI06_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI07_USI, "dout_peric1_usi07_usi",
+	      "mout_peric1_usi07_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI07_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI08_USI, "dout_peric1_usi08_usi",
+	      "mout_peric1_usi08_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI08_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI18_USI, "dout_peric1_usi18_usi",
+	      "mout_peric1_usi18_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI18_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI12_USI, "dout_peric1_usi12_usi",
+	      "mout_peric1_usi12_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI09_USI, "dout_peric1_usi09_usi",
+	      "mout_peric1_usi09_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI09_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI10_USI, "dout_peric1_usi10_usi",
+	      "mout_peric1_usi10_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI11_USI, "dout_peric1_usi11_usi",
+	      "mout_peric1_usi11_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI16_USI, "dout_peric1_usi16_usi",
+	      "mout_peric1_usi16_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI16_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
+	DIV_F(CLK_DOUT_PERIC1_USI17_USI, "dout_peric1_usi17_usi",
+	      "mout_peric1_usi17_usi_user",
+	      CLK_CON_DIV_DIV_CLK_PERIC1_USI17_USI, 0, 4,
+	      CLK_SET_RATE_PARENT, 0),
 	DIV(CLK_DOUT_PERIC1_USI_I2C, "dout_peric1_usi_i2c",
 	    "mout_peric1_usi_i2c_user",
 	    CLK_CON_DIV_DIV_CLK_PERIC1_USI_I2C,

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-perics-usi-65a7fe26b00a

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>


