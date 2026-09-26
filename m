Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D798CC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 23:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYTBzKvF2qzOSbaUlSMxRmbScRkD+Ryvav4HHNjqjN0=; b=z9uBZuEgxtAB7Cqyzem/KqaYdQ
	6yre7nWmGsQNADXEmnZXOBrjBxv8YXOGACAQypMQKwRrdz/nJ5c13v494LzvgRJXnnqHOHYlUaPGo
	y32OMJ+mgOSWSKBKWSTPk58aQ7hXjiriFbIIPjmPtDoS8SyanBDKD69wVJ+tlBo9GSrSoir7ypeO2
	ZVtoGfJF2spZhg+ZifL3kpqdOkBfYPUkgev8By1qLo1em6MP/NMir3mVPJ4c7f9VNEjIZLuO3j4ly
	u84imYPwnWzVbD+EirC54A+ftcUjc3PBaZmiDQd8XDtAPA2+s3Ucwo/zKsuNnStqf0fAX1T0O13W2
	LOA8g59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbn3-0000000Fr21-3NAf;
	Sat, 26 Sep 2026 23:26:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbmx-0000000Fr0T-2NRL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 23:26:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9B11570;
	Sat, 26 Sep 2026 16:26:35 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA47E3F85F;
	Sat, 26 Sep 2026 16:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790465198; bh=18BAa8o4E9lvNw8wwNFzP1FIpKXx6SRGQiiHFQNFT/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vegZt+4Dru+hnxX89KGXOyf2wnZKm+shsFlnfiTbPpYispoyRFxWxoVRmpMO8y6IM
	 Lmv7M4/ECvjdExyThNWiINNxwALXjKqf/lVKaQLIoK8FJCi3hGwA+MXxIoWQuYS7rF
	 5T38ZgwJpioR0xK/WfKKcOmGQ5czwoXDSA7KxNc4=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Per Larsson <per@palvencia.se>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: a523: x96qpro+: enable Ethernet support
Date: Sun, 27 Sep 2026 01:21:42 +0200
Message-ID: <20260926232142.5244-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260926232142.5244-1-andre.przywara@arm.com>
References: <20260926232142.5244-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_162639_671876_17DA6E1F 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

The X96QPro+ TV Box features a Gigabit Ethernet capable port, which is
driven by the secondary EMAC, and supported by a Maxio MAE0621A PHY.

Add the required devicetree nodes to enable that port.

The PHY is not clocked by an external crystal oscillator, but relies on a
SoC-provided clock fanout pin for its 25 MHz reference input clock. The
clock is referenced in the PHY DT node, which not all systems might enable
before scanning the MDIO bus. To help with that problem, the PHY compatible
string is using the PHY ID, which means the MDIO bus scanning can be
skipped.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Per Larsson <per@palvencia.se>
---
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index eb9fd0a65b41c..8015473ecb7ae 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac1;
 	};
 
 	chosen {
@@ -72,11 +73,38 @@ &ehci1 {
 	status = "okay";
 };
 
+&gmac1 {
+	clocks = <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii1_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_cldo3>;
+
+	tx-internal-delay-ps = <200>;
+	rx-internal-delay-ps = <500>;
+
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
+&mdio1 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-id7b74.4411";
+		reg = <1>;
+		clocks = <&ccu CLK_EMAC1_25M>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ephy1_25m_pin>;
+		reset-gpios = <&pio 9 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.46.4


