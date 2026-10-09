Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21CECA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agWwGHXgK3UuChHnrrojdFSSW6O1V9Ukr8rkgt6PGR4=; b=Ig+6n/EyIbSLEVX3UVGQhnOpoa
	1HcVhE7e4rwc4i38Tnth+O1wrqLw2QtnVpwoLYhz8FbiE5/NnYznU8BA0P9F9tX5C8wR3F8Okg5LV
	fh3lJE+eqwHZlHkbHFUB3fNpzzS+ortC5yazXbjbJusEjmBAkJllLunViUP75Bc4dlyabSegFJ39N
	6k75XfWZV/AboV5a7++CMq9ItKg+VLa1A2Qo61N738f4Qm54xARlWUSeaAl47j21MZgP1ziUKjU5v
	uRaNpqhtN5MH4/OxLQWGLR3ELKAnLsXKQ/lktpBjIWPpLsb6DVMPioP1cjhikjkz7RuwkyNuFVHAf
	+1ZxwlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAbs-00000006NQP-1yip;
	Fri, 09 Oct 2026 13:26:04 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAbp-00000006NP2-1KAg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:26:03 +0000
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id C63E01FCCB;
	Fri,  9 Oct 2026 15:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791552359;
	bh=agWwGHXgK3UuChHnrrojdFSSW6O1V9Ukr8rkgt6PGR4=; h=From:To:Subject;
	b=lIGo8bBrCKTKfhfYSf9QZ/9JZOIAKXtPCe68uTxF7jbjoLY1kme2FGOsaARonQXZ6
	 Wig0yuePcKbwCFw5w5cUBBwElBhdnWx2cyzJ6n2va04xUocr4rRAaqW0k7Ei96k0vo
	 vrAr5RK09si7iygjrulqTxIburt8T0YfK5dr7fTg+iNitVfFN0fbRftgEG9CkkcjBM
	 qDpIkwWs11eZOPm4udyXc/5yIJqXQdzTYiqdg9Ob5gJLzQYFy8cI2IIyKXva76NE45
	 U5JNuHVHx5y5gTF1vKDsL1B7e57DMbP9Rg342sjg7uEps8Lv2ckjh5cn25m3IU6Ph0
	 uVqBNeq7K7yHw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix USB_A source PDO to 900 mA
Date: Fri,  9 Oct 2026 15:25:48 +0200
Message-ID: <20261009132550.20793-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009132550.20793-1-francesco@dolcini.it>
References: <20261009132550.20793-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_062601_614081_FFA0B933 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correct USB_A source PDO from 3A to 900mA.

The USB_A Type-C port on the Toradex OSM development board can source
only 900 mA on VBUS, but the connector advertises a 5V / 3A fixed PDO.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 566671b32308..8bebe4d8afa9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -207,7 +207,7 @@ connector {
 			power-role = "dual";
 			try-power-role = "sink";
 			self-powered;
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 900, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
 			op-sink-microwatt = <0>;
 
-- 
2.47.3


