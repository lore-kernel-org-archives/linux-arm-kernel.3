Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773F6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rniZbZT42cTz1JQWgzCA6pN/tKGxiseo1y9AAMtwRAw=; b=eMJnioDiDEbbhzIfkz3R5Z5449
	z6uaw7ZG1CUjMr1PpCU1M/7AwuNFj3XCbSfJoni+kW0lLV0DyrNdsW0GUP+kZ+N5lV3YP1m63pegk
	cynMXBBPUKte2tGUbNI+aAAq+2tyEytb/I/SaX5WHHz8p3aQ4ZGYGXbmkjlhY4USyLMRHHYemhnDG
	ZTiwA0BF3LUyvxtSXApWySDvYma+6cILkwZM7PcJhs7J5sAW4U59RObmDl/7WXOA6Xi31DqtxeAb3
	2un4LjueKoaEkf/iXoOiQMjo+EunL36pbQpIXWfFaaHlus3LisY/OTd0L2wk0vE3KES8OVJ0P3tSZ
	+u/8Wc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiesr-0000000COmp-39Ua;
	Thu, 13 Feb 2025 19:28:25 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqt-0000000CDCJ-3du7;
	Thu, 13 Feb 2025 18:22:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so2357244a12.1;
        Thu, 13 Feb 2025 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470938; x=1740075738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rniZbZT42cTz1JQWgzCA6pN/tKGxiseo1y9AAMtwRAw=;
        b=QnYnbp2yfwL/7/ewyvTWid5iuQ+1kqcD8w0u6Zo7S6GejBeo/XwS4iPLjL/Iko4/h1
         KxrzuZqwhHKp+ttGvzUDVUh9m5ncyaVsct+XZSgzx7X3xE7huoTowMqynIQ9P2QVvYc0
         vYg3za84SfgN8YHWSh+2fYasne+zUhG8gAWd+M4iq08VMNa6+G9Yoa9PpayPI0rdG3Nl
         CeOcoqSPxLV+KOAq0yZ9zPCnWXwpLMDKK9hH9DfLd+RqHtISzwSJ2yGmF93pTG7Av8ul
         DvTteO3nZ/qgPYJqxiQ4FIb5kXaQpvUu1DVTttdeOM9AR5/FuwnTJWK0NmU90BznSxGR
         M04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470938; x=1740075738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rniZbZT42cTz1JQWgzCA6pN/tKGxiseo1y9AAMtwRAw=;
        b=mEaMe/QZaB2p5hakAN1URxFp2PQqi6r06Nf595NJW8inaUftc0YaAN3mcGAHvjPU+q
         hh5OgH1WJf22JJK0yNnOqesQQPrEf2Y974ji8jPLmWKkwEsobeww4P47aBBTUkcLislD
         8huqpDWz+X+zIKasm+ZpIGk0t2y9eJSdCSR80MWLIgmEKevw6K+ek8mYD+o3oQcQ0Z7x
         037lk6N6bt5oWwYdXQqD/HLy8KgzJBB3cHYkvcU0LlSDx2TdXNLFp7Wk/bME6+TRMcY1
         OLWu8TCmBxSa5YQz0vKJl0oM+SGi4EwDFOtpGM0v/dx3xW31ObYWetCreBhBxsC84yei
         FJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHseHJ1K01YsqQjYVCDf4RkGtWONLEr2yQ45Z98XIRu1PG01OeVXGK2AwtcfoUkxkYRep/JTD3u+WuNz8cxaKe@lists.infradead.org, AJvYcCWGr2ceaNv4mXAyJMjzL4sgjwV/n7fyKP6NMauQxnyJCFYKiJs83Ub3tVrk4H5miKkz4NUOu+FEHDL56M4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa3IK6q7TZVfhdX/W0KusF/C1wJdwYRHRQrNH6OSnyXgZibU7p
	eGHjOur7/yVHVXMv+F927Lm39ypjJoviIKtB0Ey0i8tBUf7OpNeN
X-Gm-Gg: ASbGncu1XOIhRb4G60o9+8Mc5tVme4RPZpDB+ZbFeNWkq29/iVPn/xS8xEqGMFHbDYV
	TCh0Hc5nhc43ccJWGUY1JMvnwFlYxskjRYXnWpO/x8Iy6yDXqyk18Px+YrIVzOiyo2quihQt+us
	uvj8tkYgNee7uYju7IlzhQ1xUmYCMVqC4Lh2doVze6lbB1darSQ+MirFgDiT5LKB+VyQIcxPSpP
	IPy8A+tMT9fTZqK2FU1C4YVK8Sq3HZFRKTanUCEqJD8PBxeIEWkFcZT2MncYYCtIm4HOWg08hNc
	PNt1nqz0OJhVclsL0eHMw5AVArVH
X-Google-Smtp-Source: AGHT+IG14L6TdSqETaLgX75QTQs9yCsm1539oykljYLZ36UNUJDCWIIy/ccFKlFu4aXniv6qdFMP7A==
X-Received: by 2002:a05:6402:1f13:b0:5dc:db58:a1c6 with SMTP id 4fb4d7f45d1cf-5decba3555dmr3843296a12.1.1739470938037;
        Thu, 13 Feb 2025 10:22:18 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:17 -0800 (PST)
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
Subject: [PATCH v4 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Thu, 13 Feb 2025 19:22:04 +0100
Message-ID: <20250213182210.2098718-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102219_904328_B106E9B9 
X-CRM114-Status: GOOD (  11.74  )
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
v4:
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


