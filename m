Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC60EC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObQ7GdDi1GptsOmZqtnr/i0ThLMDmvsqiFg1PNnocMQ=; b=xUydyL7oOf7VxvEvUM2lsMPJ11
	pEgKU1S4gP3UAAW+Tv6vFy0jY8TuupB+v6lnnvs0RQvcf/lxgZNnZgeCQKa/sUux0LKamo/10Qm/0
	f1kcgzC/RA9g1SNdbmW0Z2LGE6EaesNfE1eTthZPnZiQuzCZtmg2BB2KvEWnApymGJ2NPRHx7/ClQ
	f672FGQ56GuiOCn0icuvCUJKABH2J3IPCcIoQt5altFWM+tnL1gHBJdUfRl4suip8xQrQPrliS9DN
	H1BNYaMdxj0Zwc968YjszwdOn5k/iIZbYEjJZ78+8J1YqltiHhHsunR8cIzFmlHZ+7O/Taq3yIKNq
	pgsHfq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnkS-000000056WV-15f7;
	Mon, 20 Jan 2025 09:07:08 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnfd-000000055A9-0UKQ;
	Mon, 20 Jan 2025 09:02:10 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401c52000dso4500671e87.3;
        Mon, 20 Jan 2025 01:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363727; x=1737968527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObQ7GdDi1GptsOmZqtnr/i0ThLMDmvsqiFg1PNnocMQ=;
        b=Y7J+uSdak95JCdnbgcwWtQYs618s9KERcvMDDcJwJCa6xNyF1poZ2fegyT5ZiCov5r
         c1lCP+vnhlALCa9HtshsKBmNhcG2sUwCmIWNJYoOud7EIOMO8F2vjSYtrQKIpzWDV8kF
         q5veaLcp5CngnzxLRO7jEprqtBjsZnijNGfvmxt3I15gw7yCKJCyeN/5yFwOnW7O1bg6
         GhjxdlAobc0JkbWIUtCMEFXoIhNxQ3Dn1txA67x++11ST4xsLAODUDbS+UPFPoutR9WE
         KTeOKKt05IEqYabng4PO3Q7pUhwBskzeKKJozN4gwqwzYqcwRj2CWJDKbzRRc49x9vz0
         dcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363727; x=1737968527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObQ7GdDi1GptsOmZqtnr/i0ThLMDmvsqiFg1PNnocMQ=;
        b=wud0/2cETWehK9ljFmM0Z2d3oUursjcmreYafVEy71mBZCNXvM5DJy6SCtOSpq441F
         MHMItkp8o2MeNlCRHof0f9Q1qmyQsXHRnqPOrQwQM6HlnZbtINCsQ0vWOWUTVGRon2Wc
         1a9f6IR+JtUtJP7HKRnzSGC7DXuKWaIQoek4ppM35z261//ftgbZy5x8zRXUMCjg9J9T
         YQgple2XnSfLFMPEb1xYgR42Bd3us6+Z6hgr30srL45Zot+PM06JfPTMsAMbzo9TX9Qi
         JSgoN4GVHOKEuE+t5vzIpmF05K33ApsK043oXOSbJlVfrmURsj4QV2fZ+8448VGgPDqZ
         OgRw==
X-Forwarded-Encrypted: i=1; AJvYcCVdvlJiXDrYFYNS7MEyRfN/8LbzAFrbqwyE8GnyGtOeXKKMHmzPtYd1BJDvh1JUmJQwgPAEYlMvgfyfAdowijo=@lists.infradead.org, AJvYcCXe4AKSRtMGG/oPjVg9QKnsVAo0oAfrM9RpC83PVmIAvCuWcFiCjITEt2nrnZzoA32CLafTn2koM5NAopMVqHAv@lists.infradead.org
X-Gm-Message-State: AOJu0YzppOWBoen6IcNUXD5A1zUir/HnM9dgLNIz7AdrP6bgQJRTHBE3
	xo84WBKYCTvqTgxmmxDLBSX4UH6kxti3P13hVSiPzIOfVdMswqIanz6jP2XpOKb3uw==
X-Gm-Gg: ASbGncsjIKklvU3LnMwtKNdMq6PVFwz7OA7IKAt53cwKABxaVsG8FMItDSQa7SEybtW
	0Y0uez90dKy+NdWuZPwVfzdKcY0eanBBohmdYdNLTe56gkqnKnUxBO+volFFRGt15Ys3+qQThGw
	Kns3xQ84o+oOBb9PYMjiaZlc4RVWvjDuGT+FP/CJuLmCDW7XHHACwI2li2VfZ8+m/AN0KbsA1Cp
	CBj/v0q0FkQbNfhPyGS06F3mT9NJXTgQPoqWe+YvcpivIUg/CVDZG0ARNmxDac3fbemcko=
X-Google-Smtp-Source: AGHT+IG+uLtQwIY7ysUBBPpzDpbxHyy+W/cd6hfRub2H22c4oda2HhPrd0zg5OQqcxaq2LdygE+qDA==
X-Received: by 2002:ac2:561b:0:b0:540:353a:5b1f with SMTP id 2adb3069b0e04-5439c1ba039mr3725344e87.0.1737363726847;
        Mon, 20 Jan 2025 01:02:06 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:02:05 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 13:01:29 +0400
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable SPDIF output on H96 Max
 V58
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rk3588-spdif-v1-3-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=1420;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=mhZBI52cSFUW4zmM+Wjfy5nZUWjEd1lQ47cgj8nn2a0=;
 b=3k0A0++kluCdKMCJzs9uffAyMkB9nN6XP5utWRzFrHkWnhbpcAKF4sZs6ezzWG8blnODh5R+g
 LPjSW5xBvA9BxjjtuEIwF1rkSlrUmbTqApiJoooeSrxu/HMNIP1fWfy
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_010209_162175_8303821C 
X-CRM114-Status: GOOD (  10.42  )
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

H96 Max V58 has its spdif_tx0 controller wired to a dedicated optical
Toslink SPDIF socket, enable it in the device tree

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 4791b77f3571db3a888c015596b4cc1863fdc3f7..68dd7329de15d873f2a0df85fb84810f9c2907d8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -140,6 +140,24 @@ vcc5v0_sys: regulator-5v0-sys {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	spdif_dit: spdif-dit {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
+
+	spdif_sound: spdif-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SPDIF";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif_tx0>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_dit>;
+		};
+	};
 };
 
 &combphy0_ps {
@@ -400,6 +418,12 @@ &sdhci {
 	status = "okay";
 };
 
+&spdif_tx0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif0m1_tx>;
+	status = "okay";
+};
+
 &spi2 {
 	assigned-clocks = <&cru CLK_SPI2>;
 	assigned-clock-rates = <200000000>;

-- 
2.48.1


