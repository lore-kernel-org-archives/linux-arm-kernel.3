Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD7FCCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/hRVXihg0pwEu11e7ZxBGsFadqKMUgiC3TgtJlYnFY=; b=ZcOVcEg1TNksTKZLBJwsR49lXO
	XJKZy9baYtWa8OJsXKFVDVwn+Vrild2JDEgCeeNS/5Osaf3QtUl6zfdcXRsQy4eR++6mk54RSu+fi
	uOjMCsPU5AfwBT8juYBAW7xz9fZYjQhmJrCTCg9IvQI9EO1N3ciJo4+fU67os8W/QQHoDlYuwW947
	4e4ZjTBDxF7atYylsaILfv4F0TJ36RLdQJY23wx04jsrTvx2fkyJlWPEazB8lnqBz7meNw/Hw6gqM
	zsY69QDtlVnohtjArekSTEgf7PO4lf0Qo+QpjqV5VvLOvMBfFriw67ZuSOfJWOVKLVUPaMbaL3Pte
	F6OPN41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQG-0000000EQzZ-1Cwd;
	Mon, 20 Oct 2025 17:11:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ8-0000000EQsV-0p8Q
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=p/hRVXihg0pwEu11e7ZxBGsFadqKMUgiC3TgtJlYnFY=; b=RjIgsNTMYGtXaJC2H8TGFKVm2J
	dfbEqqwvU1FWXD0Ed/Ib80HrcpVmkwhq8LsYZyZAzlvfIjuFsiFTLH2BrxI9dXGJ+IWdAowUAwtQR
	dkBZ5XW47YDO+q4LaYzgHWwfu7U2DlDwV3HVTZ+qdG19NZuprgtWfxhAD3gWnUMx4oswgkWYWitu8
	kgHuxl86Z5qiDcS8EOky75qnaHB73icBWxnUYPL4Hws7vPpoWdMRr7WwM8FgS3MSEFzxTISM0jT6s
	jrYdE8Ut4RUE2SVKOH2ASbYAnjOum44FiwauFGFBH8fYal/SOfIteDTfE99nXt+Ryx8d+q53ai451
	aIYOLBpg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYP-0000000026c-0F5a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D86D948E12;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93322C4AF0F;
	Mon, 20 Oct 2025 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980282;
	bh=0ChEAhtAFbnQFbVJGkrrhKo/Uoy5YpaI4s6lIy/TvXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QFgPhNMI2Jj90qwqd7mDU/ZGMu+ZjcHs5w0mLa+IsNtEgj0sgkZnwc4paZhm33RCU
	 1LptkaLyQRXZkSYB9tWLderYNPCpMIqHX/Ca4CEdsm33tL5utK7qMOZA+7gX5vHM9j
	 02O9+o9Olcw2OfJJsLClQ1mmOXwIdW//v02t0gaiaWWOu36vhXhPZfoAImpEDw2iKC
	 k84LiAP8JBU9+ocen1vnga+nSR8ELeXrvBFsPLT30hR5/g+w/HhSSJyniNHy1rlEO9
	 F44qxeo4PQAcV9RGRUpNv9fG+TDjXiAZCaKNWMDQp6+Z5pcyUOa59afKNKQTTLsKY9
	 sRSdJjineEy7A==
Received: by wens.tw (Postfix, from userid 1000)
	id 667A65FEEE; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: allwinner: a523: Add device node for SPDIF block
Date: Tue, 21 Oct 2025 01:10:54 +0800
Message-ID: <20251020171059.2786070-9-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171613_353834_36859461 
X-CRM114-Status: GOOD (  10.15  )
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

The A523 has a SPDIF interface that is capable of both playback and
capture.

Add a node for it.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 8edbd3873199..33f991dbd00b 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -818,6 +818,21 @@ mcu_ccu: clock-controller@7102000 {
 			#reset-cells = <1>;
 		};
 
+		spdif: spdif@7116000 {
+			compatible = "allwinner,sun55i-a523-spdif";
+			reg = <0x07116000 0x400>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_SPDIF>,
+				 <&mcu_ccu CLK_MCU_SPDIF_TX>,
+				 <&mcu_ccu CLK_MCU_SPDIF_RX>;
+			clock-names = "apb", "tx", "rx";
+			resets = <&mcu_ccu RST_BUS_MCU_SPDIF>;
+			dmas = <&mcu_dma 2>, <&mcu_dma 2>;
+			dma-names = "rx", "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		mcu_dma: dma-controller@7121000 {
 			compatible = "allwinner,sun55i-a523-mcu-dma",
 				     "allwinner,sun50i-a100-dma";
-- 
2.47.3


