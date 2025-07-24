Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16292C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULGBrePaPl30E6kseruVigv7W/l7y1ICMo7iJ/DjQ0A=; b=qHHej3z79A2wIVMRGVqq/4hBpq
	m2IHuUucuFhJdeCV9jbiEqsLLtOzeKIGe1odqToWgsQaFXIjvqT9CYnuiq9p72CxQcI732ZNOCvHu
	HOq4dcMAG9EMVVhr+5EGMPRN9tdYoDfYqg7tkrqUOovMGqaKPdoXbLKnkTxKfhG0ffcO9VXXVtekS
	POLQ2f9WWAfJ8z5GYh9S8c10CTbb6JKWCIMJj/Z8p9k6AuzwJlu2HYUuCNpO9jMkgpC2pHky1Gzbh
	JAtd/ySuwV3A/e++608zEYVRFnpNj22IJjuFA5gn0wEogLKa2FI/FPEHMOCQJhD4I4/So7GDS10BB
	GE7mrHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejoE-00000006F6a-34iD;
	Thu, 24 Jul 2025 00:27:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZh-00000006DKj-1XWK;
	Thu, 24 Jul 2025 00:12:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-236470b2dceso3132105ad.0;
        Wed, 23 Jul 2025 17:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315960; x=1753920760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULGBrePaPl30E6kseruVigv7W/l7y1ICMo7iJ/DjQ0A=;
        b=TeAc50NeU20By2qiLsbCiCCdJbe7WvUs6/TZvmo5Sy3y2w2cwqcAJh3nr6dTSiHXwc
         d8V/oVbSoY5L/PdKp31bRek1Q+jcPEN9aulF4DrZLy9YsoHbuWr/B6dLrPsakaBWUoo2
         lOEapfDfvKCIdtE2fWMuZLiFqiCINEi8MBFf4Hqv+eJKZPQh/oRk+yrcdF60J6K8y10z
         GbmgfDAaNP1U1MGkeQwseqL1tw4P47eKVEnlZPM4LL2vRRG1XsweiQYp0A4bdT9xjXni
         5FBjrX6r7QusAa5frqECj6ud6NIrkysW/WO+iv362Mf4eZ6YggN5z4MKCIE/hraL0fqa
         hy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315960; x=1753920760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULGBrePaPl30E6kseruVigv7W/l7y1ICMo7iJ/DjQ0A=;
        b=wBZc7flj34RrtNwbarMcuEnYzxt4IxeYxDTqq9yjy182HfF7fIpv4Lr7N0oOjG7+vO
         7980rtVqHyEKqRM7nW3zU9rJ2YjhoWzbvfkFT4uZNhXRYbEYq/k2KH9qdWcFU0S2xDyZ
         Mlbp2JDBPClgWUAUK3kwKTnR8x03/F1kuVHFllWZ6nvdy3GzQTwKYK+Yeuo46wkvKUec
         1eByz2EIunEdGVn1fIHjpqHZMbRD7hCwdt4s9JLxsqoR5Ns5lfuSy7eAYE257LQbhITN
         lwchSWYx3UKyIos3RXgUbug/y1DLWW13HXbauN/VBYQALAwGdsj5ZYKMQqT3kdIGLLPo
         VTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQDtQsVSJm2CXl5bmbU+1qppZZ+LfuufVzNFsoZCNTsSSm9QUYlgVFQxVT60bCeM0fBpvQTY/qiSVrUpSHGLFl@lists.infradead.org, AJvYcCX6m1TxnV6IsFOlQOzns48SWD0Ren7m+AME9JkJmh5epNO+cLi/rb5E8SO9eR3S3aX3uEYNaFVF0MFyUn7Ap2M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2JqUGg6wfTzdh9/RrumR2Pa6ODVCNY7hSC5KR+OeNF3ArFm7z
	AhrSLxZ0SL6eB4H+3t5GAR+BPXCmp0+VQYtLe39y9QXM/s0QzOMiFSUl
