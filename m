Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67113CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 04:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCbRPFVxEt0WZgFCBiNC0T/3UAfEsH3DPRtt1y+Tp+Y=; b=1zf6mBbZX1llYCtxyjXKUGM1Vm
	DKPEv2LJFvpMSfk3iz5nIH/u7+4eSxHBEwB6pD2C9Oh7imsyUTTveuZLsLJIusSM7NUXw7HzJ5O30
	3lIoZLkN1xrg1C8OvjoRivSUDRfaip3ABS4E7hP8yaMl0XKIRdbA+cwuddgca9Y/Zy+Zk1kROK9mQ
	jp6XVyi79otty6+wZQ9Oiy0ZPvTatk7P6Vjaui5K+EPup79RObqM3XfM7eF2nQ+BrB6RHm4CXetO4
	rJmb2nemEFxyuVvXKc1e8+bhTWyQh2cia9Lr/4lXbE9+vK+ym8kqlIyaOYYoGpf58xn26oIrEHRcY
	yjrvE4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFT-00000001z4o-2YsC;
	Fri, 19 Jun 2026 04:54:35 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFO-00000001z2U-1SJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:54:31 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-91591f19c30so239542585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 21:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844869; x=1782449669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCbRPFVxEt0WZgFCBiNC0T/3UAfEsH3DPRtt1y+Tp+Y=;
        b=n0y5zir0Me+j6ECSOt7EK8WnTUYcWVoU5AkperxMnjmtNbmQ6oFBHC8tglSfml1bkl
         YtlxOPOAquPvxXraEHdqSWEaM32vcd1dBFBvk8c3UiQYQ7idXP5Tn6Vmyeoo+SUmsHGW
         7gWaKL5Paf2siPgbZ+MEGiYeQtKNqDSXY5GUCJvd+EJrq1i5QvbvR3tV8z+liattC7QM
         BKlKtqiar98GUzcNOxFKxUJSdmy921wxIwsZUuluRyMh0wZBuoAyocwdKjWpNF9VIMuv
         uwgdyidQGBMtGDrrJm/q3olLQrDwBlR8gKwRllG1t5wRlDD9cSeoDzQledHs4VW9BGJ9
         WQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844869; x=1782449669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCbRPFVxEt0WZgFCBiNC0T/3UAfEsH3DPRtt1y+Tp+Y=;
        b=fjhkVTZyM9W4dOGd94XHun5XGo6KbhllBts6qsu52/+6YnYU2XNzQF6l2ux6uMcj1D
         Rj9kMnbdiBExTIqLPuy/Ocet5BXQqXEBtEzg7eUxKCT+muxGgSQIRoSJ4hKec4IT6hBF
         hSKx1WU3rSIvNz9NwL+OBlIUImIcEiwQnNjXbvjuNwUSfhp+0ywXg3mEDIrvN+nUIYrJ
         jSXbh9/9xZ22++6OtcEgKDBbUIDgN2vItRE4Yq4UVSMFq8cVTdM4KCvETyAs0xCc8XY6
         SDt+KQ70JzVCONXDo9FXe9Ugh9rxIPJSQP+3WWZfSUPbTG5SXwt0qTCulG/He/KpgomL
         oqSA==
X-Forwarded-Encrypted: i=1; AFNElJ9XUF4f4nCoLmEAtzhfbP+A2J8O0MYyjTFU/PiIjm9ZvBI4G9asyDHAnDqId7X3s+nVtuHkLS3RrkmZ33b4b+xC@lists.infradead.org
X-Gm-Message-State: AOJu0YwX6cReJKU6Mae/HesRP+EPRv3QU6oAtJeuU6JkbsHc2aSbjqAL
	iouGinTwuUv446BennEAr6rkBbb32kQMCbLPo4tgT97KXMwP5ZuiJ1lG
