Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57981C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 21:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWkIKGkA990tICWBb/AzCkdqkS98YDkqouTWupGfwu8=; b=rxSohUpoZIO+OPKEmi8DDm0E3+
	6DPjvXFn5CMus4dSlYewUdNSK1T8F+JVE5HLroIJNghiyxRW/SihZF+gRq3NA5NdQJpj5YJ55fDQx
	Yfvarpg/2rHjNehNjgL5zkAv3OlIDA8Pha+H6+Gqf2j+DQz/aNWQQ71YYZiu5l9GnnvkMpero6CPn
	8q0FCTVIndmKNDaj5oI0/BVzwjnH3TLnjdv6zGs9iVCVqNmHlU5VeUX+lwbKw2wVYwTPrgJ92iwj0
	1Retl1Jso7L50rRMzQoqoJCFVbPsgBAo4chRibbWoZtHM1aoifQ7Q+GnMArNYd3NqLyxw0vT+/uaD
	CJt9tiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXIK-00000000rqO-3BVt;
	Sun, 06 Jul 2025 21:53:08 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX6t-00000000qmw-1roB;
	Sun, 06 Jul 2025 21:41:20 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1862119b3a.1;
        Sun, 06 Jul 2025 14:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751838079; x=1752442879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWkIKGkA990tICWBb/AzCkdqkS98YDkqouTWupGfwu8=;
        b=Oc3COxf1F9BRsSMb8GjHwZdSw7L6O9uOcQwRkHyEryurOHaX07+mE9F7xLjNKjdSvg
         VD2UunouED5/bCMtBaCth1RdZXjS0v97UIn7Jvtib3iFJaMXZvfYD+BFQC6r2VSOsAWb
         f+HCLCbqomgkbuGOepoluLOsbq/dpCGbgPrzuGLuRyNOgIZ92jL5no29CTFVomB9vGrI
         b09zlpj0QKYLCqO3sZntSK6Oe00D8gFvxntJ+XSgb06/94JYiK+mqhQImUa+mfm9uv9d
         i//X7oidFW42x8ohgDlg8na8gwa9M+ASydcAvbOz5nFiRV0HqQjC5QOwtFeBrsLCsKcL
         Rakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838079; x=1752442879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWkIKGkA990tICWBb/AzCkdqkS98YDkqouTWupGfwu8=;
        b=ogK3w/bO6wtMSndSz6AiPA/56swZZZuaGTJ4xmnkGm75IqLOuYe4fI/BC2378QQW90
         nYTBb696l8UW7+vcM4cgV+3zIgD5Ixr+Qujjram5lgiN7iFfDGmq3gNGxPrXG8mNEdsX
         y61E5C55I94RHNmPG0ScmdlF/uf9ZyKSo+v6+NgspV3R8qHCaY9y+tNquBpB/69kSnD6
         t4h3L99up7T7fvFn5Ma1jQRz2udvo9+EKxda/+R5HHwGUKb0nEOJbvH0BqMkNyKFzaB5
         Q4s/OlvU35DfzHv6f/exuK54JLo1Xe8tJAnSF/98G7ax0UXcgIZsv8WbrHNIhOouttkp
         nRQg==
X-Forwarded-Encrypted: i=1; AJvYcCV/QQdkbfvb7g3sSNP4eTZd5EYM/PtrNX0WVQsM+1KbN7YvCg3T5DV07BCseSssANbC4kpjxsKHzmg9GQlSEz6Z@lists.infradead.org, AJvYcCVQ+rfyhPwbcIG+Jizvv8+e8B23EtIzOKGflBbg6Kj35tOI4vXUMXi+HxMMzKaex8akTc8j441GTEJ5XraJ4lg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqsX5jdfJXP9D3JG64GK8lyHBTjm+GuLkzELGTtuEfvEUKolw2
	EBpuxPNkZjFK25WQ9lFHFrmCl6oQvjo0138DThca6dCS3MA+dBjgC81X
X-Gm-Gg: ASbGncuMz+pIydRNfbhtFSvbV5afwD1e4sy/lO5MslQ+CvlcuxT24EBSIM2RObgXZPP
	YLJ8SpPxS64QYlri43HyaxwIg53/QrE7JUro1I4m4TGx5DEm0+TgifG+nnjyqmtaEd2wSDKmULO
	RBjE5BSJfR4ryasp6xk7khPc+qmoPUFP7Db6IViTqrPy8xDvyHUcFtUsUSbInXoibnTgeluCQVu
	iXGoQT/S96mBJESk278+dbfGy6QwLFx1taNlksSKj+OlynhSiYFE+c9wo/txSUZh22jYpeckVxM
	mgrrIeixN8Qdu7+ncTSD1tSsNVyA4E7tXz53VSkcaL/FaMD+xBRC7Q==
