Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C89C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZC9VvPKRVEBlgzTsa7Oy41sSlv/BAQxlmUs8nA5twA=; b=IuRUjF3d77u2bPkDBY9KLEXdOy
	HT3N0ZKR264NX0KNrR5roIqP/dEWY8YP9L3XgDAgevasSlJTTQCMdPxthb9S+waiKPxoFkBOEcUNP
	xDDkwEbT1NYw/VeMohMb5H7HdNVGvYCi9yG1LhpkLv9sjqmD6e/HH8fscUGuyN9UCF4ApSd3bUm1U
	01qwlPpgXL2l9M59cBomKpnXlh/U7Rbo4nlGDTUoN/vCmeisCKTaL7viVP6Ox42W/fbkPDhoGA0YI
	eTIFiBwPNmPPI4PIPqH5t5jfsSjVSRgaxr4RkU0UOBZfVNQuMwYn1l8HoMIW1eeFkOfNoDYN+ddXo
	6P/n4wOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u058D-00000007BVs-43Fo;
	Wed, 02 Apr 2025 20:56:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u051I-00000007AqF-1rmo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 20:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=CZC9VvPKRVEBlgzTsa7Oy41sSlv/BAQxlmUs8nA5twA=; b=EBzVnq
	Np3ujT6NMLvhJAyLG5/OCXlfpoRkrB60vdgSCVlndbpHBId3OpyjnrBDHDSi0Jxt
	OR/bZqNrStefxnvpnLSZ4oREwRP/poZ/8w5JByoqfAfgkQixpYd4lryPH+svleHs
	hwfBpcf/wdL3LcHyY8yakGodl6oD5VddgK7Kr6AtZ5ZnG3tU6qIxIUq5kheVYLYX
	D4aY0GuG5HvOVtYfbAyU+iGp9YgcVTaf2Qmpkr2Y9+J3CypoKB+QTpohgCUoYeHU
	WNGSGm4viqivjOq3LuOg0uKTyBSsiMtlIrBTOvypXY60tl4t1lN/o/dr2WWBUSOx
	NLUsfQhf9Q7rfWfw==
Received: (qmail 2132881 invoked from network); 2 Apr 2025 22:49:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 22:49:01 +0200
X-UD-Smtp-Session: l3s3148p1@w0RzyNExsLwujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: at91: usb_a9260: use 'stdout-path'
Date: Wed,  2 Apr 2025 22:48:52 +0200
Message-ID: <20250402204856.5197-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
References: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_134908_768473_98F0C090 
X-CRM114-Status: GOOD (  10.70  )
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

Do not use the kernel command line for specifying the default serial
console.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9260.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9260.dts b/arch/arm/boot/dts/microchip/usb_a9260.dts
index de19904e9e91..1de2864b4cf6 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9260.dts
@@ -13,7 +13,8 @@ / {
 	compatible = "calao,usb-a9260", "atmel,at91sam9260", "atmel,at91sam9";
 
 	chosen {
-		bootargs = "mem=64M console=ttyS0,115200 root=/dev/mtdblock5 rw rootfstype=ubifs";
+		bootargs = "mem=64M root=/dev/mtdblock5 rw rootfstype=ubifs";
+		stdout-path = "serial0:115200n8";
 	};
 
 	ahb {
-- 
2.47.2


