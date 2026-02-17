Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFDEE68151
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jQsq4pIYVJuFxexpa0z/daad86QvQuw/0HPGESIxbVs=; b=r2y1p9GWbzUwIqK9A8IWXpu8Ih
	cFJfaTD7JMq2F9HF/MEx93qvT/ccU+p/DSuqWwLoTyQVMvvO+p4URawbZo65W76hNUr6BWZ1mVqRC
	bdq/yBJX8fibasN2CgfhyXXwe6jqTD7HUHJSvpFF4RFdvJYVhG3cb0Io2BB5BpB/vp9Ah7fG5Q2rB
	qr7klKFbO1pVdexUekY3XtzBg8NM1cOcr5y/DcGvQeaqoHMdOCcM0Yb8GAxUGfmjBCjPKKlCve2zm
	0q0K2aMdmSmcgezCaImxyfM78oPvNMXsf1nKWLT3df2387ocGvugsOXJRNSyKk0q7/buAWCmROGlk
	rKomC3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHPF-00000007wql-47yV;
	Tue, 17 Feb 2026 09:30:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHPE-00000007wqf-39p8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA3D160128;
	Tue, 17 Feb 2026 09:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62695C4CEF7;
	Tue, 17 Feb 2026 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771320607;
	bh=1k8IYuo7K3Yqw0fOXyGW+rdO/3WvYsWAMv00ZYTHAUU=;
	h=From:To:Cc:Subject:Date:From;
	b=jsMehZnPdpzMgPFWtctXU1YG8FhPeOmx4M4tJrmXtZVI3nE9l30/bToxfUKgtCX5i
	 L9i10wGo++GP7vJ2pgHnxZ72Wy+fFOFJyedK6H3FwWbeo6WDLDREEDzkYEL/KoR5vU
	 i86UgarLbH6Ve3Gm3nBFuL255+rtCaHgKVBvtsbHnsmiQmmNd3a9fYbi7P+9TGGvAO
	 1tKtS3KwMOrPWsXmeLz6Z9mSEGlnR1qkn22VH9YWC+wnlaHE2O2m5WaTvgeKCqOfIC
	 OejKiGYBeffJfQ/a6rMHMmbZKYN84K5LUjwqca++QIp+tsrYjefa6TOt0ERSLtE4bT
	 8uF9egvqRI99Q==
Received: by wens.tw (Postfix, from userid 1000)
	id 554705FCAE; Tue, 17 Feb 2026 17:30:05 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
Date: Tue, 17 Feb 2026 17:30:03 +0800
Message-ID: <20260217093004.3239051-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When the PRCM clk driver was added, somehow the r-spi module clock
was skipped over.

Add it so that r-spi can actually work.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 0339c4af0fe5..db0e36d8838e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -83,9 +83,22 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "r-pwmctrl",
 static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
 			 &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
 
-/* SPI clock is /M/N (same as new MMC?) */
+static const struct clk_parent_data r_spi_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "pll-periph" },
+	{ .name = "pll-periph0-300M" },
+	{ .name = "pll-periph1-300M" },
+	{ .name = "pll-audio" },
+};
+static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
 			 &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
+
 static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
 			 &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
@@ -138,6 +151,7 @@ static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&bus_r_twd_clk.common,
 	&r_pwmctrl_clk.common,
 	&bus_r_pwmctrl_clk.common,
+	&r_spi_clk.common,
 	&bus_r_spi_clk.common,
 	&bus_r_spinlock_clk.common,
 	&bus_r_msgbox_clk.common,
@@ -169,6 +183,7 @@ static struct clk_hw_onecell_data sun55i_a523_r_hw_clks = {
 		[CLK_BUS_R_TWD]		= &bus_r_twd_clk.common.hw,
 		[CLK_R_PWMCTRL]		= &r_pwmctrl_clk.common.hw,
 		[CLK_BUS_R_PWMCTRL]	= &bus_r_pwmctrl_clk.common.hw,
+		[CLK_R_SPI]		= &r_spi_clk.common.hw,
 		[CLK_BUS_R_SPI]		= &bus_r_spi_clk.common.hw,
 		[CLK_BUS_R_SPINLOCK]	= &bus_r_spinlock_clk.common.hw,
 		[CLK_BUS_R_MSGBOX]	= &bus_r_msgbox_clk.common.hw,
-- 
2.47.3


