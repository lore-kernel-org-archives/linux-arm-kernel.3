Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2512C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rl+UiCF7my18ZxcuMyoW05fzRW7rZtyaCGC1/e5Y3E=; b=352KLcbho++r20DjQudj7vWzcE
	jkSR9Gu3Hto70ICYEJW/ItPJl7AtOFr0CkwPIe7MQiQJmIGgbW6PfrwwjyeSkYm3KDDWDzJ5RW7Vl
	GN+9U2bffhrybmPYz6yHqXofpKfjW7nGJN2fJr+iqHxNN5ArlkJAJbYBCyva8panAtjupxujxMDz7
	aSgwaMJtDaSEyAYKgOFR8PkOl5aJoi8xtOrRB74O/kXeZwgyz+NztriY7rPBIqvf3zYf1IaDH8a60
	Ci0VAYuFoJXSRQEqaqSk+Qb5XJGsarZBtY2DcO/dQLcWRQu8ghAhmx0SX82egC8BIkwdpZc/k8S3U
	9sC1ckCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1Z-00000003MMb-28gy;
	Thu, 09 Jul 2026 19:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1C-00000003LRC-2ZH3;
	Thu, 09 Jul 2026 19:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5rl+UiCF7my18ZxcuMyoW05fzRW7rZtyaCGC1/e5Y3E=; b=LVZHFcN8cNQjEO9CSnbfGZhk+R
	75g45/gPeYyW1bJZfWmLkg+3luarQz853i4rR9ysY8dyrJguhhDjrm466C75teMCzRwiKrTX39Ypr
	l0EBg3VEtyhGLQMHZSGIV9mU6KQCkLFLRctzIWFbQaKacdFUEj82Qs6BPBvwp6mMhvg+7+krlSEO3
	wPY/WyyKVdf3j4SdQ0gxjQ+4/HdBIAF/Q8VJPz4CDyhEdCgcqA4eOENnwyabMdDFsRLagRiylzO4Z
	MbXQy+4s11zRbm3UzcJc1XXGTLt5Jgy1t2lTvxkorkUHgqwEz2kKn1UrO+gXCoKyBL1MGKHpu7ebW
	gAUdQeow==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu18-00000009TLC-3fVE;
	Thu, 09 Jul 2026 19:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=FzxdooW9D7IYkJPvtynhOqwEPTbYTO3x1SBymELs+Bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bKu31TW+gAs5zx3H3M+x2oo/oCgU115ZwT6XIBgAf1Qf3jDSya07MHrnSEoXLIRNu
	 pakEQJg12UVaJ149kJY3i7LtpUE8pRJ6xnbw/qXZbNCFKIGjB9MPujrAqELUKeviYI
	 6tQt8m8HgyPkaLIx+Y32QPrXLPYKwE3gU6xuPJkZpzIE6hJ7zPAMP7LxWWd3/7ylGn
	 +BP2sPHw3/T6uFoUVK+DE4bawQ604DTlyy2gP2nUgS0MZ/3T2ZoAYzIJqm+glToUjG
	 dWv3jBmhk59yXiy/7T35G7feSoZuEEoW6Zgc4QFI6Spk7a4lVyx83i89m2zaH2IrP3
	 jd57Uw2b8rs9g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BABE17E1011;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BA14A480061; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:39 +0200
Subject: [PATCH v11 16/36] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-16-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=FzxdooW9D7IYkJPvtynhOqwEPTbYTO3x1SBymELs+Bc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ESK+t3aFzIGqFjCTOFXFnvJl0urEFszh
 4oRm4TtZokGK4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaay4P/iiz3vYP5oHRMxM599SIKm5ImTi33eP801hVISHLhX3zvXLKOiFOrhJ5baTsOHXXOwC
 3I2MgyYGB2HOWEZuhxUbIr/lZka1fj6j+lPFh0AYRw8HbQtbeBOXZ4dEP1GpyJgpD6c3XBb0Sl5
 wma47nAzPM2E/1YMg/QeAv5g+i3VY9PvUVL8IR7Y0qI1kBoJVhft0HEWKcaYR0cxElOypkD3su+
 YVPbluZOWY8Si/jRvbdVgP1tGHhiTV8mCA8N50Kd1O7zORzGdo7YImunJQVbQbAkCquO4Jzd5gN
 IiYeF/GfPLUrrD9gCYZW8sX41ezuYeGwefaJ24gqmXB74+EqeMuR8WOn89ydFU/8bLi5Mv6pVfb
 ACWykKzRsCwOGEGSb4mAYaIPf1chE+y2HOTMMcoHe0Y3lp17GCNj1DaJkTTkhdgq1NifecUx02p
 9jPIoEiXtZjsuJZ/Omuxg3Ie2OWmCB93SW4WIXU/yGroiUNyHy7bKuhw8NnldUztPw4aDr0h9NF
 9/NAtm2Hd0l091gby589wf7Hl28NivgxvIR8TphTnBIm8aYGqHggS4wdV9JKx4cfO8C1jIw6+hs
 Lnbl3xET4aRAMMPVJCc4HL/XYJokh8x2nzEP7wK7CQTWDAnAQzg2U603SkYyUhNvIsKMlXahFgS
 bcG1Z3Dfhcq/id3Uu+FYnWg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200239_249786_6A964A2B 
X-CRM114-Status: GOOD (  16.20  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

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
index eda3f7a1e267..8ac6a83b0b2a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1414,6 +1415,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1468,6 +1470,21 @@ static int rk_udphy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * Only register the DRM bridge, if the DP aux channel is connected.
+	 * Some boards use the USBDP PHY only for its USB3 capabilities. The
+	 * aux bridge itself will be registered using port 0, endpoint 0, which
+	 * is fine as that is the actual superspeed data connection shared by
+	 * USB3 and DP based on the mux config.
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


