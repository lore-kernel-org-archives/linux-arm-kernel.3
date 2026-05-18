Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4742ACD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F82I1V72Vx7fqVbAKfdEbmQ6SnibYwxzPYzRPk1i94Y=; b=dyIB/sUaDNqR1CZkuKlc1ZPjml
	LaJEdTEvtwoTyGrCOBz9wKJ8SxRFAncnhWcVoUJs431f8HPqgpDIMihNkKsasJ2H4tNl1l+YJ8JUn
	UK2KMAOv+rhLtArNwNojOzd/zM/rjhWs5wrj2det5GFXIT6/Qh1H78B1pUtT0hMi+GdEZeouWOrda
	DyhV41yDSxKIh6v9q7wCZeVFMvOoanv6+nSnPnHu5LkKAcJaI6nDydXiUb0GGuQMKNKTEHw1BPVmz
	PiZow13Rws9J3LSaztaXM95lLIiufZlnICc7B5wC/N4R5an/KjKs89x1h7JLiXweuNTscFxdfJReq
	hHI/GkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz1N-0000000FzdE-2plJ;
	Mon, 18 May 2026 14:32:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz16-0000000FzIL-08mo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45e7c636e74so785555f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114742; x=1779719542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F82I1V72Vx7fqVbAKfdEbmQ6SnibYwxzPYzRPk1i94Y=;
        b=omUaDcyufESs8QJ0wmYLKzUi8rp4CPtzEniTnQmC4BCvqig7eDYZDuC6RL++HVtC7o
         E8QqpFmgXgQQ/j0ZNDrHBVIga/9GV4g/F7Qgat7iIr4TLXqDGasUsCdTAaWOiczmD50d
         xRO0mb0Tdt/j6eTCXBuq/wYjSjNpA4xzLIm7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114742; x=1779719542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F82I1V72Vx7fqVbAKfdEbmQ6SnibYwxzPYzRPk1i94Y=;
        b=dcvr6zyvXB/jFxDUYDBhBjib3zLAms8vNEaT5UcjYkIWRsdgeNsh5DVHQdbtZkVchb
         VtIs53od7TjmSOPB5Mpk6KeKQ0zXPmkgLYFFUla76zYUeqhb3hqMmW6RZLa2+HqWd5ft
         gzpg0cIxrXRdgF7ab4BjWjd3MKFnvLwh5PDji7JVs7UoTIPhbgb2GhPvy3uGEEMGkN0H
         YRvkI2jgaSBLBchXsp5fZDWdq/XuzthCY5czNLDNNO7QNJadbQgycDBnbXYk00Tkc9NR
         AtD4vC2Lg10JYjyJTddQsO/CC+7XZnKw2R+SzqwBLKEkD123O35+QfDHWAF7jhI1WZff
         8zcA==
X-Forwarded-Encrypted: i=1; AFNElJ/aw/Db8i5LbpjXbzjDCgY9Gw4Up7HZbw+avG5a2w+S5OWi2xKZXlEMXkx13Q3VomUAa5XVy5okQRxaYjwTKsdM@lists.infradead.org
X-Gm-Message-State: AOJu0YwEy5+CcG2/n8CENGLPF1nDAzE4yf/nWexocB6FesOGDDkgc6c6
	PqOivXtIraK4btJtXg3O787wgDTc1PKfBN+t0Nq6yvnYxcOkrWze2RyE5S1vV9I2c+4=
X-Gm-Gg: Acq92OGvgDEpGk8GOrw2OK7NVS66WjB4frYD09Vohm1dWIGzmfuL4IHyx7sE+OZbPmq
	+bZvAowkv+2THNbvQMc9oQP08mAxntNe4rGsWe7vCjVtZEyIaEVSa1+bAlVCc3a+w4ScrzHtRk9
	IBpjNA5tSPV+WJNw+taM5NIJcDhOiEA3hsQXUmIMEgRpEcaijcPr5psXXwuJckwyz6F9tI/0/K5
	X3hkLoYMcpMO+ZY3lF9flpDRDIOfKlwIRtF0AyszcVhfoSVOoEqJWoHh/BjnaUfFz45HgoDC/hO
	RmcQ5zyUfZAnWJlNhHfsNYWuFNI4U93CPCmmbmSGuUb5O+1mgrTcLanH5XgkOKG9MizWYGnMaGP
	zl3O+72xh9A3onXcg21Dm6KEnhN19x70m5H1h5+1XAknVeO55Wo24z+4yccVmewaWpCF79rr8V7
	zAKkyUeTR9F2RuqMW6SjwDouck3mZ3Sbj5NxvKZTi0T0SndHTmX9Dknb37hQWbR8IluzkUIGK9P
	3lOidvDolbw7dXcJCBWFhph/mJFZPRsbhTOssZrDHscRdr3emLufn7g0a6KuRgpx7ZPYw==
X-Received: by 2002:a05:6000:438a:b0:45e:82b7:c260 with SMTP id ffacd0b85a97d-45e82b7c364mr4097773f8f.2.1779114742339;
        Mon, 18 May 2026 07:32:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 12/15] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Mon, 18 May 2026 16:31:27 +0200
Message-ID: <20260518143150.3138712-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073224_130218_5DF9A24D 
X-CRM114-Status: GOOD (  14.41  )
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

Support Engicam MicroGEA-STM32MP257 SoM with:

 - 8 GB eMMC Flash
 - 2 GB LPDDR4 DRAM

The SoM also provides an Ethernet MAC, but Ethernet support is not
enabled at this stage due to a known silicon limitation documented in
[1].

This corresponds to section 2.21.2 ("ETH1 RMII mode could have CRC
errors"), where CRC errors may occur in ETH1 RMII direct mode when
directly connected to I/Os.

The workaround requires use of the Ethernet switch (ETHSW), which
introduces additional DT bindings and topology complexity. This is
intended to be addressed in a separate patch series.

[1] https://www.st.com/resource/en/errata_sheet/es0598-stm32mp23xx25xx-device-errata-stmicroelectronics.pd
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../dts/st/stm32mp257-engicam-microgea.dtsi   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
new file mode 100644
index 000000000000..67be66cd1930
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/st,stm32mp25-regulator.h>
+#include "stm32mp257.dtsi"
+#include "stm32mp25xf.dtsi"
+#include "stm32mp25-pinctrl.dtsi"
+#include "stm32mp25xxai-pinctrl.dtsi"
+
+/ {
+	model = "Engicam MicroGEA STM32MP257 SoM";
+	compatible = "engicam,microgea-stm32mp257", "st,stm32mp257";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&scmi_regu {
+	scmi_vddio1: regulator@0 {
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+	scmi_vddcore: regulator@b {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
+		regulator-name = "vddcore";
+	};
+	scmi_v1v8: regulator@e {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
+		regulator-name = "v1v8";
+	};
+	scmi_v3v3: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK7>;
+		regulator-name = "v3v3";
+	};
+	scmi_vdd3v3_usb: regulator@14 {
+		reg = <VOLTD_SCMI_STPMIC2_LDO4>;
+		regulator-name = "vdd3v3_usb";
+	};
+};
+
+/* eMMC */
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&scmi_v3v3>;
+	vqmmc-supply = <&scmi_vddio2>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
-- 
2.43.0


