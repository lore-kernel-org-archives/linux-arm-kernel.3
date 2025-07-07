Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD75AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2vnaEoVdfg5PhnfRsCRZUpo3SszFTgC7Ni2Y8+ec18=; b=vnPDOb5qLADk5bu7d2IDQ0vDgQ
	VpW1O1q/xEM/EI8iCA7TIEDoLj6xkKr42qrdxROPjrtZ32IIN7U6b/M0uYQbh/0uTX5iO0fsm1TX4
	tuGedk+wIsb9ofJvbtlEMxHoQU/MO8rK+udEC5av61yK5MdXGXnA64tDnRvitllaTH1ZzAQdtq/26
	u870SLp3AGcYoW3pT/KvmdmPV91OZ85tfDLRDVs25R+NwGi6fXGGAMbIU77ijf57xc8nBISSv498E
	si87wD4CH6E3W2epsO5Ea3x2HRXDkUiQlM3xl5y71MgnUEimJMYFOwxOCx24emKidbCa8ipTdMeJq
	a213vS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYq37-00000003Drm-321o;
	Mon, 07 Jul 2025 17:54:41 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp7S-000000035QA-2Pso
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:55:07 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1E0881F00047
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 16:55:05 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9D583ACAEFA; Mon,  7 Jul 2025 16:55:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id C1D24ACAEE5;
	Mon,  7 Jul 2025 16:52:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
Date: Mon,  7 Jul 2025 18:51:55 +0200
Message-ID: <20250707165155.581579-5-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095506_768800_402BD082 
X-CRM114-Status: GOOD (  13.67  )
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

The Liontron H-A133L board features an Ethernet controller with a
JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.

Note that the reset pin must be handled as a bus-wide reset GPIO in
order to let the MDIO core properly reset it before trying to read
its identification registers. There's no other device on the MDIO bus.

The datasheet of the PHY mentions that the reset signal must be held
for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
be on the safe side without wasting too much time during boot.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
index fe77178d3e33..90a50910f07b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -65,6 +65,25 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii0_pins>;
+	phy-handle = <&rmii_phy>;
+	phy-mode = "rmii";
+	status = "okay";
+};
+
+&mdio0 {
+	reset-gpios = <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
+	reset-delay-us = <2000>;
+	reset-post-delay-us = <2000>;
+
+	rmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdc1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
-- 
2.49.0


