Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91A4CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8jLYSQ+fGf5DtGXjU2wWRzq8Y6nl25gGAKxq/Rq4tU=; b=w6yQ2HcQnvN646FD0RVLPNEsy3
	1Oza9b2VUWbfD1WIoSnCoCeAdRCJOinYKOehBj2ETjprqrg9JOBtot97QXTUGlNq3GqgtNk1E5fUs
	9Qx5D+QlbIkfAekH2Dw+kjI9HoTy0qs7FIYqmyL1JejI0PY75sZHqCL+CLDzELt9igJ8+Q1UMASsV
	e1JtZWwIwqjICh10PI0nxWwC12LnGquftCcm4gk6vxzp0+0Z7pyQBGynFGY/qqUrxvbVJF1cD14qo
	6PL1NE3/EDNyIIYiet1CFtZAtYvejxXMWQ+mchjZfkCFVZ9s67gnTuKrZhM+J9utEyhUp7puw84rZ
	iAwIrc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwqB-00000006dbj-2iuf;
	Wed, 30 Sep 2026 16:07:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpt-00000006dTK-2yeK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S8jLYSQ+fGf5DtGXjU2wWRzq8Y6nl25gGAKxq/Rq4tU=; b=LYi+F0yeRRbHLvmf8ztQTUSyMJ
	k/gymlBzcS21JfN+B+O9pnsYh3i2rCZGjdjIJWcn8uzkGDujguX3keVF1HoQQLWppeRWvlk1d4oy1
	8fDsxky/P0vLeDirCDUDeUYfrOrcm4YxYvUHu3+efQ7OJgWgnK7UwXkij/NI4KgyEuKq/7qrxWFYJ
	DpQgS1etM5Ui5ONZ6/QwN1p+PBTddryO4mY3czkRkQnZz7/ZngGT+Xly/33nQCcPh6fH9Kfz3IGH7
	nZWKYn/6y5z+PI85mf3AMAGrBeXFKgAWRN7vT19ubcTcspx7d30l32DnTEpSoCcxPz93FQnBqBdZa
	yv0SMMAA==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwpq-0000000436W-0Vzy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S8jLYSQ+fGf5DtGXjU2wWRzq8Y6nl25gGAKxq/Rq4tU=; b=E0LLOzBOOZuUrX2ECuXXnUXFDS
	dOgkh3Kq4vF3Tn++1m5UgurND3KdewqeaBoasSkGMpPYurLxHqiAj88YvtbOj5SRk4bKzBUVrZpfu
	b+ZxRmiGbHImKr6G6Gys3+njLn0NfpN7dXRRBHaC0nXjHE0WRy5CIdASe2dipc5sUjTAWIJ6IK5cf
	FI41Ap2W9m2Sd36eTaKhWQ+rhKCs6WlecGcg2+iS+Q8/IKJBZ6J0/z3dZDT6aq2iBg37dxkCXhcVd
	7Br3ZVkFyMkAkO33zMpRNvWWXL1hajnT7pmN8dK0rtwWpo4Ywk6iiifG5l0p8sUvkIW5Lki6pBsZ0
	qf7zCNLA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <fourdollars@debian.org>)
	id 1xBwpW-009IoV-26;
	Wed, 30 Sep 2026 16:06:51 +0000
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v17 1/6] spi: pxa2xx: rename local status variable to ret
Date: Thu,  1 Oct 2026 00:06:24 +0800
Message-Id: <20260930160629.1822-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930160629.1822-1-fourdollars@debian.org>
References: <20260930160629.1822-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: fourdollars
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_170710_218914_455BCCC9 
X-CRM114-Status: GOOD (  17.08  )
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

Rename the return value variable name from 'status' to 'ret' in the
pxa2xx_spi_probe(), pxa2xx_spi_suspend(), and pxa2xx_spi_resume()
functions to conform to standard Linux kernel coding conventions.

Assisted-by: Antigravity:gemini-3.8-flash sparse
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 44 ++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 6291d7c2e06f..b11e30589074 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1274,7 +1274,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	struct spi_controller *controller;
 	struct driver_data *drv_data;
 	const struct lpss_config *config;
-	int status;
+	int ret;
 	u32 tmp;
 
 	if (platform_info->is_target)
@@ -1330,15 +1330,15 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 						| SSSR_ROR | SSSR_TUR;
 	}
 
-	status = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
+	ret = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
 			drv_data);
-	if (status < 0)
-		return dev_err_probe(dev, status, "cannot get IRQ %d\n", ssp->irq);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get IRQ %d\n", ssp->irq);
 
 	/* Setup DMA if requested */
 	if (platform_info->enable_dma) {
-		status = pxa2xx_spi_dma_setup(drv_data);
-		if (status) {
+		ret = pxa2xx_spi_dma_setup(drv_data);
+		if (ret) {
 			dev_warn(dev, "no DMA channels available, using PIO\n");
 			platform_info->enable_dma = false;
 		} else {
@@ -1352,8 +1352,8 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	}
 
 	/* Enable SOC clock */
-	status = clk_prepare_enable(ssp->clk);
-	if (status)
+	ret = clk_prepare_enable(ssp->clk);
+	if (ret)
 		goto out_error_dma_irq_alloc;
 
 	controller->max_speed_hz = clk_get_rate(ssp->clk);
@@ -1433,20 +1433,20 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 		drv_data->gpiod_ready = devm_gpiod_get_optional(dev,
 						"ready", GPIOD_OUT_LOW);
 		if (IS_ERR(drv_data->gpiod_ready)) {
-			status = PTR_ERR(drv_data->gpiod_ready);
+			ret = PTR_ERR(drv_data->gpiod_ready);
 			goto out_error_clock_enabled;
 		}
 	}
 
 	/* Register with the SPI framework */
 	dev_set_drvdata(dev, drv_data);
-	status = spi_register_controller(controller);
-	if (status) {
-		dev_err_probe(dev, status, "problem registering SPI controller\n");
+	ret = spi_register_controller(controller);
+	if (ret) {
+		dev_err_probe(dev, ret, "problem registering SPI controller\n");
 		goto out_error_clock_enabled;
 	}
 
-	return status;
+	return ret;
 
 out_error_clock_enabled:
 	clk_disable_unprepare(ssp->clk);
@@ -1455,7 +1455,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	pxa2xx_spi_dma_release(drv_data);
 	free_irq(ssp->irq, drv_data);
 
-	return status;
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_probe, "SPI_PXA2xx");
 
@@ -1483,11 +1483,11 @@ static int pxa2xx_spi_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 	struct ssp_device *ssp = drv_data->ssp;
-	int status;
+	int ret;
 
-	status = spi_controller_suspend(drv_data->controller);
-	if (status)
-		return status;
+	ret = spi_controller_suspend(drv_data->controller);
+	if (ret)
+		return ret;
 
 	pxa_ssp_disable(ssp);
 
@@ -1501,13 +1501,13 @@ static int pxa2xx_spi_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 	struct ssp_device *ssp = drv_data->ssp;
-	int status;
+	int ret;
 
 	/* Enable the SSP clock */
 	if (!pm_runtime_suspended(dev)) {
-		status = clk_prepare_enable(ssp->clk);
-		if (status)
-			return status;
+		ret = clk_prepare_enable(ssp->clk);
+		if (ret)
+			return ret;
 	}
 
 	/* Start the queue running */
-- 
2.39.5


