Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37DBE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE7mi4emr50jEpqtObN38wFodAKJOCr2oYhlGDwmbxc=; b=jRlRyFwF5PIL5N8GUL1tBoZ9E4
	h5PT/savJkLe40AbvjfpMCaPM4qiwdfoNNjmS0MWyKGfv+xfEVktjMtZ5bNsw4TedIDkvzFE9gVVm
	IQNS/XRJzDhbdxt8DMQ1UYBJEXRcwcLmx9YsnirXQ/vOM9dIloBLtCAOrrbuHTafmDMcRKWuW4HtJ
	xTtQQwekrnZkQoVon50reJUctJR9k672vLvhH4vZw3QQhXzzAVMO6MFYfc6aEfplI64Brhn+xlm2u
	/o3hMrbyXghqWid+kdOz5Vi9H9h2dT5u9BWnZV5NpxJf7LX9LG297sVO9iRsFc6LCFF8ZowLVuEuv
	+20n3rCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaVC-000000021sK-05lB;
	Fri, 06 Dec 2024 15:44:22 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaT8-000000021Dj-1yjg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 15:42:16 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9H6Fs7zGp3w;
	Fri, 06 Dec 2024 15:42:11 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b972sbQz2x9K;
	Fri,  6 Dec 2024 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499726;
	bh=2vHYtlzccOz/AoVEwW4kXIY0ycA8Zvt+Xs9cHXRdiJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAYq4u5bF9m8DT/YECg03J/MSL6xyK1iAzF7LTJkjF0OZN8qVCloEf+5KLYTnLy1Z
	 Nwqf8nF7fuGXTi9KT/WSadHbcfJNx6/gUgnMColDtYwTwja0KNxVrogSbduF6Ts0ak
	 AJwPrCZskOIrWatIIWWkexRHPwrndE62EEXVLcLnSbsU/BY4aYnw3Gd9bZxGYT3C1k
	 GhdYYHCNinCjvhyci4zrN32mb44E94LqDrYqmQ32HyLGYGVsNSGymqfk2/5CuvFg7G
	 mCvY236YgoB97+EJfbpzEUxsCnxy9qIXv23UdiVD6Xk+RtWmJUj3hu/zHd9M1jMNor
	 8IkIkWluBBf/g==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v5 2/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (hubble)
Date: Fri,  6 Dec 2024 15:41:47 +0000
Message-ID: <20241206154149.4271-3-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_074214_560012_18ED9D10 
X-CRM114-Status: GOOD (  13.11  )
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

Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
They were launched in 2020, and are based on the Exynos 990 SoC.
The devices have multiple RAM configurations,
starting from 8GB going all the way up to 16GB for the S20 Ultra devices.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM (Any more will be mapped in device trees)
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
new file mode 100644
index 000000000..55fa8e9e0
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 Series device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@f1000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xf1000000 0 (1440 * 3200 * 4)>;
+			width = <1440>;
+			height = <3200>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: framebuffer@f1000000 {
+			reg = <0 0xf1000000 0 0x1194000>;
+			no-map;
+		};
+
+		abox_reserved: audio@f7fb0000 {
+			reg = <0 0xf7fb0000 0 0x2a50000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup>;
+		pinctrl-names = "default";
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
-- 
2.47.1


