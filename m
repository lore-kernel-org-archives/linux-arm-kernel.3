Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E259D1CA15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 03:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euPhqg7viIx2XTAkn9Q5AvVF/uGDGrDQK80Z56OHLio=; b=p1y3AX1VYIcE/nYF+Am+3hinQV
	LtstMwqX5LnytWJCEFuVndhKJhEjX5MfHf8SAPIX4Z2wzdB7Mq3HKIe3QBi0weJQWRIeyh2hIxarQ
	fPvNwO00eSu6d23EN38BI8timtvPnbVkn1Vj9gEN5RtVd0YkLZ0uMLM8apumRy7eRDJRReTsVNEKR
	+6cSNa/czBgUGD4JV6+/xRMA39l77JgtCzjlFW9SMRv/UsqWf5LlP92x1Ot7W1wW6XR7LEQXxoOvU
	DS/AJfDAE9CxjRdsxdOqDNyPapx75DVtmtO0ERQHBcXUHXIhE8Vl5/MpIJPMcqcypmIUsBFyK/hJi
	eBNKz2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8A3z-0000000FkIr-26gH;
	Tue, 05 Nov 2024 03:17:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89vg-0000000FisW-0MD9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 03:08:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20cb7139d9dso45697625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 19:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730776107; x=1731380907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euPhqg7viIx2XTAkn9Q5AvVF/uGDGrDQK80Z56OHLio=;
        b=SaPaF82T2u22UVGoqj8MqvSUQcVIVMqPHuTIEHN54l6gmNnhpGlYj5A/7YkqK68VQQ
         opmnQeYTwlb0mJUHrImj1uKWO+slS2nU6Mq98tu/TMSxja71dZxpoon/6s/KcPZm62Vz
         GwMWk3scXJsjZYXNunZ8z7VejLgU2EKHNKFkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776107; x=1731380907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euPhqg7viIx2XTAkn9Q5AvVF/uGDGrDQK80Z56OHLio=;
        b=r0J4F1pR7VeHwRMr9fq7Wt4q0JIz6je1+l2lxWGyWx/sYwvgd2501W99mO+XZKA+DI
         wEt47/J/9Vv5quXp4/kIXkLVh2G0JKAUzHkNAq1AtjwmTqiS2Pf+p0NdB3CjYFP/La7l
         Yf1S6eiWlOtJE+8sZxEKcKJ2niyrFXU/HEiUoS/f3ZDiDnVjgeuhCXZ7QF/RPgYal45f
         1yQCfW8i+0E/xnWG1+wgxtA8gr3dn8+OEsRzuTadDZUg9Pk8qHC0RsKJPLuXlJ2nw/91
         BG+J+swsP2OOeG6/bOIizcmu8kzCcLHUR6Cf/dcmLITYssAEEd5jwaVkOjC6ry10b2Wy
         PiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRVQXR3WHxEbBNeV0exvGw4osVRjOJKL4TXP7k9TYlEXFQLrSUf0hT7It+2YeUak/S7x85yLfe58lPsL7vIbaJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzSp5ZgMAC5SrtGus1p+w0d1zDxFb+u5qkS1RNxC2jhZHYfuGb9
	UCyGRYSTB/sdS6PmreV4fDT1wM3yjXUtnLDW1jQGpA6z2Uwj8hC7aAbhjZpsaA==
X-Google-Smtp-Source: AGHT+IGBp3c1Lhzc3e6+qTBBRkT4mBZaYjen82U0w7kAh09SHgIN3F5lnKg4nHiKKOQv7zPeWuvL8A==
X-Received: by 2002:a17:902:cec4:b0:20c:c834:b107 with SMTP id d9443c01a7336-210c68cc81bmr425323355ad.22.1730776107551;
        Mon, 04 Nov 2024 19:08:27 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8d4dsm67497885ad.270.2024.11.04.19.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 19:08:27 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 05 Nov 2024 03:08:14 +0000
Subject: [PATCH RESEND v2 4/4] arm64: dts: mediatek: mt8183: willow:
 Support second source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-post-reset-v2-4-c1dc94b65017@chromium.org>
References: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
In-Reply-To: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_190828_170500_3BAC381D 
X-CRM114-Status: UNSURE (   9.83  )
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

Some willow devices use second source touchscreen.

Fixes: f006bcf1c972 ("arm64: dts: mt8183: Add kukui-jacuzzi-willow board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
index 813e6bf65b62ee6742e52133f9adf7e83a6078c5..e8241587949b2bc238ffa85f8fa6b6ca78b1d6f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -12,15 +12,3 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
 };
-
-&i2c0 {
-	touchscreen@40 {
-		compatible = "hid-over-i2c";
-		reg = <0x40>;
-
-		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
-
-		post-power-on-delay-ms = <70>;
-		hid-descr-addr = <0x0001>;
-	};
-};

-- 
2.47.0.199.ga7371fff76-goog


