Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3536CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXKyxPjuYkGU/mYtpWwDPaNRvu4Jio3sqsDJOHkv/VA=; b=3ekjmAYCphWGztIoQC2cA7wRfM
	rKGocQRVy4WmEAyk3FlEG857tx8J++Bwe3DVrg4bYL8amlZrPJ1dZhIRiyJhz1mlMak3g+DkKjSx7
	uFSRPFs/S5vPA1YzGvA6uuXRxphqyIrMUgTGmXu+wpRQ4OMAJvq5J/PpNFQkkAxwZB6JT80Ni6A5z
	ol4/M5kMR4rITCbq7moFwYs2GVw2x+MBjc0C8M+ALWDAjQTwWSqutygsDlfoNA+NTOKoR3Asedujx
	m7stLLJW5it3fwwxV2nHKZ5MIc5T6ntWMHldc1SDJu364BA3Nv4vgZdJFtXL63ff6XeC9rKhTZlvd
	5Y0dfPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7tE-0000000DEvz-3lz3;
	Wed, 13 Aug 2025 09:35:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7l7-0000000DDsI-1Nka;
	Wed, 13 Aug 2025 09:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QXKyxPjuYkGU/mYtpWwDPaNRvu4Jio3sqsDJOHkv/VA=; b=mx//W7r9CpowkAry9HEE1f4s92
	gi8ySjtRT1/2T4dl61xn53DDG1MmW/jS+DEuiz/VUvIMc1Y/pFyifbsgev+5iIVS0uUeIT3mUOaXh
	/0LGInRcmM8wzXocFOfAHh5Kj26IAEfTFE9IbduO1umWRmaLbJMd1y/z/3nWtgV9eArg1n7iN1XuQ
	eEPn8p4xz43k2chta3LxbzXaJASHpbQvW3Io9jXLutYQHmjRa9voFDU5OH/qbfkJfQ3vlyD/cxDko
	+1p8zUMyCXLU9JAXFMnGsxYqHzS4zXhaVol4twZdEmqechatp03b/LLYzxHZlr3vIg5CRRKqrw7QS
	2nBoJhKg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7l4-0000000G2Cl-1h62;
	Wed, 13 Aug 2025 09:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755077213;
	bh=uCyPLhhjkqbdeJ7mORJ4vVbhOFgLVZuZgt0PEPXp+uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F5kha3WemExHwqzNeSWWs/vGXTRU5awJoZmAsnDuPAfngKKaHypI4MarIkgsLA+j1
	 VQoSFEPfVVmeN6mLRyncgEiAWuXxjVwZrXXQRsSg7WbEnehEUJzW1u9OMxypcgGY13
	 yCPRQalMvZEX7HGA5MF/diQMJ6bLCp+XgOISdiwfEEKXZL8kK9er9UtM7GTmT1/XhO
	 XBtbAEXHsX3wFTCAB7t7JyZ7Dh5rVX+4nTQyikD0Jl0omGLN+yeolBYI3Ws66rgvmh
	 E3qED4jt6iTo0JCyw7MumhtBoyphvmIql1KYJTLJcywKba14NpZ/XfNSHRlx74NwS6
	 0DK8YTSpI5Brg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8F1D17E01CC;
	Wed, 13 Aug 2025 11:26:52 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 13 Aug 2025 11:25:43 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8365: Add GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-mt8365-enable-gpu-v1-2-46c44c6c1566@collabora.com>
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
In-Reply-To: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077211; l=2491;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=uCyPLhhjkqbdeJ7mORJ4vVbhOFgLVZuZgt0PEPXp+uI=;
 b=nsamGrmvDrQW6cvxe7D8qeoDZ4ybZmT09f9gZb3kcVisjMx7EGGHF26YE3+bRfMkqLlhWsDHq
 Eg1fI2YskX1C/PjZZ4MgylHh1bZY5KbV/O7GDrauReUi/Dl+kynRnDl
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_102658_594791_9E48CA81 
X-CRM114-Status: GOOD (  11.36  )
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

The Mediatek MT8365 SoC has an integrated Arm Mali G52 MC1 GPU
(Bifrost).
Add gpu, OPP table, and MFG clock driver nodes in mt8365.dtsi to support
it using the Panfrost driver.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 41 +++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e6d2b3221a3b7a855129258b379ae4bc2fd05449..6a7b4f58918b22f51b792f3a99bd777acf72df9d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -267,6 +267,24 @@ clk26m: oscillator {
 		clock-output-names = "clk26m";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-450000000 {
+			opp-hz = /bits/ 64 <450000000>;
+			opp-microvolt = <650000>;
+		};
+		opp-560000000 {
+			opp-hz = /bits/ 64 <560000000>;
+			opp-microvolt = <700000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -292,6 +310,27 @@ gic: interrupt-controller@c000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		mfgcfg: syscon@13000000 {
+			compatible = "mediatek,mt8365-mfgcfg", "syscon";
+			reg = <0 0x13000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		gpu: gpu@13040000 {
+			compatible = "mediatek,mt8365-mali", "arm,mali-bifrost";
+			reg = <0 0x13040000 0 0x4000>;
+
+			clocks = <&mfgcfg CLK_MFG_BG3D>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_MFG>;
+			status = "disabled";
+		};
+
 		topckgen: syscon@10000000 {
 			compatible = "mediatek,mt8365-topckgen", "syscon";
 			reg = <0 0x10000000 0 0x1000>;
@@ -398,7 +437,7 @@ power-domain@MT8365_POWER_DOMAIN_CONN {
 					mediatek,infracfg = <&infracfg>;
 				};
 
-				power-domain@MT8365_POWER_DOMAIN_MFG {
+				mfg: power-domain@MT8365_POWER_DOMAIN_MFG {
 					reg = <MT8365_POWER_DOMAIN_MFG>;
 					clocks = <&topckgen CLK_TOP_MFG_SEL>;
 					clock-names = "mfg";

-- 
2.50.1