X-Gm-Gg: AfdE7cl2Bo1kS9OMASiZnH5Za2/iHuMW7O1VFk86+/SSviz4Zi52ZwPBJMhPovIzc69
	cG3WfPQqZ/N9+vq/xLuwOeu9hCQ64BUIWlkhE4KgJfYHGp2uVX/nfmd0/CUGv4L/bdHscFqwXJC
	Jk1Uuh99U81/MBYZ3aYf2QDl9sMxkp3RtacMbxaMxqkvLp4CWBhRCBBde+zQwCbJ60GYC/6wTUO
	TH2joo2kEe6jUOwCn2aIsBM7h3y006IXECCnEW0gqo+JzSFm7Xvry/Dtuhz6j+fz4yXA7SktJLk
	GcFCOeBNVSLvCvw8SI85Cydo2ZNHCIW1gISYe+W+1QWoNTUM/J7tZpc6zPq+zPzwyMJiFyHemxH
	qeLJgeUbK8Ibk5yO03xMgbwxse13MuJbLuoG5o4lCyTW6iVflO/lRzyM21jLf1ecz/ztnRpUX2Y
	fytOct4TzZ8N8pyA==
X-Received: by 2002:a05:620a:2592:b0:915:efa6:d714 with SMTP id af79cd13be357-92092b3e2efmr316863785a.52.1781844869229;
        Thu, 18 Jun 2026 21:54:29 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:30 +0000
Subject: [PATCH 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-1-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
In-Reply-To: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_215430_417398_71A5C832 
X-CRM114-Status: GOOD (  18.29  )
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

This patch is the first step in a refactoring effort to support the
Allwinner A733 DMA controller. Currently, the `sun6i-dma` driver has
several functions related to interrupt handling (reading/writing
interrupt enable and status registers) and register dumping that are
hardcoded.

To support the A733, which has different register layouts and interrupt
handling logic, these functions are being moved into the
`sun6i_dma_config` structure as function pointers. This allows the
driver to use a polymorphic approach where the specific implementation
is determined by the hardware configuration assigned during device
probing.

Changes:
- Added function pointers to `struct sun6i_dma_config` for:
    - `dump_com_regs`
    - `read_irq_en`
    - `write_irq_en`
    - `read_irq_stat`
    - `write_irq_stat`
- Implemented generic `sun6i_read/write_irq_*` functions for existing
  hardware.
- Updated existing `sun6i_dma_config` instances (A31, A23, H3, A64,
  A100, H6, V3S) to use these new function pointers.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 74 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..d92e702320d9 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -138,6 +138,11 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
+	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
+	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num);
+	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val);
+	u32 (*read_irq_stat)(struct sun6i_dma_dev *sdev, u32 chan_num);
+	void (*write_irq_stat)(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
@@ -347,6 +352,25 @@ static void sun6i_set_mode_h6(u32 *p_cfg, s8 src_mode, s8 dst_mode)
 		  DMA_CHAN_CFG_DST_MODE_H6(dst_mode);
 }
 
+static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_EN(chan_num));
+}
+
+static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN(chan_num));
+}
+static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_STAT(chan_num));
+}
+
+static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT(chan_num));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -460,16 +484,16 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
-	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
+	irq_val = sdev->cfg->read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			(irq_offset * DMA_IRQ_CHAN_WIDTH));
 	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
-	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+	sdev->cfg->write_irq_en(sdev, irq_reg, irq_val);
 
 	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
 	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
 
-	sun6i_dma_dump_com_regs(sdev);
+	sdev->cfg->dump_com_regs(sdev);
 	sun6i_dma_dump_chan_regs(sdev, pchan);
 
 	return 0;
@@ -549,14 +573,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 status;
 
 	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
-		status = readl(sdev->base + DMA_IRQ_STAT(i));
+		status = sdev->cfg->read_irq_stat(sdev, i);
 		if (!status)
 			continue;
 
 		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
 			str_high_low(i), status);
 
-		writel(status, sdev->base + DMA_IRQ_STAT(i));
+		sdev->cfg->write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
 			pchan = sdev->pchans + j;
@@ -1124,6 +1148,11 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1147,6 +1176,11 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1165,6 +1199,11 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1190,6 +1229,11 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1211,6 +1255,11 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1232,6 +1281,11 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1255,6 +1309,11 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_h6,
 	.set_mode         = sun6i_set_mode_h6,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1281,6 +1340,11 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
 	.set_mode         = sun6i_set_mode_a31,
+	.dump_com_regs    = sun6i_dma_dump_com_regs,
+	.read_irq_en      = sun6i_read_irq_en,
+	.write_irq_en     = sun6i_write_irq_en,
+	.read_irq_stat    = sun6i_read_irq_stat,
+	.write_irq_stat   = sun6i_write_irq_stat,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |

-- 
2.54.0


