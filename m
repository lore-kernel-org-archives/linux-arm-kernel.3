Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB08C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+hROFZIJ4zafnbkZoU/ntEvBJYn2g7xzj4eJTsFhmI=; b=Z7otY1sK8bR8WWz2n9VTbfdaAd
	80cY+mz+7QyNqzakNqQZYwtqp72J9qJw0bhb5VjnW83tkhEV+j3NkeDi2irwg7PGLH1j3B2TVnFa9
	A2KvP77uTsPfkjLuJ7L8S6IG5pzsUqfprs1LmODaW218ht4J4JjSSyrwUeHF/9KvoAEYaVCEVSPnR
	hXzD0HDZTRYUoO+lI5F0AaQCypZeTMPpxu3mSvsyfyyBQ5ANzKXIVkz0BsevHrey5Me6Xw2jKAHDW
	Fb2QOsp479F2FWQCYgesz2EyIR59VeifMwQqVRW1P5ws1ZXVoEdSn7sXwYL8IHiEJC/5By3uSOPl6
	2IcA7GRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHQw-0000000DltI-0p40;
	Mon, 28 Jul 2025 06:34:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqr-0000000DhSG-1FE9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23ffdea3575so6098715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682204; x=1754287004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+hROFZIJ4zafnbkZoU/ntEvBJYn2g7xzj4eJTsFhmI=;
        b=IgIN/+mqkESTr4ssXGjMNOIjgENnegfVnNBja+XZg01pavkL6pJbmiD9nJ9V0HHzl+
         XdpbSKWhK+vXaBljLQudeolgIQcU9bE7gar7OwLyjokmUtGeQLhxjq4yns3mr51AyGJS
         FXGLtPpEUhTpA24job5oFmDSx0QolsDnF4QIw24SmP6si1/mEieIy+ACfbzgO6tloXOT
         jQRbtjQACiJXZWNDvbihYHD/G7COykW5vSMxhsiLY4GqCHTY5Yeyzi6Fsx00Y0HLJjTU
         ZyYxRPf9nmym1khKqqWfIhhE5urY5bfzDwAhctvhjkNZgYQRRBlvnCWGXTm30z82p/cH
         8HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682204; x=1754287004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+hROFZIJ4zafnbkZoU/ntEvBJYn2g7xzj4eJTsFhmI=;
        b=ubitV2oset+vQuAt3tkwt963/thnD/rFazkGIvqAdptMYbgdw8vxHPwUpsCztqO1oK
         9f23jwejW6+vZyyWwCdtcUpXB/MkZLwmi4J624q8SM7Kr69kda3CdLaxP5xot+Sgrbt0
         COh+Te2u/Yr3hc6ar480kUfZkPdUIcF58fncbWLJbMcAsiVvl91D7gYp4mZvCKKYa9pY
         UCeyd7jYHy/IO4fFJVvJvoKE8r9VR8074n9urzqYU+3gcXsiQAdA/geUadiWPda3U7/3
         RqQJJDckUcun5koiSSD8j4xK0muTKLzea6RbDR2Sv5SWSkXNBemVaECYoKOfgwDWke66
         0K6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDhQKZH8GJ1kAh/cNFO/IiTnufweGf1WuV7iZy3WWnZRWdaZxJ7egbNr7GwWO+DaCrTn9LIi1kZag58W8coOZR@lists.infradead.org
X-Gm-Message-State: AOJu0YwIKyY2aZp+Ry7QsKi64obfSQ3vhkYK3u0YBA/ENPjFpx2aa6pJ
	uYkmi9MXAR91WZXE8XZRMzMwnYo817IZ+H/YcBoje6KSNWz3QcTKSnoM
X-Gm-Gg: ASbGncvUdg5DlN4RCKxbVWHhm44B0P5VBn0NSg8Xzm4qiv8NwpQurnBOaFwH3iMEtdm
	Ud1esO47rVGq2DZ6PXIQvTd26y99B/GDofYJlQYQDvOYCXI1GVMyYlmBWW72iUUuMkZMm0rnix0
	TWF2f+tKfZMCsdtKWkXdYxmoDQf3II7+JjCaTuxcsS8rLmYemgnSO+d5MOa9pWrfxv7WFKGxeSq
	8pRU2yCAM5iM9FjVJCm5DARbDPluJWNO6DlYDl+AVNDsIcdLmhJfwiTyowln8qRJp6YETHvaLhx
	4gX/YT6Pp194MXph3oUKny0JpnjNMBZdxJs5ZijnUuRM840OMI0RqkrmeG2vWPG9wxUwv2TQZIP
	Lw/aCtv35J3DQJqhd0tZFwcVz9YxUrjdStSjkTCUbbqZ5fynA2eGWx86iTOiA8I9SjzSFqFsEjl
	o=
X-Google-Smtp-Source: AGHT+IESYMV9/aCSq8+ZkMIq1xghfGxILNOdIuRhEeldG3+nYfcr3Y2QDDogE793q0IX8dW9AYzfjA==
X-Received: by 2002:a17:902:c409:b0:234:f4da:7eeb with SMTP id d9443c01a7336-23fb3051350mr152238685ad.7.1753682204352;
        Sun, 27 Jul 2025 22:56:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:43 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 13/13] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Date: Sun, 27 Jul 2025 22:56:15 -0700
Message-ID: <20250728055618.61616-14-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225645_335619_506F01FA 
X-CRM114-Status: GOOD (  14.75  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.

Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
health monitoring purpose.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - Removed flash layout (use the "default" in common.dtsi).
Changes in v2:
  - Removed mac3 controller.
  - Fixed DTB warnings.

 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index f6e714b7db2d..dce32ee0ace7 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-catalina.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
+	aspeed-bmc-facebook-darwin.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji-data64.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
new file mode 100644
index 000000000000..58c107a1b6cf
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+
+/dts-v1/;
+
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Darwin BMC";
+	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	spi_gpio: spi {
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c0 {
+	eeprom@50 {
+		compatible = "atmel,24c512";
+		reg = <0x50>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		     &pinctrl_adc2_default &pinctrl_adc3_default
+		     &pinctrl_adc4_default &pinctrl_adc5_default
+		     &pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		     &pinctrl_adc10_default &pinctrl_adc11_default
+		     &pinctrl_adc12_default &pinctrl_adc13_default
+		     &pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.3


