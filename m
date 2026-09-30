Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40462CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPS3Zc/265J4SLGyUkj5JcerikEN+CDX3AvXRX7bVmM=; b=MCEOVPhXmY+f8WSquCtXK9kLIR
	pvYEF9hNvUwjOHioqEzDlOoMKn6d17Hq8t2oppayjB+NQ2rQK4xH5IfVWceEgwxr36I2s89XimnlY
	v6BPGJ11Qy7y/osV+vQ86igi6HOZHk32ZBNPkYm5wsgJYcRoSTn2Daa9d20v/oTjo+Woqgp6Cg35Q
	vGVAHMXaVSgmFGKHQaz1Azyrok+WzB51y4l4sYbqEbTqDQ1dyoy2UJ4d+W1b6qaqh36F7UkXlRXDK
	CXCiAWcCd9iiyuH1j+7PV1KVJkHoQYH9k5Hqxg3nGTqZP1NSiFf7TDzcZrxsAZ1onrbOKQL/slO6r
	A1qwUfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvze-00000006Rxm-0TOy;
	Wed, 30 Sep 2026 15:13:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvzM-00000006RnR-0Udf;
	Wed, 30 Sep 2026 15:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cPS3Zc/265J4SLGyUkj5JcerikEN+CDX3AvXRX7bVmM=; b=ippb4angGuUu/neNh4oEs7LYKC
	4+bCItANznUeglcAh36vRBynn0zSx7epur6IQVsvzBbcyTkfoRxesAnDmDSm18G9QpPkwiPFkzPfL
	4ouOddXQK2MFoq1rte4IHAJe5iZcT1rfmMnWYIc/LPxYaDyXuzLkRPYw572W+L882Rfw3aURHRtZS
	dnUuttY8Vd/Mo4hiJ3nBZkcxHK1Xe86FOnpR+XUadwXU0SDxMt7HZXaMhvIX0MLkhaVIVwkL6wq9l
	tHzMXPihpDG++Tz6gAbUAha0t8ptUNh/3mtCVux8bApXCnAXZzgjDpJWLTgznYZrChcfj3+DDIyNC
	fVKo9Ngg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBvzI-00000003yRh-0IeR;
	Wed, 30 Sep 2026 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790781167;
	bh=GWvXpMCyRz23vwGyByDqhR0iZB1dcjWq3CJUnwuL7hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YoxwdqYyIWHZkoSWlbEjf/zfYxAq8toBZ9BwWuim733cXmLWBDAVsUKjivIXfvRfU
	 UONx7JmVc+6gaGavNX/AluiYBIbC8quppuPSl2mOVRuDhk7KJW7C1U40pO8ghrhg5i
	 0Oq3Gfs+Yqf8ah+/JpX8v0/MIK54t7Jpd60nhzhWZCDJFSpbqD/KmF57xpay5+zPgV
	 yDXAIfWa28yPY/ucL49bWqFVsO8U0u8je2rnmKU4Zc5buL/nX0oXcbCyUXEq0g1jS6
	 NydG1PzsCvq999/8c1kJNM3KBe4WZj+tkfSBAOYhQBLyFjl1p2AV5LRUJdZoaglbid
	 s8xTXqahhP8XA==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EA4617E01D6;
	Wed, 30 Sep 2026 17:12:47 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v6 1/3] media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant
Date: Wed, 30 Sep 2026 17:12:39 +0200
Message-ID: <20260930151241.58233-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
References: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_161252_311887_81C90BD2 
X-CRM114-Status: GOOD (  18.42  )
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

"nxp,imx8mq-vpu" is tagged as deprecated since:
commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
merged since v5.17-rc1. There is more reference to it since that.
Remove all references to it into the driver and remove dead code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v6:
- rework patch 1 commit message
Keep hantro_runtime_resume() because it harmless and futur patches will
need it.

 .../media/platform/verisilicon/hantro_drv.c   |  10 --
 .../media/platform/verisilicon/hantro_hw.h    |   1 -
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
 3 files changed, 128 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index ad71c0402ef3..12c804dcc669 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -725,7 +725,6 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
-	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
 	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
 	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
 #endif
