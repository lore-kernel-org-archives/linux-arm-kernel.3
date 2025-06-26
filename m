Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08C8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTOnmcLZT0YNmgL9ggkghPy4yY+ApSCoU0DQJfvGIw4=; b=O/4Hl7h0imf1nRveBs1G9hkVCT
	/3irXuCti8x0GEhEhbAc9slQRE1aZxdQw37SNNhOTgpxGalIkzmhLvoSaWSS5Wb1bUbX+ApELU6Tx
	MmvL3P7gb5dvPXhI7NZ7APEFzEpULYUfnK2plsyqv1xJBNIQzanl4XpxVcyLp9LKCpdtY8T+Ez+AO
	pz8ExqAM2M9TGAKi/ZijgLvggMw57dPvygfp+7pS7IHyCMJ3daIjBzOex1+8tXC9HlG0gd4vpewSg
	hXIusGB6YRaTCGDGv1eLl2TormckiCkDqYCFVoxZy9eQiUIjdFlsHjw8sz9TTBYlVKRwpmuz/f3Ux
	JhZGTmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiKX-0000000B2nD-3B36;
	Thu, 26 Jun 2025 08:51:37 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhkF-0000000AvL9-1LPR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:14:08 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B31B71F0004B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 08:14:05 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 164B5AC7F8A; Thu, 26 Jun 2025 08:14:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id B8B27AC7F74;
	Thu, 26 Jun 2025 08:09:41 +0000 (UTC)
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
Subject: [PATCH 4/5] arm64: dts: allwinner: a100: Add EMAC support
Date: Thu, 26 Jun 2025 10:09:22 +0200
Message-ID: <20250626080923.632789-5-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011407_511089_6B45D4E5 
X-CRM114-Status: GOOD (  12.77  )
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

The Allwinner A100/A133 Ethernet MAC (EMAC) is compatible with the A64
one and needs access to the syscon register for control of the
top-level integration of the unit.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 1c4e71b32911..205faa90d37b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -420,6 +420,26 @@ i2c3: i2c@5002c00 {
 			#size-cells = <0>;
 		};
 
+		emac: ethernet@5020000 {
+			compatible = "allwinner,sun50i-a100-emac",
+				     "allwinner,sun50i-a64-emac";
+			reg = <0x5020000 0x10000>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&ccu CLK_BUS_EMAC>;
+			clock-names = "stmmaceth";
+			resets = <&ccu RST_BUS_EMAC>;
+			reset-names = "stmmaceth";
+			syscon = <&syscon>;
+			status = "disabled";
+
+			mdio: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		ths: thermal-sensor@5070400 {
 			compatible = "allwinner,sun50i-a100-ths";
 			reg = <0x05070400 0x100>;
-- 
2.49.0


