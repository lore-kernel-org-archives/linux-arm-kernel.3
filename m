Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D809BC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC60muLxgA5f781wiV0s9cKPuxR3Pspssb6H6zvzYbc=; b=skioINf8a7kTYA9Vicf+6sK4Ac
	GDxx80gfkPYeoqfVb2WdHvGxdnhBC7dxx2zTIpwCMDWq+5l8lRkkV04+eogb4yK+r2lbT4xBYZYUl
	ISLNAUv3PnXPtTMrsJaG3+3eavqQ/nN3+bhI/e8GdiqGWbRI1tqMrF6VP548HKkrkNL7Tfs9RTYWf
	fscLaXW9Yo+MmUdu7xkKu7kxWLkgVjkGjWwUVziuKl0znPnsuSwlpbKxOG2FzkDZaa1F86lbnUTI0
	plRvcnJ3uBmX2XLE5WMNC2DSj0yfI4WZEw8zZJsFSoVjd7aUq6FhUPQfEWpUalI86jdfQ5KyD84O2
	ABM3Cb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMn-0000000B39d-2DG6;
	Thu, 26 Jun 2025 08:53:57 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhl9-0000000AvX3-2lEM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:15:04 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id ED6601F0004B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 08:15:01 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 49095AC7F8A; Thu, 26 Jun 2025 08:15:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 6F66CAC7F7C;
	Thu, 26 Jun 2025 08:09:42 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 5/5] arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support
Date: Thu, 26 Jun 2025 10:09:23 +0200
Message-ID: <20250626080923.632789-6-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011503_851018_87EE8B13 
X-CRM114-Status: GOOD (  13.51  )
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
index fe77178d3e33..04dd7f781894 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -65,6 +65,25 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-handle = <&rmii_phy>;
+	phy-mode = "rmii";
+	status = "okay";
+};
+
+&mdio {
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


