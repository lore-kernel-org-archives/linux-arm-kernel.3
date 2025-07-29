Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292B5C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dlG7PNdMEgQfJKLs4yxVqtBUK7MC8lUUbumEET1hUqc=; b=WHhSp9X8iNacj/SL1iHndFb5J9
	I7YWEDMY/SSZtOQ6zTERZavC1rRo5m+dA8An2C7kTmgqo35XuEQ5UDQqbJWQPLE45Q0QautgQxGsG
	5ocu9QTUb0yOy2O74kN0L+YPdRwDhhHXt64tgfv2i8Qd3D8Aw7/odsFk3TCX+3IOCKQ3OoplizQUp
	toDfGXNrCfQHIz0vRf6mlx33gjx5JGzZ89xLVWrWuL2oe+RkztRTAn/zbCv6ZaqBvCi3EG8RmGBTE
	gcPQnwXG+IwemYEvX1/cQ+dQrS+nCSfKV01+AphdITiehFHjaqgCUUeCEmIkjnYNwtMzzZAztl12E
	o/U1HYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpZT-0000000HW3f-1CH5;
	Tue, 29 Jul 2025 19:01:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpWz-0000000HVk7-0lUP;
	Tue, 29 Jul 2025 18:58:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso58581275e9.3;
        Tue, 29 Jul 2025 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753815511; x=1754420311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlG7PNdMEgQfJKLs4yxVqtBUK7MC8lUUbumEET1hUqc=;
        b=MDN8KeJO2ZWp0PVBOH5HBJixgwaHKC6l+0lo6a3SHy5BMPU+ACe4r8j6Z/9I5z756O
         sJSysWNSfzR/6x8vU8Skk7+30UmMo6A5i0XUVRC9c7VEw6MYOSdRs++yYQHXI0uiiWyU
         LNfAWH9AePYaCjkc8ZuJI9qvs9YxkQmGyG8LOXz3uP6vF4pFMrnooI77Gxg3C/a5bNQR
         07vZN+3hqakeuwvVLW+F9DyP9CESKHobPRVPL6mXYRKsaq1xYjD/TElSkuk9ZOj6+uaL
         wBZqjT6Xbod/+3N4svOaMUivfI+qN3ZxURw/HepgHKLAKJghDd+ckJY+PqOOqbO3Rogl
         3Dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753815511; x=1754420311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlG7PNdMEgQfJKLs4yxVqtBUK7MC8lUUbumEET1hUqc=;
        b=me7DAALER+3yx5Gk2WNBlLLJFY/7rHL1ezKTaEjHJi/E4T6Nwyr/nz34w65paWJZ18
         lWgFKEFHo7JsNdj9Z0VqveYhgBfXUrBu+xqB7BtwDtvKatGxTpoWAwdfLWUg9mZloKK1
         Apw0D1aqKZAgdOS+emNHXkt+kDTlCCxjmHojOTYwiPLlGL9y2cQa7CHte1CvuQ2/4lCT
         Jooqye30qB0jRS9HV368ddZUcsovFEs4VZ8jBImsSrRREk2LAV+DMAQ0Xi/mgZ72rJep
         Z+NHiphTSA/hP/KVhdl6ahkVZ6HjFO9b/kBBb4oUYF2ASmsa3dXIA9c/Svmcv/oI6etQ
         JU6A==
X-Forwarded-Encrypted: i=1; AJvYcCUbEsps7cC0jP8TxW65q8pCvDEIGa02m7RGxc3Sf/LkSsDxbK4K0sSaARNylnuUgD5uOJQoCKEj8sg1AaeQE8fg@lists.infradead.org, AJvYcCXfpv09nQzFKb7YZehzFu0U24D8V/K2n44SsojuL1H/JoKKZYxgSYpx9D6qMr2eGAR2agZpeRJIMoBx5dDwb4U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5EWLSzuFO8dVj9S+Lt6oQWiJfzw+s1oqqu/dvjKh0EbDIZXbw
	V0997DMgA9zvVA5GAzLr8hK2BVF+ngiR0aoePC5eUNn4bEXLRrN8Br0xyE8lMA==
X-Gm-Gg: ASbGncuwAuCJmeBhhbUpJKQiKUJhuLb1rgpMBNu/NBiJ49KlLe9wvcgaqcVhWGDZm0F
	bmSi47wTm9oY31oDInfN11D8Pjghc5XkoqiBqont+Ra1ZNxCYqA+jYtya0+RI5tWYaTEUhaWdoE
	vLwFifnS+lxd+JpTTiBTfFVX9xYCRwUe0W+JLHjzd6nBvSapRbaMdah0hIF1uC+FIuSCaOEKwbr
	hJc8G1ZXK7lQc5hwiFgIbbu8ywQVU+BjNl3pJFND3n7W4PHjpxME8g93rK6Qo/8ooX68K50AaZd
	XOnlDiuoG4AIt5LZ0kDRx1pabO5RPnh7fdUrm14NuZm+46EG6rA0y6ZPiRbUjUta1xgcA1uOSQ9
	3tVPYoblOUAw1bJq1+AUiXNMToxZ1efvoXgSSNS/W0/oANu7FvwUHhbV+X752SDAhIL2kU6z3eD
	hxmrr0ro6rSuSbhmETx85dfE499cinYLI64P9OndlpQ/QbBWyIsTWHQUJ+Tw==
X-Google-Smtp-Source: AGHT+IFVG8MCSeJi/dYjm7QHZUG4zDJVV2W82Q1iLkHB7zROK/tyX/U1h+UQx958znyjGSXuSvF1YQ==
X-Received: by 2002:a05:6000:1a88:b0:3b7:8832:fdcc with SMTP id ffacd0b85a97d-3b7950093b6mr668686f8f.38.1753815510813;
        Tue, 29 Jul 2025 11:58:30 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b794a9d6a1sm880387f8f.16.2025.07.29.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 11:58:30 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Pinebook Pro: Update WiFi
Date: Tue, 29 Jul 2025 19:58:17 +0100
Message-ID: <20250729185827.144547-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_115833_219706_FB382F5B 
X-CRM114-Status: GOOD (  10.94  )
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

Update the WiFi configuration to include the wake-up
pin and add an ethernet alias to allow assignment of
a mac-address from the firmware.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 5a8551d9ffe47..05c48cb09df6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -19,6 +19,7 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
+		ethernet0 = &brcmf;
 		mmc0 = &sdio0;
 		mmc1 = &sdmmc;
 		mmc2 = &sdhci;
@@ -883,6 +884,12 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
 		};
 	};
 
+	wifi {
+		wifi_host_wake_l: wifi-host-wake-l {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -940,7 +947,19 @@ &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
 	sd-uhs-sdr104;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_l>;
+	};
 };
 
 &sdhci {
-- 
2.50.1


