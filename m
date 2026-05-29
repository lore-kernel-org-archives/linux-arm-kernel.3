Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14D1CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F377Fo6uOcwDkhqFQvTWG9lQAWoEou84WBnGGfIw1vU=; b=ZeK11T9YV3HXd7f5tDtH5OZNjT
	xJ+SF1ExH1MbfFvSoFTsUQbCbn+qZ9WNt61aH2nHmSrqrm1SEjTmMwqD681iq2TyaxdU6iq309G0l
	Vnrt0qV9MQPiuh6KVIhY6MmkKFDrz2ho6oKET5fOwHacCoZqkL5tRhobaXOYM4Y6lGNvZtCCkr5lR
	DL5lKuKTEF5A5MYZOhy8pm+9UwRGt/bKKIV6WHQRl/gx0wt4Mn0F+yrKUimCZLDWXi1rwzzclZH3S
	NY9KrEGdSWvwMKD90AhHdIboF8Z/ibW+Q6pzboc1IgQdVf1vJ+BQiet87eUq61EU7tJIGzpkJuOOc
	cvE9WBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyVD-00000007YuD-3DQB;
	Fri, 29 May 2026 14:47:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUt-00000007YaU-0GHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so89582245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066057; x=1780670857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F377Fo6uOcwDkhqFQvTWG9lQAWoEou84WBnGGfIw1vU=;
        b=Mf04SJ9CJ+stuyXlcN/JTY5XvFMbXAYRZ2+8kXdow7/B4sQj8qtBxfZu279T3nUB9L
         EjLTRiPZEEH8Of01kj4hhGA3/1GBoqfNDPLDKSrgwYQt1EGfCIpPoXaEwJAWj5PoNALW
         p25NXpm9bfaiElzDG6l2DUTTBMC+hN/LoaxEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066057; x=1780670857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F377Fo6uOcwDkhqFQvTWG9lQAWoEou84WBnGGfIw1vU=;
        b=rkaGDhWN3oj8COzy8xPU3OJfwcOkfbzMwroNzkzyTBR3sukuKGss4T4lGKF39KNAMU
         YXyFQop6N8am87U/f8snVVhXQPhfdr2tkfOTX5NKt2+IpvtAOm47SNivnr9lADu6lAdO
         QzZMrGiEwo8Vw0BtGes++HSx8xxYiiXO2NNfb+gEGSGDCvAXBhcH6f8aRwsfxPc7Z2p0
         m8vAX/SC7o8v1ZhOnzps+Lx0SbgnmrV7mj76pL6Gh5Mlj7UpnQAF2wQukZbEti+9OLry
         klvPjk/a2MZfN5ngEatGMzyeGQBj2FLeTjSSdxWN8NjcgTh8e6U3lmAkUZ0jt4ulUye8
         baJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SgdNXGGfA8rWrljFV0RZ3Nx/GKWhgq6JCK7hPwYI1SOYQ0Gm/lDChdptvJ2dbnfoFZztIQn/E9+fUALQL82pw@lists.infradead.org
X-Gm-Message-State: AOJu0YzeOvRoQ4tWU/KdcTVA7CKmzVhXPC04Ks3ZPQo5iND8pIoQ+Ff4
	GdfYkOW3rPYfaZ1clKVix9Gsf7aEM3bZes2bSbOPhw58KtYI1hplV0UnMF6qvB0zc1s=
X-Gm-Gg: Acq92OEFVhBkZQEPn1/RDqaz3WhMZvO8a4ttyJA2HoSw46UjlWlrMeGBszrljcThtGC
	4h0PjAnK0U/BBpU8qAKo9NPsAioMm3UmhqVDYtVc/vhKCH9hR0H1sgt1SyvBEgLJ6BH5M12+6G5
	BgofzdQhFFUTyxFi/UBn/Sfgbb733abztvl0tkU4hfcLclMJ9bQzpSh+Li1rCZu5b2LtdZmJYn5
	nAt5GczSTz7tk/lLYjOWt3VbNvulQXdIL+qNlmOGYViPrn6JjAF6Utxvyoj6REnneMrlqnvKEnP
	aS2WZyAZ/xlMjMUDnei0p4OPMRD0KrPlov3Dy0Z4nZJO5/8FV+WZi9zqa3vq4EThMpotQDzQgIH
	Ayj6/gn/U5JREiXjtyRSSdoySLTQG/Gm03/itHWRBBcYl0H3Dqrisg85vX0ovQnGjbJeelKNYHu
	roP9OgdIw5uHvh0Y7qkMCr+0RsfEnjDbUwjClWibOPs0nCdDgD5wteWwm9RI0FytSPg8gv/81yS
	gBIzrD96m6kkdmVDVFzRmZB+M2v8VhSBtQFzxPDGvMQS66dBSr8J/FoBlY=
X-Received: by 2002:a05:600c:1994:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-4909c0e77d6mr57063245e9.26.1780066057244;
        Fri, 29 May 2026 07:47:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v2 12/15] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri, 29 May 2026 16:46:26 +0200
Message-ID: <20260529144707.3931919-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074739_742604_A7729863 
X-CRM114-Status: GOOD (  14.11  )
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

(no changes since v1)

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


