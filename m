Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E144DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=319dyHA3Ix7LNoIvUyUgEdx8DMCYSd/Y0vS3shwnw4c=; b=G8E2SZMDi8+Li37CFL9KcdFzUN
	4v3jO/+u05F4Ck+CXxV4wEElJ05WzWsoFcOv5LUOCu5GpQIZpyv6WSqyWFzphUArTdq/8HBTMxUhT
	6K25Ih/+rFiKnHRUeeN9pkWaL5WxE7GoTjT8QuBTotRVluzLPEB4N6j6V84x3eeWCU2RfN9MEUMDy
	3uZaRzdGtxSY/KPrOav6VSnSOq7LQ9CZzzUkS2UuV/yieQF/QRqx/N2HrBnhVhmoB77LsIsOkiM84
	adj8hEQb0gjP5g+GDCP54UvntIEW28EWVl/QRkv1JnQGbd80ZvgsPRs9TrYanX5V26eavy04JIFqz
	x81/hMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLHk-0000000EVLT-3AD3;
	Wed, 10 Sep 2025 13:54:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLHi-0000000EVJm-10bY;
	Wed, 10 Sep 2025 13:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757512491;
	bh=/8UtYirEDYoOIbphyHMIVX0/QMGG1VCWOJPYddPzLD4=;
	h=From:Date:Subject:To:Cc:From;
	b=SoRbWa+kDhB9TzKR+tCQk5cxSM9+BvVzlO0Q4RcaVwUvc4NjgiwDdSSUt6abI+3Ug
	 2ICt72HDwN3INq23r2f4C6tz8QayhHSz0AxTt6NPQ+CzXjJo3qGJyFzw1m2Z/ryWUI
	 DglsBglH9bdVUC+/jtebE0TukzdZuvxk854VleQUzgUbo+QxwfFNG8GGeep0Bz34/u
	 seIqjIZK1a1quNulXCt2DXL6zqU1zyuRb96VT6FbznTr2YTKF9phyNxL4tqWMZv4Dl
	 ZxVA29YmwTFw/x8dZUzkCbsl+l+u1kSSpAuQJ4QdZoRmrZJXsdw4FpGgp+aiYfBgSM
	 nZ6ekpzsouE0w==
Received: from jupiter.universe (dyndsl-091-248-188-108.ewe-ip-backbone.de [91.248.188.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BAF0217E088B;
	Wed, 10 Sep 2025 15:54:51 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 79570480044; Wed, 10 Sep 2025 15:54:51 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 10 Sep 2025 15:54:51 +0200
Subject: [PATCH] arm64: dts: rockchip: Fix network on rk3576 evb1 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-rk3576-evb-network-v1-1-68ed4df272a2@collabora.com>
X-B4-Tracking: v=1; b=H4sIACqDwWgC/x3MwQpAQBCA4VfRnE3NrhCvIgfLYFJLs1pK3t3m+
 B3+/4HAKhygzR5QjhJk9wkmz2BcB78wypQMlmxJjSHUrSjrCjk69Hxeu27oqBkd2YrIGEjhoTz
 L/U+7/n0/pbO4qGQAAAA=
X-Change-ID: 20250910-rk3576-evb-network-b09cb0260011
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3340;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/8UtYirEDYoOIbphyHMIVX0/QMGG1VCWOJPYddPzLD4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGjBgyv0Snl1hIYtTGv1yO1KIdE5RcXUVbExR
 iQ4YXBWaLwBmokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJowYMrAAoJENju1/PI
 O/qaBOkQAKMN/8cj7wuP2lEaE7js7l+HmzH07C5ToGZ7aVe6EJ0NXEwozv2ItC2mLGlavxhl773
 rWmymc+sSoVP67KtoOeLb/h7+71wkjDOg/iTDA+zZaHRGxGbM+b2ebSOUwq0NGiWYD33PW4vQS4
 aDrmYPKRef9tCFkz8hxPmQsMGYZzpxvCTOG/9hUewg+Q3Q6bC70mIhpC4FoWRUG62lCqlPEg93n
 5TRnR+6FVY4UViPX84scJdTSCl+e5z51LVKiCtP+jjPb6MQsDZygYygKMtvW3sgt4TPJPGYMQJu
 2H272hUQJtR6aiJlhcJfM+J841hZb8WmNKEW+cX8pz7HLHJ12Ca/4BU0lUx1W+Tcsjy8qmveRY/
 oWzOy8GX4HdkRok4n8IXs5UKIlb9uhjP/wPh4XHmeCZGUSqdXTh2xnRn57l3xR+WMVpTzJ7Ypny
 EE6aT6l0D72vUxopFQR/noL0TSl8rBdLUE7sc8iFKOx1qZMoGZlY3jMICckxH5OdTy2sj3cYlSQ
 7bxMV8L/1tSyfy2eclx2Pa69U0JUCwnblGbIKSqDsE0Lgq7GhWShMmvHZpO2bsbxSmNO5F+0mz8
 aVSdyNEi+XFSTMHUprG+SgrdqUqh/AWB+tjwRY7S62Ads6sf72Pk76CaaVqX5CzcNGjNwXDr3z4
 55B97I8mYJo51ZO4O/2c4Dw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065454_447718_DF972531 
X-CRM114-Status: GOOD (  13.05  )
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

The RK3576 EVB1 has a RTL8211F PHY for each GMAC interface with
a dedicated reset line and the 25MHz clock provided by the SoC.
The current description results in non-working Ethernet as the
clocks are only enabled by the PHY driver, but probing the right
PHY driver currently requires that the PHY ID register can be read
for automatic identification.

This fixes up the network description to get the network functionality
working reliably and cleans up usage of deprecated DT properties while
at it.

Fixes: f135a1a07352 ("arm64: dts: rockchip: Add rk3576 evb1 board")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 38 +++++++++++++++++-------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 439831715cbb55a67ce9ca8736d70549377e8048..db8fef7a4f1b9570cb517ccc9a857d1c93c9d2db 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -275,9 +275,6 @@ &eth0m0_rx_bus2
 		     &eth0m0_rgmii_clk
 		     &eth0m0_rgmii_bus
 		     &ethm0_clk0_25m_out>;
-	snps,reset-gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 20000 100000>;
 	tx_delay = <0x21>;
 	status = "okay";
 };
@@ -293,9 +290,6 @@ &eth1m0_rx_bus2
 		     &eth1m0_rgmii_clk
 		     &eth1m0_rgmii_bus
 		     &ethm0_clk1_25m_out>;
-	snps,reset-gpio = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 20000 100000>;
 	tx_delay = <0x20>;
 	status = "okay";
 };
@@ -715,18 +709,32 @@ hym8563: rtc@51 {
 };
 
 &mdio0 {
-	rgmii_phy0: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clocks = <&cru REFCLKO25M_GMAC0_OUT>;
+		assigned-clock-rates = <25000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii_phy0_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
 	};
 };
 
 &mdio1 {
-	rgmii_phy1: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
+		assigned-clocks = <&cru REFCLKO25M_GMAC1_OUT>;
+		assigned-clock-rates = <25000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rgmii_phy1_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -786,6 +794,16 @@ rtc_int: rtc-int {
 		};
 	};
 
+	network {
+		rgmii_phy0_rst: rgmii-phy0-rst {
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		rgmii_phy1_rst: rgmii-phy1-rst {
+			rockchip,pins = <3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pcie0 {
 		pcie0_rst: pcie0-rst {
 			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;

---
base-commit: 02761df1f09ec1d3e03ec2c68c6c5c85955dd8f4
change-id: 20250910-rk3576-evb-network-b09cb0260011

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


