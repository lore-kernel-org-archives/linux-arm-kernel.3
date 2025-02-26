Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D443DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzjeDNF3Zm9UG754W0VlPYzIg9qdSC0/565pRQ58Zwk=; b=ui8dinXLHSrsHu
	da8JJK13PHNSZ2kTJkOoj80x3nuaCstn0uPUjC07VTyIj7g/I15YBhhxrC5e/NSB1wJbQ2XQqCt/S
	Z6yU+kF8a7HL8HtLmaOAk2J/QOo90ZANmiA8VZvENs7Js5Itjtq4T8yuCOZKLIjMMrNkzWlOou1tl
	deroSkR4VGfC0JGlpHGISgmSZELyMGYH1KEKTiZbfdlM+vq8/NPI25g0qMF0PR+gduk/4Spoe34bf
	BOBbv0xmeJHb/ojL3zfGxCMWVEdw4DKEligSjtv/0rKerKc95Lny2FvQwehY7t+Yi5KZc4R6paTNM
	6Ws1HAtppzqaXCoj66mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDAN-00000002yBu-3DWB;
	Wed, 26 Feb 2025 08:53:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnD7I-00000002xV2-3SKZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xzjeDNF3Zm9UG754W0VlPYzIg9qdSC0/565pRQ58Zwk=; b=EyYxg5
	/Jd+d6IpDKW5lmWTU7KUmtlLamRBH+1yr24CqTq3f7iZYrdclNTyYcjd5Oh43AHs
	1zRvj6zRgKZFTzvJDbZ6gnBFSAQgq6tI3KOhtQ32tF/VNE4vkaDaQIxLHnkYjRCJ
	sow82vhMNB651YYt3x0X1ue1TfewVkqV1etqEZbsryTtPi2TfTnC4pNgK88cKyFZ
	1ireP2KiGIOQz6pcCc4pQ1jAYWANA9HhwviqsNBgYp55D9ginnwj2E8IGIVLHUVo
	3yrKhdX68VNGjofmXAj8tRmmLeK/nsmra3PuZ/tsGkDaqoT54vEy69k8723skkSN
	lEEORrfNNjLLlBtQ==
Received: (qmail 500453 invoked from network); 26 Feb 2025 09:50:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2025 09:50:05 +0100
X-UD-Smtp-Session: l3s3148p1@ItvnqAcveK4gAwDPXxaLANR24ZQNPy5l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] ARM: dts: at91: usb_a9263: fix wrong vendor
Date: Wed, 26 Feb 2025 09:49:38 +0100
Message-ID: <20250226084938.3436-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
References: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_005009_777253_07FB68A4 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The board was made by Calao, not by Atmel.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/microchip/usb_a9263.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index 5caf7e337009..bc85d8aaf378 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Calao USB A9263";
-	compatible = "atmel,usb-a9263", "atmel,at91sam9263", "atmel,at91sam9";
+	compatible = "calao,usb-a9263", "atmel,at91sam9263", "atmel,at91sam9";
 
 	chosen {
 		bootargs = "mem=64M console=ttyS0,115200 root=/dev/mtdblock5 rw rootfstype=ubifs";
-- 
2.45.2


