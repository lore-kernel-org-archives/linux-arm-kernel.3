Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786A8C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBuzrJXAqQ9DZMn4N2wiFwDhlwVQP97BeWlGzpcl+3Q=; b=rk5Fs5T5O/dK8x1+d2x3gKrRTa
	lwjDyK63r22P/sDVdBZ4lDlLDZGmOh71+MwM0HWQPnIpYEQAtUGJOkQxouLtDr5xqNmju1R+ok2mD
	ZbIhlf6XruUHg/TdPxho6L3zbqFwCH91Q9ISnAoFN8InhzmK2qe0qG22LE0+/lCpwH1rLoxzw3/3H
	pDPVaWcE4iVOTnBs2DyntmJw8eblDB2OHTV/AfrLpyGZaaSZgQGA1+msQsRj+nr4Vf20LNLeZYX6y
	6sbUaIQ4Ky6Xef0SJJn3KWYqDBkXbIVOL0WK43F3ZNlhkA7jPUdGm4U9k9763c0UwhZh5yqiTdSDT
	V2H/bNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhdi-00000006aIW-3V7Y;
	Tue, 01 Jul 2025 20:31:38 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhTr-00000006Z1g-07lR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:21:28 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 74E871F0004B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 20:21:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 020C1AC96BD; Tue,  1 Jul 2025 20:21:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 07126AC9684;
	Tue,  1 Jul 2025 20:15:44 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 2/2] ARM: dts: sun8i: v3: Add RGB666 LCD PD pins definition
Date: Tue,  1 Jul 2025 22:15:34 +0200
Message-ID: <20250701201534.815513-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201534.815513-1-paulk@sys-base.io>
References: <20250701201534.815513-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_132127_221358_C9051829 
X-CRM114-Status: GOOD (  11.78  )
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

The V3 supports RGB666 LCD output on PD pins, which are not available
on the V3s package.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 arch/arm/boot/dts/allwinner/sun8i-v3.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi
index 186c30cbe6ee..95bd0b616349 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3.dtsi
@@ -56,6 +56,15 @@ i2s0_pins: i2s0-pins {
 		function = "i2s";
 	};
 
+	/omit-if-no-ref/
+	lcd_rgb666_pd_pins: lcd-rgb666-pd-pins {
+		pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
+		       "PD6", "PD7", "PD8", "PD9", "PD10", "PD11",
+		       "PD12", "PD13", "PD14", "PD15", "PD16", "PD17",
+		       "PD18", "PD19", "PD20", "PD21";
+		function = "lcd";
+	};
+
 	uart1_pg_pins: uart1-pg-pins {
 		pins = "PG6", "PG7";
 		function = "uart1";
-- 
2.49.0


