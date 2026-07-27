Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658BCC5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIDYXM9+LpuDl5xH7TLyFckqlHiktoL2NqyKKPRVviQ=; b=tEPqU8c8v/p8Cc7BUXX7klhIeP
	EgVUA3sZh9fpzjwGXMyPvHronQKob2+icVtuyZCwBI24dSjIpp6SK281P6uk1XXG0FbwpOWiNVh07
	+3qA+zGN2z3MyopHYkusyKT0BNvTVN4xekTK4XSnMFExEeCpCdgSzNclJDY0W0U9iZljazdSvpSNV
	QK19cCcjgbUoISmTpCAVPNsw7C54P1EkM6F77gn1I9IIGwmHYpw5ntARHhshTwkYuCX+sJGAo10s8
	De0/0e1rk58vvljf1RdwXF7+DGlkM4Luz6PaOtlokpKIR3hq5aU1OWf5oi8DtO30Ph4EkB9rE4W0a
	l8yrJKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKyU-00000002mPN-2xdJ;
	Mon, 27 Jul 2026 13:02:30 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxx-00000002m4s-34ML
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:01:59 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIDYXM9+LpuDl5xH7TLyFckqlHiktoL2NqyKKPRVviQ=;
	b=ZbmttIq/zAkiWEWLCzMm1/BB60jAzCRh/m5TpuajjBTFEF0EXFouwpdS/0H0rxGogVZcgK
	IzK0TT8VdSS7fj0d4zWEzIjS9tN0VfVbVTRMfCfm1r0DshHfKs5JR2qsADILhf/NeY5SHF
	O0pcQUbmxiP93sOP9i5YO/hOMjr4r2L3EQ58eivctWS/MBQellNGOqvldL7ExS4aK7a1WJ
	pek2vr+3jDDb4RjMzXwhjsZy+M+4kbvdbJF0q6qi81VfoVEUmgN5+vDCkQqoDd6/fPA/Iz
	vwWiyzQRB4KGLFWPiGdFRIAS7sydlak8yemtb5TEv0/lNnM+uWhH3Ljwk44zCw==
Date: Mon, 27 Jul 2026 15:00:53 +0200
Subject: [PATCH v4 10/11] arm64: dts: Add ELE firmware node and common
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-10-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=tJ9rSkBdmzSOcevJn11J6HTiPXh99MsoW+7PNACRN4k=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bA3XkXcFb1MiN0kVSFfxvA+7ZfR2nc3ybXUur+Yyb
 N/sYGfWUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJH2Xwx/BVr33ebx86y3/lKh
 dnBiRbnE3UuhC8PEep+vdld7Zxzcysiw02veqaOV6XOOC542W7pXsvjCFlbuKGUGq44DE10v6L1
 iAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060157_939908_B0538A1C 
X-CRM114-Status: GOOD (  14.32  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Add the firmware node to SoC dtsi and to make it easier for boards to
configure the EdgeLock Secure Enclave on i.MX93, add a common include
file that contains sane defaults. It specifies the memory node,
enables the ELE firmware node and adds a reference to NVMEM OCOTP
driver.

The 1MB memory area required for the firmware is placed in the first
256MB of the DDR. Boards that require a more specific alignment can
override this accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  9 +++++++
 arch/arm64/boot/dts/freescale/imx93-firmware.dtsi  | 28 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a1a7e6a0571b..60798b216438 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -46,6 +46,15 @@ A55_0: cpu@0 {
 		};
 	};
 
+	firmware {
+		hsm0: secure-enclave {
+			compatible = "fsl,imx93-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			status = "disabled";
+		};
+	};
+
 	osc_32k: clock-osc-32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
new file mode 100644
index 000000000000..58614158ef90
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Kontron Electronics GmbH
+ */
+
+/{
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_memory: ele-memory {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x10000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	status = "okay";
+	memory-region = <&ele_memory>;
+};
+
+&ocotp {
+	secure-enclave = <&hsm0>;
+};

-- 
2.55.0


