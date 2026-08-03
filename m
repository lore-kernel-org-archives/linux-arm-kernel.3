Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD292C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnplVDzOj+uqcS79QDtEIzGhp0w1Fui1V+f4mPC31UE=; b=noaRR4WX8PgwylMBHd4Rp3MqjF
	Bwiksueg3TH9UZpvqXCX+8nMXP0DxGSEne3noHKNCiP8f200hiO0LRVc+MlS8MYSSbXDfBHETse7z
	Na5EiV6urUrkmf3k9jz/YWur6Sbql3wRFrlG1L+FyoGB5euQ2SSsYaSOsK1eyYHZjYACKXG7MnT96
	fXWdtcQKizwNHtZY0Z8pZOGPEQwfTr8V30paXdhl/yn8VlitaKooxasr7wQMW9Rb8K5xn1dDrOTgE
	IItJoigt2n7gAXwg6rMFyfiNIwVvp77upkH44Ar4Z3ZH1H1mDjS9Wr6Hn3Te8MxPdFpKVnc67e6tC
	kd6KD47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphh-0000000Gp9g-2GBA;
	Mon, 03 Aug 2026 10:15:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqphe-0000000Gp7E-45A3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:15:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC4F7165C;
	Mon,  3 Aug 2026 03:15:21 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55AC93F632;
	Mon,  3 Aug 2026 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752125; bh=VqSq/RFgnYRFkrdByzSG0050K4hOTZSeg3klIsefLjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8rZGnfZxZfbkexDhrnLAo1lZg5wso/9INZUYurtRxpRj7B8bPg6xTk8nzMWCBSaF
	 9Zw1t9V4MSO7PN7u5CcloZo0nKDfp54uLwByTmOZWJ/SUqdGzWx2BoFWbjlCBc/6hr
	 uGWf8cAnHL7Hfb+DTP6ePo02wG0GlE7l/0lOOqRo=
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Liu Changjie <liucj1228@outlook.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] arm64: dts: allwinner: a523: x96qpro+: enable Ethernet support
Date: Mon,  3 Aug 2026 12:14:52 +0200
Message-ID: <20260803101452.2993721-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101452.2993721-1-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031527_053279_39AA6FDB 
X-CRM114-Status: GOOD (  11.07  )
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
---
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..568a4fae84df 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac1;
 	};
 
 	chosen {
@@ -54,11 +55,38 @@ &ehci1 {
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
+		pinctrl-0 = <&ephy_25m_pin>;
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
2.43.0


