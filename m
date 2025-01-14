Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61AFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jzX5EdLsCWjyFAlDUCXLOh7T18XLl+qs3XwQKiuLtpU=; b=joBBcmLtqrKZI3bb6EL7yeFJgz
	FELkC9K7/c21wpF3JBTNOVDPdo67Wmv2jjQypTsKXNf6lwvCQ/WXOZ0Ikk6vpE5vjU4+O2GJ/UK2r
	9gF8zDANWxfUFV9Sv+BlO8eXw/VrxKL17yQKRdFr4wRb2J6ryhwb5QsJn6ZMJ2qUijtcwng3NiTnV
	ayW3mb+cFe7s+JEwFaXrLbW9Vt0d3is36zDsg6l0NjPPVsqAR8i2lLTWv36xTuywbSjS7B8jitwVu
	O2ox5nS78JWfBF/ESCvvBMWL8DzfpVnzXfP3xgCtAEnmQo21jQGpyACKz9ba6bDE9vBv/td0j+3hI
	9HiGAaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdjO-000000081AO-002Y;
	Tue, 14 Jan 2025 10:01:06 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdi7-000000080tL-41cw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:59:49 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0943CA0AB9;
	Tue, 14 Jan 2025 10:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=jzX5EdLsCWjyFAlDUCXLOh7T18XLl+qs3XwQKiuLtpU=; b=
	Vlx49ypumGK4OYALTAT+3gqfJ37n+GyTzB9YcrZhg4vvDhSSXP/xgqjghbq3BqkW
	99auOeXdbCUZ/ZT1f1KuE3Y0OgBfTHzApliAmgk0bpCmqMvb3P1ZulajE03l3TCo
	yACcZa9AKvEJS+SCqDZJkFY8x/ESB2BXHCn61BINGXdaj/W/+OcE+H+4joKcu4zB
	0CXsVUDJRekrWNSKsedX2WBW7wARoKGpDmsfbzeVCQxkoRDKdcJtVnDq9kQDWj8T
	xjHEei3Zn+R/2PSfguprp4vBMnjwM0GeE3NXfKWXfoCX7bmq4KFALUXH1fBjLIgY
	XT/oBNBDJNiiS3MgerUjOFfZW+h1ZHHaFfGm3IJaZi+KojaP1Ov8FThP6qBWhd0z
	Jsw+WxsRA1xi+SZSOKjB0QS7bppm26gDhbdVKCzBiX/MYpmTerSN5/ny00JYxfsX
	YwOAWTAg+kxjRjXp/S3gjCDgmhfmtxoMdsvOSWAMf3l2DPj0kcNvCQqmgAY1lE9S
	+HM+gknf3avJybCVpjZA0FGquknN5qtvAi9EE+BToCLWZ7e+ZHIRxEFj9lEUKAIW
	xyUn3IVUQpjacz4d0tMSld6wkAnjGMToP3Ekhfe/al0fjBsza13gms7IlZQ5lhzY
	cOtFNmvn/o5gAQwGtmGlSy+3T+uinoHrX0pY1u4IKmU=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] ASoC: sun4i-codec: Use new devm clk and reset APIs
Date: Tue, 14 Jan 2025 10:59:07 +0100
Message-ID: <20250114095909.798559-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1736848776;VERSION=7983;MC=2726077745;ID=287044;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485264766B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_015948_461885_0E82656F 
X-CRM114-Status: GOOD (  15.25  )
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

Clean up error handling by using the new devm_
clock and reset functions. This should make it
easier to add new code, as we can eliminate the
"goto ladder" in probe().

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * remove unused `scodec` var
    * rebase onto current for-next

 sound/soc/sunxi/sun4i-codec.c | 42 ++++++-----------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 3d6156fefe75..886b3fa537d2 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2273,7 +2273,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	}
 
 	/* Get the clocks from the DT */
-	scodec->clk_apb = devm_clk_get(&pdev->dev, "apb");
+	scodec->clk_apb = devm_clk_get_enabled(&pdev->dev, "apb");
 	if (IS_ERR(scodec->clk_apb)) {
 		dev_err(&pdev->dev, "Failed to get the APB clock\n");
 		return PTR_ERR(scodec->clk_apb);
@@ -2286,8 +2286,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	}
 
 	if (quirks->has_reset) {
-		scodec->rst = devm_reset_control_get_exclusive(&pdev->dev,
-							       NULL);
+		scodec->rst = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
 		if (IS_ERR(scodec->rst)) {
 			dev_err(&pdev->dev, "Failed to get reset control\n");
 			return PTR_ERR(scodec->rst);
@@ -2323,22 +2322,6 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Enable the bus clock */
-	if (clk_prepare_enable(scodec->clk_apb)) {
-		dev_err(&pdev->dev, "Failed to enable the APB clock\n");
-		return -EINVAL;
-	}
-
-	/* Deassert the reset control */
-	if (scodec->rst) {
-		ret = reset_control_deassert(scodec->rst);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"Failed to deassert the reset control\n");
-			goto err_clk_disable;
-		}
-	}
-
 	/* DMA configuration for TX FIFO */
 	scodec->playback_dma_data.addr = res->start + quirks->reg_dac_txdata;
 	scodec->playback_dma_data.maxburst = quirks->dma_max_burst;
@@ -2356,7 +2339,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 				     &sun4i_codec_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register our codec\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -2364,20 +2347,20 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 					      &dummy_cpu_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register our DAI\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	card = quirks->create_card(&pdev->dev);
 	if (IS_ERR(card)) {
 		ret = PTR_ERR(card);
 		dev_err(&pdev->dev, "Failed to create our card\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	snd_soc_card_set_drvdata(card, scodec);
@@ -2385,28 +2368,17 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
-		goto err_assert_reset;
+		return ret;
 	}
 
 	return 0;
-
-err_assert_reset:
-	if (scodec->rst)
-		reset_control_assert(scodec->rst);
-err_clk_disable:
-	clk_disable_unprepare(scodec->clk_apb);
-	return ret;
 }
 
 static void sun4i_codec_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
 
 	snd_soc_unregister_card(card);
-	if (scodec->rst)
-		reset_control_assert(scodec->rst);
-	clk_disable_unprepare(scodec->clk_apb);
 }
 
 static struct platform_driver sun4i_codec_driver = {
-- 
2.48.0



