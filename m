Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C873C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SkrNC4OKrwBslXKn2lY94InL2WdhCv1RHq6pIDaZsc=; b=ZeRlKKA4e1STFV9DaGIGE8cz8M
	wC+Aj2oJE01dAV1Ubng15Tu90Vq5n43f30rmcW5aHEdUNXHmZeuHsRGIib2f26yju0mgJFbrfGxuc
	YY7WPMiRxtgmlPrMDQBnbmphWRyttUttU2wn2r4uHVDmXS65vOlERw82giDnrf8qzOgwRjE/h2bmm
	b5UA2i8UmG3q+bnBZjZsVsCJ1bax6WwAek1gcS51fawaboNWjrQ65I3sNwa66qDAwZ93Q4CLJOmdD
	/3cjpDmPlhjmZisOX0c/hgoR01IIAwKuahqCDBQx/3uoQJOJptYcwDhTUMABR9ChXlExv4OFtH95x
	NMfBrqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnjB-000000056AE-1vZl;
	Mon, 20 Jan 2025 09:05:49 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnfW-0000000558d-0eEt;
	Mon, 20 Jan 2025 09:02:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso4862448e87.0;
        Mon, 20 Jan 2025 01:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363720; x=1737968520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SkrNC4OKrwBslXKn2lY94InL2WdhCv1RHq6pIDaZsc=;
        b=lsJOOlQxMxg6zEUROrVESE7VQukcyxy05rbTbVZtfRM9oyfHGj3PktCgRq1SykqPqO
         0eDXAD8HEjAaf/Xri3FlnxagzmJsrKCeQrDzupKI+lMXPXjkd+bJ7Eh3knbagvraM9V1
         BM+iH6HfGwaU5URprQBAzYy+vPCqJQEuqWhdn4E6Qvm3XSwZmntb4iJbd26lXVcvILgD
         FxaNYlBFAvyBPS+k6DX+i9/zjmw7HlqOmopNZ/QwG1rcb2UErIgMm+yniw2Rh7mmdMms
         MfgaBUCE4QTDmo7CTlMm8Fkrvx23IhmTYB89X/w+neoF62z4dZVcts9mzmf6Qo+sJ1me
         C5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363720; x=1737968520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SkrNC4OKrwBslXKn2lY94InL2WdhCv1RHq6pIDaZsc=;
        b=Kv+bAZ4Sd28WtKKFN6IPurTsUncbp9+uVCs4dvKxQ4zOZjt4gNT38PCP/FbQMwkjLd
         zjvxcQyprkpo03YSNAl9wDllaBOAwL9qTugN+yKBTPjVRTxvGLyg0DV2A+wuvu7GCqU2
         uIa68KPAK/zAaZ1W7yMMzqaQpgjrTeEhsWWecy477xNd8aqmPcTc2A631WIxv5VrR+5w
         ZFhtffmPT0LauSSUDZYcS6ZArm/7MCccLGtfmF6xxMRFqMGG6mPz8TOHXIYo7kQ6goUN
         JCTvt6MEEyLTTOWxfF3/d5EK+Lm2esrs5EPe4K17Pus4sNX6Rq/YbjVht7xaNqKqSjAf
         5ntg==
X-Forwarded-Encrypted: i=1; AJvYcCVS72J7ws81I74orXhhG1Epu+49G9XJU8d6jStcHwSi4gMvch7OwH10LTE2/Tjh1NQR5QiWAg3EndaVDh8b+8s=@lists.infradead.org, AJvYcCWqJdqK/mH2X6jho4NaUEZGJGw5ohAogpd8PxXVCibDIVl9ZQis79eZdtL1LWf4HciQ2Z0mbXNy3nYmd0nXVxBG@lists.infradead.org
X-Gm-Message-State: AOJu0YwiwR/BMjWyKSlatJqOs+hVc25/iOcc6xusAbd4BVlrt5IJknea
	9JXtVr8WSGFtBbcOsw14xzx3/S53f2p/StiPOQIa44Pq4DHUaYp4YWvtycXCaaW6hA==
X-Gm-Gg: ASbGncsg4KTFfhZY9zd/XLtKdU3STnTM9Rfcf5FhZq2ZRX6pNQKj5qwi0poIzRRrMup
	H/sId1wKe3JD8PqaFr1WifwdE/7W8ImJMMrOVJUEvuQdbHWrGmx47RPBApovOYAlknDTeEFfgRd
	oaa0abzM1cHFEdW5DsWALkas1n5p1Y1tSR+HnmRk3TkHbCHFcYwK5EzIH/HXian7ikHtuEOQy3h
	7mkaZ79W/oZoI3VhruA9EhJCjbqOywVpn5+WHwoEjdV+4DyDc55osAPexaLoePu2qisrHs=
