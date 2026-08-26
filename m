Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3201AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5pUUJmcn3/3Y2ngemNPoG+r9QKqCH0NVXE0QE3SQQY=; b=i/K0Ia1iipdU8TMJCovVckmtb7
	AQX3snt4BF75LDZT5ny6WY7wFY93RF4JtsHXWvddYrnP/nU/1BUipRaqFpP30wfDoKPCiYk0oNfY2
	RwktiZ300bNmJj3etplN+kTyvvvbD+woM5vpNgjngfXH+/EMrCZTUR485QAZH7u1eS+p+YMY0kYWi
	QjwnVf1qHyRzt1zKnyWt0dFx7mciD96YQCpbL2LiRF7CZzG0J8OBD1rE9rWL6Ekq8jmIupUKEvL0/
	pMujIF7eI9/I+yRT2kIC5iwPO5wlw2ezLq/wxFGpuFVxbbLxKwU3pa83nHiyRTSrP2JlGKe97cxOw
	04wbZjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TV-00000001l6r-1tWB;
	Wed, 26 Aug 2026 01:30:45 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TE-00000001l0g-2aLW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 01:30:29 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-9309d4ea213so29092685a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707827; x=1788312627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5pUUJmcn3/3Y2ngemNPoG+r9QKqCH0NVXE0QE3SQQY=;
        b=Q9k3SieIQdwQh2qD7IXhMiFQtDOAp9TxZTLvte2qTocVXk9t02gN8SOQikemDh7O4R
         dnfki/kfxC9yBFyCzqAQPlLmEzUHR2zblcs8/haQXpwLMZgYv+XW6QWZhuWGVyE8H44P
         a98QXoGXqckha0t3pXmtlM0FR6WVDRuuVFvfenIKzvkWLEKuStYjWXJWkCtd0SQLZwcg
         kBu1EP96Unr5nxv31yn2S+XO/QdQECbWK2UhrjNLS0KI1FEO0e+5Un3ol2t7eJEXY3lo
         ejC+oD7CG4Oxd12+GEfpOVwap6SmsUL0NQpZ5Js0db3ExX587lSZr2nzcLV8l+hc9RsO
         Yjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707827; x=1788312627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5pUUJmcn3/3Y2ngemNPoG+r9QKqCH0NVXE0QE3SQQY=;
        b=doX2RfiAckir61P1Yr5ystzwcD0oLr03FXk/PuiYKiY/5NMzRA942VTXfUqPaMlQtn
         YmrCcvoCvPbMfRRLwv+mEGv7bSV4mb3VCh5HJF7cjhqNdS+mNTA8XGDbBJhzJUG/ciYj
         SR/UGgk0pBaeWcqf45scRQdV8hvQh6X6qk4aAEpvsJOX7TILCYwHzx+Mv4WlLVjSje+H
         nOqhfH/Z4k8WNBTPOBHNlEcterjhFkR2S2jDPz5yaQiRCp/ADxe5eTTp9bXxq4hq+HRS
         V+C7FE101s+z712zbC6PUH6EwwpppTHjml/8AogjL7qzGdrUYHl31337xC07/YrYDPyt
         F4cg==
X-Forwarded-Encrypted: i=1; AHgh+RoG3rUrFYq0Av50o8QgRpccPivL44uBl2IMa5eadn4rxp9PM9fUlSos63JTexrVrLEdu0Q6GmoMiRmHCohoyuKR@lists.infradead.org
X-Gm-Message-State: AFuF++nRI98Al969db7PYsJ7pY08622j4O468fnZ7xkEz6Hd7EikCm1K
	8xAtatLJcw7bwhs3v3DNcpwN/PSbm13tD7o60oszFMiBjbFTGbly0JLx
