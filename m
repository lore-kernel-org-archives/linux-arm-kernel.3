Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B22F54AD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=marSnsLIsX2d4dgYBdyw9rsPv3vHzf9arg75DtZMQnc=; b=4AQYMxvHRfbEXD8JYeOw0zBIXj
	ufAe0HMUKlHmBYcDHh24vXjT3Enpl2JoTAIBLAabKYhHAmODlbTk3N42A3H35LLVacHxn9znKNYnE
	3prGm4WHhi2MeiGA8Z6k80PJx4sc++9hTPlkdRjN/mhiRK1kevw65TyDtk3o96Upgrqp4qDRV/UyX
	kmE/AYy/gfZFI2lrgz3Yk5YSx5O8YQZCKXYvqjgKhpcoJVDsdSD2jBmPdf/JeB+EddPI5ig320MKB
	5H4qud38I3O3TC2P55SPtztQgOQZixpLw4hQyQpFa1Bsv9POwtIwcvht0VQSqs5ofYouRoDUARwYo
	og3/mLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rb-00000001uWM-1aNP;
	Tue, 24 Mar 2026 16:44:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rN-00000001uNv-3LPw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EE49600C4;
	Tue, 24 Mar 2026 16:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACDBC2BC87;
	Tue, 24 Mar 2026 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370645;
	bh=d2usvZzl3iy+LSd+yBZb4LfU83ScHAI81Xk1hz8xX44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQaehjJr8t4bUSbUTEGVQT2xDGVv40IiShtPC8uoYCf0awgsoDTrwcYKHDbfREA+K
	 34UqJSiTmESYONEWMDK7dV6YNZUMqCzYTvVO02zVtp1I9TTiC5/gNa2p+ul7huAWxf
	 WFjl0c8qXVGFqh/hFdH9J5AsByPb2qW7MCAq0RpUIxLRzLPcfVPuCQ6xQcS0vn4rOX
	 VW31rGBGIcuhmbnw6J8YomWxFmFQGDjjBpW1ehkX32EnXiF7XNZyUlF+Q+hLEVOt+l
	 iignnGxW2yVpB5JEtsOjG6YcWqlEB50QJkOubK6CmFEWIhEiy8jCVf+nWaVYLGNxvD
	 L86M3xvBbXXAw==
Received: by wens.tw (Postfix, from userid 1000)
	id F22F75FFE0; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: allwinner: sun50i-h616: Add SRAM nodes
Date: Wed, 25 Mar 2026 00:43:55 +0800
Message-ID: <20260324164357.1607247-8-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The H616 SoC has a video engine, and two SRAM regions needed by it.

Add the SRAM regions to the dtsi file. The video engine will be added
in a separate change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[wens@kernel.org: Add VE SRAM region, commit message, and split into two]
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 8d1110c14bad..0c50a73def65 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -182,12 +182,38 @@ syscon: syscon@3000000 {
 			#size-cells = <1>;
 			ranges;
 
-			sram_c: sram@28000 {
+			/* SRAM C */
+			sram@28000 {
 				compatible = "mmio-sram";
 				reg = <0x00028000 0x30000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00028000 0x30000>;
+
+				/*
+				 * 0x0 ~ 0x20000 is partial alias of VE SRAM below.
+				 * 0x20000 ~ 0x2ffff is (partial?) alias of DE SRAM.
+				 * However the whole region is toggled together.
+				 */
+				sram_c: sram-section@0 {
+					compatible = "allwinner,sun50i-h616-sram-c",
+						     "allwinner,sun50i-a64-sram-c";
+					reg = <0x00000 0x30000>;
+				};
+			};
+
+			/* VE SRAM */
+			sram@1a00000 {
+				compatible = "mmio-sram";
+				reg = <0x01a00000 0x200000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x01a00000 0x200000>;
+
+				ve_sram: sram-section@0 {
+					compatible = "allwinner,sun50i-h616-ve-sram";
+					reg = <0x000000 0x200000>;
+				};
 			};
 		};
 
-- 
2.47.3