@@ -1100,15 +1099,6 @@ static int hantro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/*
-	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
-	 * but it's deprecated. Please update your DTS file to use
-	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
-	 */
-	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
-		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
-			 match->compatible);
-
 	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
 
 	vpu->clocks = devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..865de26ffbce 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -405,7 +405,6 @@ enum hantro_enc_fmt {
 extern const struct hantro_variant imx8mm_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
-extern const struct hantro_variant imx8mq_vpu_variant;
 extern const struct hantro_variant px30_vpu_variant;
 extern const struct hantro_variant rk3036_vpu_variant;
 extern const struct hantro_variant rk3066_vpu_variant;
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index fa4224de4b99..0d6a71ae5f45 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -13,67 +13,6 @@
 #include "hantro_g1_regs.h"
 #include "hantro_g2_regs.h"
 
-#define CTRL_SOFT_RESET		0x00
-#define RESET_G1		BIT(1)
-#define RESET_G2		BIT(0)
-
-#define CTRL_CLOCK_ENABLE	0x04
-#define CLOCK_G1		BIT(1)
-#define CLOCK_G2		BIT(0)
-
-#define CTRL_G1_DEC_FUSE	0x08
-#define CTRL_G1_PP_FUSE		0x0c
-#define CTRL_G2_DEC_FUSE	0x10
-
-static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
-{
-	u32 val;
-
-	/* Assert */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val &= ~reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
-
-	udelay(2);
-
-	/* Release */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val |= reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
-}
-
-static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
-{
-	u32 val;
-
-	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
-	val |= clock_bits;
-	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
-}
-
-static int imx8mq_runtime_resume(struct hantro_dev *vpu)
-{
-	int ret;
-
-	ret = clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
-	if (ret) {
-		dev_err(vpu->dev, "Failed to enable clocks\n");
-		return ret;
-	}
-
-	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2);
-	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
-
-	/* Set values of the fuse registers */
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
-
-	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
-
-	return 0;
-}
-
 /*
  * Supported formats.
  */
@@ -234,45 +173,10 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	},
 };
 
-static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
-{
-	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
-
-	return 0;
-}
-
-static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	imx8m_soft_reset(vpu, RESET_G1);
-}
-
 /*
  * Supported codec ops.
  */
 
-static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
-	[HANTRO_MODE_MPEG2_DEC] = {
-		.run = hantro_g1_mpeg2_dec_run,
-		.reset = imx8m_vpu_g1_reset,
-		.init = hantro_mpeg2_dec_init,
-		.exit = hantro_mpeg2_dec_exit,
-	},
-	[HANTRO_MODE_VP8_DEC] = {
-		.run = hantro_g1_vp8_dec_run,
-		.reset = imx8m_vpu_g1_reset,
-		.init = hantro_vp8_dec_init,
-		.exit = hantro_vp8_dec_exit,
-	},
-	[HANTRO_MODE_H264_DEC] = {
-		.run = hantro_g1_h264_dec_run,
-		.reset = imx8m_vpu_g1_reset,
-		.init = hantro_h264_dec_init,
-		.exit = hantro_h264_dec_exit,
-	},
-};
-
 static const struct hantro_codec_ops imx8mq_vpu_g1_codec_ops[] = {
 	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = hantro_g1_mpeg2_dec_run,
@@ -319,30 +223,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
 	{ "g2", hantro_g2_irq },
 };
 
-static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
-static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
 static const char * const imx8mq_g1_clk_names[] = { "g1" };
 static const char * const imx8mq_g2_clk_names[] = { "g2" };
 
-const struct hantro_variant imx8mq_vpu_variant = {
-	.dec_fmts = imx8m_vpu_dec_fmts,
-	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
-	.postproc_fmts = imx8m_vpu_postproc_fmts,
-	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
-	.postproc_ops = &hantro_g1_postproc_ops,
-	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
-		 HANTRO_H264_DECODER,
-	.codec_ops = imx8mq_vpu_codec_ops,
-	.init = imx8mq_vpu_hw_init,
-	.runtime_resume = imx8mq_runtime_resume,
-	.irqs = imx8mq_irqs,
-	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
-	.clk_names = imx8mq_clk_names,
-	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
-	.reg_names = imx8mq_reg_names,
-	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
-};
-
 static const struct of_device_id imx8mq_vpu_shared_resources[] = {
 	{ .compatible = "nxp,imx8mq-vpu-g1", },
 	{ .compatible = "nxp,imx8mq-vpu-g2", },
-- 
2.53.0


