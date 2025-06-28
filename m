Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD161C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 05:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK8Kh9IhM4RSrrc7LHqpFAC8NP6JZr2rel/I3xm4IqA=; b=iilJS7tsQPIV04WktD67hbrQyt
	vqToSUdExrqoV/WlvMr6Jo7jbiqEBYYbq8GndUUoiOHZEwMkqbMbAToYRDs8plgHEiiPhlSdftLKJ
	gl6P+76rIaN3pAxkrfOhfIttsfUPHOXHLCALFrNHXeZb4p9jbIzXw2iqlCFNOWpGEosFrCrpCzulu
	/VZ6Eq1C/wSmHVTf/jHVkgKYt/83CStHuzw1lVa/yw4O+KOq/fIaXIAw5krFcvGBBq0++twwEljIK
	KV8fII3xzltGuTsfPi+9ZALjFZHX3sWPV/pxSOkB9bX6DZJCu0cQ+/+LaqLxDbJr+M+ZXcBNK8Zlf
	bUXDYrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVORQ-0000000GQtd-2tzu;
	Sat, 28 Jun 2025 05:49:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVOMq-0000000GQWu-1pwD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 05:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45AD544CF5;
	Sat, 28 Jun 2025 05:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16D3C4CEF4;
	Sat, 28 Jun 2025 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751089487;
	bh=WKX6UPJG1JKK2C5l7RGoc2IVvdGkeOSZ82VyvukU8Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mX4bCDJDLs0dK9C86qRB66iAJTv77tTOiAaMz6rER9I1XC3Wq4YXoi57TBk0/oCzS
	 o8ajQdLDEx0z7a40jaY4FXFFWhPGJVV+cN5dF5nmHlh8Qtu7h2p01DDthOgiyW8CCU
	 +uCqKyZKwTJoyMKJkvjo/Xkk5LXOruYPrfYOKDDcHOt18eIGQdPkSgqW/iz9DzLBJm
	 EdruJnU1YTHXUWC213Y7PyiuGgKJqCZf4yQYRkf0rkqeb2N6anfhOnI4jV0M+txMVQ
	 KHKHvEaC6Sr4mTJfjISFccfB71xlDNykXwqM+H0qlBb3r1FjqHA8KkFUxfYOVlGAbZ
	 Eyl/9f0sMusMg==
Received: by wens.tw (Postfix, from userid 1000)
	id 583A25FE35; Sat, 28 Jun 2025 13:44:44 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net 2/2] arm64: dts: allwinner: a523: Rename emac0 to gmac0
Date: Sat, 28 Jun 2025 13:44:38 +0800
Message-Id: <20250628054438.2864220-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628054438.2864220-1-wens@kernel.org>
References: <20250628054438.2864220-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_224448_658070_6E46287B 
X-CRM114-Status: GOOD (  13.91  )
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

From: Chen-Yu Tsai <wens@csie.org>

The datasheets refer to the first Ethernet controller as GMAC0, not
EMAC0.

Fix the compatible string, node label and pinmux function name to match
what the datasheets use. A change to the device tree binding is sent
separately.

Fixes: 56766ca6c4f6 ("arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC")
Fixes: acca163f3f51 ("arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board")
Fixes: c6800f15998b ("arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 6 +++---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 4 ++--
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 8b7cbc2e78f5..51cd148f4227 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -131,7 +131,7 @@ rgmii0_pins: rgmii0-pins {
 				       "PH5", "PH6", "PH7", "PH9", "PH10",
 				       "PH14", "PH15", "PH16", "PH17", "PH18";
 				allwinner,pinmux = <5>;
-				function = "emac0";
+				function = "gmac0";
 				drive-strength = <40>;
 				bias-disable;
 			};
@@ -540,8 +540,8 @@ ohci1: usb@4200400 {
 			status = "disabled";
 		};
 
-		emac0: ethernet@4500000 {
-			compatible = "allwinner,sun55i-a523-emac0",
+		gmac0: ethernet@4500000 {
+			compatible = "allwinner,sun55i-a523-gmac0",
 				     "allwinner,sun50i-a64-emac";
 			reg = <0x04500000 0x10000>;
 			clocks = <&ccu CLK_BUS_EMAC0>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 0f58d92a6adc..8bc0f2c72a24 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "radxa,cubie-a5e", "allwinner,sun55i-a527";
 
 	aliases {
-		ethernet0 = &emac0;
+		ethernet0 = &gmac0;
 		serial0 = &uart0;
 	};
 
@@ -55,7 +55,7 @@ &ehci1 {
 	status = "okay";
 };
 
-&emac0 {
+&gmac0 {
 	phy-mode = "rgmii-id";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_cldo3>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 08127f0cdd35..142177c1f737 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "yuzukihd,avaota-a1", "allwinner,sun55i-t527";
 
 	aliases {
-		ethernet0 = &emac0;
+		ethernet0 = &gmac0;
 		serial0 = &uart0;
 	};
 
@@ -65,7 +65,7 @@ &ehci1 {
 	status = "okay";
 };
 
-&emac0 {
+&gmac0 {
 	phy-mode = "rgmii-id";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc4>;
-- 
2.39.5


