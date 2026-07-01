Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E23FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTokNJJPhiwC84lyIu3GOUx3hsJTak28hNBAGHupzns=; b=L3iiey+J1Afafne1bx/Qs1jdAA
	eBz8DcbUjZoP/tYPZBmP8X1zomYR2gKb1XwZ/TKJhHrqUZ/4/TAwYnkaKNnJTmm6V9ILptutHMUEV
	4CJOO5oc3AfX/kJa7z8gaeIlrjJB/bI89AlsmgBv2gFXor8bYMq0AXs6KnreRVfLwfcDVsuqFozuw
	kvNUnzZQEKvKsF8Nmcwm81C2K34PRq+4KehCS2IgfV5ySuA7iFk6mEQgP518FNq4Y5cGVjlR1eTUe
	76Ogt/gcOP5/S2vqEoaAOeIBB9o0GoXWP8aaQwq8D9PriO1HCxINcQ+gPAD8Xhf8okndY31GCmsvg
	hksVKaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetul-00000001pJd-090s;
	Wed, 01 Jul 2026 12:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetui-00000001pBb-3bdW;
	Wed, 01 Jul 2026 12:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zTokNJJPhiwC84lyIu3GOUx3hsJTak28hNBAGHupzns=; b=B8I74X4VsY2y7Wxn9WxmZo914j
	XSLvGPosm5qXXR7VCVeJusZAc2/f+6Ys4sVYanr9MYJRzjexm2O5QgbIJI6PW3jWdFtERr3GWhZvL
	WwZhqamERAGmSLWYmPWOHwlC2ZQqGjDrzXkYMsOxDxDaJBuoDUjAaMzr+vK1ZdXZkoWw+I7KcEhPj
	HyEDWA2UnJVl2aOcbgga/SbO/dl2IPN5JBHBZ2hXNfdiP+KeCGVNjn/TDc0Nw/aiPftDjXCjw9p1o
	OgHq9r+02sIX8ZjngqrPzm461O+nIpCyk+FUHb+jRcwnQulwB3WofCw/MXvcxmmvhzJr660ULsWTQ
	2GloFPEA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetuf-00000002iuM-41fp;
	Wed, 01 Jul 2026 12:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908372;
	bh=FP4PyTvgp8XB6N3XqeaC/sT6Tr0nsSIcWUYH3AkEMlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcOWkjUQKWqQYRgXsnf5FPTk9JOuD8+SHjfVcCSbCZ+JC5l5lo4SEdmiltcKKBmns
	 YB/whWE7SOUTK8lF9OijckzQ4z6mKZQaZ4yAdvXAplCyEY6fnt/k5w81njxktUZL/k
	 vSR1+iRA3Lwx58o4k/2DiOAyPLzJGHfea0BiQnc8BNgmKvLyzxyMo7Jiy6eg3z3uiL
	 hny3vj2KUPkvV8ga1esWNaOWpTgb1voaWk8TINh5hSTmzrtf8H+kbWvxFlLpR/KktA
	 yliEAlvBBVo6GBkcklLHbp2zzRtei7HHplDvmH02FGebFAhhsOI57ttOZPWYWLSIJk
	 LaxlQP+0OLwYw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 538F317E0FB0;
	Wed,  1 Jul 2026 14:19:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com
Subject: [PATCH 3/7] arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
Date: Wed,  1 Jul 2026 14:19:25 +0200
Message-ID: <20260701121929.19374-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131934_131001_5D2AFE80 
X-CRM114-Status: UNSURE (   9.61  )
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

This SoC has a DMA controller (AP_DMA) that provides one channel
for each data direction (transmit and receive) for all of the
UART controllers in the SoC.

In order to increase the efficiency of data TX/RX over the UART
controllers, add the UART DMA controller and assign the right
channels to each of the three UART controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 174aa8175ad6..6faaccbba580 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1059,6 +1059,22 @@ gce: mailbox@10238000 {
 			clock-names = "gce";
 		};
 
+		apdma: dma-controller@11000780 {
+			compatible = "mediatek,mt8183-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000780 0 0x80>, <0 0x11000800 0 0x80>,
+			      <0 0x11000880 0 0x80>, <0 0x11000900 0 0x80>,
+			      <0 0x11000980 0 0x80>, <0 0x11000a00 0 0x80>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <6>;
+		};
+
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8183-auxadc",
 				     "mediatek,mt8173-auxadc";
@@ -1076,6 +1092,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1086,6 +1104,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1096,6 +1116,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0


