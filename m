Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB31F54ACF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=leOlxLANT+C3xgMs59z/YGP1AA9RAUAS+voGaGnrJwI=; b=hSTRzrtLP8lqeDHTBM97XM13X/
	jLon9icws+E+Dvf+5BSTVnuI7fRp7BiH3QfbHxRfRtqDTmzgSuH/LnMhUmuoBJrleMO7w5DfPZDwD
	rfeupBymNnHInJ0eOpPHfnidPjMksEzRHdvY5ffHf1cVZE0PzPgRq/vYIf7vvs3S2vJ8iYYGj7i+K
	NX++qUCQ97TMbn4q0hQ0J7wBJ914FMjZo8s7IdJzmuFXwGq1D937rE/uchmpAVaWqeZ2aF/bhzoOH
	qhdddKJkGH8K6zitf23OkGdKe7uvRnGPVfIrQMGo5NwWVQoHxPdrmUvlejmvLT8dk4T9PJaSgbrTy
	YOjaeV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Tj-00000001sYH-3f48;
	Tue, 24 Mar 2026 16:19:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Th-00000001sXY-39bf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:19:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E038D600AC;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A06C19424;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774369176;
	bh=OOoOHuRKnfY4pEIgmq0rR3HB4Sgy5RohzLtXdcbQlig=;
	h=From:To:Cc:Subject:Date:From;
	b=popDtLTeN25BTHrI27WnsvkVsSv8K+tiyhbH7yJVKfjRGFDKC3yv3MnF+UxqeGDJt
	 P0YeqRYwMDfjrAxQ8+RbOTJHlTwD7722oJtR5LTGt2LFPe4C/vvC+ZvLSNfmy72Es3
	 r33085vOTy+LeoIsXtvIS9wCyEUDJgyHk9w74SToFX6uNMtrvlNdGdD+5Zjb/Jbu7X
	 zb//NFvP6NpJr0RDU62HSqVzdql0C1npAc7inhWzXoMPWsEeBt0tLZjORXRtq0bxh9
	 QMH6K7qSWLoxH76f7isidoB95UGc2veq4UoXvP/4scN44Uz9txxxRq0GZXPXGHNjcQ
	 2w5ztWgtZD46w==
Received: by wens.tw (Postfix, from userid 1000)
	id E883F5FEB2; Wed, 25 Mar 2026 00:19:33 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA channels
Date: Wed, 25 Mar 2026 00:19:28 +0800
Message-ID: <20260324161930.1602083-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
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

All the UARTs support DMA and are hooked up to the DMA controller.

Add the DMA channels for the UARTs

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 0fecf0abb204..04a26762a19a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1000,6 +1000,8 @@ uart0: serial@1c28000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			resets = <&ccu RST_BUS_UART0>;
+			dmas = <&dma 6>, <&dma 6>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1011,6 +1013,8 @@ uart1: serial@1c28400 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			resets = <&ccu RST_BUS_UART1>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1022,6 +1026,8 @@ uart2: serial@1c28800 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			resets = <&ccu RST_BUS_UART2>;
+			dmas = <&dma 8>, <&dma 8>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1033,6 +1039,8 @@ uart3: serial@1c28c00 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			resets = <&ccu RST_BUS_UART3>;
+			dmas = <&dma 9>, <&dma 9>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1044,6 +1052,8 @@ uart4: serial@1c29000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART4>;
 			resets = <&ccu RST_BUS_UART4>;
+			dmas = <&dma 10>, <&dma 10>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.47.3


