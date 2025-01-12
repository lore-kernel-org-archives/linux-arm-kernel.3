Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75657E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 00:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:To:From:Subject:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ksY3pTe5FhYmC9XNvS9bCw4xuSS2jCyI26cxeF8DOk0=; b=Xw16HNgXTprGDV
	Sc+fAuCLEv8s50NXuLsoGfFoF2oUV2RrD/GYKeoLr1RkRpz913vfYG6oOAbZM76KYIZ8+NJmcslMZ
	Ogmo0KuO93GtT9TO2YkB7kL7aiFl1HJIDSjcvr6u3owf7KHX5iZTAnJHirmeQWJafk5+3QmKt1Zoe
	p4h0NahL2V34SAnGnY+48WfzbBnYrK7wAW5C9uqMgXTtLMMETWSl8/l57J23IYrlyLslKwRGCCYEX
	YjS5XCyB2hldTK4PSVpHethpIJOqE2gKGH3CNdSoYtxZTj7pW4fVYBY3yiMyptRusGbqAmO4ftdKt
	MCuqgOabNLLL6F4EzrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWmI4-00000001oB1-3TUv;
	Sun, 12 Jan 2025 00:57:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWmGq-00000001o3h-0y9o;
	Sun, 12 Jan 2025 00:56:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso34386015e9.1;
        Sat, 11 Jan 2025 16:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736643362; x=1737248162; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ksY3pTe5FhYmC9XNvS9bCw4xuSS2jCyI26cxeF8DOk0=;
        b=PIh4uDd9ow8J5Yk2gNbW8lPQXbnJmLv9obhknwzk7GyZ+TbvBvF7MdV3sTqY7WRExz
         U9CX8MVBrjHDATbl7pyhs48bvC98mNbMko6RnPHHFV+lhoY8t2H7w/9Nn8Tufm4NKLpo
         zy5g98wO5hlAOzZBLHH6/rUcRHWkP6W0ghd6/NnZSC06JAKkashnCGHLQeNMLZyVbOIu
         Mj3nAZ2GB0imKteues4hIzJbODGVe0qoaomjyuHV7pDdDjzA05Yhqi9pM2mjbraydq6U
         H25xU4eGZQJPCzen2vPDS0/aXJdwFII7e16Sykq9234b6CFwze+z8rESgXESroNtu2gs
         ZyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736643362; x=1737248162;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksY3pTe5FhYmC9XNvS9bCw4xuSS2jCyI26cxeF8DOk0=;
        b=gDsJ8XkfTTBl2jeRDIu9hehjX+UTJvPQA0MpKwTAjoHYnPJ+iM3eoUY/VDgEG3kT5l
         PyW6XVNVkzj+HAb8NhnR6V1jd1E11uThdv0V9UdzaEQdXUv0oXzQiS5Pya6HldWSNtPs
         rCagF453bm92Ng7cnhBqPA3rmgQ5aCkhjXMYPSxn/gbtGMgs4UcFzzMmcQaxdGZI0unc
         cyYrBpKBqHrBdxC9Xlo+oO/sdlaON2QcqbFM4wJ/7SdgXDkZFlKhoW59dL45OQZRnHmc
         kLM33iGpo9c/LFlPZfDo3/2ZbdkJOChcB737a8BHy2qDemBVWCX5C8Z/Ns7FGPkIpr6Y
         6h7w==
X-Forwarded-Encrypted: i=1; AJvYcCV7jPjd/Rnu3OBfhl3jV76B3aewEkZBevMYJXAkvRKawvkSaQ/e7n5VUZtRmU+mnT3wbouMlr+N9n94UwrFeWUU@lists.infradead.org, AJvYcCXxFGiD3QacMCk2R5N3FCxlfM1SNe+zEusl7oPizBd6rjSX0xsZcuB1GKeuQ1MxT7ixCMRlGIyhmO4/fhw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfJ6OmcUtVVLrFKont1bst5rDY1aMZ+Vj9ZSeLNeTkqPfsW5DG
	c7Lmb3wjx+bVJBbQtfKWXM3fqU6BxzJad3LlHC1KPJ+nmOqZfbE6
X-Gm-Gg: ASbGncuALXZUAKZkGxIVt2F1b5HKBlqwi4P9aj8GA8M0mmGDwq0THofVfiqYGPBIvge
	CAnyCZCxupnaCgB+5xJPqaV/gOen2NB0kgWeUxcx47xbypIYn52jT4r/0FwpRUeJ8Jg3ewysj2E
	SIe3At6QyLqYZLYYih+vmqkJ8ZIcoMwZk9CoO4ZoBecREMU78IPWn+yfNvexCCcJZThZmYmII/i
	6f6TWThI+opIVwcfHBsJsr7+C+NzXlEdRJA+RXxCScHKYZaQbFHWtCsGRa5KkNJL+s1EQ48hHoh
