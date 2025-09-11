Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D07FCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 21:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbB6MuwRBK0RcCg9CaXmHw+3+P3wUlKIa9esP4qASto=; b=3BXyzeAyv3uhpWFd8tmpkqbI5l
	HMq/rN2zH0E+iLEVqPe83U8JGioMZYmPn8C6JVLH70OlfA7MbEH02JdvDiyknBSCcyS6KWHem7l04
	g38v5+R8ekKQQj/pROhlh1UDqLPmLO2/kz3lLy4wamarfRP/b6PaOV7qxTHlfJlhUuYqE1HmpULIw
	Cf+njb+WRfrjwtU2gX2TXGWu2nFNjH9yC8G/463hc8Sjoz13Gpv5XckpeNoPkMjorRe6pl++htYDV
	7iUIR6NQ1cQZ11Lv2aMWO20ivy5yTJstYo3+bcFSEbolkU8gthpgpCI23MYKH7PXtJP/WEEntJyhs
	sIh7bQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKT-00000005an0-1Hxq;
	Thu, 11 Sep 2025 21:59:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpKQ-00000005akA-3dM5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 21:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SbB6MuwRBK0RcCg9CaXmHw+3+P3wUlKIa9esP4qASto=; b=AGUGZaEeP1aTT8e76wm5SF7u50
	5548WO/BDk8tFF7Q6j/l24UqKnJj3JROJnBu89Wz5PAcqOG/XmEJuryGsAyU47G+BMX+crzZusKJa
	WxSnpR6WioE4FsTuoYvF01jXW7x/RNLvft/nt1sBGYm+DomhWXT78mKqZa998jFdp1RAlKUpQWwSa
	sxFhc+bSjnLiBBSvGCiEq2xZCb/QtIAS5w3+BZ5F07wrss7Qsm0ymXgKUtiuR7Oa8+cPmh6OKLC3X
	P4ZvxrlohXMiYXmkoJESQXI9ntbmySsIajQ6jHbFq3xEQiRday25gFB/+MNXmw/82zXT1kNoxSGhH
	wHS5Ijeg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpHr-00000006BDD-2sv4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 21:59:41 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpHe-0004g5-7I; Thu, 11 Sep 2025 23:56:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 11 Sep 2025 23:56:46 +0200
Subject: [PATCH v2 05/10] dmaengine: imx-sdma: cosmetic cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-v6-16-topic-sdma-v2-5-d315f56343b5@pengutronix.de>
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
In-Reply-To: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_225740_339667_4341D050 
X-CRM114-Status: GOOD (  13.97  )
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

Make use of local struct device pointer to not dereference the
platform_device pointer everytime.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 44411c15029c9b09f307c4b9e3f7b1ab77fa5093..b0def2bde77fe53b0805bddc0c5d6116c9cefcbe 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2266,7 +2266,8 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
 
 static int sdma_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	const char *fw_name;
 	int ret;
 	int irq;
@@ -2274,18 +2275,18 @@ static int sdma_probe(struct platform_device *pdev)
 	struct sdma_engine *sdma;
 	s32 *saddr_arr;
 
-	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	sdma = devm_kzalloc(&pdev->dev, sizeof(*sdma), GFP_KERNEL);
+	sdma = devm_kzalloc(dev, sizeof(*sdma), GFP_KERNEL);
 	if (!sdma)
 		return -ENOMEM;
 
 	spin_lock_init(&sdma->channel_0_lock);
 
-	sdma->dev = &pdev->dev;
-	sdma->drvdata = of_device_get_match_data(sdma->dev);
+	sdma->dev = dev;
+	sdma->drvdata = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -2295,11 +2296,11 @@ static int sdma_probe(struct platform_device *pdev)
 	if (IS_ERR(sdma->regs))
 		return PTR_ERR(sdma->regs);
 
-	sdma->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
+	sdma->clk_ipg = devm_clk_get(dev, "ipg");
 	if (IS_ERR(sdma->clk_ipg))
 		return PTR_ERR(sdma->clk_ipg);
 
-	sdma->clk_ahb = devm_clk_get(&pdev->dev, "ahb");
+	sdma->clk_ahb = devm_clk_get(dev, "ahb");
 	if (IS_ERR(sdma->clk_ahb))
 		return PTR_ERR(sdma->clk_ahb);
 
@@ -2311,8 +2312,8 @@ static int sdma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk;
 
-	ret = devm_request_irq(&pdev->dev, irq, sdma_int_handler, 0,
-				dev_name(&pdev->dev), sdma);
+	ret = devm_request_irq(dev, irq, sdma_int_handler, 0,
+			       dev_name(dev), sdma);
 	if (ret)
 		goto err_irq;
 
@@ -2357,7 +2358,7 @@ static int sdma_probe(struct platform_device *pdev)
 
 	sdma->iram_pool = of_gen_pool_get(np, "iram", 0);
 	if (sdma->iram_pool)
-		dev_info(&pdev->dev, "alloc bd from iram.\n");
+		dev_info(dev, "alloc bd from iram.\n");
 
 	ret = sdma_init(sdma);
 	if (ret)
@@ -2370,7 +2371,7 @@ static int sdma_probe(struct platform_device *pdev)
 	if (sdma->drvdata->script_addrs)
 		sdma_add_scripts(sdma, sdma->drvdata->script_addrs);
 
-	sdma->dma_device.dev = &pdev->dev;
+	sdma->dma_device.dev = dev;
 
 	sdma->dma_device.device_alloc_chan_resources = sdma_alloc_chan_resources;
 	sdma->dma_device.device_free_chan_resources = sdma_free_chan_resources;
@@ -2393,13 +2394,13 @@ static int sdma_probe(struct platform_device *pdev)
 
 	ret = dma_async_device_register(&sdma->dma_device);
 	if (ret) {
-		dev_err(&pdev->dev, "unable to register\n");
+		dev_err(dev, "unable to register\n");
 		goto err_init;
 	}
 
 	ret = of_dma_controller_register(np, sdma_xlate, sdma);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register controller\n");
+		dev_err(dev, "failed to register controller\n");
 		goto err_register;
 	}
 
@@ -2411,11 +2412,11 @@ static int sdma_probe(struct platform_device *pdev)
 	ret = of_property_read_string(np, "fsl,sdma-ram-script-name",
 				      &fw_name);
 	if (ret) {
-		dev_warn(&pdev->dev, "failed to get firmware name\n");
+		dev_warn(dev, "failed to get firmware name\n");
 	} else {
 		ret = sdma_get_firmware(sdma, fw_name);
 		if (ret)
-			dev_warn(&pdev->dev, "failed to get firmware from device tree\n");
+			dev_warn(dev, "failed to get firmware from device tree\n");
 	}
 
 	return 0;

-- 
2.47.3


