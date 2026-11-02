Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C8060B33C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hS0cIV8L;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gcmi0pt+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=; b=hS0cIV8LKysl+U
	a1iK/zG64cjcyH/5bkdKIFkxWQHg75GBnu5Pc0pCvOMoPRBWGZy0zVHIyjc3Oirdn/hL0LVQ1fiM8
	nd4WutB6/0XmaqtzSzR27a/FTVwZDQGJPD7PDp/5E93DPpihTpXLdFb3U2htqE1CRhFdv04nWVKkc
	PGg84GiQPjgsvu3pInyKWIZrNMkdQ2o9hv6XJ42msg1LW0d7vqaM0mjOQCEPZtfm1HIUmsi4Fxzor
	jKrpAbbBB1QgDZKh76QbEk0OXNmG1BnL1xj6VwnB0RqW03ZoKEGVYhWdlftiEYWhKZcWMr/wJCOqa
	zQVuwcRGjMzDYmCWryxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw60-0000000HVU4-1Z8Y;
	Mon, 02 Nov 2026 17:45:24 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5w-0000000HVQY-3qUb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:45:22 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-35eaf84cc66so3201701eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641520; x=1794246320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
        b=Gcmi0pt+zASLznEzjfy24y8qcpXJIZZLtlprXzDzhaSXYFG2gM6xilcn+CpkNwUuZp
         MGpLSBQqv+3Kbb5wYBFQKkdUT2U5LdyqXQ7n/VdoTX5FKNmSCS8fp54pZaaS0XjRv/ud
         7ERfpXALlAo/iPWfx+g6srMCu0DOAifk9HcL0obynMc6QekGnU7pk1OjOgusqpr1Kco4
         GDXbkINsDcjKvItxi6n4ZhnJXF4w4t4JEeasBLoNWskxqQUsWTgkz5HkCfluCswjlkjm
         fzUXHggAkc4MZ3GH0R3bM06iPvsTIJWRPvN3nF5Jjvw4xKQlClGVSqZ6gRVSfsZwDFMT
         Y0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641520; x=1794246320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
        b=xmdceaGXT81oFdPL/e8irWdBpOQHKILmNN4tDjnywIuHLxNBryqqXQkwpQDG67j8RJ
         4irPVGFqAN+JNNGycrv5TaWcAHLAq8zHbpfH3U8/xvwWELtRTzzJYNvbnqt6nP0kf7sR
         WMH2ecK/JO3pPSGr6C8kCG7H/AxQ10KxQNfMu+TrY1O+OSpR3qIyjeu9FUDekOrqcS66
         Bst+8G+idtB7fcGFpbseE9iGWGnxI2k0codqgy9k7GRsChOtr4in7unHtohq21QCAdfV
         T7d7VIlI4X2ag5ZoUxDctz09REC9hOVynvqFvFECyoY6azXSiK+KGRzd/OCEPZqCJ7Wi
         seUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcPhuk73gROgEtsNijVCh3sKuH+AzpOfHs9j/s4+sV94FGjcx1pw5UPFSkCtfjGvk0JkoKFkJ//berFaoWicz6@lists.infradead.org
X-Gm-Message-State: AFq9FYJZR2X7HGdkaw83Ze71O2ClCnjtkK+c0DwaBD5BJQ4QR6WwDILn
	i3fe8d4fO6sj58wshOUmibb/28h2dDDf632pc+cLO7Vrgetssj9swvVr
