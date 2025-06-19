Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD150C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCRl/sp6j76nRzOl2TGqZ/k2hE04Vcfe+znXwEAwJDw=; b=ZHvKe5i+Iv6CktRH/ETFCaM7PK
	GKvgKjLWc6rVngKzdkZ5C+4tUG4NLhbcENMrNMiqbMauVKioPFFOAVexV97qeiaHzEjx1hgKiEsw7
	RTwC0hvp12KLzLqd2tHLunlNb5/0CAFDDQwgiFVh2ammKz+2DqCHkTDILY9UIHxcg/5LBsNLBHH/o
	8YalXFnJBumXD4GuFTdgmBIZMB4MVgb66NEi5iD4ftNmkD8FvElIhqdRvamOspdiWT/4SdEHV8Xe2
	NDE2xNHkQAgG0V6tEuKOaLMVdrUWewML5mjLeEZmNz/4uZy2SliEZ89vSemL1vFyJUK/ZtSh4IWdx
	5JZGsVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDK-0000000E0Ge-04qL;
	Thu, 19 Jun 2025 18:42:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJ5b-0000000Dn3K-3shS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0704661AE1;
	Thu, 19 Jun 2025 17:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C5EC4CEED;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=aIr3qu6ile1nHg+g5aa59zKENPrBn3sv1ZGDJSdnhpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pnErTiIJQWLhrFkDH2xNIzoO7E9+xdWsnIw4zWbewhlj0MRFDiCcgP9c6B4F4Mt+R
	 N8+9L2m0yAb5mulJl37xOEI7jDJCz4pdhfq7LNCORJGeGzn8uFiO7it0RgA8G6ipLp
	 nt+v339QxXTJyhO8iO2ntQv9teuonONx0EIxmOrYfP69tzeIls5ZocT8bK5oKg7G3w
	 PjrH5IXxo+1lftGEYYWNL3UeoSzsLeRKOVjR8i1xSWBPnUN3PW8cRf5m/kghMAG4Vq
	 7gi2etfoBbx0e52alSkD51C4pfr2FpzyoSXHiJHR6G80+XuTHqXtL2h27In0KU/iIu
	 gbwAf/13nFgyA==
Received: by wens.tw (Postfix, from userid 1000)
	id 2C81E5FF77; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
Date: Fri, 20 Jun 2025 01:30:05 +0800
Message-Id: <20250619173007.3367034-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Nodes are supposed to be sorted by address, or if no addresses
apply, by node name. The rgmii0 pins are out of order, possibly
due to multiple patches adding pin mux settings conflicting.

Move the rgmii0 pins to the correct location.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 458d7ecedacd..30613a0b1124 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -126,16 +126,6 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
-			rgmii0_pins: rgmii0-pins {
-				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
-				       "PH5", "PH6", "PH7", "PH9", "PH10",
-				       "PH14", "PH15", "PH16", "PH17", "PH18";
-				allwinner,pinmux = <5>;
-				function = "emac0";
-				drive-strength = <40>;
-				bias-disable;
-			};
-
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
@@ -163,6 +153,16 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			rgmii0_pins: rgmii0-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				allwinner,pinmux = <5>;
+				function = "emac0";
+				drive-strength = <40>;
+				bias-disable;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
-- 
2.39.5


