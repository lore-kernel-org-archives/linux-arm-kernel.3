Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD84C60A6F60
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qY2awauN;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TeOehWBJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=; b=qY2awauNaJ9No4
	TKkr8gevSyJXQGthaZbF5WT8QtOukoBkD8VQ832HRiWzk3TruJCuiM18zm208zPApoNV+c4h0r0EP
	0qYJBUcb7cCZqUqoCdXsvo0t3isfSpO/sRoePDYML/XyEYkyA0YvAG0qCJj+hE85oxM2csKdf/jex
	AA+vRWcpNfzoq3gNOv8NZUW7Gft9FhOF7UOt69Mgu04qLRnGITPNx+nInkSaCOGJ30wv9OpJN2ddJ
	LUmfLiclW5h+Jl+wnTiES/gS+OPn2u2PIJPUUKxfZXHoo/Pt8gTOiSIildO+DepPYbyfY1nozxszZ
	8KT46Wl4Qcd84dOsB6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Aj-00000007UWe-2vYs;
	Wed, 28 Oct 2026 16:06:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Ab-00000007UPu-1KOJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9271925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203592; x=1793808392; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
        b=TeOehWBJKSJUiRRxNfH84vo0awUn4Mqb7hki3BwHFZhITYQkayIXcCxGTo7iw7Kvu5
         hPdrPBwZkudyuegJwAg21m3Vs4gNruN5SBvs64SXSZ+/wtdXsJMMLEZSz66WJuMfmRV4
         zmUle1+FjH9+/mf4iS7sXNkH7EsSUyh2EFAOwwV+UwcwX2PdcnKBLButpYvZSPKv+iOU
         IPNsODhyNEv+aPvhvOHg+05ge2R9+35ZYKLw53V33T7PNonx6HLyCUOTJlu/EDOyWvBh
         UelSbATZ1XNkwjUIa3tSChJ1HoCFaaxk4dniJoHtj+PyJWILJXGZ7772zJy3N6cHdUc1
         qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203592; x=1793808392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZA+lAyHuDEsFhqEslFfArNJzGGWxbNE92ukEzZuxNI=;
        b=CqQTPre90s3OsYJ1wnDnnIn6yYmaWD1xDZHWtjIP1aO2Jfbx0JFW3n1qbNvO4RFyWv
         S576zxrWGlis/poXyAgVaGnNxGASRh4KjGXugCaJlisgQ6+rABKbklFcaNYEyjS4RhO8
         pWWmD8Bv8h+MvjCFeKSXQvdS1tKmFte6zXK3RVlkpdfI8qKwq+LChy/rCarVg0zEnIXw
         RR0VKRo5cygdTr8HxKNlLglzDvc420g4CXY+kZnrMV7BJQv8pCaQ4BIVE31p4AtFbTgX
         WYOmkBsaky/5eSgZd6CX8BK5NzF5cCyqFryXYr2Wy2BiGRIPBuXfPi/9+qli+hEmzLTX
         sEPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo10CnvIg2Ta4IxoNsaxIzgcQhzXmzWCmzKPmNRuFlQlNtyNxTr3VEWXjQ/wYGuI5dxNH41xfnSN6joFFYb+LI@lists.infradead.org
X-Gm-Message-State: AFq9FYJLoZZ4iz0fmeDJv4bl2qZGRc/sDG9Xyx2UE+WdvhZr498GzRmj
	ca8atWwAcLThGpV8FXkrKVzthPDnTwN57VZtEx5t9lykEH0i3udT7wJ4NNnKmi/vKV8=
X-Gm-Gg: AYBFou0Wk6Aon6afgrFxVc7Tje8xmNe5xLCPYWZ+63wrW1rIENxX507EG8Z/aPixYoA
	asb5ZWiiwGjMV99OzLZLRg+IAlW1HTdz3kHiuXV5GLooVOFXzf8abnQl0DRhD3RCdv346gVktlp
	aBSeKeLtgiwL09k50ry1PzRo72GiUzUvkzIB0wRSo+v0V5HvCt1yOBy6uysinfmqSyd+3g496E8
	E8nvTkkPpmGc6rJf4mgmnJzRko8fbN0sjXTJ/5tz825dqTQyRyWqb3pjORgSmNouzfygfhz8C22
	4PZyuhyykwHu4JR5FJkr5SORHC4Ojtmtg2X60jRcew1edplBFXlw61VzId8VR/Fvj+zTSQVP/+R
	AfTlHvQe6DmGREvUiWF8oe89XG9qRiNM4ZH7gB59w1zOwI62a1f4MdEmeN35+o3c90Vb1Tu8b1g
	jSZsDk+jJw8H07iLvSWfbN8nmmlJW8fisYgTU6tZVlX3+utjWI02RSL+Jcs5rVPJuhMPF9ApB4F
	uk0WS7GJiQI7lp+nvuelYy6Au1A/RTyMYRc/6YINK3iLyvGK8W1NeRUimzi7Gs/ZpHWuOtEj0et
	zZKbeTrXDcn9toMLkB6VXc5I7NImgcFaPNsfyGo+6pYPLo0CMbYId1k7OycezeGwsncPryb7v7p
	whylTgJDyhlfueCas5teRgpcdgQ==
X-Received: by 2002:a05:600c:3556:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a9678c3cadmr65712265e9.35.1793203591617;
        Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:31 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:08 +0100
Subject: [PATCH v2 7/9] ARM: dts: omap: dm816x: Remove hwmod code for USB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-7-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=2202;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=Ny6o+8O75PYtwR2Tbz8N21c8sCnj9yIYkNJzjWqiRRs=;
 b=e2Cm89NUh+NWLAqlSGnjPS9Qu2O++UotrEcH7tte7NtpZVzxvOd9M+H4nKGn+8JXxX8PSH1PL
 NQS5foBIQrUBlTbY4ZPammQ7bf2KFpxUI4ifneZh92O8oRNb5O/qxZD
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090633_592701_A1F43CB3 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Remove the hwmod property from the USB controller node and the matching
code from the hwmod data file as this is now deprecated.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi      |  1 -
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index b839ee29e9eb..55f4b91fa1fc 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -576,7 +576,6 @@ uart3: serial@48024000 {
 		/* NOTE: USB needs a transceiver driver for phys to work */
 		usb: target-module@47400000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_hs";
 			reg = <0x47400000 0x4>,
 			      <0x47400010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
index 9b5c728fb7da..b9735b507d6b 100644
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -646,26 +646,6 @@ static struct omap_hwmod_ocp_if dm814x_default_l3_slow__usbss = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod dm816x_usbss_hwmod = {
-	.name		= "usb_otg_hs",
-	.clkdm_name	= "default_l3_slow_clkdm",
-	.main_clk	= "sysclk6_ck",
-	.prcm		= {
-		.omap4 = {
-			.clkctrl_offs = DM81XX_CM_DEFAULT_USB_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-	.class		= &dm81xx_usbotg_class,
-};
-
-static struct omap_hwmod_ocp_if dm816x_default_l3_slow__usbss = {
-	.master		= &dm81xx_default_l3_slow_hwmod,
-	.slave		= &dm816x_usbss_hwmod,
-	.clk		= "sysclk6_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_class_sysconfig dm816x_timer_sysc = {
 	.rev_offs	= 0x0000,
 	.sysc_offs	= 0x0010,
@@ -1250,7 +1230,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm816x_l4_hs__emac1,
 	&dm81xx_l4_hs__sata,
 	&dm81xx_alwon_l3_slow__gpmc,
-	&dm816x_default_l3_slow__usbss,
 	NULL,
 };
 

-- 
2.56.0


