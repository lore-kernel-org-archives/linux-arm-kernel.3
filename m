Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA41C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA1ZkQzruaCSEyzR7ucHNTWeXY5GrlIUwViNOlkeo48=; b=a1eeu2raGilBWIyIOTvV2/wjNL
	tREa2T9fihNWm33tBGHbgNnR1K5p+zCVtNLohAFL8IWs9bE1xP5li0WRsJ/Wpp5vdCoHmMupjaGM6
	3ZZrfqOpAQ+c7tHeOl+kps2Kv98QqnQZHOm35PFJZu1EttmbqqKnnF/TXQTZKBxzOcFseQDBHxnJb
	GTifoAbgUhco9zDtweQsnXbuNfZWPJy2SAxsEwi00SYObvJzKJghjUNCLCM882h5gil0CbixaxGk7
	wLhcF/gzKElQW7JRfGwiiC91fXeMqwLomL9EoeUfa/f52JhAw1JflsvIq8Yxs+Zyet6EZO62VFbR+
	WXhO2CmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l45-0000000FItC-3A7p;
	Thu, 10 Sep 2026 20:08:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l43-0000000FIqC-2v3L;
	Thu, 10 Sep 2026 20:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED87844807;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF537C2BD05;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789070886;
	bh=9VN3bwZka3S+tTg96FmOIUV3qYPE1M05k5Wl+t8sisQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fYykwd/dQWxc1GcfAUYzHz9vvAfD6xQW5Or+3/9qU8kwWRQe3SeWqZpWKXgJvOMdI
	 DbIba7rbihNAjtl4IPRiSnliZ2nR3T9gnGQhBeYwSNgkRqHnjHkswVpEkkMc1wntdC
	 gbHdGfwwoa/H+3vD5PCFCS7MZ3YiC2UFhEwpvgENZq3VtZZA95NFPKVnFgYtewbFQT
	 u0yVDLFZkZ+7qR0p068MCjIKhO0VQ/Xl9v0Td1fo5G3bbOO0lRfV5oCjmI/T+axvLp
	 9A68gokm4SdW1gI7LcMVj8UjxnJ+kMPN/l0ESZB+QBW+f3SZxz1luV2yJH9G4gIMqd
	 aTi2oGqEBhOBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3BCC88E42;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Thu, 10 Sep 2026 22:07:57 +0200
Subject: [PATCH v5 7/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on ROCK 5 ITX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-7-c1b9e5f10cd6@pardini.net>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=6JENscbgGnnWW/4PaIbc3X/OTv8wHFKHVCvXFVsCaGI=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWQt5lM5Z/zure0WD5bAba2XA91+FL/82syq2fdTRU/S1
 OhlhOifTkZ/FgZGDgZLMUWWNRLKPN/Wvzp1x6NjMswgViaQKdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ikY6BjzMDFKQBTnXaWg6GVjcWSZZrtF86duUf1exXWOm3Ze1yT98wrA/WzkXNr87relftXt9U
 tDJIucr7PmfsnZvlKW8elQk1/rrMXXjmTZnbuhoDaZtNzdx0UOh0shY2ML0yZGxFzpCHxXY1Ua3
 ifw5cmo87VT1vffprCfOZpc2eO4Iy8b9HznTOKN7IyhLZMauwwO7Qla5qW/8my3weNpNcZPD2z3
 2GeoGW5X7juh6YehrULPG8ZTDa1kBLuOTCtJXxphtXGK9sknP9eUtTz/6FxuHPqTQEudfHDiU8r
 Ln851t1dev2nxaJveZ86fy/ii47Ksunoepd23kwi+YW9b3C02s+m1QeyJprMPMD6cMfR1jM+0wy
 EWSI1AQ==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

The Radxa ROCK 5 ITX carries two on-board Realtek RTL8125 NICs behind
pcie2x1l1 and pcie2x1l2.

Describe the fixed function nodes and attach ethernet0/ethernet1
aliases, so that U-Boot's fdt_fixup_ethernet() can inject mac-address
properties from its ethaddr/eth1addr env, for stable MACs across
boots that both U-Boot and the kernel agree on.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 6f25e088f3189..f1d6647c57bf9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -20,6 +20,8 @@ / {
 	compatible = "radxa,rock-5-itx", "rockchip,rk3588";
 
 	aliases {
+		ethernet0 = &rtl_eth0;
+		ethernet1 = &rtl_eth1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		mmc2 = &sdio;
@@ -631,6 +633,20 @@ &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_lan>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x300000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x30 0x3f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
 };
 
 /* RTL8125B_2 */
@@ -640,6 +656,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_lan_phy2>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x40 0x4f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.55.0



