Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3868BC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqTQGOfqcr22lakzrEU9GmH3j3SEvT+upsozoFTBBWQ=; b=30Fpburg9Xp5NK6lkhNG5ssyNG
	Zoj4U/39jhNBllT1DU3buCpsrNm5BjH4y390OaBmEvhGAi78rEWn8yOprJcemzdH0QYg/4eHzeaTg
	gDughO664rMlDM3xuDL+tANDx/WZI/MFoeCdHulnb8As6fIdBW4m+peRRmTuJ/7jemiXO/Gn1BDTV
	fFWYBbp4QHcRAdeKAqbvh9c5D2ok5xPLqHs0cdmRM6YzouGtRQ0eebR0Ex7x1Ubtng2ktJMdmndCN
	QUUduHmkpobuKNtjbekISPRPFXHmNdnSjohdpoR9PKnpESI32+t3XlJ25Qgt1xnbbOyt1K1zrq9Rp
	TVhGWGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdA6-00000001q7S-420c;
	Mon, 10 Feb 2025 23:25:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyi-00000001bM5-0fLi;
	Mon, 10 Feb 2025 22:10:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38dd14c99d3so2440402f8f.3;
        Mon, 10 Feb 2025 14:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225407; x=1739830207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqTQGOfqcr22lakzrEU9GmH3j3SEvT+upsozoFTBBWQ=;
        b=Wk7xBnr+h6pjGKxECKpJjJvvSiMxX/vNNN5crChBmigwz6TdQfimj6E9tUF3vD+6jI
         7AX4Y8P1x8zTJGkd3QeBDSBj4l6PK7Y2ykTpgZeT92DlM09H8w/TfNrfZXEBLov78WXm
         8BDDAxohCUhHsPQsMzEJfcDaWZPpsXRLr34oAkEdtrQkRhc3mnUDak6Nj+mnbhWCsd6c
         w18Mv1I6k7XrUhKjsit2RfEgsmhIl0CYCg35kHB50CG87DYZ02ltyL4KHdTB2l5g4Qhi
         /6YA9NNY2M2/59JdDVtlRGTecO6yu8XyEKtOhVFQ9EDYzZpvcKWrB0CsoT/lByoRyzcN
         OA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225407; x=1739830207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqTQGOfqcr22lakzrEU9GmH3j3SEvT+upsozoFTBBWQ=;
        b=UNgAdCUOz/AqXJ0c+VCyyjj6Pu5gzVR/btgS7r8qjd61LxJ2xkLtyWnkT47GfrK7no
         x8D89sAGlCOKoQrF0utL3cbnA7mlQjqpat7+8GuYYUw8Kx8yz+BMaGJnrAHAdGutI4K1
         s7s1Gt5RIKz/kRnfwqzR5bexGeFax2DJsHf/av81cWgeUVO8On1b1o+8NF+OEfSDnuYr
         XEsRnpKco7lS8kWU0RC+QnIObx33VrEqDFUago6uPYg+Vq+vb3Alx9J8FGHnZPtCxFwy
         vl9UcgJYM8Zfuh9mABtiOwg7VVIiQcIG/nRpvTnoLqNfojKhMZGKndiqDJlABhsom0Cn
         CQhw==
X-Forwarded-Encrypted: i=1; AJvYcCU/TIiuE48UNOQb9lFic/i+05moKpmMofa8H9etSPwtXFxalygJAihfXTD6h9vRWQFwlrQpsjH+TfsCiwD9Fxl7@lists.infradead.org, AJvYcCWkVgtqJLguBp8fbWrhZo5j+6VPmMOQs8m4U/DK4nBWGqDdmo/GcVNOFsf7vpzmvoVy6MS0kcSGUEfXkIM=@lists.infradead.org
X-Gm-Message-State: AOJu0YysQq1QRm8F9iH1Udc0gtNUHnwLNcJZ+hHsw38fcm3/p2LyiwQ5
	WABklKdgirrS/fDWptBglt2fwPM0sTyon++mhDHGa4MrqHB/SVce
X-Gm-Gg: ASbGncsK93uxmT4/vHwxb0wfPuuK5IrhRcplVeAfWz41ErjQF8pIkyWjCm7Zek99zs8
	lF2KDCQqBVsGDJm892Ron5FERnIStWPrduIgyiz3SUP2L2fhKIJ3Sgr6NJbqxabqa0IKSmqx+4I
	gF5pg+ifyu47JQOeyTiBcUUSxWEph8bK9DHtYWd3y1YK3+7Nx+nE/tmhMM3EpSbZ6gh+Vd+icQb
	+t3mYwG87gukc9jp/RY7qR4kV/exjIKEEmLOG+PleBiJNB4iJnVJ/4mxeYeiYNs8cryL0fOBzeu
	Q5TkJpmkw0YBVZyulitr3O5QcvDs
X-Google-Smtp-Source: AGHT+IE8Rd+D6a5FfE4GhUBDXVPl11ELRUcMh1iUYQiQapnXPgx0wFseAaugMpCFZrWcX8Q9xU91dw==
X-Received: by 2002:a05:6000:1542:b0:38d:d0ca:fbaf with SMTP id ffacd0b85a97d-38dd0cb6ab6mr9753836f8f.18.1739225406495;
        Mon, 10 Feb 2025 14:10:06 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:06 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Mon, 10 Feb 2025 23:09:44 +0100
Message-ID: <20250210220951.1248533-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141008_194388_6E9A670C 
X-CRM114-Status: GOOD (  12.33  )
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

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dtsi not to use underscores;
- added status = "okay" instead of deleting it;

 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.48.1


