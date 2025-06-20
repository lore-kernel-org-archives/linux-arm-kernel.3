Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53C6C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PcgXI/SwiX/bwD34wkRIbcjhA4z+lQnGQOUOu85+vT8=; b=EZT5vI1gUQSVJsoE3Z6ioUUVai
	1Csy/KZrJeLT/nby0/tEQ1739RcmyJX681QHXw7gJybKnw0hSlI5gAMTis5sMcIs5ivBsOKettvRq
	iPOjHGUzKwuJITDqMFvWFV/HvivpcPUpCYAipR3fFMgiXzoCtsTOjDKW/+ZwkdtX9hzSWzBszTaK/
	OmRqfCtDHhj/KnIH9AksqOto3evm31jRMb1jGtd/D4Egr8JIFAdIbvs0WMCDpwKpdmwKtQ06rtnrb
	3JlSh/FqL/a++vi6LJMcI7Mxf5jugVIhpEnFdg386HSQW6EQGfWneThDxJ5wpYKebl797lKQjNW9F
	i4M5Q7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaTj-0000000FWnJ-0F3I;
	Fri, 20 Jun 2025 12:04:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSa2d-0000000FTfe-0VkX;
	Fri, 20 Jun 2025 11:36:20 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso3110762a12.2;
        Fri, 20 Jun 2025 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750419377; x=1751024177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcgXI/SwiX/bwD34wkRIbcjhA4z+lQnGQOUOu85+vT8=;
        b=DSa7LVLU459+NKxKHHJQja4hJRQ0MVr5LWEsPoO4pI8gmLWs0aqC36gkUZQBK1AanA
         +XxVtP/FWdC/J/EktpK0/ezRI+pk9zaaTDReBUOSutjMZiPbgtb24CKUWIMtU6GQQImC
         VLMonKLg/awcXHCPYHIPm6HZMt2iRt8moI0zPqqwrDDGLqWRnh7TGzwrgToJDiauQH2C
         tr7jbLN0c2IadgLcfUDyjguxC9aCCiqUrbJcFjrvRf8haorGOwgc3X4YGHo/1nOLZWGI
         X75Ex4FvVBqEuWOR/pps85BXWTXeOwLCvmF0P0uAbMfW4y0n/XIrJQ4B9BAUxbTgT01e
         etyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750419377; x=1751024177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcgXI/SwiX/bwD34wkRIbcjhA4z+lQnGQOUOu85+vT8=;
        b=oF95SOWnZmFS0coDvsCasUZjb7H44bdAXmsU/FeV5CabDdd04kZ+k2Zbew1hb6T7eF
         xn+U64SpFYkDhq8N9Wz/LnIPkNsf4ezvvQtED77fF3d4R2+FcIiZtK54uysnOt0BhGp8
         UhZZ66OHJXdzNqjFkGIudjOH3Z4c6Cn++5Bu2wnc/TIrVCBMMUgX/wMvtVQtOyEJOBA4
         X+SJXX9T+IlnElyHkv+aGX5K7Ukf2AMtkHA2ktt/rzBTzRlMocfIZA145EsaJXJJPY5q
         Z3bVq+elOWdA9JB5RR5PmbiGhmEcAHBvL7QCfwWpgwSN4tDlyW9l2TZ+xZDOPeTwRQ1b
         jTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs7LDpmhKl5OzCVOE0ENkrezV9srmOdtSuskraYIA/8Gqsy7nPA+g5pS5vgzKflD3qj7e4GalW9NUsDe5zzwXY@lists.infradead.org, AJvYcCWdQ5II2kx9WihoqLVcj7BXg/9nhlRRKLrtEQQeRrR1yE/XtGkvRwBgn8X5PGMbvT/18DvfE/p7LfEN6B8VYBA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9c8EqIXbVG49icOR6alkeOVEbw9vzADBh5JwhoHZAqKDNrxbO
	o0zBwvAH5J2LBZa8mdf7bIBHlsugI/JwOCorcxDMj+1k0UUELI4S5R0O