X-Gm-Gg: ASbGncuy4GMZ7pLp2XbRZ0vDT9sSDRmrVqQH7/5LyPx/+6erOMJ7IbiQ2LvYkIzy2cp
	G8Yl8LjB3sgcIExac0JWix0GGjyLFr5BBuan30L4VC+5E3cv8hH5kjz4tqa2F3fKYS+yyWFp3gA
	10zykuaCVIR19SReKtIUzUnETZjKZHTUNVLEA3zcauURKjpL9CNkURTQZ3hi7Doew/430Z1QRsx
	m/X4s52kFNf/XTIOqjB4Fc10iTLzAuwvDz3E6Q42ml9pu29jHvpVqH7uopA/9ix57tuDTrcpAHy
	ZW8Tckc7FPdXoDXP8h6TKMpGxG1ub4mPtJ6miiPugAUezncNgpkXHwt8JNYp3+OEPcG7DAVTZ6G
	0zlw=
X-Google-Smtp-Source: AGHT+IFNdYHqf63rqLYnG9pPv8FZ2a0dGD38GcTIoO9oYFC6DKFllYIrp1P+dYQvcTyrdApqnPUX7w==
X-Received: by 2002:a17:903:18a:b0:235:efbb:9539 with SMTP id d9443c01a7336-23f9814e312mr71621445ad.17.1753315960517;
        Wed, 23 Jul 2025 17:12:40 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv6 wireless-next 5/7] wifi: rt2x00: soc: modernize probe
Date: Wed, 23 Jul 2025 17:12:30 -0700
Message-ID: <20250724001232.2275-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724001232.2275-1-rosenp@gmail.com>
References: <20250724001232.2275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171241_407422_0E5F6BF1 
X-CRM114-Status: GOOD (  19.84  )
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

Remove a bunch of static memory management functions and simplify with
devm.

Also move allocation before ieee80211_alloc_hw to get rid of goto
statements and clarify the error handling a bit more.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 187 ++++++++----------
 1 file changed, 82 insertions(+), 105 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 4d06f49ec6d2..8f510a84e7f1 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #include "rt2x00.h"
@@ -130,108 +131,8 @@ static int rt2800soc_write_firmware(struct rt2x00_dev *rt2x00dev,
 	return 0;
 }
 
-static void rt2x00soc_free_reg(struct rt2x00_dev *rt2x00dev)
-{
-	kfree(rt2x00dev->rf);
-	rt2x00dev->rf = NULL;
-
-	kfree(rt2x00dev->eeprom);
-	rt2x00dev->eeprom = NULL;
-
-	iounmap(rt2x00dev->csr.base);
-}
-
-static int rt2x00soc_alloc_reg(struct rt2x00_dev *rt2x00dev)
-{
-	struct platform_device *pdev = to_platform_device(rt2x00dev->dev);
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	rt2x00dev->csr.base = ioremap(res->start, resource_size(res));
-	if (!rt2x00dev->csr.base)
-		return -ENOMEM;
-
-	rt2x00dev->eeprom = kzalloc(rt2x00dev->ops->eeprom_size, GFP_KERNEL);
-	if (!rt2x00dev->eeprom)
-		goto exit;
-
-	rt2x00dev->rf = kzalloc(rt2x00dev->ops->rf_size, GFP_KERNEL);
-	if (!rt2x00dev->rf)
-		goto exit;
-
-	return 0;
-
-exit:
-	rt2x00_probe_err("Failed to allocate registers\n");
-	rt2x00soc_free_reg(rt2x00dev);
-
-	return -ENOMEM;
-}
-
-static int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
-{
-	struct ieee80211_hw *hw;
-	struct rt2x00_dev *rt2x00dev;
-	int retval;
-
-	hw = ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
-	if (!hw) {
-		rt2x00_probe_err("Failed to allocate hardware\n");
-		return -ENOMEM;
-	}
-
-	platform_set_drvdata(pdev, hw);
-
-	rt2x00dev = hw->priv;
-	rt2x00dev->dev = &pdev->dev;
-	rt2x00dev->ops = ops;
-	rt2x00dev->hw = hw;
-	rt2x00dev->irq = platform_get_irq(pdev, 0);
-	rt2x00dev->name = pdev->dev.driver->name;
-
-	rt2x00dev->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(rt2x00dev->clk))
-		rt2x00dev->clk = NULL;
-
-	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
-
-	retval = rt2x00soc_alloc_reg(rt2x00dev);
-	if (retval)
-		goto exit_free_device;
-
-	retval = rt2x00lib_probe_dev(rt2x00dev);
-	if (retval)
-		goto exit_free_reg;
-
-	return 0;
-
-exit_free_reg:
-	rt2x00soc_free_reg(rt2x00dev);
-
-exit_free_device:
-	ieee80211_free_hw(hw);
-
-	return retval;
-}
-
-static void rt2x00soc_remove(struct platform_device *pdev)
-{
-	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
-	struct rt2x00_dev *rt2x00dev = hw->priv;
-
-	/*
-	 * Free all allocated data.
-	 */
-	rt2x00lib_remove_dev(rt2x00dev);
-	rt2x00soc_free_reg(rt2x00dev);
-	ieee80211_free_hw(hw);
-}
-
 #ifdef CONFIG_PM
