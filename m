Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F85C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rl+UiCF7my18ZxcuMyoW05fzRW7rZtyaCGC1/e5Y3E=; b=4UGtLRqSniZoMgaOJ8WhjnajG9
	EZUfa9e6RsYO9EoEgU+/hw0uHXF53P9Y60kjJsxCZ1tI/TkHn4figLdPfYuuU6lLjp3rYClAV59gX
	265KjSB8DmjkT+eCS/txjk8nzSErwmZvGDmlDHEP2MrpG1Vxb3WOPJ581/RU5rr+NtyQVl0UtObhE
	dlxfHnxMxo1Z059YXT5qqmk8U2i0nvgKuqbnOaefYZM/6R2Fzj7JmGy84C8zaPfB+QHYqHGXszlRl
	sZfQvA4Qap7QyNSRnYanAjlgi+MsemADBzXaeytKtGy3wgNF9oHO8Z+nGC1KnfROh9KbsBrbTHGGq
	IyWwez4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiENl-00000005KdU-00mC;
	Fri, 10 Jul 2026 16:47:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEMy-00000005JLE-1BMq;
	Fri, 10 Jul 2026 16:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5rl+UiCF7my18ZxcuMyoW05fzRW7rZtyaCGC1/e5Y3E=; b=TphVS379CdSEamHS1492ezmJWj
	gtaLYN9x+wCivWvg4OaBSoy3agMG2DdwyTm1wr2JakZW0WNme6ISRqqemHqoYMU1NJr50uRcxikJg
	OxEeJ6VWKRBU9I0JhkujFFyATVOyNok8rFB5R3ww+/4WmuSHprfRK9KhEWZsxqAEv1gaX9B4AAYTt
	Ki5+7ch10sMB5wPOO4vBXxncPZ9xO5fAJFHnUXYtqXA9eYykWIUKqShltFWffxADtZpyssCIf0F6Z
	tYJLvUva8QVf3W9jzo7tQTPh8NsiJGDKVbxDS7AFHSBD0Q3zHuo+crPjgwjBCotzt/0WKqNA47VPz
	Dhr/beyQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiEMu-0000000AAaE-1Bgn;
	Fri, 10 Jul 2026 16:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=FzxdooW9D7IYkJPvtynhOqwEPTbYTO3x1SBymELs+Bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GxJUQV4mEv63qejlRcOX6cIOJyBCnUgt6WAp1kqfYXCRFibxsGRHNo5ZM2LmNsQU0
	 Wb4YYZ7Pg1B1HiDgh78P18LOYqRIywvR+Cnpb7yzbLIi4Xwm60a0EjCbT2TUJiljte
	 VokcpdEtWeLU5XMyG7OcnZb/GO4tDqn6hVEkq4Slg41ZHHAuEqsSoWAGz7Jcf9h1o1
	 Bs5QjFIXrvTjm6CrJOr+6o89f9pnayDRR6G38N7MRugGnO1LAJk3zPgAYMDF+VsRHh
	 H1c4R4YCl5viMKmkaFR0n50FiVRnzeejgbJDZPomF5qwTKJAz1l9mB9VSauoILSUcA
	 nM/8W5v1//T7Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB7B117E1025;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F3A2E480061; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:54 +0200
Subject: [PATCH v12 16/36] phy: rockchip: usbdp: Register DP aux bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-16-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdndfN8ksRClf6fj7cmJ+kNQiM+l8TQWZ
 lRarEtpJE7IJ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaKtsP/0Ay6hPd8htwWr/CfaNpJp7U/leRjPnfOYBN3n2aAN5j44xWj7PCOGKyfK30Lqw5Spa
 B6l1bX+gyyKX0mqUJjYs2cSOVCXmXfdLU+lFF5kBlaGtI+x0dyOpt5+JkjfilEwMOt4hjwHcmKy
 5ByWNAnPKuxOT65y0MP5H47IJGtjPig0Ye1ZyAgIZNKr8B3i15C1HLFdZtJAteMhJkT9IyBr+bO
 dGaRxuwgx2Zra+TmbsEFyp7imwJ8FuHWL/LNHcX7ZmNmgeaPhCVoo4vbDHFy0us01mLQFdUIaN3
 RiUizACmqpf384TRMowB8nn+jSuJiOxD2b0XJa0PgQIYaAUl9Fk20RsEQWDWj9bC1fd5EdzEfyp
 LhAjhTEox8jqsMvrKQGgecIZNiwT/9NpJSHQiNd1w5H/JJGNPbfZC8wmVbFxhymp7EvdDrN+Li1
 52qZEEGKZeybgf5iuSGETJynBU4hBsD8WZsAlIijxFwZPeFEt0EvA1JSo2an90c878JLvWC8C14
 HwY34Qxh8FGkDVnLdVnssrnm4l4mGUbqa90/0ozk6b+XQI/8oMu4+HxbvaZ/LqU3fe1QLlW/P9C
 wn02+WZXTt1dEljs6R6eX5Ze17BJo9rrUUtCEIdr0PuC+B5eaVrPiV13YU1hy3lpTuK5+kDSf+y
 9JtMfABDFrnhn84rq7FEwWg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_174628_440901_970D683A 
X-CRM114-Status: GOOD (  16.41  )
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


