Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC7D6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBEQpPRdaqyT4yBrdc2VuF7tH0alyCTNwsdiWN83Bew=; b=f8bK0S4sxDHN9FHPHYFuAs35Qa
	rFKcIREnkUHrokqCqBcwH2mcCs6ISU76lFDOJo0d4Lshtsab8l5fo2zAyWZtQbIu6DYM/xfZXnKIE
	VACcaAIW+8Fkqos4flZGrHvxRPjmSpLW6tuNjzp3ZfsChPKA3FvHvzMzszwY+AuSSZX2X0ksu76E1
	h6L6mcQlmhm4iM8f2LbXOJkf+Lft7DVgRfsHUYj2RhKpC9bakYk06uRiKdmT2B7606o5z1byPGvQF
	zYf0ZWIDmDVhwSq3ZKN+ywqCgMgGP2yjQSh6YbfE4AkNqJ1WKGcvEIQNdF+tMExVRSBoLZsA9A0Wp
	hNw6uyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UWt-00000003Zgq-0cJ2;
	Thu, 31 Oct 2024 12:43:59 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UPg-00000003Xkd-43d2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:36:34 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 58501A0FB1;
	Thu, 31 Oct 2024 13:36:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=DBEQpPRdaqyT4yBrdc2V
	uF7tH0alyCTNwsdiWN83Bew=; b=MAAoCQo46VLAg+KRCfrpmPvYrBpw5kXQBArP
	2/O1DshKus20vJNFFFjl9jKE1kKV4d3UbO8lm2d44N4aCf2QbjTKWml82GLjefeV
	6F+bVHjAsBHIWZlWmqxqX3COcUegwTPBBX0hQdjqdSVimZr3Tp+OIPv+Dd9MjXLx
	ILSh9OM+pVzUsIUpGr+k+CpKlOrutd0p/io1/rwq1mLoBtXK3cgwzJmo6av5TdlG
	mt1rZoE0cH3gdLayTti8FMWrAthDjIWCD0VdroU5XhYqoNTsWohjjrI+l+ugwbNZ
	Ioy4sti4QZYf0eL4bzmXWcZDeDQmiPfYQQe1xmJXgT1CyTrG3JRc4knfGiI++mAs
	Bt1Z+xbWCqWjhSr2HFWniTtNL2BDT7GyIFL4duUhAuCFbpaVLopbd3on9ZGf2y4G
	tE5/bxBJi0XbmT+a5yLtGngx+jGeGmz7T7mAiyVdvMIjdmBE7tLBvGqerdSm1NY6
	ox5G8/Ue6UtQJvhu65R6YZuxtPZntFxj/U5RVVUdKX0m8FhcosZNROTEhvbEY2y+
	rnjAsbFuVssu9MlMLY6VFNTSdqQzQUmEdG6mBwtvHSt6/Q4yJ/X1kyDK2JsDzDJX
	NYWMrB/E68xwHaujGBbMgJPIMmyNZ8yK3KF8h3SDjnpUvM1rETs25N3YyVDZOdMu
	yHE5v/U=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 04/10] dma-engine: sun4i: Add support for Allwinner suniv F1C100s