-static int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
+static int rt2800soc_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
 	struct rt2x00_dev *rt2x00dev = hw->priv;
@@ -239,7 +140,7 @@ static int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
 	return rt2x00lib_suspend(rt2x00dev);
 }
 
-static int rt2x00soc_resume(struct platform_device *pdev)
+static int rt2800soc_resume(struct platform_device *pdev)
 {
 	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
 	struct rt2x00_dev *rt2x00dev = hw->priv;
@@ -355,11 +256,85 @@ static const struct rt2x00_ops rt2800soc_ops = {
 #endif /* CONFIG_RT2X00_LIB_DEBUGFS */
 };
 
+static int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
+{
+	struct rt2x00_dev *rt2x00dev;
+	struct ieee80211_hw *hw;
+	void __iomem *mem;
+	struct clk *clk;
+	__le16 *eeprom;
+	int retval;
+	u32 *rf;
+	int irq;
+
+	mem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	eeprom = devm_kzalloc(&pdev->dev, ops->eeprom_size, GFP_KERNEL);
+	if (!eeprom)
+		return -ENOMEM;
+
+	rf = devm_kzalloc(&pdev->dev, ops->rf_size, GFP_KERNEL);
+	if (!rf)
+		return -ENOMEM;
+
+	hw = ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
+	if (!hw)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate hardware");
+
+	platform_set_drvdata(pdev, hw);
+
+	rt2x00dev = hw->priv;
+	rt2x00dev->dev = &pdev->dev;
+	rt2x00dev->ops = ops;
+	rt2x00dev->hw = hw;
+	rt2x00dev->irq = irq;
+	rt2x00dev->clk = clk;
+	rt2x00dev->eeprom = eeprom;
+	rt2x00dev->rf = rf;
+	rt2x00dev->name = pdev->dev.driver->name;
+	rt2x00dev->csr.base = mem;
+
+	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
+
+	retval = rt2x00lib_probe_dev(rt2x00dev);
+	if (retval)
+		goto exit_free_device;
+
+	return 0;
+
+exit_free_device:
+	ieee80211_free_hw(hw);
+
+	return retval;
+}
+
 static int rt2800soc_probe(struct platform_device *pdev)
 {
 	return rt2x00soc_probe(pdev, &rt2800soc_ops);
 }
 
+static void rt2800soc_remove(struct platform_device *pdev)
+{
+	struct ieee80211_hw *hw = platform_get_drvdata(pdev);
+	struct rt2x00_dev *rt2x00dev = hw->priv;
+
+	/*
+	 * Free all allocated data.
+	 */
+	rt2x00lib_remove_dev(rt2x00dev);
+	ieee80211_free_hw(hw);
+}
+
 static const struct of_device_id rt2880_wmac_match[] = {
 	{ .compatible = "ralink,rt2880-wifi" },
 	{},
@@ -372,9 +347,11 @@ static struct platform_driver rt2800soc_driver = {
 		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
-	.remove		= rt2x00soc_remove,
-	.suspend	= rt2x00soc_suspend,
-	.resume		= rt2x00soc_resume,
+	.remove		= rt2800soc_remove,
+#ifdef CONFIG_PM
+	.suspend	= rt2800soc_suspend,
+	.resume		= rt2800soc_resume,
+#endif
 };
 
 module_platform_driver(rt2800soc_driver);
-- 
2.50.1


