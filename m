Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89376EEA853
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 00:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCxrXLqPIHOR917s+hZ+LxjiKySTWl0KpvB6DCQTllk=; b=nYggCNPc6sv3dx99zLpq726lgV
	jMZ517vG3W5ySrLu89eqLYxXcsbktNrnIKosqk3A5gPfaGIMdQqchpGP4rhRjdIN64qU9WalI2dgt
	Fie84OdPbnr2/W2VObALT1UuMu7v8mttzLtZjNTzUZtseInScvwfsgWOhaZ/C/ogW4GRq2zifcAZo
	whWQQCbaJBdi8SmXjld8tpDqrFCFcRNVjlyyboaZU2msK8Lmx5PMHYXHQ2RIVhm0StB1OnlmZsSmS
	S0xj1Bx0Ba6IjHG6TPm4Pdr1MMrXjigvNsEuq9CSU1/kKJe3Hqn4Lf6zTYx8fizGdWcTzAznBDBiz
	3uRDWn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqI-00000002lcP-3Xta;
	Fri, 13 Feb 2026 00:15:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqB-00000002lXH-3P4s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 00:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE17E443FC;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3D0FC2BCB3;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941722;
	bh=0cagQQWs1EQdChAxlxHuUUZ51gQ+OoWY5PxjVHvtV3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dBJgHY44dTIuOY9xXALHU9Y/QCqRKAHspXUjwHRr34EaF0+tLS9UWE8A9PreFAjpO
	 i6BL4QzyR407nVAQvGJ/cuaNur5mEI/Vfg3x18glhy66hsmNmTHPfgkdatH8R1UkFd
	 R2W7GTTkbzhrAC4ki0qFWNcRIu+xktyeSuxDWVfGw1QTgesnYgSFkxrY0J0eGkB5Se
	 qqLdoDEz+A1gSfei/kDLBT1BiEJzOcwGlbVMrdA6meoB6xww1v8BAVYTD9xDTfbUp0
	 /cuHwEu+EaDsqes3AOgKlSt0zf/QjAAnq7z//oWAzoewC44ZTOQNDNGvJFAjmRaMnC
	 2aOQGCwqkVDYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4A6EEA872;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 13 Feb 2026 00:15:19 +0000
Subject: [PATCH v11 4/7] i2c: xiic: cosmetic cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-xiic-v11-4-5d18aea11bde@nexthop.ai>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
In-Reply-To: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770941721; l=2969;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=4goe1hN23ExSd3bXmlNyi4c8jVT0rjfLxvQAv2IuPoE=;
 b=UG0j3nVRP5W7SvnQm4//0ani0A3FVvsGWRY67oVUvfCso0Nr4yMGnTlpamwnzNcgayMcWb+rV
 6iFLUqzfA9tDd5RRgCfjO4tJxV4JbKRkZ2+2ER1kRMIdW8v0y/iOHjG
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161523_902884_EB6BC6EC 
X-CRM114-Status: GOOD (  12.20  )
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
 drivers/i2c/busses/i2c-xiic.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 20cee7b6200c..377fa5948c3f 100644
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
@@ -1467,9 +1467,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");
 
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
@@ -1481,9 +1482,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					xiic_process, IRQF_ONESHOT,
-					pdev->name, i2c);
+	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
+					IRQF_ONESHOT, pdev->name, i2c);
 	if (ret)
 		return ret;
 
@@ -1526,21 +1526,21 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 static void xiic_i2c_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
 	int ret;
 
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	ret = pm_runtime_get_sync(i2c->dev);
-
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
-		dev_warn(&pdev->dev, "Failed to activate device for removal (%pe)\n",
+		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
 			 ERR_PTR(ret));
 	else
 		xiic_deinit(i2c);
 
-	pm_runtime_put_sync(i2c->dev);
+	pm_runtime_put_sync(dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

-- 
2.52.0



