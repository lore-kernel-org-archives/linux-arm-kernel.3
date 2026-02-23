Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1398EEA4FD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wYOfmXsQT9mA9KmWikbrAJCxeHHu9aPewq4lgggerg=; b=IRxAknzQS1CXTLpeFRmQEV9C90
	wCnHsGRDrEpW/S0E92c52GPHtbDkR+R4Y1zlp/iz9lVCX95+pkw/aHZ8Jk8SYYtpVQsUzPGmMJW5Y
	aYUlNAwukcxeKKbNms7GnTGrIj+7yO0Bp1WpJV2vQeFalDG0SZ3MpGswhOAQ4ZOg7TANvib4q/UWN
	GW7u1NEnC30IovabSU/eukh1CeJ24/+XtF/hZL8RXui9UMeE4aLVxwisbgs6PzfeswQFWbuneZ1AG
	ldouunEaomvt5TK1HmW7nqkfYn25vWAfpOd9BQvA5caWpHwF7kltWI7mLXtBB29aWIaUTwByRwpkw
	xxuLJrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLM-00000000cMl-0TWk;
	Mon, 23 Feb 2026 15:59:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLJ-00000000cKJ-3g1F
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 15:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=8wYOfmXsQT9mA9KmWikbrAJCxeHHu9aPewq4lgggerg=; b=YGdF7zmUw0HH0tQEOX/qjyEPaZ
	NofTZmK76L4S5zE1np+jLfIw+De+UeFZRB9ovM6oBaDqyzcWq2WOnNGT8G3Dw7LtvIqlCFxttbRAR
	xLhSR/hUPrOna7bBP3RtDC8NBjGa+64nsXMsIEytwCmQYNV9VMHajVcMVaMwwzl9flrhj8Nj1d7Lh
	OcVUp6h09GNZpXAV3iYZqP8Upvpq1AMLUBGijqQ1LDhF/GJGX0B10SdkVhaabNBjVL0lex/f2k/+Y
	zKVa5qYEP1HuU/JfYHn1ONhOul0Bf14j+y++fUuw2KZAdTXWAyyoNj/gHdHiqP2WxdR50K9uJkywK
	OwNqqIQA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLF-00000005PNM-0SBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 013B944556;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D37ACC2BC9E;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862359;
	bh=sNUMCjC/edNNrfJ9N5Yw2HyQVYhOfmsHMGbbuNPu+Fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AkRhInjH51fBhdjZ4XUT2MLA52L+TswWhdbw2ERy+PBbnlNt5YwchNJTBhZtMXpUj
	 6bsopWxi+Cm/vuXQtLu4abNRlOGbICevwnw/cdBbasppfXtl+NDDeod1vlismRmKuN
	 YcyN6PaoOTqkc60dlVc5FkJrhujHh4gphUaNrVRdcqINpQNB2Je3PPM3ZZoQ+6jCi3
	 fDsWfCldRJfPd3onmknV74OZ3PVDQL/ysBAc6sZRmoS/pGgDoAGnMQhjZVRPYS0kkK
	 2x/4kMI0xMALadzjyHXkK3wOXa8+Ms61rdqj0u+KwPmT3Wp8jd9LayFXPtFAS7NiVq
	 2soGsDXV237Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA973EF5865;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 23 Feb 2026 15:59:18 +0000
Subject: [PATCH v12 3/7] i2c: xiic: switch to generic device property
 accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-xiic-v12-3-b6c9ce4e4f3c@nexthop.ai>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771862359; l=3070;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=9F2oFcqzvLc5raKmRaUuz3YdJei2/cMdcAQn1OeCoq0=;
 b=/W0xDE+k/+F40SNAzgQNuMFD1cDoIW54jyie115F+/LqMWFUqscX1wiXpxpOkxojbnd9YwsX9
 1zoz4nlL3iGD3XtdynudSm3RVXng6/lQris26KDh1p9ToMNAgYbNzDf
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_155925_667860_C8FCB2D8 
X-CRM114-Status: GOOD (  13.73  )
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

Use generic device property accessors making them work for ACPI
platforms.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 99286af2a0d7..c7f641e291a2 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -27,7 +27,6 @@
 #include <linux/platform_data/i2c-xiic.h>
 #include <linux/io.h>
 #include <linux/slab.h>
-#include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/iopoll.h>
@@ -1408,7 +1407,6 @@ static const struct i2c_adapter xiic_adapter = {
 	.algo = &xiic_algorithm,
 };
 
-#if defined(CONFIG_OF)
 static const struct xiic_version_data xiic_2_00 = {
 	.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
 };
@@ -1419,14 +1417,14 @@ static const struct of_device_id xiic_of_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-#endif
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
-	const struct of_device_id *match;
+	const struct xiic_version_data *data;
 	struct resource *res;
 	int ret, irq;
 	u8 i;
@@ -1436,12 +1434,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	match = of_match_node(xiic_of_match, pdev->dev.of_node);
-	if (match && match->data) {
-		const struct xiic_version_data *data = match->data;
-
+	data = device_get_match_data(dev);
+	if (data)
 		i2c->quirks = data->quirks;
-	}
 
 	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c->base))
@@ -1458,7 +1453,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c->adap = xiic_adapter;
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent = &pdev->dev;
-	i2c->adap.dev.of_node = pdev->dev.of_node;
+	device_set_node(&i2c->adap.dev, fwnode);
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
@@ -1482,8 +1477,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
-	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
-				   &i2c->i2c_clk);
+	ret = device_property_read_u32(dev, "clock-frequency", &i2c->i2c_clk);
 	/* If clock-frequency not specified in DT, do not configure in SW */
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
@@ -1494,8 +1488,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	i2c->singlemaster =
-		of_property_read_bool(pdev->dev.of_node, "single-master");
+	i2c->singlemaster = device_property_read_bool(dev, "single-master");
 
 	/*
 	 * Detect endianness

-- 
2.52.0



