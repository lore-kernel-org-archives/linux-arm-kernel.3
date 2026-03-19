Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE261091912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePp2cj3QsqbKFBEYZr7yHg7hIpe6bh9vkoKNgnuo7Og=; b=iQnp25g2WciD7HBuPlfp8A1XBJ
	T36tIoKuzzp1QAHz6TeArseMplayXOmvk48JJUm1tEPYtUrLscNGnsseMcBUdgPYbeV5oPsjIaGRS
	C0skf+wvealz4dz0sA7yOrb2cbUXFKtuB4zs8F7aBJxaBqA1ZgpPxPzeVxr3gabwUNzdx+0GXSQL/
	C4WYp9ig1S0jmfzNFhxMhEdW0Z7/KOJGYqDu8oq0DD1gUqGS0uZueiF+M8zhu/KXEJ3R2orduScG9
	QiFfwQ1EgQsJujlstxUxfsIlAaI4iwC628ZI7CJ7K4vWoTgQbrw/79Lsky9mmNLJr8cQYiYxkqX12
	RELzpX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJx-0000000BNZm-3Ahm;
	Thu, 19 Mar 2026 18:42:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJp-0000000BNRT-117W
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ePp2cj3QsqbKFBEYZr7yHg7hIpe6bh9vkoKNgnuo7Og=; b=Lq0BJzzDgk73lbKEy6FNdbG+a3
	EPSwO8oE3W54NWfiLl5nBkuvIAhg2LDmJhBMeE7jooj71FyF9WQCm2QQcvyRwvT4AusXkDdeuEORu
	SHRFQ/Yge908QguZAs6hbKPwr0avIypWKwWXL+uclOsRBYuGviv2aaGMsm762wTIyeYZ3IhtYGzPq
	Vo+QpwuY2/VK1k+U1sKPvjGXt1dwhqnguyIthDXTcLZBoGCjSLtdtk6MzuXVm/1MdrF+3FErKtcab
	+8BpZCIz3TiKE+EWPr9YuO20Oz6dEL5giP/zDwBYTyqvXnqifzUdFE6cOJCRQzwNS225+Vyw8xj5o
	L9lKrMnQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJm-0000000EH7l-0jwb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:42:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so16545845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945720; x=1774550520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePp2cj3QsqbKFBEYZr7yHg7hIpe6bh9vkoKNgnuo7Og=;
        b=ZCctADZiR3ODNKfvt9bh9q43HJMHVwftJ3sNj3l17s6t78tIil0510aJWmtM9Gb8E1
         1HOjtHtsyCvr1JeTcyJ2MMtdxqkoN0VBkab8WAHLJKLAW/7777ycI9PCrwlnmqz0PTu0
         rbRi90s09DzFH5NME0c/8J30YfOua89vAB230vHT26Ot9Wm52tFBmq9p6fZBfa32+g8J
         a2LV3wiDEeJGjT6eCqen1rm5uhXR8A2SA65Y2MAmOKIdRjiJAc3nQCeSOuSQzptkZzYK
         yIFEYumBULR5zySGKnvWQiNR2UmQLS0n/yHa5bSINM0aDVdkPcXOZapfk8iM8pcQAjTM
         b4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945720; x=1774550520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePp2cj3QsqbKFBEYZr7yHg7hIpe6bh9vkoKNgnuo7Og=;
        b=QEIab0GuYzrAH3n5lEecuM2Kmx2bJ4rKqXHLt+gynEUTUbEfz0xbxoPU4B8q4n8E5v
         rbiQ0ntOXLFzXdz0rI7Egyr2SiXVkv3fJlS6K7oLSpuysAtXB0dUMIjXbvmOevr1bty8
         cFM/VXcL+RSWniAmik4LKxIr5AqONfS98rbxz2ZzVchtTs5woyq7eTUrSl1BTFQs+Kn1
         heVUiE44g3Uqc8pVaPdnpvzknKQ6cyyixzNYboC/CrvutkXizO+ZsjuXzOiPh2h8vPrp
         dHvjTUpo8pMyXAxh/nsXN/u8xNhstu6AbU3v9MJ8UXNbnkacj2NpERTn9BWKSnY1zatC
         chqg==
X-Forwarded-Encrypted: i=1; AJvYcCXjpzgRxHqEMh3KynpDofO0p/M7E6my9V393lzpXW+wMJzUSZbolwTt/Rhjx9R5uMVKzibxHfez8u+nm59z1XrN@lists.infradead.org
X-Gm-Message-State: AOJu0YxCkAPID+qw3S5bGPkTixe4dMfVM1oQ4STVAVjOHcLyEucqqCpT
	WpJk93FBrd18h2r6uto2zOPKP4L+VLjQklL9Bht9/vjsOoxZxtjRcZRaWK3dRw==
X-Gm-Gg: ATEYQzx78T7sK/DUIwetXTfEJwNmDC+3rlPWCCd3hs+mGDuMix1zb7TkBluj5KktSY4
	uUtJ/ZjyLzqq69qcEd8Gehrgua9Jiu3ytAKm/CBtC/6vTfBMSBftY42dlRgmlTVIWOTyTgzsPxD
	/AMuq4dIMVTu5MTQUI+ny5xeHlzvSPMcopyDXBv2Fc8kn+efH6xTkJc3ag5F6JCtzM2q32bPU4l
	BN5UF3CLW+7/3FOS06s7di27TCvcaxg9jBKiq+i3ORNOMuct5el8qzgd0JiPGBtt9Y4ta1n5lan
	RI5li1J1phTqH7sBjkiqEPlnl94QutfUqGdX86bHwfwQMqdVEDmM70Iqzvx4/DOEd5k+B5gw1xa
	571QLKrkwKM/IKgMd/gYKC5RFxodnk46kRtjwNNqLTlGUiSE230dXKg143S03OO/SgDKFRgOaTo
	2ZN67lhutLJD9J8KRRTihr9ayus1DFir2m9ECYeTjEHG5ptqq8mM7cs4qm9JneL0itvslp8oIbY
	tokJwocaU/oj4UKLcgsrVMAw9NFPbWrvuFwnUVUWAiGDG3IaA==
X-Received: by 2002:a05:600c:5248:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-486feb5d82emr3683855e9.0.1773945720197;
        Thu, 19 Mar 2026 11:42:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 10/11] arm64: dts: imx8mm-var-som-symphony: Enable I2C4
Date: Thu, 19 Mar 2026 19:40:30 +0100
Message-ID: <ba867b28e52cd1ed934a988d2c9e46542992c788.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_184202_426886_A833F3AF 
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 6112e4392c59..fbad5d2d4a97 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -188,6 +188,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -281,6 +291,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3


