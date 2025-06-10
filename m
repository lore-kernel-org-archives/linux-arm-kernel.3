Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30098C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVpRsOav3dc0RZBgP6jRNm+pqWPgbw4b4uSBb4dfuLs=; b=pjKtpUahtOkDe/BYzT0BiPIyJw
	NVOpHrDONMDWq/pogKTlWu6hjCfFeRYOXdIQcI0B+R3zPZSbh9OweTZgvMUmHR4zW92JFxxeWu6GB
	mBEuMBKV33HkbzCdFwN7pZ6PIOVRa/pcX6+aE/89o/3+eyrJccnW21XfWG6NZizngaev/vsIvwfxf
	6CCh68Lsnmk+mGY1+pVi20v98yB0QAFRCnAzHclJpRsm3//ff6NiK0OPIqA5bz1wgDPMS1BJ4kVm3
	Ve8rJZyT9KBgassPmQs/CAs3GtJoVg3ZWhmfCtULEKOF9CeLCxdOzNy+5NYPB3CpbieVwVWh1JwdE
	oSdeRqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwf9-00000006YPb-1NrD;
	Tue, 10 Jun 2025 10:57:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvnh-00000006R0c-1MrH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:01:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so5757443a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549708; x=1750154508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVpRsOav3dc0RZBgP6jRNm+pqWPgbw4b4uSBb4dfuLs=;
        b=KhMMW6WZb0qvzqiqAaXS3rF7OXf4WMSvfX0E0e5XkeRVluyV1tZshfoikIfDCkhX1l
         ukHakDkd7QMFF8frWfHljU8fM7PlgX9rFFuGYscfgtGDpFpnuAxgvoVKH693PewgDp+B
         lKqeYOIbI9oLB4jDUDCrZX+cBzU8GdVklkjzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549708; x=1750154508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVpRsOav3dc0RZBgP6jRNm+pqWPgbw4b4uSBb4dfuLs=;
        b=xMneTdZceEqt0YAbEv9uc582AsofJPNHzacgePEcpub3d0ozbsU4vOgHJjDYZ71Y8v
         n+3nJw6oEAgJBUVQMDUDFPCdV5xzKK15mXbuDjan6M4LvZa6aYgRwqNAjRIiOWxtnxUZ
         S3flatPLikpkGYoQSpBK/iqxZKpyTHxPhdF/HKxtCBljrhzlqA/z3+5wYi1Yy3RAhMO0
         /KE5rw9+J4jZhbxvF7OIlZHqtSqWh6/qLjxBtKkNc25aq5qhgS20mJ8PdWJ47rfyN5sS
         PYt6MLRLCEFE6Db8GDHhUS9lHfrq6B0G6rVZvywGVN+IAIr9p8PjcMFPokZaFkBlGa+J
         DqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ3lZ/mNwdb6126zzkKYtRgYDYkrKIdhmFLPeoLmOKlk4V7M9Jij7gfE2EnkziGJBdBPZaFc0KGySTx0Hu4k4V@lists.infradead.org
X-Gm-Message-State: AOJu0Ywevq745MKiDQ/ZfuXu6T/BA9mG1qC/AHq8EnqPgeuLWtZ90aHw
	DIvMfAXe9o+1PiqgjkcfdLgbciXK1X8qpfm9tuF8O4EksPnPwV+Lp+ktL3p0T6YOVnU8cncOQS5
	M6dTp
X-Gm-Gg: ASbGncsOCqIsD5Q7sGkYFGNGZ9GJVoKdl30SBXlvftsWc/n8LO+bjom+0ZTJRwRpZ8T
	Tv0klSxQLskwdVGf0eJExrPv5LI0XpvMaTBRMdMShPFFwJKOn7IET98+eGc7QgD8D5O8f3hW3I2
	3Tpwz7+dDKJ/CmmBvg51DFr4RiJA5AlR8UTa8RuAp/GkY5em7hGPQd5MTUvScy7zMuYfkM1Qn/3
	3JYrAJBfBfWnFk1e+3k0bBUhYelEeO3YmQzHKhCYPb4nC4RjOKaS76ljp5E970N/4YUxs9lgyzl
	O7WZg0bC0DARxJxl2lcanFsjPLr75njs9Rj4BP+PwpHqy1AUXx5lgAX1kwmXhsqnIfmQaBJqKRY
	xiKQNjvf/1vKfAJBV3i946lQZR1Q=
X-Google-Smtp-Source: AGHT+IEdzv89/n4ZpuVZrDYAFUC80+0NYiuFuEDwH6TaCdynJi5ZwnYhSmYFBATEcTH98tBhKddrrQ==
X-Received: by 2002:a05:6402:348c:b0:607:edbb:4bbb with SMTP id 4fb4d7f45d1cf-607edbb4f69mr6751957a12.28.1749549707676;
        Tue, 10 Jun 2025 03:01:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Tue, 10 Jun 2025 12:00:15 +0200
Message-ID: <20250610100139.2476555-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030149_365258_8D95BA53 
X-CRM114-Status: GOOD (  14.39  )
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

Support Engicam MicroGEA-MX6UL SoM with:

 - 256 Mbytes NAND Flash
 - 512 Mbytes DRAM DDR2
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..43518bf07602
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+ #include "imx6ull.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull", "fsl,imx6ull";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	local-mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+/* NAND */
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <0>;
+	nand-ecc-step-size = <0>;
+	nand-on-flash-bbt;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b009
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+		>;
+	};
+
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
+
+&iomuxc_snvs {
+	pinctrl_phy_reset: phy-resetgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x1b0b0
+		>;
+	};
+};
-- 
2.43.0


