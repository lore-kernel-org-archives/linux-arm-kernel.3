Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F93CC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uBIA7QN2LRdc1jNMD3SO5QQvHIgcF56NzfNZYhpArdw=; b=a+AlvX+TAr712cO8v7yIDmJE6r
	KoWN5srSaWncj5pIDv2NWHWC664iCs3DgASpgbcL9WUpeYgcAzisujt8DWyhoZnHlXbTr8JhYxpeb
	939glmnLj0gFxK6fR9/4RazIslH6qzhplX563BlRIor7QIOZzeMd+2m69WsueDqP3vgXaSexJOV9p
	DIiDMNUkgT0wmunnafQhpoggfEgin4+LoxzL6OwQOj2mHNRSBUSJ4eOCd5LWbnlcWaVvWp9g/Czui
	k7VMRipPRfFHqWR3A1BHgzx+jXeS/0pnT3zXu6Ml79uNX1RsmrG0NmnsYZQh2hmGAuDOFEn1LGRxB
	mc92/Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0G5x-00000006vBR-3aWP;
	Sat, 29 Aug 2026 10:15:29 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0G5v-00000006vB2-0V5O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 10:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1787998523;
	bh=0LHTVujrq1CsKZO/WoUYdjGkoWUNdaiGEWftAdeIzlY=;
	h=From:To:Cc:Subject:Date:From;
	b=ZqGNPIOITjQWzyL+NvuxtEQn4v4Fdsb7eCIibL11gt9L3Wdmwv4cK2Z7ZwxA/2wp+
	 E8WHqR0gr7Cd5l214e6tx/fZF5gbXXY9VHfEEAompHJ7MlU2YejoenPNuNvvX9m3xr
	 2ahk7cxxlIxz2opYg0JSMqCi1ju1tav1aYji4kws=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS in Bluetooth node
Date: Sat, 29 Aug 2026 12:15:09 +0200
Message-ID: <20260829101509.138284-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_031527_336330_FDDD4C94 
X-CRM114-Status: UNSURE (   9.15  )
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

The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-rtscts'
property.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    Changes:
    
    V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node"
    
    -v2: Drop max-speed property. It's only supposed to be used in some
         cases, which don't apply here. As this was the "fix" for getting
         Bluetooth to work on my device, which will be applied to the
         driver instead, the Fixes: tag was removed.

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 8a635bee59fa..95964be7daa8 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -875,6 +875,7 @@ &serial_0 {
 	status = "okay";
 
 	pinctrl-names = "default";
+	uart-has-rtscts;
 	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
 
 	bluetooth {
-- 
2.53.0


