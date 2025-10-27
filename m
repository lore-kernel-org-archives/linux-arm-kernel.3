Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D23CCF9F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIPN93vEVZUhWKya9FooFrwQkLLx299e1vk/G/qCOLY=; b=xfhlk6P82ZvCD5N/2Vzfs4uX2P
	FKGT+iUvGOsfRFJRSNYEli1LD6vBykLoNvh1iJ3mBEW/yCPUT44jI9nEV34I30zNnM4aSqi3winyU
	xfg+kNJqMyNJBrVX8RXMYms8uNnVsirxMFCojDTIjaI2E7ZERpjnnhO33F6VMsFAQ3ELH5Wqwdxd9
	RwewZJK8hGbuXIR+fLZ4ikIKkfuEvDxfaQ27j6/vqxddjwLV2kt8mhb48I2819IxlLf4oy6UL52Qk
	Tvsqhxxj0HGUcTZQfsyk+GGzvR9XVQcOG1CmE0pPPNwktCohxFe1lSonll1ANmWmPTLhQ7Y14KeJg
	SeNvQMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmh-0000000Dx67-1szJ;
	Mon, 27 Oct 2025 12:57:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmc-0000000Dx0m-3cBY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KIPN93vEVZUhWKya9FooFrwQkLLx299e1vk/G/qCOLY=; b=Xs17OtvfLFSQcnqTiNZ8izY9QY
	rrAGMQftSqii9sEJ8G3gs7bkC5RL7Q85UdzXCZE1vhSFpHZ7llIcwPjxTHh+FDNi4Yo92sY90jCPG
	KzQIarVNQlsGnZjy4PX3VJQZOY447XJ2Ajo46rdREvf7pX3G+dDxUgiI+Eza18FTV/KwJPEHajjlN
	om6LhVdp47QgLosAGw/XxExQdIcbk+KJKdBT7gesyNolVufslXBsn/xlZ1dyYASKMMQfU1Ze/ZT4z
	HxMgmGew8nLzRpgZr1v0pmjliAd1Ov+2OuepxiiAODmhi60D5pEIAnrMqFYBr7pM0hBilvOtIH2/S
	fUGzdm5g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLuo-00000002737-3H6B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B076459C1;
	Mon, 27 Oct 2025 12:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1EFC2BC87;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569822;
	bh=7WylpHCfl5v2xSL09jxwrG9Ik/L6u+sN2kDjKM+sdbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AytX+UM2VJpPevBJmVH1Guw+dpV6MPA9jbKvvQQHiS7kw9AfqGTx0FrICPKUZUkXe
	 6e4CkYRLhzVMvy9sfDOv4HX/uKFcb2Xhp8o3JgnjwFvQbtA0Cw+EzT64dtVckmdoFz
	 6asLarvlAUHXRrNNH4kghjBNEsz1CdIdiLz9bhFE8+cyEPA3z3C+C9omB/nvfR6C2R
	 GLLFeU4geEafPxvRycr9XsIIfF6i4j2bCzOclYbNvEb0XEmyTJ6R4py5QrsHBDFZeJ
	 btAiPlc5igKle+32Ffzt5Se1r0B2XjcnRSvWzPd+xuKic36v1TwvSYeduYk3jdLebl
	 2Q73IV9Kql5Fw==
Received: by wens.tw (Postfix, from userid 1000)
	id C5E7E5FFAB; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] [EXAMPLE] arm64: dts: allwinner: a527-cubie-a5e: Enable I2S and SPDIF output
Date: Mon, 27 Oct 2025 20:56:51 +0800
Message-ID: <20251027125655.793277-11-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120135_322654_65CF3958 
X-CRM114-Status: GOOD (  11.48  )
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

This is an example change.

The Radxa Cubie A5E exposes I2S2 and SPDIF on the 40-pin header. Enable
both.

In this example, I2S2 is connected to adafruit speaker bonnet, which
sports a pair of MAX98357A for speaker amplication. SPDIF is connected
to a SPDIF interface card for PCs, which has both coaxial and optical
outputs. The output was connected via optical cable to a dumb SPDIF to
analog audio converter.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index bfdf1728cd14..828d101d28e8 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -64,6 +64,46 @@ reg_usb_vbus: vbus {
 		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */
 		enable-active-high;
 	};
+
+	codec: audio-codec {
+		compatible = "maxim,max98360a";
+		#sound-dai-cells = <0>;
+	};
+
+	sound-i2s {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "I2S";
+		simple-audio-card,format = "left_j";
+		simple-audio-card,bitclock-master = <&dailink_cpu>;
+		simple-audio-card,frame-master = <&dailink_cpu>;
+		simple-audio-card,mclk-fs = <128>;
+
+		dailink_cpu: simple-audio-card,cpu {
+			sound-dai = <&i2s2>;
+		};
+
+		dailink0_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "spdif-out";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
 };
 
 &ehci0 {
@@ -101,6 +141,12 @@ &gpu {
 	status = "okay";
 };
 
+&i2s2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s2_pi_pins>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -344,6 +390,12 @@ &r_pio {
 	vcc-pm-supply = <&reg_aldo3>;
 };
 
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif_out_pi_pin>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.47.3


