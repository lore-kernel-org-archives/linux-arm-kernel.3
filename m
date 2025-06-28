Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545B0C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrb96SxxEVgsiYgVihXKhwehFCAAm23cbJpHVkIhPRY=; b=0dpPG0kjWsb5yZK8vgrsmncUXn
	fpLC7CDdTeFv5QU8jkwKTFSkpUQvVo7Hitd9kZwZ9IorI9yWXG5SbkrCtdOfbJ9ka72wiJZlUqwD8
	IuXYFdO+BXjK7tzjuk3J5pvnCgmBdrrdybLTSedW4+zbPHQg4c2Tux/Aja+NC7ezgRNObPd7otTfW
	YC1HczRWRWbErV7ztczVcHHHOLP0cBWBxchGiltxuJsEtcBmxFHoLEz0ap2q/CkHtv9wSZJ0hpJsS
	T9+orxb8APNBCHmR1HtgmKe9SvFeIIMwZx1vLiQzXX2mrcGU53OMRMbL0IhW3dLWYJnVfPQWlNElT
	NpqRIOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYN4-0000000H1C6-3Crn;
	Sat, 28 Jun 2025 16:25:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYDt-0000000H08R-3yiC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 16:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADCBE5C53FD;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED521C4CEED;
	Sat, 28 Jun 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=TsjHd3vjaRE+OZ1WrugGGMN70hthcmgsyxPq1MteFRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nc5hGm5GBbtw3D3dPqsb/52Ew0xXsKR7Zy5Q8mVaA5PavGyFyqy1Lq+P0pBGNRs2q
	 c3cGhPOlTgUwc+YN9mn9GBm9KaqsN1tPFPGdySqtuckkxuCFEMeg3/OmE3+/Kft+BP
	 a+R50YQrlJP6lYxP5wbnm+YXEr+WUiHSqCs9GU8TC6x4N1M9tb7Je/gGwLOD3vOxGA
	 NbcCa2b29qEBiCL5yVkQEb6alI1rUa/+eFyxT8ZfgfjFZ8r/QAADXSx/TkJDRt93mA
	 60gwtW1BlVRPL+Hh/q3ypK2TfYFUYciRICDlDRSdixI69iHZ3NXbx5W+5wTTk3JgKs
	 0mSzlTlfP2Zsg==
Received: by wens.tw (Postfix, from userid 1000)
	id 57A9B5FD53; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
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
Subject: [PATCH v3 3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
Date: Sun, 29 Jun 2025 00:16:06 +0800
Message-Id: <20250628161608.3072968-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_091614_035909_FAF4F951 
X-CRM114-Status: GOOD (  11.17  )
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 490f596cad6c..4839411e51cf 100644
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
-				function = "gmac0";
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
+				function = "gmac0";
+				drive-strength = <40>;
+				bias-disable;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
-- 
2.39.5


