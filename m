Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD14CFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eu52mGUbetBRLmudxyVBLRUknGkgPUqu7SpGNBo93X8=; b=FURDmMarIE9ZKnd60sarRJxnON
	7/10alBhB7CMeUOweNUcDAy4ctJT4wA0GhGPY3rJ/ZqpjGN2dZOu14/OTBzevBIMP9ldT7EFbWirz
	Fasy0sQuPn3ArNm4ztGyzST/di4uNshRdgpzLk50OPNuxf5NFN81n677RZkQgOV/oBPwaoPNKtfVP
	/i9Y4NqOLkVATD4E+of2TABSTUojIhZ8EKp+iVY51OLT1wcexnsDns0KQMjXdIssMSA4439W05uOF
	zZbbjdXImmf0owhfMKTDwwOT6CLM9mPnCiyOnfzfjJ34qVLj6M+ZAWsqnfD9LHQONthsBUDYaZrvS
	JVdkJZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl52-00000001tXV-1EK2;
	Tue, 28 Apr 2026 16:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4j-00000001svb-3UnT;
	Tue, 28 Apr 2026 16:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eu52mGUbetBRLmudxyVBLRUknGkgPUqu7SpGNBo93X8=; b=E0kJxIjkjiUv50AWrwfzouTYQI
	E+Dhfk9IlBfLVy4Wt+meFkRo/Lu59SlIBIgcza0uAZLtwP6/PPbSYyXaRajGXKQU74jJIpsasQ2/C
	C0TfYYr71XsWWP/4mlQZ+tsq3yerJUp5Z8hgbqCxYCP/Jl5HqU/PUgwKtoJyJKSFtZKQAarJx93Fb
	niJGvPvGPLzkUAC8EYAqtahfzDw5V+5MstNi2TG6GAe0h/WJS/uV5KEdznOMEp8eulbmihQkm4ot3
	rlUWi7yBagS7WFVDwPp3In80AeKjatcklfNjdUcvOVXgwtBrsGYU5CQDayLxJFxsXJbeAsH1BgolS
	r0v6bBYw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl4e-00000003ZLv-0ZTu;
	Tue, 28 Apr 2026 16:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=2RDTD3i97hvqpAcQDq/HnQnUMc4wftjxgYkOHKmJn4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qYTwRCvVxitM2Pnu8Km8cp6ScTYqD4RSacdYSxr/PbVX4M1yw8egMkOxU7YEOoBzL
	 byApT/yjPttVKFK9DBXahCesoPQPYJNHxF8C+H2C8pcPWLmJa2kD6UYQ4pe1pTdBzZ
	 i7htOZClsGbBC6/DXpa5fh66XcT/S/fcnUa7R+TpOgZBa3bO8yRnvheStoRf4QbaKL
	 j3jyDB+vn2TXb8IzWfzgJnhYZP6j+XuiC++ujaiURrZMG5q882jmilC58hmftyzdR4
	 PCv6G01d5kDG0qBgK2Ph/7iqKRwcPWdbaT5HJKy7yujdYO/ywLoZvoi32yiS9PYOb4
	 WCNGeNpKHCIgw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BF0617E15A3;
	Tue, 28 Apr 2026 18:14:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 90311480052; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:50 +0200
Subject: [PATCH v4 11/16] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-11-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2934;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2RDTD3i97hvqpAcQDq/HnQnUMc4wftjxgYkOHKmJn4U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MmQSSSwrcFXLHqHG6CyyOtH5uQtKKZOz
 +82bfniCOEglYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzJAAoJENju1/PI
 O/qam/4P/3vhs4uoTFTRp6OFin+UhI0KhjUsLWVjRF/uTJlIifjNAzP2AceepnakSsVbiFn3A7D
 e89Gq8BgbKfSlf/KrK/x411ZBfKWrjHDc0ks7sFKNW+l5U9df9bXvHhhZeNWvCzCfaRL0ZzRSlQ
 WuqZ4iDT1tfzLdGMugPWGCH57gYAyvZZMFRS7q7+SoKplmPNYXKUY1bvNHAwCQFbp46bk/1P1IY
 MH3zN5g7MUqkKv2VKUbPVandQEDtwvpS+F8+kKvLoaXAJdcNMf2n3fzgHsWJ4ovfDhYUS+FkK4I
 YhBJrJc5EzKymDNIq8omudVQDwy4jjE3KmeUbY3R68ySqPTdXNtN6fEb1Wz4ozQNrGMdDXWRSpZ
 0P9t4l1egmQBY+2iSJ/v66BQxMV4pc4sMi4BSxSy0tQ75y7Dl9/Soce6Df9Y7Jv3+Vki7LANPDQ
 3pZr5spNYsTeqFQpC407taDkjMIURi0tQPrJ1rM9CkWQai/0D8hJM/NT4qCETLzq3/hsQV062dI
 WHd+go/xyBuxsqkj2lOKtl8xn8ogAGwkzpZFtoBw+bQUdIRkSiZMLKXQ9hjKFKt9LacwUnQEo3F
 VsvxxTmyhGPr/U4USlal6mjkms172FRzxxb93wqaygfBqHeSgPlsD3NPMoAVx8AZYEsU01E5114
 dmUpA6ncUrKq3JrInpeUyAQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_171412_410037_94BA6E08 
X-CRM114-Status: GOOD (  15.04  )
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

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..39759bb2fa1d 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -136,8 +136,10 @@ config PHY_ROCKCHIP_USBDP
 	tristate "Rockchip USBDP COMBO PHY Driver"
 	depends on ARCH_ROCKCHIP && OF
 	depends on TYPEC
+	depends on DRM || DRM=n
 	select GENERIC_PHY
 	select USB_COMMON
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	help
 	  Enable this to support the Rockchip USB3.0/DP combo PHY with
 	  Samsung IP block. This is required for USB3 support on RK3588.
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index beab20e4c512..77ad2a89d4f2 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1434,6 +1435,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1492,6 +1494,18 @@ static int rk_udphy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * Only register the DRM bridge, if the DP aux channel is connected.
+	 * Some boards use the USBDP PHY only for its USB3 capabilities.
+	 */
+	dp_aux_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0, 0);
+	if (dp_aux_ep) {
+		ret = drm_aux_bridge_register(dev);
+		fwnode_handle_put(dp_aux_ep);
+		if (ret)
+			return ret;
+	}
+
 	udphy->phy_u3 = devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy_ops);
 	if (IS_ERR(udphy->phy_u3)) {
 		ret = PTR_ERR(udphy->phy_u3);

-- 
2.53.0


