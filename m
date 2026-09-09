Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024FFC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVEvKohMwl+oRCs2NwhQKpKiy0E+b76snrJ7S//JB88=; b=S0ZLGmTtCDxXyvvqIVe2ZaBwGD
	5gm53/ytUFzNrmyRzkR+mytYXvgb/6dhPs9aCZFWRJjeeTSqX0dKiJrw2KltYZdwZQjDXkilbIr01
	NsGMGjiMCHFi1WMj0M1IoaX757ztVTWOxGONr0VMqlLrc+xXW+rjLB3Y77YrpQF0ZSKq86ZnYA6PH
	VzBXfzl7RZia3HFzzRkJdRl/oMv9mZ8Kga73hMxT54Au3Pb+lMCJtUxAQnFrmL7JaJ6VOt+qJrVQa
	HFWMvYLe6LPeaaL1eM9FgTooxKME2CMe698FfFZf9k8H2jtZX5srR/lpB+CrVjiH1WgkyKQU29Uvf
	cknN1xNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JN8-0000000BzJZ-0AiO;
	Wed, 09 Sep 2026 14:33:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JN6-0000000BzHb-24S6;
	Wed, 09 Sep 2026 14:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBC8960218;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7355DC2BCF6;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=rssftvIB7JoeWgPHfSiz0eTsk9hUcMMvgkEOARy/pIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kAdba5f+RakFKdpMriPx1K93vIY7A5TJlvMhh9DExtsyDexUCDVEZ418E4+NoahYY
	 B+E6TRxpMZE2szTyFudEjcHwoWMqIC66u9usikNxZXkdY2/XsNi8NMSHxRoAlpglF6
	 XIxrLtBeIkXvjoZ2UTBtKPxllGpu7rlVUfuXk+e/JbF1PL+E1IVU0940hfWm/eyNUg
	 +EVveEAWOp/hYZqxk86WoK0S2FPa7wGAWa/iH6bunGbxF5TunBTQabun3ZhrIAddlm
	 RU8ymDtID0PhONxXkPI0q19A+uDlt8JhqaBJXM3k2me9MN4WnOMiEuMlItMB+uoVpx
	 Hu8hzilLcI5AQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8DAC79FB7;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Wed, 09 Sep 2026 22:33:22 +0800
Subject: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY
 from the MDIO bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
In-Reply-To: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Uf1K3l1f7dmnIbSjn3YINB58f9z+/Y2KTLHOEJQ3J20=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYF5wTYZZufNc3dv9ruWplDnsHhyx9trYu0Lv3zrE
 u3q4vToKGVhEONikBVTZJHdVB0ptCp6ZhGL1HGYOaxMIEMYuDgFYCIvgxkZukw3NQa+aF/TeMRv
 6UcLK3PfqOgfIS5GTAs2Tt2+6M6XWwz/tH+27+k/yZp+dYfyf4YzmlpG4X+yPcw2WyzvS5Y0qw9
 kBwA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: 安容 <HystericalDragons@proton.me>

The RGMII PHY reset is described in the PHY node, where it is applied
too late to be of use. __of_mdiobus_register() registers the bus before
walking its children, and for a PHY node without an explicit
ethernet-phy-idAAAA.BBBB compatible, fwnode_mdiobus_register_phy() calls
get_phy_device() to read the PHY ID over the bus before
phy_device_register() gets as far as requesting reset-gpios. A PHY that
the bootloader left in reset is therefore never found:

  mdio_bus stmmac-0: MDIO device at address 1 is missing.

This happens with mainline U-Boot (generic-rk3528), which does not touch
the pin, and leaves the port dead.

Describe the reset on the MDIO bus instead. __mdiobus_register() asserts
and releases the bus level reset-gpios before any device on the bus is
registered, so the PHY responds whatever state the bootloader left it
in. There is only one PHY on mdio1, so a bus wide reset is equivalent.

The pin is muxed by the GPIO request itself, but keep gmac1_rstn_l
described: move it to the MAC, as the MDIO bus has no device of its own
to apply pinctrl to.

Fixes: b944112abef4 ("arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2")
Reported-by: Andrey Korshunov <razor1702@gmail.com>
Closes: https://lore.kernel.org/r/20260909134716.879-1-razor1702@gmail.com
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
index 97d85124d2..f3e543d261 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
@@ -215,7 +215,7 @@ &gmac1 {
 	phy-supply = <&vcc_3v3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
-		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>;
+		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
 	status = "okay";
 };
 
@@ -242,14 +242,13 @@ hym8563: rtc@51 {
 };
 
 &mdio1 {
+	reset-delay-us = <20000>;
+	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	reset-post-delay-us = <100000>;
+
 	rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&gmac1_rstn_l>;
-		reset-assert-us = <20000>;
-		reset-deassert-us = <100000>;
-		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
 	};
 };
 

-- 
2.55.0



