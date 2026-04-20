Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4677BF588C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SgxE5c1jYTStJfualncVt99hbYma370L6L8f6RT420=; b=lM0TeOC+XfvL6hyRGH4ZX4I0tX
	jwKEWTQDKp+z33hLhvQJADxuhCVdGZ5W3/fjCPCisFltQaIS/8Q0rol61OnT7FnKFUM0Q/E9zbAqE
	gD6NWIaA0Ye8Loivv28hM4JWpE5mi8oLezgbuMLWpr2kf0nHvr93Fy6VMDi8KW7UcvbfW8MzYgbR1
	GTT6AqVmDOuUaq6L0s82lNEWe4EvPUDV2wPCl9oLzJyrD7xUY8SPIFYcYfm5r86lEUsQMugfIO6O5
	pomCWUUXRAjs9opwBBQ8feb/GsqfjhiHLMYaBwCV7vKMJ13Ar+UBcxcBvywyXq6BWbXJ5VSFRTfwI
	ZZNZMK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEodR-000000070Fm-0IGY;
	Mon, 20 Apr 2026 13:25:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEodP-000000070FI-2VRP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1061360055;
	Mon, 20 Apr 2026 13:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654A6C2BCB9;
	Mon, 20 Apr 2026 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691554;
	bh=wqssYkH7wHaSK4ZujMsdTPYU7wNv3OKuWpGpkDZUxoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RuodTQwBk2ujQrrxOQgXBU2Jse3oOIWcIixuHeftwkx2rhEnzLP3MJ/NJiUxRd9Et
	 AgtfegnkE1HfGOxw7v+A8FhoPFDN2ag8GhW/g/hViIg3APupWM/NpelHO+TVAsxFuL
	 bicxbzrSzjIfObZBI/5XUW4FTaPiRnTCcmBhxtjWx65k0tNPtliOq3I0P2VnPwk+JN
	 de+ymWYLk3uDr2OWc1ZegtMUoX8LENc9+WZa1YoqlZ23g0MsTbfTrtsRtTDj/eXYCA
	 mFx6DCz/2tOPIXD4sI+xqjT0kPrXi09EfgGsIvAE2hZg4+l/ffvxqqd+Y7CnHAhfKQ
	 scBkY3zuGIH4w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mihai Sain <mihai.sain@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sasha Levin <sashal@kernel.org>,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	varshini.rajendran@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB
Date: Mon, 20 Apr 2026 09:18:11 -0400
Message-ID: <20260420132314.1023554-97-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
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

From: Mihai Sain <mihai.sain@microchip.com>

[ Upstream commit 907150bbe566e23714a25d7bcb910f236c3c44c0 ]

The pioB controller on the SAM9X7 SoC actually supports 27 GPIO lines.
The previous value of 26 was incorrect, leading to the last pin being
unavailable for use by the GPIO subsystem.
Update the #gpio-lines property to reflect
the correct hardware specification.

Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
Link: https://lore.kernel.org/r/20260209090735.2016-1-mihai.sain@microchip.com
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201dd..d242d7a934d0f 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -1226,7 +1226,7 @@ pioB: gpio@fffff600 {
 				interrupt-controller;
 				#gpio-cells = <2>;
 				gpio-controller;
-				#gpio-lines = <26>;
+				#gpio-lines = <27>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 3>;
 			};
 
-- 
2.53.0