Date: Thu, 31 Oct 2024 13:35:30 +0100
Message-ID: <20241031123538.2582675-4-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031123538.2582675-1-csokas.bence@prolan.hu>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730378190;VERSION=7979;MC=2659970641;ID=207184;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053633_189538_03B7EB6C 
X-CRM114-Status: GOOD (  16.06  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

DMA of Allwinner suniv F1C100s is similar to sun4i. It has 4 NDMA, 4
DDMA channels and endpoints are different. Also F1C100s has reset bit
for DMA in CCU. Add support for it.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased on current master ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/dma/Kconfig     |  4 +--
 drivers/dma/sun4i-dma.c | 60 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index d9ec1e69e428..fc25bfc356f3 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -162,8 +162,8 @@ config DMA_SA11X0
 
 config DMA_SUN4I
 	tristate "Allwinner A10 DMA SoCs support"
-	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I
-	default (MACH_SUN4I || MACH_SUN5I || MACH_SUN7I)
+	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUNIV
+	default (MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUNIV)
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 4626cc8ad114..c0a4e40134dc 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -33,7 +33,11 @@
 #define SUN4I_DMA_CFG_SRC_ADDR_MODE(mode)	((mode) << 5)
 #define SUN4I_DMA_CFG_SRC_DRQ_TYPE(type)	(type)
 
+#define SUNIV_DMA_CFG_DST_DATA_WIDTH(width)	((width) << 24)
+#define SUNIV_DMA_CFG_SRC_DATA_WIDTH(width)	((width) << 8)
+
 #define SUN4I_MAX_BURST	8
+#define SUNIV_MAX_BURST	4
 
 /** Normal DMA register values **/
 
@@ -41,6 +45,9 @@
 #define SUN4I_NDMA_DRQ_TYPE_SDRAM		0x16
 #define SUN4I_NDMA_DRQ_TYPE_LIMIT		(0x1F + 1)
 
+#define SUNIV_NDMA_DRQ_TYPE_SDRAM		0x11
+#define SUNIV_NDMA_DRQ_TYPE_LIMIT		(0x17 + 1)
+
 /** Normal DMA register layout **/
 
 /* Dedicated DMA source/destination address mode values */
@@ -54,6 +61,9 @@
 #define SUN4I_NDMA_CFG_BYTE_COUNT_MODE_REMAIN	BIT(15)
 #define SUN4I_NDMA_CFG_SRC_NON_SECURE		BIT(6)
 
+#define SUNIV_NDMA_CFG_CONT_MODE		BIT(29)
+#define SUNIV_NDMA_CFG_WAIT_STATE(n)		((n) << 26)
+
 /** Dedicated DMA register values **/
 
 /* Dedicated DMA source/destination address mode values */
@@ -66,6 +76,9 @@
 #define SUN4I_DDMA_DRQ_TYPE_SDRAM		0x1
 #define SUN4I_DDMA_DRQ_TYPE_LIMIT		(0x1F + 1)
 
+#define SUNIV_DDMA_DRQ_TYPE_SDRAM		0x1
+#define SUNIV_DDMA_DRQ_TYPE_LIMIT		(0x9 + 1)
+
 /** Dedicated DMA register layout **/
 
 /* Dedicated DMA configuration register layout */
@@ -119,6 +132,11 @@
 #define SUN4I_DMA_NR_MAX_VCHANS						\
 	(SUN4I_NDMA_NR_MAX_VCHANS + SUN4I_DDMA_NR_MAX_VCHANS)
 
+#define SUNIV_NDMA_NR_MAX_CHANNELS	4
+#define SUNIV_DDMA_NR_MAX_CHANNELS	4
+#define SUNIV_NDMA_NR_MAX_VCHANS	(24 * 2 - 1)
+#define SUNIV_DDMA_NR_MAX_VCHANS	10
+
 /* This set of SUN4I_DDMA timing parameters were found experimentally while
  * working with the SPI driver and seem to make it behave correctly */
 #define SUN4I_DDMA_MAGIC_SPI_PARAMETERS \
@@ -243,6 +261,16 @@ static void set_src_data_width_a10(u32 *p_cfg, s8 data_width)
 	*p_cfg |= SUN4I_DMA_CFG_SRC_DATA_WIDTH(data_width);
 }
 
+static void set_dst_data_width_f1c100s(u32 *p_cfg, s8 data_width)
+{
+	*p_cfg |= SUNIV_DMA_CFG_DST_DATA_WIDTH(data_width);
+}
+
+static void set_src_data_width_f1c100s(u32 *p_cfg, s8 data_width)
+{
+	*p_cfg |= SUNIV_DMA_CFG_SRC_DATA_WIDTH(data_width);
+}
+
 static int convert_burst_a10(u32 maxburst)
 {
 	if (maxburst > 8)
@@ -252,6 +280,15 @@ static int convert_burst_a10(u32 maxburst)
 	return (maxburst >> 2);
 }
 
+static int convert_burst_f1c100s(u32 maxburst)
+{
+	if (maxburst > 4)
+		return -EINVAL;
+
+	/* 1 -> 0, 4 -> 1 */
+	return (maxburst >> 2);
+}
+
 static int convert_buswidth(enum dma_slave_buswidth addr_width)
 {
 	if (addr_width > DMA_SLAVE_BUSWIDTH_4_BYTES)
@@ -1379,8 +1416,31 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg = {
 	.has_reset		= false,
 };
 
+static struct sun4i_dma_config suniv_f1c100s_dma_cfg = {
+	.ndma_nr_max_channels	= SUNIV_NDMA_NR_MAX_CHANNELS,
+	.ndma_nr_max_vchans	= SUNIV_NDMA_NR_MAX_VCHANS,
+
+	.ddma_nr_max_channels	= SUNIV_DDMA_NR_MAX_CHANNELS,
+	.ddma_nr_max_vchans	= SUNIV_DDMA_NR_MAX_VCHANS,
+
+	.dma_nr_max_channels	= SUNIV_NDMA_NR_MAX_CHANNELS +
+		SUNIV_DDMA_NR_MAX_CHANNELS,
+
+	.set_dst_data_width	= set_dst_data_width_f1c100s,
+	.set_src_data_width	= set_src_data_width_f1c100s,
+	.convert_burst		= convert_burst_f1c100s,
+
+	.ndma_drq_sdram		= SUNIV_NDMA_DRQ_TYPE_SDRAM,
+	.ddma_drq_sdram		= SUNIV_DDMA_DRQ_TYPE_SDRAM,
+
+	.max_burst		= SUNIV_MAX_BURST,
+	.has_reset		= true,
+};
+
 static const struct of_device_id sun4i_dma_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-dma", .data = &sun4i_a10_dma_cfg },
+	{ .compatible = "allwinner,suniv-f1c100s-dma",
+		.data = &suniv_f1c100s_dma_cfg },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun4i_dma_match);
-- 
2.34.1



