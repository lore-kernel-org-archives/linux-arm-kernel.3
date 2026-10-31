Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FC4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Raidsjpy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wc57TvhD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=; b=RaidsjpyYzt9vm
	p3ZsuHm7NQxCzNJzKZGBluc1hInYy9cDH+uUqufe9pcw9WXfEgcUONUdKkGKUJNtuJXu2+5lKMoHM
	q+aOhL992a3FMPI6X83/2WXZQJs5EZp9mDm70s0OsgUYhmAQ1skQ8QNnAzur8kCUkd9S2v/ARzjUL
	I9JkPsOrdZdYXSUQyJKTpUJY57quwRdn+VPk+ruaQb7YbAlmkXKSD2GpgHCnZIHF7VyaEcZKC56QN
	vbGpKKKp+ACZ6lnRaoq0+hObT65cbcTBRzDarhxPpAVnouX2iOksO5xm7jwMWIJ5vtr+e2nQPvJQA
	VCsmyclIVkthqiVy41bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyoO-0000000CsHp-3JUq;
	Sat, 31 Oct 2026 02:27:16 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyo8-0000000Cs79-2RwM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:27:01 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6ddef424972so1042663eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413619; x=1794018419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=wc57TvhDI9ZG9tZY+ThPdwMf3sXi83dZbyGvllxyjlnmpnQoQ0G/lG+EH9n7a/jS1C
         eGiw58xP6lIM3gGH/ja9oxvwHNx6LL/47qOWG4w9orIwFw1kFP+fyf08nMjZqHQowefQ
         XbrDBQyeh5kfiavqRgwHji6VqCCeUdsG6rgTSH0J8UwhdseZ5nnCqeFtC5nkNVRSsW4S
         9B8J1TsE8biNNXdNS54k9matE319cmQSMlWnIAIQKAqMlNy4j6xF00gH1aAH8sy6gXy0
         W3geXM+wzSbEZ4cS1scTACkwQ3GJlfg5qtr78z8HJRPPqSnx/g+ls+jTBh43XghyiN7r
         2Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413619; x=1794018419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=S7OgrsOwYF6uAnoKupiXT5c0ySyp3PzY8akbS2DfVBDADjm2CzIzw3Nt/OSQEbaMnG
         lXri+SY2IjUlQZqxn4aMdetkXuHeAf9SG5op37DqYKFbE2BHpd0D6AXszd09rAbDeSNH
         ARc5M8PWOZxNYNY+XCSdhGyBL/ySoIBJgWYSC2gS1mopCiikiOikGUPqIQiSIln+CQiX
         02nNMU6doRv6zg+C6jQ2UpcNLAj4sqHiCa6uVL1vpk81wJnWo/Ysb9LNpNGhun30xqz0
         vnswsd60mMFmY2h9fN92ore3sTmkGVdpRe5VHMW9ycCZIFBeMf7sRBLQnv7sZGXxX07K
         5cBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2dkhEp19Kae6m8elduMhXHKMy0iAE+KSOZbvMF8i73OW5bSMoPI5mVqof6d5s3xFY0aVM+1qEf1KHTsSldWw+@lists.infradead.org
X-Gm-Message-State: AFq9FYKwu/LNlK/dUJzn1LqHa1fVVNrAOwpzt+OgaQPek66P7Dp3iR8v
	TXcMqG9V2HTbJz/IUfKO+p3UUOL0VFw4Uu+XC9QdYcc0AkYNnntAnEke
X-Gm-Gg: AYBFou26O87KIPlXqu70bPZgr58laO+adAQNgFl4SX2yWQLQAQicCo8jlXBf7oxNlaL
	jE9iqcsR4OIgmULRBr/A4C8PbOQ3hgxBrVGrDB7P83lCjY5yRK6tvW+6yf7KhLjIu2DYXiHC4uf
	ECwDLzSr5AsKzLo1h4w83Wq07mC3PjOlmd6O6FWBcuphBxvvHiuV3ty5110SEw6uZX+nYrFn5Eq
	nq7Q4wq/Y+2PQ+89WkN4zvTFzS6I9MNxc4iPSZbfONrj3Pr2KVZw5IEMKFUqrbY4MwAfyL7b5HQ
	8thXn8cA7exql6NGGR6MBT8HpbgUpEtZv0fYnJBlaKDgPaqWo0Ex6jW1BSBtr8lyzS8qah7izPw
	taFRfiRdF4DEUcPmw5vnUuovc+Weaqwp9/dKnb34ztRWhxE2p3BhIRoqCqqb75hb4k7d7/MCPoP
	5v38iYl9eR4TnKcvMchNw11epudRGL+EgynvGYtpMvzVPPcHjksGh7IE8X/u3ux/usxsBZtduHo
	lwv/lA00uci64V3HIVypzqVT3i+22OTVHWjJXwgO/DDbdpBKdJxTBljknkHFCDCxEha59TfztWJ
	qVJGUmD40xB7lHe7my0b5KxbVzNnC4X5WssVvtrWZrOrcmFvUTdIMk8ttMNAGMw8jvHvRn+wix+
	AAlkbdIKv3IoUbjHrv0xhI0gTdDY=
X-Received: by 2002:a05:6820:1384:b0:70a:12a9:c43d with SMTP id 006d021491bc7-714f2988c22mr2274753eaf.22.1793413619538;
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d12f2sm3401232a34.17.2026.10.30.19.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 30 Oct 2026 22:26:57 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-3@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192700_645731_9A326397 
X-CRM114-Status: GOOD (  13.82  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Supply the 26 MHz crystal and 32768 Hz RTC input, enable UART0 and the
AXP318W on R-I2C0, and describe the schematic's PMIC input/output and
CPU supply connections. Preserve firmware settings on rails whose
working voltage is not established. In particular, BLDO2 has no
programmed voltage constraint: its software 3.3 V selector does not
establish its physical output with the schematic's nominal 2.4 V input.

Describe the card's SWOUT2 supply and PF6 active-high detect with an
internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
1.8 V input and must not be raised for SD signaling. Firmware must
select the 3.3 V PF path; dynamic voltage switching is not provided.
Keep other storage off.

Connect the documented bank supplies. PL's self-supply phandle is
omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
fix is required so these connections do not trigger incompatible one-bit
bias programming.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6461d5a40537473fc62da6ba6a0d82c0..792152525b433b0caa5118ed2669f548835717e0 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..341c24360ce29e29f8fc4631924eaf48b7b1f809
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Radxa Cubie A7S";
+	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
+
+	aliases {
+		mmc0 = &mmc0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_ps: regulator-system-power {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_ldo_input: regulator-ldo-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo-input";
+		/* ETA3521: 0.6 V * (1 + RP298 / RP299), 30k / 10k. */
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
+	disable-wp;
+	max-frequency = <50000000>;
+	no-1-8-v;
+	vmmc-supply = <&reg_swout2>;
+	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
+	vqmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&osc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	vcc-pf-supply = <&reg_cldo5>;
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys";
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-name = "vdd-cpub";
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-always-on;
+			};
+
+			reg_dcdc5: dcdc5 {
+				regulator-name = "vdd-cpul";
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				regulator-name = "vcc-draml";
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				regulator-name = "vcc-dram";
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-always-on;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc33-lcd";
+				regulator-always-on;
+			};
+
+			reg_swout2: swout2 {
+				regulator-name = "vcc-io-card";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				regulator-name = "vcc-pl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-always-on;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vcc33-18-usb";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc18-pf-pc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-efuse";
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-always-on;
+			};
+
+			reg_eldo1: eldo1 {
+				regulator-name = "vcc09-vdd2l";
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus";
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.53.0


