Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FECE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWGF2oM/vKIRGFx8hE5XmZ6u2ciBUKfkn2ZTbuVUqz0=; b=Tz6UXKBs+w+cpUC7EFmkILkE1x
	n3VlZP7bRFANsiACffuAZPFBx+zzBANTuLBtpUmlhtpM6uPQ0yGDi0oWagPR3CTOqTCKO6kidmI2e
	8zOOGp7ik237/UuulKibaeROFIY3mXIDdFvCr52GHhULqXGCswewz6cX2xQmvJ66IfX/k5reGDiZZ
	3qoaX1H1z3X72sBRSHnRLN+RsE3Rbag30jFitup/d28xE9eqACHDsw923twzu57CfFfxO2exfAIbS
	XUastnzdzO/8IBH/0JNVpszHysaKuM2C2337FNYSSaDsduPo+6qWvk1yZzgjJoeOS34uEDhYhYnxg
	kqiXA+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS8F-00000007iGW-0aXV;
	Wed, 08 Jan 2025 09:13:43 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS4s-00000007hGs-0lkR;
	Wed, 08 Jan 2025 09:10:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-540215984f0so17023841e87.1;
        Wed, 08 Jan 2025 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736327412; x=1736932212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWGF2oM/vKIRGFx8hE5XmZ6u2ciBUKfkn2ZTbuVUqz0=;
        b=Zy7oVgyZZFLsGzNdth4Wzxta5TkgSZcSwkmiHxWHgeC0WHC5Csz1+Q9iRg0zj+WVtG
         n0ypV8h3iPEbGdAdsHmLeB28oeoBDPX9o/ExO8IaoUgGdrV421C1v1AdkJAcswu1PIZw
         V5cqROkCeiPB20yLBm8vYiXYU43QHeNuPkBnTujjSA09vlhhyH+/IQw8gs6q3vLeQtqj
         uQE3cbZUiGuVsfkJMfpuzLem2Tc6DXfkiRwyDDh4iSBCGdYA8QUScnThfSJnt2LYS2v5
         +PV/TVoRGm0TjLldKFQ7l2r+WJQbtooqBFb/JjvJ/I3NzM9HE+iYzRFMktQrTvqrcFNT
         o/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327412; x=1736932212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWGF2oM/vKIRGFx8hE5XmZ6u2ciBUKfkn2ZTbuVUqz0=;
        b=VYeOV0eu2cJ8c1JoYI0TwlKwOP15GPtjglCiN1smAELgmZWo+/ZAHYvXueQXFAqs2v
         0yd+IEX17AxwHQ1ZQPUhsQ388aqUIC4OHWw+kMJPbIzUJQRx08R2tUpbt1yH6hNr4xtx
         xSAxCrDcOlf9g0WBYy9DR5DuGI5oLAxnTGU74VDGpzobo0to7OJ3taPfne88gktplIL9
         n1pEZ1fduev44Ptbkc6NiHRBapWnwmvgV+2TIHCe+cwk604taxkcTG05j16YmIZuA3CS
         wC06FMWtjufF+ocDsr+AYP0ZIrtwgTU+iJt5y/80DfvX2XSb6Rh/WtLS/87O48bUyJhe
         8Xvg==
X-Forwarded-Encrypted: i=1; AJvYcCUocoxrByLTbPFvLjPQoUuAab7EYQyZXzIIb5YzXkh2eH2fj6nb7kD2H6Wu4HtSEKdqWD6eiS4Fm0WHRxAKqFg=@lists.infradead.org, AJvYcCWgq2q5uWTBQW8ZU7WAbigfIkyH194DnuESuT4JLG6+CbXyz1YbxuYmRtVep9kEMB4Rcin7XeZ66/etfODkpZbK@lists.infradead.org
X-Gm-Message-State: AOJu0YwzUYk4FxXN9UwM1/IhFzHgh+NsSD4UBRXZcauu6nNE/mPf9vg2
	NqidQ4tfUEM/dsJB/qoHhP7Einta/k2HjbLe7TtcQYGfMxqMpue+
X-Gm-Gg: ASbGncvpvoEzsKwUgBOhjXvWPbLIEYtpy0XqdHEnolCgjvGcv4duc2AvEOEl/9IbmTq
	KMv9eQOuhA/0JKN4vyvGleNwh5N4blHVyHCPez/dzHmEVcUX01wvXtg8obMHMbcv0nWmnnTgsyf
	WuUUyEfF7gB2+cyrWMrS6oxG7YFMLRe1s/w/tXy4d2kHzgqwzGvHTDfNh0B4LfLlh8MasnVRXST
	2/2I2DJQc7FTSWujfFjgFhguD7BAj4IokZC8akZOcmVrCAxELyoHRXfWw==
X-Google-Smtp-Source: AGHT+IE74KEWQS4U1KXJtRslRHa2gJCLG/CfWtCHo6E7tvyAqKfRW6yylJE1lhY8SVxJKm4mBKxpAw==
X-Received: by 2002:a05:6512:304f:b0:542:238d:d71b with SMTP id 2adb3069b0e04-542845d9729mr539284e87.33.1736327411982;
        Wed, 08 Jan 2025 01:10:11 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813898sm5386450e87.154.2025.01.08.01.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:10:10 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 08 Jan 2025 13:09:07 +0400
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s)
 device trees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-rk3588-h96-max-v58-v2-2-522301b905d6@gmail.com>
References: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
In-Reply-To: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736327393; l=5384;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=Z6xzM6WkCN7HyVNXVYylSHqW28xdbS4GEvTlM4S/byQ=;
 b=3n/miVwyrF26qJM3oldJ9q12mx9dCt6L3OUEIBspgLIoo9ucfSpST2R9u5jqNH046JrT2u4AZ
 lRx50WNr5zcCNiENXGg0bBzL07FCZv0UH8cAOOezEq+nnjSiAbq3ZpW
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_011014_229909_181074CF 
X-CRM114-Status: UNSURE (   9.95  )
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

RK3588s has four SPDIF transmitters, and the full RK3588 has six.
They are fully compatible to RK3568 ones. Add respective nodes
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
index 8cfa30837ce72581d0b513a8274ab0177eb5ae15..ff0c9191737b34979a408067df1a664dbe87395f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1318,6 +1318,21 @@ vop_mmu: iommu@fdd97e00 {
 		status = "disabled";
 	};
 
+	spdif_tx2: spdif-tx@fddb0000 {
+		compatible = "rockchip,rk3568-spdif";
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
+		compatible = "rockchip,rk3568-spdif";
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
+		compatible = "rockchip,rk3568-spdif";
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
+		compatible = "rockchip,rk3568-spdif";
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
index 4a950907ea6f51c1d4123d52b73b726226db37bc..ba1bcd12c558847680aaaa2377d6d0a84fdaa1db 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -67,6 +67,21 @@ u2phy1_otg: otg-port {
 		};
 	};
 
+	spdif_tx5: spdif-tx@fddb8000 {
+		compatible = "rockchip,rk3568-spdif";
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
+		compatible = "rockchip,rk3568-spdif";
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
2.47.1


