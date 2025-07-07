Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87244C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHcmKkBpPPrNDi3uyRoIbsC2CJV7aIiUXNOmkgQtYQk=; b=rLliNk7D4kjYffEmn+gIKNab0I
	2Mp4zLhXT+ccAaadpaWRMwsJuuF5sb3PTQT5wcQLevdiSWwvDY23DoQs7fN3UiMzY6UjzhWOQ/gXr
	daiXn4YEspkguYuXf0QDMpt1jmyzbGzQZZ1CKBxgAI31WkeARzuYZvNdd49eR3BPSU2ef+U85ttNq
	/x3bvrvFGfraxEUU4Mmqc5e5EEx7Es8opxIBSUQjJLn8iRCSDEqvRVWdHjCusySuLyifbIXvKhQw9
	QWG/qUvMW1tmVcXhJciic/0KCEeTtAdypVdmlKOkCrVoS43A8XDX6VUuk7gWXepAQFZjEJgWFmw/f
	HOzru/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpyX-00000003DFh-0qLk;
	Mon, 07 Jul 2025 17:49:57 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp6O-0000000357p-1GOq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:54:01 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B0ED01F00036
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 16:53:58 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3D9EDACAEF4; Mon,  7 Jul 2025 16:53:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 25322ACAEE3;
	Mon,  7 Jul 2025 16:52:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
Date: Mon,  7 Jul 2025 18:51:53 +0200
Message-ID: <20250707165155.581579-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095400_493172_17954A53 
X-CRM114-Status: GOOD (  11.79  )
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

The Allwinner A100/A133 supports both RGMII and RMII for its Ethernet
MAC (EMAC) controller. Add corresponding pin definitions.

Note that the sun50iw10 die actually includes two ethernet controllers,
the second of which is rarely exposed to pins. Call the first controller
"emac0" to distinguish it from the second that may be added later.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index bd366389b238..7d5be0975371 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -236,6 +236,21 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			rgmii0_pins: rgmii0-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				function = "emac0";
+				drive-strength = <40>;
+			};
+
+			rmii0_pins: rmii0-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10";
+				function = "emac0";
+				drive-strength = <40>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				function = "uart0";
-- 
2.49.0


