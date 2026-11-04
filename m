Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE098606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yp48vbH8;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HSNP90b5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=; b=Yp48vbH8L8rY0TBBzl8e2+lMX+
	jmX8qY9RJiAVI9g0AphhgH1UVFZgScoC4oV2gLoKPCYgmmC0BlUPCVeLSAKt6f1m1xy3oJOTCbeVo
	vyyaWxNu7yfap3oqWGSdxyERkTmcUgEz+xeSMsFsi2ztEVn8WyEp9PEkiRQ6cK79kHQe945YP3ixH
	U9fhCNnowUif/Tsu7GYEmfqf98v4Lri4lPfhDsL1tNj1ttbTmLdLBSzfmVFl19sbns9cpD3UFmAGw
	0pcyziRnId6N0QwXg1NRrYgEOI6wrOfwZGhOLm7M2fFHDGeYdPTrAFbrHjZ5mNrXnNTroPPWClZ3j
	t1cPT40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOecq-00000006Acs-0c5J;
	Wed, 04 Nov 2026 17:18:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOecl-00000006Aby-1BlH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:18:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8770475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 09:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793812687; x=1794417487; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
        b=HSNP90b5ls3QFA716P/rMe0HB5Nwtc0WmM6hVOyox5QAsHtkYImH5DSPJ2DCYo7uFA
         VJgVv0NdauiMx8Ce6i0fKgzZpsTOjaV+SgJiq90uS0WrFOkwEfYj9SiDx7uoz4UAdnph
         cJfLZasAUweZDOEiGPvgZWApj/9tDis6AMr5QOaG4QOeE+hhHzRbh5W/H54mfkYpED/V
         6UetaZDZmD0UGD/bIKyciVS4l0lYxK9eadBy672yzg33ginAaU+5y3VRHoCkKY0U+uDw
         3oNwgXAfo3IQsmS6M18ThlvRbA9+mScnj7O1FDHh70jzep1dYk1ym5JuRldbSIhSnhGl
         3aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812687; x=1794417487;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
        b=gY71N97ryDvKWQ5+wxFbNTyDzGnX/nWccx2X1PHlqFqDyGXWDyRvlJYxwbrQvZNjq8
         aRuwfzormMi4tmhFiv66qvPWl2nDx99X9/ZDE8TlD5IkRQCnLhB1uPnG7QTkczsL5zhq
         al4rpmNt6Dp+PKKe/Icr6heqRaLt9wdobl8FAAaR/HoOhzPw9sURz7wRobgNZCEYiPyc
         IgVGcM3ZB7au6aDerwnyOVm9BdI07KL99BZ2soYuE8SXULlqaKhGnRxjYVyEjbMwhAcZ
         TzjNQK9D9Er+U26ktTs+csriJHKscJTdUbivjGhS98mmeaBE5zgxa2NLgDbB3k730V0Z
         /Tmg==
X-Gm-Message-State: APuU4Z8c8Lw1UvPFKZCvyqw3USNFCjLoHF+ZqyJ6HY+XDTNJGEK8Be6g
	4bbD34USJk3iJBLocPY75khZ9NLgA0ouNV+CxSVNTWlU7kOlgaRUopabyF/TA3dnIYE=
X-Gm-Gg: AYBFou3hdL6fF7uuYDykldoR6LlOr8KO13FhYv1CU37sVluMcJ31KIVvXmvk7UY/WuR
	S9hHRgom2XZVWuPJM0snfKUBiAqjcF+7YomNb5g7FQFFhr+Eg+1kiKByyYzAGu1qUpWbM/LX2HO
	9DtoTs773tTeb2NgFOtnMykGCBRtQfd3R2ClUaEVwfALliMw1GGmqHH+i+uuzX6xO9OHcL3aghw
	CWXhIrAwEGKEE3GiVXyuyAtutoYXjDmm/HkXPe/o7aKe1Vqkabo5BYbu6fwXROQNxfutVG6Y01t
	ck0k1SYos7zIBqHQlqM1leKZ1q0paZSmqUuuODOdwrty9epIZd+RY7kLjUZiMBVD5PAjd3bNyG/
	ImGeZjIvmMM45XjzApo2w58HXQSAdBNjVjpnGtI4HINUSDedUuzp1Jr5+AK98sTPPWmj0fV/+Ba
	y3n00eHBuzkcS3AzwUaM4Ih8NuZPJRLx9Kw/V2Eq8C9G8RqzN6umBk1Dua0B30qwi0e41tMkPYu
	GcE0ZDzfnWvzpHtyvotpDGXuQNiSHis8jo2pqTwqSh/TkdI/Cdha5lraUkc8XCAb6VfacKbCFZK
	GQn2WD1g7KUIbpsnm22IZ30Z5K2beQNDKnRPEo50U1gk8ieqrsg13mCLY+XjqiSg0W3HQcP7k8x
	vO188bY+hdQ==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr373130175e9.29.1793812687472;
        Wed, 04 Nov 2026 09:18:07 -0800 (PST)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm99030535e9.5.2026.11.04.09.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:18:06 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 04 Nov 2026 17:17:58 +0000
