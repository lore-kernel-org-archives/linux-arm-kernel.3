Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD00C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMWGrMZL4Nj+QgrYjwQjicY2dtZresrFXSJZmvC3DZI=; b=KagZSQAzprWvzAszs6zKojoh8k
	sF4H3MugK0vD9TOudpE4Hy3GSOLovgVLEbVPunVJtFxmElFTndzOgy4Y1p893krrM2wJlHwF2iA3y
	hzm5rwh+sOjLfbkaYFmRriq3C/LW1Wcv/JvDCCNc6iFg3aBiIYCrsuFCathax0/JvFACIGIKfyBN4
	o7RJakrYhq3cIwjwmRqDJ3FgUp2BfGT+eP2kv7xJZnQSuDIISqEHGWTrty1KGaviqRjlv8768XINk
	AZdvi+QJxWpBPi+O7i5G+Z8bYG07XtBfg/1efzbBONAD3KDG7lhDuzUpSx5l7SRSD9Ezt1tV1gtS6
	endpga0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2c-0000000ExXe-0uKl;
	Thu, 23 Jul 2026 19:25:10 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2Z-0000000ExWc-1Alx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:25:08 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 587388005E;
	Thu, 23 Jul 2026 21:24:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwqy4N3yN4_h; Thu, 23 Jul 2026 21:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784834698; bh=DmJPtAysp709Y2CnVk1sHYjZws6rXevfNZSuuVeapIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OMArMF+Y0VidHl1WBfhFAOGK2iB01e/08BE/oT0emnrLGJxLYSlyn+gRUEMeUWKgA
	 HWqAQeyUdYMaemT8A2XY6qOzpI1ojPZilyKv1SX06HJUF0crwZqhkJBvsBqNSbFkEl
	 kCh7sE/9TeNrOKSdJ0y4aTXjBJm528X5AF9bGVbJlGVuuLdbHQTi2HPpEXphPEq+/7
	 vLdvEMgYGFdc2zXRf+hZUrf3A87sltZEqhSxLo3Jes3i7lPm48IqVoQY9RhGDAHkYq
	 1uFAn5P7uYxGX76JxbEEKzjLamHKiLyTIcH175nnHwz59vFy/A8w+3Gyj89Ez+H81q
	 QOxJ5GBdpdSjg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Jul 2026 00:54:07 +0530
Subject: [PATCH 5/5] arm64: dts: exynos7870-j6lte: set mode 0 as default
 for zinitix touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-zinitix-modes-v1-5-f6df7d86a878@disroot.org>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_122507_469698_041417A9 
X-CRM114-Status: GOOD (  11.44  )
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

The ZT7548 chip in the Galaxy J6 is actually able to support mode 2 (the
recommended mode) just fine.

However, the downstream kernel driver utilizes mode 0. This creates a
problem in the aftermarket world where fake touch digitizers only
implement the bare minimum functionality, as used by the downstream
driver, to compromise on cost, which leads to such chips implementing
mode 0 only. To ensure touch works on those devices, set the default
mode to 0.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index de30d0970336..bd8f798c9810 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -424,6 +424,8 @@ touchscreen@20 {
 		touchscreen-size-y = <1480>;
 
 		vdd-supply = <&vdd_ldo34>;
+
+		zinitix,mode = <0>;
 	};
 };
 

-- 
2.54.0


