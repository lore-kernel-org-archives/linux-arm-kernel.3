Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC1DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mMkApyIviwgjNGP53yywhnyZBKW4nkYb6GZmulufeM4=; b=NCZghi4ri3mP3Q3CsdfR5vk7ZP
	k0rKa7qCahvpLeqBnl4hLsDx8ZFun9xg+VlUKoNilWYjyv5U5zF4N2HwUC3tbnGrabat0jiOdPWAq
	lWm2tBMybzUIhyvi1R/hHQ5XS02+SOYS/SE3R/ZR2NAPOrjeC6C0KyVrChHsL0HPfGoOWsMCoDotw
	/haH2SipLdKdD9mQGKp5toV7kUu+K44V0MVXZDFRZsMW1vO5Pp9tPzuXsBEEkTHXhvMoNAXW58YSW
	lotk0qckLwmXlhTXNkBE6nbxYSmE2zYSITOLCUUqzsWZh1hoGNU1SYbTUO3nvTPC9vvfhQb3P+yS2
	e1pYVnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9ar-00000002k0B-16Zl;
	Wed, 13 May 2026 13:25:45 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9ao-00000002jxl-1c6e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:25:44 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1778678735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mMkApyIviwgjNGP53yywhnyZBKW4nkYb6GZmulufeM4=;
	b=dqcGHZiQN58x4IPPdCp2jAbA+C0mABFjwNoaFF883c04K/O8ROemh2Jjl6HWQXt8o+NT5L
	W4J8KLTktYm4/C+UcmfGS8L1AMP9sEXv5/73q+iJz6rL7V1clY08wmVlN6Fl+IGsCR+Tsu
	9r8W799ZwrVz1HuDpfOsvxihumCY1E8F1FoxL45bo2z7exQrQ9mxHMIMhY7fQKPkzlVFdh
	JvXjmzZa5uoe3awod5uzfvGxXQ4SUxvW0sY6HZ20jWFbyNZz6b4QKw2xFyZMZjGcaoFaSW
	wzwAGBwZ84uitc5N/NX50nv1cd58/NkMm+9WC5PeQHZD6NbLBvut3WP9xU/P6w==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-kontron: Reduce EERAM SPI clock frequency
Date: Wed, 13 May 2026 15:25:31 +0200
Message-ID: <20260513132533.589783-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_062542_851713_C6CC822C 
X-CRM114-Status: UNSURE (   9.27  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

There is an onboard level shifter for the SPI signals that causes
additional propagation delay and renders the SPI transmission
unreliable at 20 MHz. Reduce the clock frequency to a safe value.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
index 0924ac50fd2d..75ae46642782 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
@@ -63,7 +63,7 @@ &ecspi2 {
 	eeram@0 {
 		compatible = "microchip,48l640";
 		reg = <0>;
-		spi-max-frequency = <20000000>;
+		spi-max-frequency = <16000000>;
 	};
 };
 
-- 
2.54.0


