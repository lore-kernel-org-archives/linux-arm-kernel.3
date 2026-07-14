Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE39C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rl+UiCF7my18ZxcuMyoW05fzRW7rZtyaCGC1/e5Y3E=; b=a935SXD40KMxr/V4SDPTdZk2qB
	lfvHAAW7CJGzN9ALxOFy9G8zYhzoNfApUkLl9gTh9QSHJJ7GyNUnopjM/T7ndhGUX7m301Q4Gnc4h
	DeVXg0OgC6QVXSHnzL+bJ4+yr5c7EY1IYCcqYGuLVJfHWGD+vebZ4pPuRe4YIUJRzhzVi5c4lV6S1
	fUfoqmp4RD2M5qtEfjW0zj6zuy9EmrAO2YePCO6ywig5eZQ0TFR92qpBOGIkDTLkBpnhNGn+sXRUz
	0T+nbGLewlzMvRdCPHCoxbwBHgtHwvDT3CrsycAQS1gLB5Pseq1poSqZVvvI6q5kGf8OePQ5z9t9K
	8S/AcbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjink-0000000D5Xp-1V5y;
	Tue, 14 Jul 2026 19:28:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimE-0000000D3Qa-0uaK;
	Tue, 14 Jul 2026 19:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5rl+UiCF7my18ZxcuMyoW05fzRW7rZtyaCGC1/e5Y3E=; b=VYg/R75si/JWDpLGE+s3zTBlSv
	1ayW/0RkbUCghETQjBzFey4bmr31yh5vjmKGCVp3RpBpuVik7swNK37KFl+HIowlwc2sCD9tAUZGZ
	RIXWPIHOoH9bdNtfeo3QBpQF5bCnmhZNyvkWT91p7elurJj8bRYri594PD40kPkCzszVku9TljlG6
	xBilzHNXL61ktPy6462k8B5tftA6J0DBiERySVDBE+fAl2hzhH0WmasSIJUIcV3/Y5C3usohNXlcs
	DYIMwuLYzGMJ9Q2H5RkZnI8tzxleudo2i82aeQRXvCwSDQaRbIUMfCvjXXP91qWgE7MaOkvxiy/Mp
	L+fYi1vw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim3-0000000Co6x-353K;
	Tue, 14 Jul 2026 19:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=FzxdooW9D7IYkJPvtynhOqwEPTbYTO3x1SBymELs+Bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WEzpHQv5armzKD8q2UPJzb5uhxxC/XusNRE58QZAJijBUlkun3ephVIUaQpyB3eQt
	 GJEnXgoKk6xjAnqOrCY23lJ4uqtDW+Er/1SSqD6EbW+iPTdx+v/uFbWn41MMhHWaKh
	 JPfvIS89Y+QIvX2yVsjxCCfWZRfi+loP/E/6U1yykiMl8yGac5cYoDmnGSgeOR6fMH
	 eDLFCiU2MovEQif+DuBR+Vgr+gqNP69s05kVSdEbIoTzcZ4UgUdp5lzKHKwBdmvO1T
	 vQrZ+QezH5fHXWAhkHdNAu5kLrYs1sY9txIpD1kaVrxd9aVRj0stQTVb6lTUz7XEv9
	 aKdZRGAbMuhBg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1CE017E1029;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E5C4B480061; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:17 +0200
Subject: [PATCH v13 16/35] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-16-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVCmQA7P9pLhCQwe1b0neqgfTb3q06+zi
 47H/lksbpq1vYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaAnEP/2pJcDRGVcbo90LkCIDqorCJyp0SsQeFrx/0hF1d9pt5TwyRVOu8yNxGxgkzs3qQP0p
 mXXvtBeYFBlC5ej+Ep371y2qiB5/9rpAdmLE3t/DhB/fSnFjh6MRSFBQDrAPUBXLA8XDcT+zT11
 8iy11uQwwO95/81+gBH15ANtNDs9f6G6nO5lWqi0brpo2qd0Z4rTo5U9YcxGb2aRSe0WFDG1DRY
 uYFUPTIv4DYunDmM5dMH2CnrvJgXm5E/DTu5ZxRvErnSQwsDA0mSjDMlupfgclFmpzMVM69wKr4
 ApV2uG9FhwTtHu++8EMQOplg+dJXFskD8VcNxayXmzYHFDDs1yQia2w6vy/XdhRX4ePm83w1B5v
 Cj07x5V0F1N1bFtIIzRKO08QR4mebzvAKsGdYsP9wEcCblDD4dGVGB9j0VMZkY6/AvuhrUlNKwn
 kMujikbBUhQP51YfbYVWfN+uv9a/Tn84Mfy/t0lC/+eBeZUYn49jMU72dqB7GH79d65WpCNcyYN
 5sZr5sKEQRUh35k24/mNcjCYbUHYPsiK2AJoDHIYUhnz4px0YnbUCJHLNexcVB7BUK7Ds1KDwh9
 Vj9+8Y6aBxKYgjHP2xZS+3joxJIFgZRKBrWGhyp+n6OVYgj4fLjICNF+tqoqHvRtS/Gy/sA8bZ7
 ojiTRxBgKY4Q0TyhC6OgzsQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202641_925301_046DD99E 
X-CRM114-Status: GOOD (  16.00  )
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


