Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71325C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+40mL3jZJ6m57RT2qXKG2PKW8kpulSlmUXjQH5BVdhU=; b=qxG2fwgHCPiubThVuDUJ6d6Qew
	VmzRxHH/ke+HF6o8Q3j9cy01FuejcCLHWqdD0PgadngeXsxCOiuV+ya4uQlaikPEurNfvc7bYTMlw
	jwmmxB8vC5874soJUWsRrHDDYGPqN08P9G49RRgYhQhclvjK9uawswihN630gFaprzyXjfaZItMLv
	a4Vyd8UerLFjTGK8RNfgg9f6kJUUAoRU3lMYHTWReXeclSio9Aqn/87U5+2BYYkAGnO69PMTqEvCp
	+A4hI6/dPR6uUzMaLS4D0qJgyEUO+9DTBQR71n4e438fVvezOK8Vk4Zc0eDlb0PGoxP5H2DZHmoto
	KRPQISsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLWn-000000095Nk-2pHd;
	Wed, 12 Feb 2025 22:48:21 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLSZ-000000094e4-0gTg;
	Wed, 12 Feb 2025 22:44:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so477573a12.0;
        Wed, 12 Feb 2025 14:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400238; x=1740005038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+40mL3jZJ6m57RT2qXKG2PKW8kpulSlmUXjQH5BVdhU=;
        b=mSnaXbZ6d6nLmIuMEyN9wWR419PpDSyP5EBAEpMrj1UVjH4iHiLR5vcpF8ABviTAkC
         GwwOx1KKoXtxvBO4uJJRX+Sf1gixNAP+oGlW0D+WbfKEYX6TEISRfL+vVZCJi2XzhZY1
         0tso3XqpsmfHGU0bTjX9sN2Jt6mlm9aL4QA4kKnc3/2MVAdzgCo+738L8dK07ugSEPLo
         zvAHnV5enBh4TkSUksDM7Ong4wQ76poOT8mKtOwjbWIoHf7u7DGV+Xic4Q2gXT26ujBs
         vtyKxmsp/uvj/354nYKrVqVpQ9C3UzyhDr64kpH3ksmtyao0DZVTyBGfNyXRA4ONanOV
         gJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400238; x=1740005038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+40mL3jZJ6m57RT2qXKG2PKW8kpulSlmUXjQH5BVdhU=;
        b=cRnKMbwEYVP0NfBBCyMfhB3Kcw5wFNUB4AHSyN5eXcKLMeZfjkb7u8JsXxh0cIY63F
         iRqWYAl5jHtY6f8sieHD72dIEtk8+RWYfC0EGErflQDovSVwPlJsm7QO07GzqqzZYmwf
         fkCBCnji1GeppRORRkNWTfL0YnPSULk/zwJS04Bvv3VVXlC1hputXwjqrRwALCLP7Xqp
         VMVH9mAVjjNuHz9jOLw0q7kO/8C4LL5BdbxSDV4ncBmGYu1F/XjIZBOS7OMfO/b2RWpL
         SoYT7/OuFBH2b3TBlmunvZaAVhxO63/Zp3QF+iQ+J2oaK0eBzvM3X0Ymw0n8Mk0j/5a0
         R21w==
X-Forwarded-Encrypted: i=1; AJvYcCUdI1nzmQvvw8xmowBda6QFS5J6Z/muObAhrBpCNHSbg9zcP3FbGM/2os+xrYWN1XkSvhriVwGntqkmJg0=@lists.infradead.org, AJvYcCXDQglTWP8ByALF+UCCtDnGfOzxke+Idl8mhqauLL7mewj2dvDT0Vn+oRFzoVBta2pJgN8ZrBzGzt1m0GdMkoaU@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPn18U5+s2f/aLOoNpWe2P/30meGG23k6PkBmPiFedLsDmIP0
	wSDzLlPhYJQg3y2EWI83zrM6eM+4txBDHhB0o+NouySVhRv2/Lxe
X-Gm-Gg: ASbGncskMvJr1Z9TWt/MS3JrTKtsoupT7qXlNgMNQJs31cIFa2LBL7R0UtgQzSOebZ3
	eG18uMkjpJ9JPGrBZtUQbkT8BKhPIfOqalz2DW3NSNagpStQapWDzEisZk+ySKcRm1Zjy5YRpDi
	N8+CmN3oX7QHkERlrcnAwW2ezFlmuM97BdQILVkt5ShIhVkpcspXy8i9GiRMME1mf/4wwG1Ekxx
	rPNrQCk8S1SRYMiGr4FCgLM8cu6s6wtaRBPGPiwhpd+CnZ+1cYA+mH9wlmjiYi9w4t4/m6Kg3kt
	0z+foR8sGygYejO4F8fFzrAnQLK3
X-Google-Smtp-Source: AGHT+IEv+/AzdknABejwMbnqDJnaCwlQfqvJh/OI5EUKfTNWF0GxuzkjTpxXDZ3NzmJ5AaWO5+exLw==
X-Received: by 2002:a05:6402:3495:b0:5de:5e08:babd with SMTP id 4fb4d7f45d1cf-5decb8d50f6mr651452a12.11.1739400237691;
        Wed, 12 Feb 2025 14:43:57 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:57 -0800 (PST)
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
Subject: [PATCH v3 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Wed, 12 Feb 2025 23:43:35 +0100
Message-ID: <20250212224347.1767819-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_144359_206461_4C07C911 
X-CRM114-Status: GOOD (  12.65  )
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- relocated "memory" node according to DT coding style;
- moved GIC node into "soc";
- referring "soc" by label;

 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..98c8d300347c
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv18xx.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
+
+&soc {
+	gic: interrupt-controller@1f01000 {
+		compatible = "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x01f01000 0x1000>,
+		      <0x01f02000 0x2000>;
+	};
+
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,sg2000-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+};
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
-- 
2.48.1


