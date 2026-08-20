Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E61C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=; b=cgTsU+o4+oxoE2qVPagU3e/FTt
	yYsvBW3DKN0ffqbgBKWgggPOtFGtqMgDjqiXtO0bbrfwvqydS163dUJN8ybKptYvK/46dTA2EuCRd
	iiGi0CEfEiJz8rICCvrqeP/DIGs9gu84e1qxXnqXeLc/CVs+yDzINsqkEkflGlY3z/x9RMLjNhLTO
	LvpuniEbnfWf7gD6/cRiWRKwTuM9xtdTCKWU9rLSbeenJ63z1S3hSKyFDiEdYU4JZziMD0uQQg9Xb
	saNm2nS4MKgHmuaz4K3MXQ+JjRPrp6JIYLmky7v6B31B4NmIiE2UKaXsseBgLQ5lsAOx/O8BZyZdX
	x93SpzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyuP-0000000BFOv-3DYA;
	Thu, 20 Aug 2026 09:18:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu8-0000000BFA8-1bZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1360073f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217462; x=1787822262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=ngDDb26RUkrZh9cP/xF07wuChA18QbS7oj8SshNGz4uytul+TF9s0ywg3zo0Aitj4D
         /Ucv3fvJ+Vd95TmM9fgZ8R04QyPDgFsohgPL3BdGOWqiIWqD2Ux/0yW7iZ83wV9wFmFT
         CfpYNv+W2xcEz2sUKWMIhOH37mnjKMBiZ3dYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217462; x=1787822262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=OgtRLbcyxqQMD86+uWsFPJlmGCrwUAVUlkwW3KG9mePI2XHwKecCc9Zi0rtTaRBwbW
         Zs368uJkpoXtWNtsBZZ0JouXn9xd1225vzNAKa1XOh8DO8M4upuE0Q0RaPlMFe8ROex/
         ec7Ws1iKiqXck+7EcqeTsIZCicVtbXdvAeKHFyfl01iMkUF8UJoqKpYhdbRC+Bs4QTCY
         IYoXS7Tn32ZFgI3Pd9Pvy/ODLqf02f0UAZfSprjdQfupx01OQOBnrMHQu9vGQMtcIbSt
         3RA3lH41tMJ4xufRTszAiv9HF8yAICuhz260RF/7kmhD6bov9io/iLINsYJu6VFaz/pS
         UT1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqU4lVIDhNo5VXeih1ZhiKT4zSWzGq8IuupiZ2rH05jEdK46UtSSMAwQTL8F0PDCZ3yVZqn7U4CWl2TyvfmlV5f@lists.infradead.org
X-Gm-Message-State: AFuF++npz/ce9VKyf2dJ5jujbjBzXj+cdskNgJlyib3ARGVAIFvQen1t
	a0SG/Q530V/L+6NYG1UWDMMqdgQBo0i0YjLpFRN+EgOj5yUzo2bx9XSk7jg0HZotci4=
X-Gm-Gg: AR+sD13v3mht/slNy6UX13WU2Q6NSs41GuSjmbF6icRBcAYCya/Tzb+HLPoZYn7LLIv
	eehk2+26onfNhE2BN7P7cPu/CcqwvgTJa6ZJmku7dHxgQARp/bz/54x3KPiUjQV1sng+tvbu3SR
	9UQXWepVU2LQwnDX2MkHs1P6Ubkyn3Rb07XROk/xQlDWm23ubtLK0Sk5NARtiNAv0b3Fa9Q5sM1
	pwUI2vUIT+9KQy3GjW8FFgeV1BK2nRBvrGPreMTIXXndyBpMRQWzOuKfBNcaKDhowkkqT84RtS0
	/m/PM0E4SpInDJl+37sN4EDj0ayMqPyzaBikgzddzHTs2kP+hMwidEaY2NTAsQRuXTGmGysIqsH
	izIi0dVnM6cYsHNsu9z3LLn0twnPwY7sjVaKggfDZ6P4eUB7m9zF4wu1H7ADbjTiwcYgokDWv/Z
	E6Y7LU81quw60gwD87qKPKdPVXik3ZuRDRECofzODKnHB3EQuT/I9v85XDhUOVaIWK/1Ej3kmEy
	9NPiZFSevTp7oP99yLFXvufRpAWvnCAecuCm29JiqShYd9nb4bNrNwf/KJk5DDeMdKU530Shl+I
	fLXpPefH+Z1Q0QsBd2Aaa2Zks3J8eKDRmoa5Caj6fdFgOSyl+MXHDYm5/f6giA==
X-Received: by 2002:a05:6000:2311:b0:47f:ddc0:602a with SMTP id ffacd0b85a97d-482b1fde11bmr17822449f8f.18.1787217462627;
        Thu, 20 Aug 2026 02:17:42 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Thu, 20 Aug 2026 11:12:22 +0200
Message-ID: <20260820091652.43541-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021744_502854_1A4C7AA3 
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