X-Gm-Gg: ASbGncuuFkKcjuh1BbpW9KGd8YwUJy2N4bNeZ1kzd9Y5zsI5wY6tVm7RTgSC2bY/2XO
	nYezqpD4U+02VEJ0tBxZxq0dWkOc3s1H76j583B7TjJCLMyaUDYzd4lPffBqTBiJ+e2QQ0vDuCR
	3PCMkf4jifFw/VZcsLVOpU2K2VeIgjCm+RVyp4yYqQFIMIE7AE6/S2TFs1LPHGE3lIokbrptshv
	d89lF0i62FUA96kaPE3KFIj5vR0T6CImB+lEj0kRYRcQDTs328/paI/xf0gNaawjpHhJ/UYAKVZ
	mIoGbHbWTLrfy+8Ku6X7G6oqYFp89VnR/ygLcSSLVYQIZzyMe4Xm22Umc+c6coyqMELb82/a1sw
	zo331v4ZzqMez4iXVagpVbHrcN/g59nFotARD2KKX
X-Google-Smtp-Source: AGHT+IHBoM3zuM2+rcjourKLd9oqU11oDVF2zMJ82/RpbVFFdMzcRAVeWNOk+uMVQHC4Dg6qq0mMDA==
X-Received: by 2002:a05:6402:2749:b0:608:42f9:a5cb with SMTP id 4fb4d7f45d1cf-60a1cd314aemr2249040a12.10.1750419376882;
        Fri, 20 Jun 2025 04:36:16 -0700 (PDT)
Received: from localhost.localdomain (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504e95sm1302003a12.4.2025.06.20.04.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:36:16 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>
Cc: stable@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
Date: Fri, 20 Jun 2025 13:35:46 +0200
Message-Id: <20250620113549.2900285-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_043619_161499_FAAD3837 
X-CRM114-Status: GOOD (  15.44  )
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

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Hardware CS has a very slow rise time of about 6us,
causing transmission errors when CS does not reach
high between transaction.

It looks like it's not driven actively when transitioning
from low to high but switched to input, so only the CPU
pull-up pulls it high, slowly. Transitions from high to low
are fast. On the oscilloscope, CS looks like an irregular sawtooth
pattern like this:
                         _____
              ^         /     |
      ^      /|        /      |
     /|     / |       /       |
    / |    /  |      /        |
___/  |___/   |_____/         |___

With cs-gpios we have a CS rise time of about 20ns, as it should be,
and CS looks rectangular.

This fixes the data errors when running a flashcp loop against a
m25p40 spi flash.

With the Rockchip 6.1 kernel we see the same slow rise time, but
for some reason CS is always high for long enough to reach a solid
high.

The RK3399 and RK3588 SoCs use the same SPI driver, so we also
checked our "Puma" (RK3399) and "Tiger" (RK3588) boards.
They do not have this problem. Hardware CS rise time is good.

Fixes: c484cf93f61b ("arm64: dts: rockchip: add PX30-µQ7 (Ringneck) SoM with Haikou baseboard")
Cc: stable@vger.kernel.org
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
 .../boot/dts/rockchip/px30-ringneck.dtsi      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index ab232e5c7ad6..dcc62dd9b894 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -379,6 +379,18 @@ pmic_int: pmic-int {
 				<0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	spi1 {
+		spi1_csn0_gpio: spi1-csn0-gpio {
+			rockchip,pins =
+				<3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up_4ma>;
+		};
+
+		spi1_csn1_gpio: spi1-csn1-gpio {
+			rockchip,pins =
+				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up_4ma>;
+		};
+	};
 };
 
 &pmu_io_domains {
@@ -396,6 +408,16 @@ &sdmmc {
 	vqmmc-supply = <&vccio_sd>;
 };
 
+&spi1 {
+	/*
+	 * Hardware CS has a very slow rise time of about 6us,
+	 * causing transmission errors.
+	 * With cs-gpios we have a rise time of about 20ns.
+	 */
+	cs-gpios = <&gpio3 RK_PB1 GPIO_ACTIVE_LOW>, <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&spi1_clk &spi1_csn0_gpio &spi1_csn1_gpio &spi1_miso &spi1_mosi>;
+};
+
 &tsadc {
 	status = "okay";
 };
-- 
2.39.5


