Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D76C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltywIMjiK0H4xv3BCFs9zbvJ1WAMuOaSMXABEg1vJsY=; b=iwgh6QvfMKzL5HiYy/w2vu96v6
	XIjBSlPvleAYUPvGoC7XLKIAjZIOVD1AwDiEzfjnrKTDnji8hSBBxvSVPM60EuNXI8O2ifodan/TP
	KheoGhl0LIgPCt1q0CWXZ37XNOpKdiFsNdA4w1LTgBuuDPQfCcvxqQBIDlFyYCasFPungA4muOol5
	PpgvYP9gxTS0BW13cy9T3tBGc/T009wpAdAxut+6RpJQIX9WDGT1T2DhHB2atefLxrFzYRJ4q8B0o
	V1r5sDK2mMA4s20EUim9ou3MI9UOG1DQ/3hnNWcUomXmQC7n6X4XJNh+A/bhK7k8gzhJMxv02u1nG
	Mk4V4fxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiFs-0000000B1aB-3Wkt;
	Thu, 26 Jun 2025 08:46:48 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhiI-0000000Auoa-0tOY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:12:07 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id AE7431F0004B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 08:12:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 29CF0AC7F88; Thu, 26 Jun 2025 08:12:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 89D1EAC7F7A;
	Thu, 26 Jun 2025 08:09:40 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 2/5] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
Date: Thu, 26 Jun 2025 10:09:20 +0200
Message-ID: <20250626080923.632789-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_011206_401968_2C53B136 
X-CRM114-Status: GOOD (  10.41  )
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

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index bd366389b238..1c4e71b32911 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -236,6 +236,21 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			rgmii_pins: rgmii-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
+			rmii_pins: rmii-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				function = "uart0";
-- 
2.49.0


