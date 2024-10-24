Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E804FD0BB69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DAimrnmPrGVcs+dO6bpOYED/+XihqEkuNp6uC83mhg=; b=SJ+c61X4Fm4abB2j00OBvICRzA
	7VVqPcafdEjGR3aZYePq+IfI4NaJvqQMCCgcgfwbouc7zJxLl7elZu03wAGDh2YrNFsGJxIng8klb
	KRQmjrgKdz+zf61Qbg3boVE0IJZ0nNLvpVJZY7fE0S8AUytuJbN7TttAQ9rHLm5bHWXumAyXuLaq0
	dblyjPNUIpP2mrEqIt954hyrLKu2JV0fOmmW5yrDVebSBJFiORThF6CktMXWJihjvs8Mqs+XssZKr
	gs2RuH8t1GR78OX8+k3GKB+UcEtJkLI8bt9en7tHf7QL07NUWGTGDl+ldOONJyFi6E8CR2Kw5h6/z
	llJapatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rru-0000000H0xb-3ucR;
	Thu, 24 Oct 2024 07:02:50 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rga-0000000GyaL-2aeP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:51:11 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 6783BA0767;
	Thu, 24 Oct 2024 08:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=1DAimrnmPrGVcs+dO6bp
	OYED/+XihqEkuNp6uC83mhg=; b=Lw33F5uiObI/m7yT6LVT8p8F3FZ6F8RGZ09E
	5xkJqOWbrDxowYtLZzrsbExO5+YWnBArjGlD7gYpXardFTQ2hwKhsnevZKxOMowO
	fzjM7VuDfhihPDoAs1yvv5y6AQSvI3bz2oigM24Ibxn7nJnXQMufxDbDPQmbLGHx
	POGbpN2g41L21eeIDWrBqQheR/ilgHmosncQYKHJ5tmqRKc5e3wwpd5Pe08EtJUZ
	yugUnNhjJAqgkLT40dtoGfn4QX6mJrWjrt0AcMNVAi125zJkxnen1R7HRx88t2TI
	qzU9LXRgCWj07bbEwMn4pXBRL4Jf22Ufize872vbJZ79qvVlGJdsIdrq+KNDrtnv
	bois/NyMwpYf0UIxRot52nbkdw89BovTSk2On8tn3T+Bd9X5tgwvrj8H5+KPn1GI
	gMEGIM/ULrKr9Ya0gknApaxfMZyrpB6vRc3iVGk4Rz2MGVI+QNKiDh7N7IBzxP8G
	lW1IbIhGSc2qydr2kFdAQTqAQo2Pt7psYHCfKCvW3+E4v3hUO98KuXq90DEGKK4X
	Tr6N0TTnfBXhGYY4Jf3d12ysfHsGZnMmLrktBojdRgRuArYWilRXW0bOPPLYurfC
	7FpMjiW0oEkNWQkQm12ukK0H3re8jYx9pwnqjcs9EOwBo7liKdjm/zhgt+5zNPjV
	2Cnx4Gs=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 06/10] ASoC: sun4i-codec: Add DMA Max Burst field
Date: Thu, 24 Oct 2024 08:49:27 +0200
Message-ID: <20241024064931.1144605-7-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1729752653;VERSION=7978;MC=1098937437;ID=135553;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235108_939734_EC69AC96 
X-CRM114-Status: GOOD (  12.76  )
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

Allwinner suniv F1C100s has similar DMA engine to sun4i but it has
smaller max burst size compared to sun4i. Add a quirk field to
differantitate between them.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 330bc0c09f56..4953b5013c58 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -228,6 +228,8 @@
 
 /* TODO H3 DAP (Digital Audio Processing) bits */
 
+#define SUN4I_DMA_MAX_BURST			(8)
+
 struct sun4i_codec {
 	struct device	*dev;
 	struct regmap	*regmap;
@@ -1568,6 +1570,7 @@ struct sun4i_codec_quirks {
 	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
 	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
 	bool has_reset;
+	u32 dma_max_burst;
 };
 
 static const struct sun4i_codec_quirks sun4i_codec_quirks = {
@@ -1577,6 +1580,7 @@ static const struct sun4i_codec_quirks sun4i_codec_quirks = {
 	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
+	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
 static const struct sun4i_codec_quirks sun6i_a31_codec_quirks = {
@@ -1587,6 +1591,7 @@ static const struct sun4i_codec_quirks sun6i_a31_codec_quirks = {
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
+	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
 static const struct sun4i_codec_quirks sun7i_codec_quirks = {
@@ -1596,6 +1601,7 @@ static const struct sun4i_codec_quirks sun7i_codec_quirks = {
 	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
+	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
 static const struct sun4i_codec_quirks sun8i_a23_codec_quirks = {
@@ -1606,6 +1612,7 @@ static const struct sun4i_codec_quirks sun8i_a23_codec_quirks = {
 	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
+	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
 static const struct sun4i_codec_quirks sun8i_h3_codec_quirks = {
@@ -1621,6 +1628,7 @@ static const struct sun4i_codec_quirks sun8i_h3_codec_quirks = {
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
+	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
 static const struct sun4i_codec_quirks sun8i_v3s_codec_quirks = {
@@ -1635,6 +1643,7 @@ static const struct sun4i_codec_quirks sun8i_v3s_codec_quirks = {
 	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
 	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
 	.has_reset	= true,
+	.dma_max_burst	= SUN4I_DMA_MAX_BURST,
 };
 
 static const struct of_device_id sun4i_codec_of_match[] = {
@@ -1757,12 +1766,12 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	/* DMA configuration for TX FIFO */
 	scodec->playback_dma_data.addr = res->start + quirks->reg_dac_txdata;
-	scodec->playback_dma_data.maxburst = 8;
+	scodec->playback_dma_data.maxburst = quirks->dma_max_burst;
 	scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 
 	/* DMA configuration for RX FIFO */
 	scodec->capture_dma_data.addr = res->start + quirks->reg_adc_rxdata;
-	scodec->capture_dma_data.maxburst = 8;
+	scodec->capture_dma_data.maxburst = quirks->dma_max_burst;
 	scodec->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, quirks->codec,
-- 
2.34.1