X-Gm-Gg: AR+sD11K5JEEmFft5wsQXN2QoaNWIxnsCBDKSh+G1wY88+GELcWANCQ2lyndph+b22M
	K03V8MM58OTVhbaW4B0Lfia5KQIjfjAjE53SK+0VfXb/SXUl23tToOn83115zOrwlUIKgd+Jxhg
	c2gMpaPq4GxHsOzFxMUGDrclkmLFJaHt7BBNIY6qgf/SpFv9pqd+GZWCO1oGVcHOP2JxaLRkFjh
	76mmk7aNs7qjr2CkFjC9fb1ZJDOdCVj3MSaMF8EpzUdI3zksIuK8j9+fct+GdDPDPcDxcdi2zqB
	Ri8pEddB7F1dLrnZgG/Og5LGaevWevi894S57N6cVLoe/utJoaQFf1MGrrhmACGk+7VqOGnsUDv
	j0zZ71HdhSM5A813S03zOOP5yUOCQ/zGehMqSaGHaMg/r1NGDfr5cyMh3G9Pe6nBFkBcnDtKiO+
	UCHnmM7c0hWiaJs8rwiYXEQ7En+vv3LfJZQVKyospFwFnpYKHkZ8T3gOHve/PMkQ==
X-Received: by 2002:a05:620a:4102:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-937801702c8mr267218185a.17.1787707827056;
        Tue, 25 Aug 2026 18:30:27 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:26 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:05 +0000
Subject: [PATCH v4 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-3-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_183028_731525_3A8CA082 
X-CRM114-Status: GOOD (  16.59  )
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

The `sun6i-dma` driver previously assumed a fixed number of channels
per interrupt register. For example, `sun6i_kill_tasklet` was hardcoded
to disable interrupts only for registers 0 and 1. `DMA_MAX_CHANNELS` was
also not in used previously, and the old SoCs never has more than 16
channels.

The A733 has a different interrupt structure where the number of
channels per register may differ. Add `num_channels_per_reg` to `struct
sun6i_dma_config` to make the interrupt handling logic handware-agnostic
Update `sun6i_dma_interrupt`, `sun6i_dma_start_desc`, and
`sun6i_kill_tasklet` to use this value.

Additionally, set `DMA_MAX_CHANNELS` to 16 to ensure loops over
interrupts are correctly bounded, aligning with the hardware
specifications.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 53c54161e32a..b96d7d90f6b5 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -35,14 +35,13 @@
 #define DMA_IRQ_PKG			BIT(1)
 #define DMA_IRQ_QUEUE			BIT(2)
 
-#define DMA_IRQ_CHAN_NR			8
 #define DMA_IRQ_CHAN_WIDTH		4
 
 
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
-#define DMA_MAX_CHANNELS	(DMA_IRQ_CHAN_NR * 0x10 / 4)
+#define DMA_MAX_CHANNELS	16
 
 /*
  * sun8i specific registers
@@ -61,6 +60,8 @@
 #define DMA_IRQ_EN_OFFSET_A31		0x00
 #define DMA_IRQ_STAT_OFFSET_A31		0x10
 
+#define DMA_IRQ_CHAN_NR_A31		8
+
 /*
  * Channels specific registers
  */
@@ -157,6 +158,7 @@ struct sun6i_dma_config {
 	u32 irq_stride;
 	u32 irq_en_offset;
 	u32 irq_stat_offset;
+	u32 num_channels_per_reg;
 };
 
 /*
@@ -271,7 +273,7 @@ static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 {
 	int i;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, sdev->cfg->num_channels_per_reg); i++) {
 		dev_dbg(sdev->slave.dev, "Common register:\n"
 			"chan num %d\n"
 			"\tmask(%04x): 0x%08x\n"
@@ -492,8 +494,8 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
-	irq_reg = pchan->idx / DMA_IRQ_CHAN_NR;
-	irq_offset = pchan->idx % DMA_IRQ_CHAN_NR;
+	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
@@ -585,7 +587,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -595,7 +597,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
+		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
 			pchan = sdev->pchans + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
@@ -1113,7 +1115,7 @@ static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 	int i;
 
 	/* Disable all interrupts from DMA */
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i++)
 		sun6i_write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
@@ -1141,7 +1143,8 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 #define SUN6I_DMA_IRQ_A31_COMMON_CFG	\
 	.irq_stride      = DMA_IRQ_STRIDE_A31,	\
 	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A31,	\
-	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,	\
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A31,
 
 /*
  * For A31:

-- 
2.55.0


