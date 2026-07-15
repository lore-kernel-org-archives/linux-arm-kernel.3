Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D9C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=; b=vLh+E7EQcIBdQBsS1+DjFZI9Q2
	rJfHsJER0kbwqM2zk2vTzoC5C/Z2Czun50SJtLZ4zJ/6TyxOYjtbjtYd+EhY5za7uj5AKLUpfmTMU
	RXlhwwwOX4cOHMIWW5JABNWn4NjMZBGoVWnTL143DbKUSSNq7DuFvpMBeBcXpEGBtjUXkpQoUcqqD
	p76dUu7oxXcjTNNsulUCKhADDtrWKpEyNERMEWYMcDEDxvw/o8Scl/AhScf2K2nbuBpuDaoCLblFp
	4F+6kOMbN2oq/47upODnhOV3EVOsXsjDflX/0s+aHd+I21+d3wV0Oct1/7uk2MUzDtHfbwarL5IEj
	n8fD5Ihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt1V-0000000Dt7b-1evF;
	Wed, 15 Jul 2026 06:23:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt11-0000000DsZD-1CaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:46 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c1601d552a8so525824066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096561; x=1784701361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=W1j9cPm7YegZ7791QdGUxvk+MPr0F3SOjWOMwzC8I630cMdjc/3svkwwuTIl0euyaT
         bPMJpGko28PmCn37a6k9zWkcSdQ52c0n6pl1jxxo7mc3M41rZl4U3XTSBgM12bKRGk22
         XZe6PhUoxCn/df1e3Ke5SjyR+QB4jlLFrNZwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096561; x=1784701361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=pDnqxiRiqUXHQQR54HMUSKOjtdoPXXhvPYDUBPrw7RPifvbW39lCq8+i8rMxaoRCzu
         j2+0FZUFToT7x+mZkIow8n4y5EfgwLat1oLS+5ZCUThSFMi1qdsQBiULZ9muImjQYXny
         WYcMII1U7dfDlLJQPksIxpeMEVg4TEQmDXfPLGVqM9tncH4usqZnb1MjQGVv9xBVb1UI
         2cyWQaLZSFfs+nnSAJT8is1UHmilZONO8KaRQY97T/tjhOj8L6mktWkVPBChKS0fPBv9
         nOr/CQzLh8HoPLJAhIGiu03EpVlEwqrHDvCm8zvY9lXsgkzCmnMO3XvsDdJQ6faC/245
         GYDA==
X-Forwarded-Encrypted: i=1; AHgh+Rqqq1+oC3pf/bntGGzfuYA7I0VCfzvrllXMzxFEYbIuCgmndWKAtP3T0xlPvqRLLQIRGlpHd3nbn6CEjPmQ9J5u@lists.infradead.org
X-Gm-Message-State: AOJu0YwAgY9/pgVMIEyLYEtov/byF89K5Mo13PWPDUHpultQ8I9DZOP4
	b/piTCx5o+VpRBehvyHtS8HHH2pY/wfi/tGpYBbxjolWh4pJ/NLPFcUQfRluOy5JYx8=
X-Gm-Gg: AfdE7clccCBEDK8ebR7UTCu7Ckuz0E38D/1I4Y/cSBxVUEbWfXXgwW9AWIvIEKEqzTM
	p/HWNuv/0KhHqQYdijTsZMl65Veu2aXw1Y8G4kyMDfhGJ+9wTuG7ZSHdKO1RQK+9IIBpcwOMPJf
	9Dcij5rr0XLemX3efZwlyHuA5VmiT5EHBJIqlZbzFCwjdOLYEGlNHH5iLK03rNPAlXpkOvp1AQb
	xY2fQzh+Vb7PuVd17aBW13Bfak8pAb3zau6Mq40fFpqo0vjtzBXn2HerM51z/cat6HyH/wyM6a4
	vXHyKvekG3EYMMt8LLvCK5jjGmcRQgr9UksdV00tYHZNSVVs6E5FTxB0Kp/M27q1fCEwAiu7cZ4
	zznndUOafXRIlx/7C6npUwJGZ6KRfIme9HL9khvNwtF0Nxly1AsKLR03fvKWchzQC2oDrqsf+Cd
	rQM1eMPIYVpWCbVWKQpicoXYtbBJE7yWggnyqpIDwCr1FRGTOrsYew3ukTFWT8wSMwlw3K9LSHE
	YBsuW776j2d2zw2YFdajZ4=
X-Received: by 2002:a17:907:3fa0:b0:c12:34f0:49b6 with SMTP id a640c23a62f3a-c1667b9fc15mr331888666b.57.1784096561463;
        Tue, 14 Jul 2026 23:22:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Wed, 15 Jul 2026 08:20:31 +0200
Message-ID: <20260715062201.3599458-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232243_344375_656EA6FD 
X-CRM114-Status: GOOD (  15.26  )
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

[1] https://www.st.com/resource/en/errata_sheet/es0598-stm32mp23xx25xx-device-errata-stmicroelectronics.pdf
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi, we are using stm32mp257d.

Changes in v3:
- Fix a typo in the URL

 .../dts/st/stm32mp257-engicam-microgea.dtsi   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
new file mode 100644
index 000000000000..5b4287e86def
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -0,0 +1,63 @@
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