X-Google-Smtp-Source: AGHT+IHHOmTsiBLo3z6UMMswYtFY9ObAPDGTYpD1AOLGuigpAPh9rfOATyQ8i/rlbaFuXtxZ+xyf4w==
X-Received: by 2002:a05:6a00:240d:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-74ce5de7884mr14558457b3a.0.1751838078711;
        Sun, 06 Jul 2025 14:41:18 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74cfad75020sm4126416b3a.109.2025.07.06.14.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 14:41:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	yangshiji66@qq.com,
	ansuelsmth@gmail.com,
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
Subject: [PATCH 4/6] wifi: rt2x00: soc: move and modernize probe
Date: Sun,  6 Jul 2025 14:41:09 -0700
Message-ID: <20250706214111.45687-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706214111.45687-1-rosenp@gmail.com>
References: <20250706214111.45687-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_144119_486017_AA4C50B1 
X-CRM114-Status: GOOD (  18.17  )
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

By moving functions from rt2x00soc to rt2800soc, the driver benefits
with potentially smaller compiled size. It also becomes much easier to
remove a bunch of manual memory management and use devm.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../net/wireless/ralink/rt2x00/rt2800soc.c    |  67 +++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 102 ------------------
 2 files changed, 65 insertions(+), 104 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index db8d01f0cdc3..e2c05ead9b25 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #include "rt2x00.h"
@@ -240,7 +241,69 @@ static const struct rt2x00_ops rt2800soc_ops = {
 
 static int rt2800soc_probe(struct platform_device *pdev)
 {
-	return rt2x00soc_probe(pdev, &rt2800soc_ops);
+	const struct rt2x00_ops *ops = of_device_get_match_data(&pdev->dev);
+	struct rt2x00_dev *rt2x00dev;
+	struct ieee80211_hw *hw;
+	int retval;
+
+	hw = ieee80211_alloc_hw(sizeof(struct rt2x00_dev), ops->hw);
+	if (!hw) {
+		rt2x00_probe_err("Failed to allocate hardware\n");
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, hw);
+
+	rt2x00dev = hw->priv;
+	rt2x00dev->dev = &pdev->dev;
+	rt2x00dev->ops = ops;
+	rt2x00dev->hw = hw;
+	rt2x00dev->irq = platform_get_irq(pdev, 0);
+	rt2x00dev->name = pdev->dev.driver->name;
+	rt2x00dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
+
+	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
+
+	rt2x00dev->csr.base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rt2x00dev->csr.base)) {
+		retval = PTR_ERR(rt2x00dev->csr.base);
+		goto exit_free_device;
+	}
+
+	rt2x00dev->eeprom = devm_kzalloc(&pdev->dev, rt2x00dev->ops->eeprom_size, GFP_KERNEL);
+	if (!rt2x00dev->eeprom) {
+		retval = -ENOMEM;
+		goto exit_free_device;
+	}
+
+	rt2x00dev->rf = devm_kzalloc(&pdev->dev, rt2x00dev->ops->rf_size, GFP_KERNEL);
+	if (!rt2x00dev->rf) {
+		retval = -ENOMEM;
+		goto exit_free_device;
+	}
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
 }
 
 static const struct of_device_id rt2880_wmac_match[] = {
@@ -255,7 +318,7 @@ static struct platform_driver rt2800soc_driver = {
 		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
-	.remove		= rt2x00soc_remove,
+	.remove		= rt2800soc_remove,
 	.suspend	= rt2x00soc_suspend,
 	.resume		= rt2x00soc_resume,
 };
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
index f7f3a2340c39..9fd763f2fcde 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
@@ -20,108 +20,6 @@
 #include "rt2x00.h"
 #include "rt2x00soc.h"
 
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
-int rt2x00soc_probe(struct platform_device *pdev, const struct rt2x00_ops *ops)
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
-EXPORT_SYMBOL_GPL(rt2x00soc_probe);
-
-void rt2x00soc_remove(struct platform_device *pdev)
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
-EXPORT_SYMBOL_GPL(rt2x00soc_remove);
-
 #ifdef CONFIG_PM
 int rt2x00soc_suspend(struct platform_device *pdev, pm_message_t state)
 {
-- 
2.50.0


