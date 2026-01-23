Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB20D77880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8jhuIoL70KlF87IpDGuqNPloU2BWDUD9zyI3a1FXKg=; b=4EOo/VdbZTh7yf+4XmB65zvJfs
	HsZlglGdHr6Ozc4xB2oXAcH9KanWVUPo05vzhMR3NC7DD0PJnzbekOcCeMjnryBeiHLwGQM0b/eoZ
	9p7dYgYxSoSSTtqqrk5yTDzFIGdSQSnq4vEL7nPp5HaIZ8ieOBLOcWs47KAOs6UYgg+pfx90i0SS1
	lstc9MmYYIzsXV2BcJhQk0le3oWU05ql9LzA2GX2kZflo0n/Hgf7YJLnRYAE4MD0bzG+uEB9zBxUx
	DB45DKDGQAI59EwhapYQf2RGTgdTpFdMFcNhE0nflcdY9h3TEywQrRtYUwxPQOym+qiRU8/jvppx3
	UznxfcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK71-00000009CsZ-1sXH;
	Fri, 23 Jan 2026 16:34:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK70-00000009Crc-0jYD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 315AD6012B;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5EACC19422;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186056;
	bh=mA693d2B+lCutFgSWj64GcSrZarkiCgLGJixz53RjCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t2enw8dHZyxTEK2l+4YEqkG81wTj2Bngqv2Hec++sETMkzrZ5omooaOb/1kyn+HGI
	 URrZ3u8C5Qg4ljQMFv2UaOnIUul4SUoUZ66HH++MIDsj8rj2UuEFfSHKe323lZUSCp
	 Z0GHoJopD4Wqt2kqmypjqa0W0FziEODzp9HZW+lSid781834KYHE0M3MA/fmCGhDzQ
	 qhDAkESyZZ/gqL/jIp35PWLTZ472diwBClrPL3CbGDwVmF32kDx9A1xpbziiv80vLD
	 ECK1UZZH0HHS7eQzy4krsqfgy3aTAQ3KESkC+9fP3DMi4hwAkjybJInLuzIAbkG2bO
	 0FyZKyPWr2z9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63BED74EFF;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 23 Jan 2026 16:34:14 +0000
Subject: [PATCH v4 1/5] i2c: xiic: minor cosmetic cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-i2c-xiic-v4-1-4a3eba3510ce@nexthop.ai>
References: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
In-Reply-To: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186056; l=5157;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=0QQ3AZ9kvIaYMsjGFuaC+WxbuuTcDJrOZdiaoj9V0Us=;
 b=Zf7buBeB54Kay6AbbJHNDAjugWSFk0yHlrcN4HOY2Hq5Wi2h+6lrkFZzLQA+6j8jrNNdJCUg7
 cQ1pQvOONErDAKhgYM8Xj9qQDKILPCCwW1tG/eoiQcQp3MEtSyc4WvO
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Add a temporary dev variable and reuse it instead of referencing pdev->dev
everywhere.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..12321654055f 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1423,6 +1423,7 @@ MODULE_DEVICE_TABLE(of, xiic_of_match);
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
 	const struct of_device_id *match;
@@ -1431,11 +1432,11 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	u8 i;
 	u32 sr;
 
-	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
-	match = of_match_node(xiic_of_match, pdev->dev.of_node);
+	match = of_match_node(xiic_of_match, dev->of_node);
 	if (match && match->data) {
 		const struct xiic_version_data *data = match->data;
 
@@ -1450,50 +1451,49 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	pdata = dev_get_platdata(&pdev->dev);
+	pdata = dev_get_platdata(dev);
 
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
 	i2c->adap = xiic_adapter;
 	i2c_set_adapdata(&i2c->adap, i2c);
-	i2c->adap.dev.parent = &pdev->dev;
-	i2c->adap.dev.of_node = pdev->dev.of_node;
+	i2c->adap.dev.parent = dev;
+	i2c->adap.dev.of_node = dev->of_node;
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(i2c->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+		return dev_err_probe(dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");
 
-	i2c->dev = &pdev->dev;
-	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
-	pm_runtime_use_autosuspend(i2c->dev);
-	pm_runtime_set_active(i2c->dev);
-	pm_runtime_enable(i2c->dev);
+	i2c->dev = dev;
+	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
-	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
+	ret = of_property_read_u32(dev->of_node, "clock-frequency",
 				   &i2c->i2c_clk);
 	/* If clock-frequency not specified in DT, do not configure in SW */
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					xiic_process, IRQF_ONESHOT,
-					pdev->name, i2c);
+	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
+					IRQF_ONESHOT, pdev->name, i2c);
 
 	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
+		dev_err_probe(dev, ret, "Cannot claim IRQ\n");
 		goto err_pm_disable;
 	}
 
 	i2c->singlemaster =
-		of_property_read_bool(pdev->dev.of_node, "single-master");
+		of_property_read_bool(dev->of_node, "single-master");
 
 	/*
 	 * Detect endianness
@@ -1509,7 +1509,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	ret = xiic_reinit(i2c);
 	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
+		dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
 		goto err_pm_disable;
 	}
 
@@ -1526,38 +1526,39 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
-	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
+	dev_dbg(dev, "mmio %08lx irq %d scl clock frequency %d\n",
 		(unsigned long)res->start, irq, i2c->i2c_clk);
 
 	return 0;
 
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
 
 	return ret;
 }
 
 static void xiic_i2c_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
 	int ret;
 
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	ret = pm_runtime_get_sync(i2c->dev);
+	ret = pm_runtime_get_sync(dev);
 
 	if (ret < 0)
-		dev_warn(&pdev->dev, "Failed to activate device for removal (%pe)\n",
+		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
 			 ERR_PTR(ret));
 	else
 		xiic_deinit(i2c);
 
-	pm_runtime_put_sync(i2c->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

-- 
2.52.0



