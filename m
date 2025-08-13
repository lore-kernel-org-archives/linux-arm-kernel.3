Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AF6CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9QekULDTpKT2sp/tU5XfRCPn/3eOKEKt4xinUDGYWs=; b=ObjytGiDYAbaneq9Ubz1jtQUxs
	K+1U6In+ctf2qi8B5wBPAZ2e+rgNMbjQVF+IdibwT8YKBkhPWyJkizIDOBFbwSYWPZd90gsQBEf53
	1g1R+HkGWqpWaOP2KeSRVRTigctKLJ8M3NjqHg1eAwFiOve6+Buy/zm+nSqhPyR7PM6c0PAWhhvd8
	0IM4CwisyL8Ivs51zSzpM5T9Ev1vdoxQeg0sKCDkOK6mXfBUemjlH4v5Cn5r5h9Nq/EEJrIkR1/A9
	J3+qI3CVNPjlnP5BrnTm/YARnhOnTdlqsw7pr8QFFPT4W0TRy1KcU5lkFwCXwiGCLeckoA8ZakXOn
	0seCL1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um5wM-0000000Cw2P-2lEH;
	Wed, 13 Aug 2025 07:30:30 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um52w-0000000Cniu-2TDj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:33:15 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 14:33:01 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 13 Aug 2025 14:33:01 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Po-Yu
 Chuang <ratbert@faraday-tech.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<taoren@meta.com>, <bmc-sw2@aspeedtech.com>
Subject: [net-next v2 2/4] ARM: dts: aspeed-g6: Add ethernet alise and update MAC compatible
Date: Wed, 13 Aug 2025 14:32:59 +0800
Message-ID: <20250813063301.338851-3-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_233314_631317_E256CFE9 
X-CRM114-Status: UNSURE (   9.65  )
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

For RGMII delay setting, the MAC0 and MAC1 use the SCU0x340 to configure
the RGMII delay. We use the ethernet alise to identify the index of MAC.
And add the new compatible for MAC0/1 and MAC2/3 to calculate the
RGMII delay with different delay unit.
Finally, the RGMII delay of AST2600 is configured in SCU region and add
the scu phandle for configuration.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 8ed715bd53aa..6be17b18da46 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -40,6 +40,10 @@ aliases {
 		mdio1 = &mdio1;
 		mdio2 = &mdio2;
 		mdio3 = &mdio3;
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
+		ethernet2 = &mac2;
+		ethernet3 = &mac3;
 	};
 
 
@@ -232,34 +236,46 @@ mdio3: mdio@1e650018 {
 		};
 
 		mac0: ethernet@1e660000 {
-			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			compatible = "aspeed,ast2600-mac01",
+				     "aspeed,ast2600-mac",
+				     "faraday,ftgmac100";
 			reg = <0x1e660000 0x180>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>;
+			scu = <&syscon>;
 			status = "disabled";
 		};
 
 		mac1: ethernet@1e680000 {
-			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			compatible = "aspeed,ast2600-mac01",
+				     "aspeed,ast2600-mac",
+				     "faraday,ftgmac100";
 			reg = <0x1e680000 0x180>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>;
+			scu = <&syscon>;
 			status = "disabled";
 		};
 
 		mac2: ethernet@1e670000 {
-			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			compatible = "aspeed,ast2600-mac23",
+				     "aspeed,ast2600-mac",
+				     "faraday,ftgmac100";
 			reg = <0x1e670000 0x180>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>;
+			scu = <&syscon>;
 			status = "disabled";
 		};
 
 		mac3: ethernet@1e690000 {
-			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
+			compatible = "aspeed,ast2600-mac23",
+				     "aspeed,ast2600-mac",
+				     "faraday,ftgmac100";
 			reg = <0x1e690000 0x180>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>;
+			scu = <&syscon>;
 			status = "disabled";
 		};
 
-- 
2.43.0


