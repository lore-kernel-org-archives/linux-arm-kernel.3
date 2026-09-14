Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EFFC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isoDZwX6W1vqdmHogIuC7VTxQkrMw87Syh8xJfMxyB4=; b=oahOzJdDD7Ex6X1EpMH/6XsQnH
	BZsjDdMiz4BuqvvQeALmKmtQ0oois7jivNVABpyEdE4CXZIaDd+yxZdvDdvRatRpakmHBCjakFGtd
	NAJ+f++W9o0kGAwPmWVnGHwBKDHFZEEl7IjCgW2qBLK16akQadClBmIROJgp+mgtOR1w6w6j9pbjq
	kbWH+07Ac7XK1h48q9ZukEuU5aVkomIyZ8/abI7+8rTi/eXzUa7DHYMnbOE2vyOgyZNIVUJqOuoy9
	sZ/19pSsBU1uEbY/t4iZ3ovt+j115EWrb84px5HiunTmz4gJTQCsERys0iBtrQ8WkoNGmQ+TO7ffi
	7/OUAS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61m8-00000002foi-1vt1;
	Mon, 14 Sep 2026 08:10:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61lj-00000002fV0-05eQ;
	Mon, 14 Sep 2026 08:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A9DF601FA;
	Mon, 14 Sep 2026 08:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08BBFC32786;
	Mon, 14 Sep 2026 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789373426;
	bh=lwJXVr3wc26b+3DxMp3usk6z4LJrnsg7CkkD3KcfV3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UsKN2WzVRq3Cbb1cdnLE/EmusX2BsRxlJoLLUvBUDsw7/RD67kfC9VTu4xymlXrKK
	 B3yGMKtAZ3/Ezlh/AirikIB0D1hTIHp4xMRArDd+UE989GXii/wv7fnsCM1rebMB0M
	 OAtDmBaYnx8z8/RzXS4hQ+sfQb/O6vcJDqlb3sYOcQ6baBKeb9TRLA4wIQ/t+6v7qy
	 F54DAJHvGTkWy5twd7PbwIyU6L+C8uGvEewzKmHHenmai4R9jy42vSZor4TCt8A10g
	 Ni737HApULR3m4cjUNhzWvorJldFhM2cQd+KqEayyGzoMRs9nubuSS1J3pLTbp4qNE
	 QdcCl/uOcTkXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9679C88E6C;
	Mon, 14 Sep 2026 08:10:25 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 14 Sep 2026 16:10:22 +0800
Subject: [PATCH v9 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-s4-vdec-upstream-v9-5-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789373423; l=1809;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=H9IyUCO85svTK//eBl/nrcLMkGvELMBTFbFDRfZO4Og=;
 b=TyFJRBe//V50cIkGl76mxLDD3OV0/mV8Q6EPSUGAt0ND8X2dA1JaB94rRd3+2h0YMC4hK9zYt
 OhAJtBbcoNTAQxewrFAwExWEe8IJO6+NMmQEilSSpIoYp0lWGnThJ6p
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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

Add vdec node to enable Amlogic V4L2 stateless video decoder
support. Since the video fw needs to be loaded via TEE helpers,
enable the optee node in this patch.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..d62e93a28098 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -80,6 +80,11 @@ pwrc: power-controller {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	saradc: adc@fe026000 {
@@ -907,5 +912,33 @@ emmc: mmc@fe08c000 {
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
+			compatible = "amlogic,s4-vdec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "core_v",
+				      "core_h";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "dos_v",
+					     "dos_h";
+			resets = <&reset RESET_DOS>;
+			amlogic,canvas = <&canvas>;
+			amlogic,secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0



