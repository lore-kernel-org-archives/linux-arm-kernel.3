Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4CFD73E9E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMhHnznqFwxBrzvbF8HDmOnguOyKKs8bDV7TVDVnURU=; b=aBkqPFwBZsweCFr0auyy8e5WEC
	sZE10Lv/FVCJZMT12INrz1SDQD0tSGNe6w/QewoGpJyU62LQR11tZq0rzG2nuBbRNyPhugZkZEvEM
	DTtFWFQkC3eCNCx/QzevewzzmDYXl6FJRtORDVtafOCtbZUr/+ZN4QKvTtbPCZoMY+IPYqkdvBfev
	LOmc7uBqTp29J7Sx+ZVKxDVjgOwZuGyV8ibNt1bjy1XfEeYVeScXIdczF1sI2pEE+LLBKlR3Nn28l
	uZzDXo5yF0PHSC5U5zqj46n21PEp5OCH0ZUDyJswb2ITK/FVPu7rtgsOUc6GaXbS+4Hfl7CbHPxbr
	pANyJp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnf-00000000gwF-2fBD;
	Thu, 29 Jan 2026 21:43:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnU-00000000grX-24F1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:43:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 240C6444D5;
	Thu, 29 Jan 2026 21:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F11E0C2BC9E;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769723006;
	bh=aK3PD+1V9CbJdF7r5/K5yWNnPE96LBlgQvwpAazD83g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FgWO2Nb/7yL+sNMUC/+zaK555uGGDiIXiXXyLwFDlTgYah6ArbhC2btUxhx2Mw9zo
	 TFy06UyFRe1TFL5mlTbdfMvrxRvqYOONZ1AU+JMpKRerhpslrfn5qDqfCkXSOfDPyw
	 RCSj37EYGDFTZyY9Z9pjyi0uJgYtuxF2VnOB9lFWAROsVrW9TNmLuzs0AJyq+5J4iI
	 65uijRwh+1sD3kEUZWuxhiwnlTEqMvCBSBBLtz8DVt5FSt5kEtnruAnCgWFzDMtQI0
	 uwHhdA4U3v3kVRqE4/w/Ls8+DERExDRkWQByDDGja7J7AL6IwMUY7FmZhsP+j6P3SU
	 qMSPIJdWMEiMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8171D73E9C;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Thu, 29 Jan 2026 21:43:17 +0000
Subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-i2c-xiic-v7-5-727e434897ef@nexthop.ai>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
In-Reply-To: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769723005; l=3586;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=Iwa891qmu5bsxzfQcaF7qqAdE4otD0QTMnDYJyhw7aQ=;
 b=3Vlmq/TnuvEJ0CllMYPLJX/3z5XypTON5mdYlh3tHWNKv5KI8g1BICU40VYBJGy3jCNbNIOzW
 Zcy6RKpUi7FBjU8BzX7Bsee/2XeGA9E9uFXzlp4P8Ux0lmXiDyx/BVp
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_134328_601878_B8EB4C34 
X-CRM114-Status: GOOD (  13.37  )
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

Re-use dev pointer instead of referencing &pdev->dev everywhere.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3578c00d6404..37a15065db60 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1429,7 +1429,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	u8 i;
 	u32 sr;
 
-	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
@@ -1445,13 +1445,13 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	pdata = dev_get_platdata(&pdev->dev);
+	pdata = dev_get_platdata(dev);
 
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
 	i2c->adap = xiic_adapter;
 	i2c_set_adapdata(&i2c->adap, i2c);
-	i2c->adap.dev.parent = &pdev->dev;
+	i2c->adap.dev.parent = dev;
 	device_set_node(&i2c->adap.dev, dev_fwnode(dev));
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
@@ -1465,13 +1465,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (is_of_node(dev->fwnode)) {
 		i2c->clk = devm_clk_get_enabled(dev, NULL);
 		if (IS_ERR(i2c->clk))
-			return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+			return dev_err_probe(dev, PTR_ERR(i2c->clk),
 					"failed to enable input clock.\n");
 	}
 
-	i2c->dev = &pdev->dev;
-	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
-	pm_runtime_use_autosuspend(i2c->dev);
+	i2c->dev = dev;
+
+	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return ret;
@@ -1483,9 +1484,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					xiic_process, IRQF_ONESHOT,
-					pdev->name, i2c);
+	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
+					IRQF_ONESHOT, pdev->name, i2c);
 	if (ret)
 		return ret;
 
@@ -1520,7 +1520,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
-	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
+	dev_dbg(dev, "mmio %08lx irq %d scl clock frequency %d\n",
 		(unsigned long)res->start, irq, i2c->i2c_clk);
 
 	return ret;
@@ -1528,22 +1528,22 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 static void xiic_i2c_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
 	int ret;
 
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	ret = pm_runtime_get_sync(i2c->dev);
-
-	if (ret < 0)
-		dev_warn(&pdev->dev, "Failed to activate device for removal (%pe)\n",
+	ret = pm_runtime_get_sync(dev);
+	if (ret)
+		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
 			 ERR_PTR(ret));
 	else
 		xiic_deinit(i2c);
 
-	pm_runtime_put_sync(i2c->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_put_sync(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

-- 
2.52.0