Subject: [PATCH v9] arm64: dts: exynos: gs101: Add thermal management unit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-acpm-tmu-dts-v9-1-e5c53cd8b440@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMVo62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3cTkglzdktxS3ZSSYt201OREi9SkFAtTwxQloJaCotS0zAqwcdG
 xtbUAfAtwa14AAAA=
X-Change-ID: 20261104-acpm-tmu-dts-feca8ebd851d
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793812686; l=8231;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FzMgyf0GkXAyHz8KN3lxfqbJvyM58XZDMZmsVFVF56M=;
 b=VcLAybzUpRdt0QacvThY4kiJAnifS9EwqcYep0QB5ESA/2J7Rlxdlz45MZVYRS2cA2JubWltF
 cvCADLbjES+ChWqPWNh7RaCINiQSKBd1jYJmS8Hh2Qrrd2hE2vlSM92
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_091811_382237_F994D552 
X-CRM114-Status: GOOD (  17.03  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the TMU node and thermal zones for the little, mid and big CPU
clusters, and make the CPUs cooling devices.

Trips are ordered by temperature rather than by name, as the
power_allocator governor relies on the order of the passive trips.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Hi,

Add the device tree description of the Thermal Management Unit (TMU)
on the Google GS101 SoC.

The GS101 TMU bindings and driver have been merged in v7.4-rc1 through
the thermal tree. This patch is split off from v8 [1].

Changes since v8 [1]:
- dts: set polling-delay-passive to 250ms so thermal governors (step_wise,
  power_allocator) periodically evaluate and adjust CPU cooling states while a
  passive trip point is violated, place generic #thermal-sensor-cells before
  samsung,acpm-ipc (André), fix tab indentation in cpucl1-thermal
  cooling-maps, and use GPL-2.0-only SPDX identifier.
- dts: order thermal zones by name and place cooling-maps before trips to
  follow the DTS coding style, and keep trip points ordered by temperature
  as power_allocator selects its switch-on and maximum trips by passive
  trip order.
- defconfig: drop the patch. CONFIG_EXYNOS_ACPM_THERMAL defaults to
  ARCH_EXYNOS and is already built as a module in the arm64 defconfig
  via CONFIG_EXYNOS_ACPM_PROTOCOL=m, so savedefconfig removes the line.

[1] https://lore.kernel.org/linux-samsung-soc/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org/

Thanks,
ta
---
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi | 136 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi     |  18 +++
 2 files changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
new file mode 100644
index 000000000000..5ca8360ee97e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google GS101 TMU configurations device tree source
+ *
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		cpucl0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 2>;
+
+			cooling-maps {
+				map0 {
+					trip = <&little_mitigate>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				little_switch_on: little-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				little_mitigate: little-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				little_hot: little-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				little_critical: little-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 1>;
+
+			cooling-maps {
+				map0 {
+					trip = <&mid_mitigate>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				mid_switch_on: mid-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				mid_mitigate: mid-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mid_hot: mid-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mid_critical: mid-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 0>;
+
+			cooling-maps {
+				map0 {
+					trip = <&big_mitigate>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				big_switch_on: big-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				big_mitigate: big-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				big_hot: big-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				big_critical: big-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index b218ff50d228..395e4716f8fd 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -91,6 +91,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -103,6 +104,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -115,6 +117,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -127,6 +130,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -139,6 +143,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -151,6 +156,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -163,6 +169,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -175,6 +182,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -646,6 +654,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		tmu_top: thermal-sensor@100a0000 {
+			compatible = "google,gs101-tmu-top";
+			reg = <0x100a0000 0x800>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+			#thermal-sensor-cells = <1>;
+			samsung,acpm-ipc = <&acpm_ipc>;
+		};
+
 		trng: rng@10141400 {
 			compatible = "google,gs101-trng",
 				     "samsung,exynos850-trng";
@@ -1937,3 +1954,4 @@ timer {
 };
 
 #include "gs101-pinctrl.dtsi"
+#include "gs101-tmu.dtsi"

---
base-commit: 2c222a46655e0191e70ca92258ad3b3ead32787c
change-id: 20261104-acpm-tmu-dts-feca8ebd851d

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


