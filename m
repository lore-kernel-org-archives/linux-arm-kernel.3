Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EA5C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6vermkBIgUo8thwtRk6Cz+ktM6vVuAwyTtaUnyUQFc=; b=LvltGapVl7EgGB03TvlbjCaUbY
	kAwju69rAyA3pwhsgPJeD56lXxkC1H4XqdNwNBi2UXJQcy+8rxSgrDPwnE4mgjWH/+MnFYkCtBj5v
	bD83hzcivEt2sbB0poxJTNho3oSxIb8Z+AhsUoKRDNwxRjUOT7fz888LMSFv6HrhpRR/FKffrCKPy
	XeQylNZ6LunhTj51lh7oDw8QfEGSSSod/dT8Qu/jZxmdXxZ1dNpM323PChVc4i1wsxviyBHSw9wK/
	xhr0ph5zBPaCzPp9DB73Hn8XGFySaWEaMJMBSoKq/Atfn5qi/oqXkWGKPAt4eTfMt78LMOm15oIRn
	CjHoqOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Isx-00000007enW-2l6I;
	Wed, 23 Sep 2026 09:03:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ism-00000007ehl-1LfW;
	Wed, 23 Sep 2026 09:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790154193;
	bh=KNcQLxsr1Ai2oFPUKlfQXhafD0SSWQp7nUDr8E0tm9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lhyi7fAsG/N362P5ZxbnOzO9udXgFn+n3pAyjrnkWsSTHkJiO4uKB09hSvNkN2XPU
	 EyStei4X7rUxom2pnUVa18uASj6x1BSSf76TOpR8GvGZ7RPggk/dCqgo+asvL+ZvkN
	 Ag8JPVQCa9EgqdUyzn6O9FX7sPtkkkL7WfIPRYc9eBi+fnkIcpezrWzhLuJ8Wm58Xj
	 I50BVXxBUMjjBAp31M+fZxZYovgQBoDrCQ8CyDkpY7i1lv9u99G0ksG+yVJgOpO5Qn
	 QQ//DdItY88TCdvk7MTlJhHSiSfF4T7y0dEwV/dloZMUssC5CQb3D6pPpe5+JvUo84
	 5KMul1LCz3TYA==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1790117E047B;
	Wed, 23 Sep 2026 11:03:13 +0200 (CEST)
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
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/2] media: verisilicon: Remove deprecated variant
Date: Wed, 23 Sep 2026 11:03:06 +0200
Message-ID: <20260923090307.49959-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
References: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_020316_510435_8055E339 
X-CRM114-Status: GOOD (  12.75  )
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
merged since v5.17-rc1.
There is more reference to it since that.
Remove for driver and Documentation to clean up the code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../bindings/media/nxp,imx8mq-vpu.yaml        |  2 -
 .../media/platform/verisilicon/hantro_drv.c   |  1 -
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 60 -------------------
 3 files changed, 63 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 19528262810a5..504ea45355dbc 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -15,8 +15,6 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: nxp,imx8mq-vpu
-        deprecated: true
       - const: nxp,imx8mq-vpu-g1
       - const: nxp,imx8mq-vpu-g2
       - const: nxp,imx8mm-vpu-g1
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index ad71c0402ef3b..70de47ddb023b 100644
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
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index fa4224de4b996..3b63f626d33f2 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -42,38 +42,6 @@ static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
 	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
 }
 
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
@@ -234,13 +202,6 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	},
 };
 
-static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
-{
-	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
-
-	return 0;
-}
-
 static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -319,30 +280,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
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