X-Google-Smtp-Source: AGHT+IGC7FCazsrX10UnVTI4JyBQvROZIT3aDBV34LerB5P0S0R4EmhZ2kEAeo8emEvzObroak2BsQ==
X-Received: by 2002:a05:6512:1250:b0:542:215f:e615 with SMTP id 2adb3069b0e04-5439bfad838mr4216453e87.16.1737363719979;
        Mon, 20 Jan 2025 01:01:59 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:01:58 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 13:01:28 +0400
Subject: [PATCH 2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s)
 device trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rk3588-spdif-v1-2-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=5537;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=YP/asl0ktuAJ+7lkx9uBG8Zp8T+WKtOvDkKSxE7Zxj8=;
 b=tTVe1SaVvi1gG1B2uuR2l3PrPdSsc6F5m8rEBlrbsDtsHLd5lFHOeLy577Pd8XyAZL4oLM/6G
 CMTJV5jt9FFAJsCTf87cT3AnlWpO+PkVU+pxwKRJpYrfGs/iNw6Mh1R
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_010202_202243_2402FB4D 
X-CRM114-Status: GOOD (  10.26  )
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

RK3588s has four SPDIF transmitters, and the full RK3588 has six.
They are software compatible to RK3568 ones. Add respective nodes
to .dtsi files.

Adapted from vendor sources at [1] and [2], respectively

[1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
[2] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3588.dtsi

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 64 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 30 ++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce72581d0b513a8274ab0177eb5ae15..07e8c5aeb45b22db71ac5bc27f812a2d3347a463 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1318,6 +1318,21 @@ vop_mmu: iommu@fdd97e00 {
 		status = "disabled";
 	};
 
+	spdif_tx2: spdif-tx@fddb0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfddb0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF2_DP0_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF2>, <&cru HCLK_SPDIF2_DP0>;
+		dma-names = "tx";
+		dmas = <&dmac1 6>;
+		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s4_8ch: i2s@fddc0000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddc0000 0x0 0x1000>;
@@ -1335,6 +1350,21 @@ i2s4_8ch: i2s@fddc0000 {
 		status = "disabled";
 	};
 
+	spdif_tx3: spdif-tx@fdde0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfdde0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF3_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF3>, <&cru HCLK_SPDIF3>;
+		dma-names = "tx";
+		dmas = <&dmac1 7>;
+		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO1>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s5_8ch: i2s@fddf0000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddf0000 0x0 0x1000>;
@@ -2016,6 +2046,40 @@ &i2s3_sdi
 		status = "disabled";
 	};
 
+	spdif_tx0: spdif-tx@fe4e0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfe4e0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF0_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF0>, <&cru HCLK_SPDIF0>;
+		dma-names = "tx";
+		dmas = <&dmac0 5>;
+		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
+		pinctrl-0 = <&spdif0m0_tx>;
+		pinctrl-names = "default";
+		power-domains = <&power RK3588_PD_AUDIO>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	spdif_tx1: spdif-tx@fe4f0000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfe4f0000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF1_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF1>, <&cru HCLK_SPDIF1>;
+		dma-names = "tx";
+		dmas = <&dmac1 5>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
+		pinctrl-0 = <&spdif1m0_tx>;
+		pinctrl-names = "default";
+		power-domains = <&power RK3588_PD_AUDIO>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@fe600000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0xfe600000 0 0x10000>, /* GICD */
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 4a950907ea6f51c1d4123d52b73b726226db37bc..505cdd7b518ed687865deebcad553fe92b111fd8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -67,6 +67,21 @@ u2phy1_otg: otg-port {
 		};
 	};
 
+	spdif_tx5: spdif-tx@fddb8000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfddb8000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF5_DP1_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF5>, <&cru HCLK_SPDIF5_DP1>;
+		dma-names = "tx";
+		dmas = <&dmac1 22>;
+		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO0>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s8_8ch: i2s@fddc8000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddc8000 0x0 0x1000>;
@@ -84,6 +99,21 @@ i2s8_8ch: i2s@fddc8000 {
 		status = "disabled";
 	};
 
+	spdif_tx4: spdif-tx@fdde8000 {
+		compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
+		reg = <0x0 0xfdde8000 0x0 0x1000>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		assigned-clocks = <&cru CLK_SPDIF4_SRC>;
+		clock-names = "mclk", "hclk";
+		clocks = <&cru MCLK_SPDIF4>, <&cru HCLK_SPDIF4>;
+		dma-names = "tx";
+		dmas = <&dmac1 8>;
+		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH 0>;
+		power-domains = <&power RK3588_PD_VO1>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2s6_8ch: i2s@fddf4000 {
 		compatible = "rockchip,rk3588-i2s-tdm";
 		reg = <0x0 0xfddf4000 0x0 0x1000>;

-- 
2.48.1