X-Google-Smtp-Source: AGHT+IFfjQRmPA7J1JcMDYWuV7GNTmDNiwa2bTfjh+WvuUJzhBu0MLn6yi9lwFvEz/AIlXAd0TJJkQ==
X-Received: by 2002:a05:6000:1445:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-38a8730ce5amr15436211f8f.25.1736643361723;
        Sat, 11 Jan 2025 16:56:01 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf78sm8305800f8f.48.2025.01.11.16.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 16:56:01 -0800 (PST)
Message-ID: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
Subject: [PATCH RFC] arm64: dts: sophgo: Add initial SG2000 SoC device tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 12 Jan 2025 01:55:05 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_165604_276177_32B2EBF6 
X-CRM114-Status: GOOD (  17.89  )
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

---
Dear ARM, RISCV, DT maintainers, I'd like to ask your opinion on the
below patch, which I plan as a base for ARM64 BSP for dual-arch (RISCV or
ARM64) Cvitek SoC SG2000. The main motivation for ARM64 support is the
ARCH support in the upstream gcc, which is not that mature for RISCV.

I believe it's the first time we already have quite some base in the
tree for a SoC, so it would be advantageous to re-use it and not
duplicate the same SoC structures in two places, especially having
in mind that Cvitek/Sophgo are still working on upstreaming and by
far not all HW blocks are populated in the SoC DTs. They focus primarely
on RISCV, so ARM64 would be dragging behind in this case if it would be
forked.

On the other hand, including SoC dtsi from RISCV into ARM64 poses
some technical challenges by itself, obviously CPU cores have to be
deleted, same is true for interrupt controller. And the interrupt
numbers are of course difference for ARM GIC, so they have to be
overwritten.

Alternatively I can split existing .dtsi included below into their
RISCV-specific and generic parts, so that both ARM64 and RISCV would
include generic part and their corresponding ARCH-specific parts
bringing CPU cores + interrupt controller + IRQ numbers for each and
every device separately.

The below example isactually booting (being included into board-level
DT), so it's a real example I'd be ready to submit if there will be
no objections of the cross-ARCH include approach in general.

What are your thoughts?

=C2=A0arch/arm64/boot/dts/sophgo/sg2000.dtsi | 164 ++++++++++++++++++++++++=
+
=C2=A01 file changed, 164 insertions(+)
=C2=A0create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/s=
ophgo/sg2000.dtsi
new file mode 100644
index 000000000000..96afd342bde5
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "../../../../riscv/boot/dts/sophgo/cv18xx.dtsi"
+#include "../../../../riscv/boot/dts/sophgo/cv181x.dtsi"
+
+/delete-node/ &cpu0;
+/delete-node/ &plic;
+/delete-node/ &clint;
+
+/ {
+	compatible =3D "sophgo,sg2000";
+	interrupt-parent =3D <&gic>;
+
+	memory@80000000 {
+		device_type =3D "memory";
+		reg =3D <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible =3D "arm,cortex-a53-pmu";
+		interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			=C2=A0=C2=A0=C2=A0=C2=A0 <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible =3D "arm,armv8-timer";
+		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)=
>,
+			=C2=A0=C2=A0=C2=A0=C2=A0 <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE=
_LEVEL_LOW)>,
+			=C2=A0=C2=A0=C2=A0=C2=A0 <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE=
_LEVEL_LOW)>,
+			=C2=A0=C2=A0=C2=A0=C2=A0 <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE=
_LEVEL_LOW)>;
+		always-on;
+		clock-frequency =3D <25000000>;
+	};
+
+	gic: interrupt-controller@1f01000 {
+		compatible =3D "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells =3D <3>;
+		reg =3D <0x01f01000 0x1000>,
+		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x01f02000 0x2000>;
+	};
+
+	soc {
+		/delete-property/ interrupt-parent;
+
+		pinctrl: pinctrl@3001000 {
+			compatible =3D "sophgo,sg2000-pinctrl";
+			reg =3D <0x03001000 0x1000>,
+			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
+			reg-names =3D "sys", "rtc";
+		};
+	};
+};
+
+&cpus {
+	cpu0: cpu@0 {
+		compatible =3D "arm,cortex-a53";
+		device_type =3D "cpu";
+		reg =3D <0>;
+		enable-method =3D "psci";
+		next-level-cache =3D <&l2>;
+	};
+
+	l2: l2-cache {
+		compatible =3D "cache";
+	};
+};
+
+&clk {
+	compatible =3D "sophgo,sg2000-clk";
+};
+
+&saradc {
+	interrupts =3D <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
+};
+
+&dmac {
+	interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spi0 {
+	interrupts =3D <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spi1 {
+	interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spi2 {
+	interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&spi3 {
+	interrupts =3D <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart0 {
+	interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart1 {
+	interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart2 {
+	interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart3 {
+	interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart4 {
+	interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&porta {
+	interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&portb {
+	interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&portc {
+	interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&portd {
+	interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c0 {
+	interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c1 {
+	interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c2 {
+	interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c3 {
+	interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c4 {
+	interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&emmc {
+	interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&sdhci0 {
+	interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&sdhci1 {
+	interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+};

--=20
Alexander Sverdlin.