X-Gm-Gg: AYBFou1WZ0aFmScyI8M/g2fiEGMXbdaBBhtUmtOwRPlcIyQzT/iTWE10cYJLAITW4Nv
	xkHLe7H3lNjjM2VXobkI8r+xU115XkuBmU6kFnR1z9OtXHJGaG9WwzUVSC8OIKAd0LYIW4fGGnW
	ssivofRtgyf3VbaiQozlFprkEmCfk5A+xx1RUBnfB8dNZxwjvXX6PoKa4aV8LSfM2g9gidEjxf/
	lirSi7FxdoptZBpjOogh9yOw/DHGquGRg4LZBT39yZguU8L5bLZAZmnIFf3tup4weuGTgScYGgC
	u1QWemKhRgKD95IsWbdmgqcpzWVTQMac81jShXj7eqf2t12OW7zVzuzWfkzYnXPsDtFbBn9c2IV
	N1OYvh6BotBq3Mwn3ue9OTqUuSs20OiwV5UUhqFvumNnLk8zdME/zDZzp7OPgrg6GzeAeI9TMCO
	QSR3WGn5FL/KMl1B/vTmkOnM9bvCMTfNs7dqODjfz4CTuwcKDUiqxNZRPmrdZUAiL5wU3eD1hu6
	yT/Pxb6yXhN5IrBe1zA7ftDoyw3r0SOv+n8gzboYhld7GhW4Y5RaurNJIuQC9JgRyqTd2hxl1+Y
	bSNUYB1bsl/a0u9Lluq1zoYcwUM=
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr123492eec.34.1793641520162;
        Mon, 02 Nov 2026 09:45:20 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:19 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Tue,  3 Nov 2026 01:44:49 +0800
Message-ID: <20261102174450.3000397-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094520_976385_275A53CF 
X-CRM114-Status: GOOD (  17.39  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the Ariaboard Photonicat runs on battery, the USB port has no power
output and attached devices are not detected. With the external supply
connected, the same port works fine.

Per the schematic, the 5V_OUT rail that feeds the USB load switch (U12,
enabled by USB_HOST_PWREN_H) is the OR-ed combination of two sources:
- VCCIN_5V (external DC input), OR-ed via D16.
- 5V_BOOST from the VBAT boost converter (U16, enabled by BOOST_EN /
  GPIO4_D2), OR-ed via D5002.

The 5V_OUT rail has no enable pin of its own. Since the regulator
framework can only model a single power supply dependency per
fixed-regulator, add a regulator_5v_boost node for the VBAT boost
converter, and a regulator_5v_out node to represent the OR-ed 5V_OUT
rail. Bind the vin-supply of regulator_5v_out to regulator_5v_boost to
ensure VBAT is boosted when the system runs on battery. When VCCIN_5V
is present, D16 takes over.

The USB load switch (vcc5v0_usb30_otg0) is then supplied by
regulator_5v_out. This restores USB host functionality on battery
power, matching the vendor firmware behaviour.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 15,18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 7e0a2ab829209..290e3ee97c709 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -59,6 +59,47 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	regulator_5v_boost: regulator-5v-boost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_en>;
+		regulator-name = "5v_boost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vbat>;
+	};
+
+	/*
+	 * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
+	 * and VCCIN_5V (via D16).
+	 * It has no enable pin of its own.
+	 * Model it as a fixed regulator depending on the boost converter,
+	 * so that VBAT is boosted when running on battery.
+	 *
+	 * 5V_OUT supplies:
+	 * - VCC5V0_USB30_OTG0 (USB VBUS via U12 load switch)
+	 * - VCC5V_HDMI (HDMI 5V via D5000)
+	 * - J53 expansion header (Pin 1)
+	 */
+	regulator_5v_out: regulator-5v-out {
+		compatible = "regulator-fixed";
+		regulator-name = "5v_out";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&regulator_5v_boost>;
+	};
+
+	vbat: regulator-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
@@ -148,7 +189,7 @@ vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
 		regulator-name = "vcc5v0_usb30_otg0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&regulator_5v_out>;
 	};
 
 	vccin_5v: regulator-vccin-5v {
@@ -446,6 +487,12 @@ pcie_pwren_h: pcie-pwren-h {
 		};
 	};
 
+	power {
+		boost_en: boost-en {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc0 {
 		sdmmc0_pwren: sdmmc0-pwren {
 			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.47.3


