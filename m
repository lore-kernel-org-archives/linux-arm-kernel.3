Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2DFC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idhPvN32LaXpizNmAfnsvkXfbWjFwcLTH+e/hbfjRzQ=; b=HlAKCrYfHIH5StMVh/9YjRgonF
	MjEd4oWoQVClHBH6nrt7WwgujxPQVEsgNx+5QSjPnTpqKTwkpt7vZ0RSqxPCdCv9wgxzsUXbFP6AJ
	x5kykimesg+VkzHRgCNCdc+4UEnxxNgVoyRoFPIn1Zg6MfazVYHobmKTvdJrLSR6qrYrdf3sG0B/h
	45y42ngN2F2u9iKmEh76Hokg37nxfOhePYmBeAZs9UFM2lZSK8XK/yZEkFNLfFfae17QHizVILKHD
	rnWyGWTjrBdtv/e2uV0vsAqJsi6hIqXj4Qy8uTZDi5zRVPF2EDbNfE+0wc+PbL7wCMpkdbkGZjc2t
	ZDiPKs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetul-00000001pN9-45VD;
	Wed, 01 Jul 2026 12:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuj-00000001pFO-3SF2;
	Wed, 01 Jul 2026 12:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=idhPvN32LaXpizNmAfnsvkXfbWjFwcLTH+e/hbfjRzQ=; b=kU6u7xU6pABeuWzNA/B4potkvz
	ESp2DLo4E0nmDVDa3K9oIvX3YtS71A+3q6dETGo38wRBXKlbZilsX5/sOfan+ZBpe1WXaBbVAsvGp
	hz573xEZ+YKKoHwSskq+Nn29AtQuJQoIxZtqMcrgfUAlhHN6R3rRA9MnmHtZa7bSHmtcciL4c+n+y
	/8Ytm+Bxg9iZfJV4nsnU2d6JrFKDDgWueAwTw5cRDw0p/2ibYtwA1wzOmCThP2t3/yV7Ak3d2wR7N
	3J0kIJXAM7f1XqJhncA7mlNU7nE4u/XsRHYLgWprsTH20aGFzmZBrYCyBxbbKMqt8rPsRodayKyys
	JyYws42g==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetuh-00000002iuc-0KSH;
	Wed, 01 Jul 2026 12:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908373;
	bh=E1CBk7APT/eenltiF4Kqbk0fUMyDWyiwKz3ErWVdHxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXWkJBtgYUjAz+A2EaCfYJg8FPKgJ2dp5Npivukgi+7imoGSRFNq07oR3hlyAkEpB
	 7M/zELTldgZ4ZOh49GIunPR0K8x8Ru6QBw92XH0N0A/oY+W6FWdMj/JInn83ByE9rp
	 FOCALyttzH+s258kiBzBA20+j0bj5iewk0dP5nzrxso8EGdjBmXDo0I6JwXXxH3l0i
	 DvcV8Z1+JJodtt0l2AeG5IZdd2ja75GMOCBjv5B5sGWcBpmZL/qJqw6xAyiSZNgslA
	 7oiIQkLpXiSChMwS0WWNMLxF8NrniaAzNaQEIZMXr9N2hvz+V8PcWX4ut/DjQeg9m7
	 G3T0F1Qukoe6Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EACEE17E116D;
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
Subject: [PATCH 4/7] arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
Date: Wed,  1 Jul 2026 14:19:26 +0200
Message-ID: <20260701121929.19374-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131935_246431_CAF94F13 
X-CRM114-Status: UNSURE (   9.71  )
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 3fa85185e2c8..3784c1f38620 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1134,6 +1134,22 @@ systimer: timer@10017000 {
 			clocks = <&clk13m>;
 		};
 
+		apdma: dma-controller@10200d80 {
+			compatible = "mediatek,mt8186-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x10200d80 0 0x80>, <0 0x10200e00 0 0x80>,
+			      <0 0x10200e80 0 0x80>, <0 0x10200f00 0 0x80>,
+			      <0 0x10200f80 0 0x80>, <0 0x10201000 0 0x80>;
+			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 377 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 380 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 381 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <6>;
+		};
+
 		gce: mailbox@1022c000 {
 			compatible = "mediatek,mt8186-gce";
 			reg = <0 0X1022c000 0 0x4000>;
@@ -1210,6 +1226,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1220,6 +1238,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1474,6 +1494,8 @@ uart2: serial@11018000 {
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0


