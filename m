Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4295C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFLLICAaBRVRM21szC7qOLSSIrKtyMcQMcSJ22HcUek=; b=Ljeu78bFoTucVNbNsbOlWh/5rp
	NWcmTBEcKLc2hVb/ZULw+drw4sTNjCsPhDIlak2fcaHIka+608bUaGM/M+v3qll0x8ZrC4ytihxXP
	bYMtW17TdLFc6ZfUiFd4v32pbLwIvCifhCr5V+tdZAIuOyKoidVoMfzSVnAEhbyA6eK51RUwYNOKd
	56FHGTu7QJ9mRff4bqHYe/8S6QkSlaiAFdCLY5TvcHeDctal3Ymm7yHYKX9m6INCypubbpE8HVBUW
	a8M3vO1cNrjr7oRNCOcabvr9UW+DCeCNJ9QD/p+T7tmmODMukhsWzBGl4e0qFm06hAeqA/5ithbu/
	Un4vrC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVUq-00000005HZY-02tx;
	Wed, 21 Jan 2026 10:31:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVUe-00000005HUG-0M1e;
	Wed, 21 Jan 2026 10:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 197124416E;
	Wed, 21 Jan 2026 10:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1E3BC19425;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768991478;
	bh=Zy41UwtVc78Y7hlHNkNvuMf7hnbnIw6ZTXc0eFogMko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FCMwyh1o7SWaoHVIGii+6tVQpFDHAxDN8dx2u4A6PXKYNbzewqIj6RxYq8LYMsbbf
	 1wD5u37qIFYvLKXmWEoeoSpo+CsjuColYqF0b9clu/24KJg5JlBkchVGfo1i7KNz8M
	 SCophZVXnXCfPn20P2mKu8t3NCCxdxOQFSWfhW1TLCkvCIdioJriHwFwOHiKDLyyFG
	 x1kPvbeg3tkgrPMDF1EL/ple/BTPc474tnkmh4RDNMKl3V5E2XKsMbN9rKQK39CJQJ
	 NWke5z/MYK7QH4qOy5p1wsXD1D9w9HX4C63tAae8LyR2Ot3xRzPZiJVxiCHC8An/zV
	 NGt2FIWpF5i1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5F3C44501;
	Wed, 21 Jan 2026 10:31:18 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 21 Jan 2026 18:30:41 +0800
Subject: [PATCH RFC v3 3/4] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-s4-vdec-upstream-v3-3-4496aec3d79e@amlogic.com>
References: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
In-Reply-To: <20260121-b4-s4-vdec-upstream-v3-0-4496aec3d79e@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768991475; l=1534;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=IzNXt2+VyFRVs1Y87t2pUqlUvtHK8Yc5ii/YgU+Xf3g=;
 b=xx4IFR50dTvR+IhoaSdyB9ewHO/ihu8C/le7zGIqU9cauI5USp2V62XmZWrQG6Xyn6pDqCTaP
 dN6f7CPzI+OATv8nm6k8GloH5TIl4kfEPREWeVr7nZvAcdz0mqLPX2i
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_023120_167944_FF56A822 
X-CRM114-Status: UNSURE (   9.37  )
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
Reply-To: zhentao.guo@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vcodec node to enable Amlogic V4L2 stateless video decoder
support.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index dfc0a30a6e61..b8355e41d550 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -862,5 +862,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vcodec-dec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			amlogic,canvas = <&canvas>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "vdec",
+				      "clk_vdec_mux",
+				      "clk_hevcf_mux";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hevc";
+			resets = <&reset RESET_DOS>;
+		};
 	};
 };

-- 
2.42.0



