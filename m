Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFE6CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HK5aUNHJuGOqzYfYTsVDKq6LYb/5EHw2h2TCmhcXuI=; b=CWZZnuXO0UaBBkTFtOu15t9uwc
	y2AeC+YEcDhekgppWqJxAwJkoXb5uqyxyvlve3nc19D99WglOXi4KstKdhRpk9693MZPpajwbqCFs
	+9IzmCrZaR05DOI9s65v5fGCtXqPQBM/g6VSlyIA0y2Ozuj5QN9E0uqPHIENoDSF8jb5xaSsVWCRu
	HA1+yKXeEjbobFpdgc6VDSVkHvMekkN8ifePE9aT4vnuvrZfEFcykPNGYzccHqatakcX3zv0pnaon
	1I/vQHhTjfkGFdvEopfhZ3A4dd/F6O0nwHDMsl8vcQ+IyVAinsV1OmN1KTZpzP7A0z7kqwnDP6/gP
	+xsoPu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBj9-00000007mA6-3fKI;
	Sat, 01 Nov 2025 13:33:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBj5-00000007m64-0u73;
	Sat, 01 Nov 2025 13:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762003979;
	bh=TML+7NIpD9ku6fMMNJ4M3sDNuPNu+rMvX1U1RKvDE/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fS5BHcvi5NKG+PayXkzDIFxY7Y8m/3TPgiARnEqyD6D3CrOj9z3utuHzrvbZXwhnJ
	 kXnsg0GSmRMe3nTgq3T9YmN4Xo1hAHjEe5UUAFdsFnFP4MX6HY+ZRw5ZkiXuTQaprE
	 9Bb69eiqABYmuEpO5zHfwAqhHlNAETVAF04/CkeTT3xLukM7J9Zlp/7JNMOJMMnhq6
	 aXj72/6mY5Di7+KnE9vfg7LfwnRti9EmJ9gI6ZGWSM9rqTmLx1H6Ov7xDOccXMJJ6y
	 zIfefG8sDXNUVjw1mA1tkGOWgfvTqpZ+ht4/Xia735EskZ6IjWT6Mo0ay6wqEJq5uy
	 K1v6mSQQwOrsQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA4E317E1091;
	Sat,  1 Nov 2025 14:32:58 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 88F2410E9D02A; Sat, 01 Nov 2025 14:32:58 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Sat, 01 Nov 2025 14:32:46 +0100
Subject: [PATCH v2 01/15] arm64: dts: mediatek: mt7981b: Configure UART0
 pinmux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-openwrt-one-network-v2-1-2a162b9eea91@collabora.com>
References: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
In-Reply-To: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_063303_921908_DC69E546 
X-CRM114-Status: UNSURE (   9.79  )
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

Add explicit pinctrl configuration for UART0

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V1 -> V2: Move pinctrl to the soc dtsi as it's the only available
          pinmux for the uart. And very rare for the pins to be used for
          anything else.
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 58c99f2a25218..4fa35bbf0a9cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -102,6 +102,8 @@ uart0: serial@11002000 {
 			clocks = <&infracfg CLK_INFRA_UART0_SEL>,
 				 <&infracfg CLK_INFRA_UART0_CK>;
 			clock-names = "baud", "bus";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins>;
 			status = "disabled";
 		};
 
@@ -229,6 +231,13 @@ pio: pinctrl@11d00000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			#interrupt-cells = <2>;
+
+			uart0_pins: uart0-pins {
+				mux {
+					function = "uart";
+					groups = "uart0";
+				};
+			};
 		};
 
 		efuse@11f20000 {

-- 
2.51.0


