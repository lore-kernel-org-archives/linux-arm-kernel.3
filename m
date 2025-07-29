Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D238C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o/MxRuoyCjAuu+Wx+uvo6WAHep4Y7koyz5dvv/gvsfI=; b=g7D96ogPpRsIvYBOwPA/RfaSFV
	SS9bCtg0bn7W0pIUH+n9y51E6w3zATpUI8pX6IpswrwRJsejYr9m//znPe2uFB5hkBe931fKyeyMT
	tNqr/3yMTg5NKA4ghfoWw6UsJRvQiCS6xTezp9ocv8QOW/iKMy3WFsfm0W3+X/LbYul1vo8UeFvCK
	snUb2trKyFIfxzPjWRS4Cowa3xe07g8ccNe585KuMHIwBob9Qh84nIq5/ekn8mjUykEYDqU83HlJm
	g86kr1nLU+rrUth2D8duY4d74tSf7FcItf0iuWQEcPTk7/QPqGEdhJ3ToAiw8IQUdnQSWNsQ+0EIj
	DZnA/foQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugphv-0000000HXAy-00Sb;
	Tue, 29 Jul 2025 19:09:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpfS-0000000HX43-3Iwl;
	Tue, 29 Jul 2025 19:07:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b7892609a5so55148f8f.1;
        Tue, 29 Jul 2025 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753816037; x=1754420837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/MxRuoyCjAuu+Wx+uvo6WAHep4Y7koyz5dvv/gvsfI=;
        b=IEBHj7++FIzubZbKY4uKqwwiObgSBTGioaI9LXtDUz0u/KupZRvW1Q9/WYY/nHwXZ/
         1OOQ8CeLz7Z/6pPEIBV1514HqUT9JwI4vGuJspcctqdlISH1J1xHDhzUflhOZSe/ZI2q
         VtmWuAcgxAro9Lu7BBn8C1npLcalVIpH5fxJxcvwb10F+Tkto+URe7+oPbWuotzhOP0O
         R8fr0C/XqG8eqk5qY0SfTnfACVCIM2hKDVY9XS6mGcDf6V1QP6KvdaFW52gbaaa0NBC2
         cfiOWkIrBO5LHyqtJS07PgJ1KBsKtCTcF5Ganqtrr19tuOJ/9gqqsv12IPdRrBeb5Qtr
         c1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753816037; x=1754420837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/MxRuoyCjAuu+Wx+uvo6WAHep4Y7koyz5dvv/gvsfI=;
        b=g0J/I1mHuy42gcj8ml64gbTwLEFqAL0ZWYfWOhhGTk1nmAfdbpwz84emWSNfc7ssMd
         ZKYyrVPd4yk5go4QGjCn/7Y9NZ9WILS1WJzQIxD6cGInduXBecsbdNg0X47QN2YZNwgX
         aRdGhnzcg7vFb7/87xyYc4XZV70fm6/pmekDKOzgRUOz8MOfJMOb206z2TFZBKIdG6Lf
         ll7KQArpmOGtRJP2bTA77m6mksPupfgAh2bi9JG1BUKDKI6wrW8HzX1PDEewcNpzlkW7
         1J/fhIyZ8zzUWHedq5BkGIT3fj58qGFYVa9VonDVy+MtDDL8I+ubqss1lNufLmi8WIAD
         StMg==
X-Forwarded-Encrypted: i=1; AJvYcCUDq8GSkv61OLVVi3xFwUxJhEaTrfT6WCeSf6OxkrNz/X//DbPxAr/9PT2YJxfJTJ+ElJyKCJc6/lYQaqYjhIM=@lists.infradead.org, AJvYcCXWWyVQOUfKEOoawIg+Qu/4fDxInd1X3aHlNO4Mu3OzsBJvb5UrluMcZYGBoE/q1zskjbEUrUR9/GbduuzSCzp4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5h3RtTYHK/t8ODpdEPyhSh2a2rExEu9P3JAKIdBC8CnO3kWCW
	N4i8WhonWlPi9apkImpuz067vbZNMs3Ubk2Ek3In0cNSyda3PX/XthM3WbvM2A==
X-Gm-Gg: ASbGnctdDiRmBkK+bES+LbOAu8tJ4fie3d/lxeBbbrkolAVivLEIE4pD6aJl8tVNZJY
	ZgYz1iy1jwhhN1OmU4WWnnDguGac4lNG7JgsuWTcOJyuSHJ+qFYbMc39a9YiR89Z7Ko0PidyrC4
	e1BlY7ADDrJLk/q12XZjxTkPxQ6gL2nssbuK+TyH2XhWoMW3TEE3SGtbLrnjXJF/95gDGk3nUcU
	b2teE9VMRhi7Wdus127tynU3rIQ6duxuK+zRFYgkOeFDUYk4ZXEXeGX+T9opAI+KUboZQLK/U+c
	D9t0y3sJcR3UY9o1hA6VmvT4Q6+wiaQcNlafYJ9wXtn6lmKKr6aj5yWRD8ZXxA6O0oetSAFcYxW
	hnwJgihyPbNDvaitWBd34H7lq/rdWcCN2pLns5bFBQysCluIyWTj8uFFeQ0ESnQy6VqzrQLsDoR
	BriTFXHbRGhhx4iz/PvXTAFZ91m8Kh4HPLybiDeJjtdTEjfkqExuH/VtXPpY95mxjBnDsG
X-Google-Smtp-Source: AGHT+IH6zFByu5WodzMnXJJqavnMrgXchjczYZlogRLJSbiGoSTQBt4t6fb0Oxe0bzUtCS6BUJq3HA==
X-Received: by 2002:a05:6000:288a:b0:3b7:8146:4640 with SMTP id ffacd0b85a97d-3b79503579dmr637352f8f.56.1753816036422;
        Tue, 29 Jul 2025 12:07:16 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4588e5c1ad7sm36470415e9.10.2025.07.29.12.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 12:07:16 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Pinephone Pro: Update WiFi
Date: Tue, 29 Jul 2025 20:06:47 +0100
Message-ID: <20250729190712.145817-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_120718_860530_E6226A3A 
X-CRM114-Status: GOOD (  10.84  )
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
 .../dts/rockchip/rk3399-pinephone-pro.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 585ef0fd88ef0..05f7b506f3594 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -21,6 +21,7 @@ / {
 	chassis-type = "handset";
 
 	aliases {
+		ethernet0 = &brcmf;
 		mmc0 = &sdio0;
 		mmc1 = &sdmmc;
 		mmc2 = &sdhci;
@@ -689,6 +690,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
 		};
 	};
 
+	wifi {
+		wifi_host_wake_l: wifi-host-wake-l {
+			rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -715,7 +722,19 @@ &sdio0 {
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
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_l>;
+	};
 };
 
 &pwm0 {
-- 
2.50.1


