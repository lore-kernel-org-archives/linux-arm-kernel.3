Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E198CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+erK0bGW29K0SJeHxD4PubkWllmjltfCuqMutxnnws=; b=e17xD76GGVM0zoiAFjUxiCxSWv
	09STDFJLBlJ4iVIChYc2U9LDt6szpnwjuHjHm2bXlcdZ2o7cd6GD+HnattIpPYbNXN66EWRdcl0f5
	sKS4ecWVTWyA6H3QpDp6t5ODp2cfTuWj7pyT4vScVGlHycte2XkDvOKfsxuDYWPtK4t866LGTgl8X
	fjxoCmgFhNU1PnbLPI3un3AAu1aMAEutnmNTi9aGBGILiZmIIVd8GNrYCrukUC9IOgr+SS/rDoNn/
	P2dzzgjmNRoFhnlbuF9kx+bV6VPYLSK4btqo2lSCMg/PERXjcWtFHnaYJPp7Bl1CDZ2zakjA5Tk++
	AvmRqhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLNG-00000001osi-1pRu;
	Tue, 19 May 2026 14:24:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLNE-00000001os8-3MBt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 14:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q+erK0bGW29K0SJeHxD4PubkWllmjltfCuqMutxnnws=; b=hsCBI1NLM3bXN7BV/TOSP9YeXB
	WPXnpnRQnszBbNlxxVxrO0D+IBvmt/K0IazgOFbitrOSDrz1ZT8Og8/axySZex/VoiuoyQMTAwQb0
	CcKgPSi1af/koPHTHbklw0P9usRj9j+GCnTQxKD0VGyuOPCRoBUK7rTvmktAAGH4PCc0bY6VoNpaK
	IXO1cy/rQaHqDIv557iJuYTX6uOna7XgyJ4iXJ5r/TnTXesF0OvT6PP3cnCg+H9CmHgWPwL1Uo5ol
	0ATrS4DAh4tPyED9jheaGgyI8eeQ5u87ZHBiDhLYQnP8sOt+BgvnqtGklPvaxyu1fKY2+ljhAM/Rs
	GMiPrffA==;
Received: from mail-westus3azon11011036.outbound.protection.outlook.com ([40.107.208.36] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLNA-0000000EVF9-0UYU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:24:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2aEkee7Uk6wxcbgQh0NcolLfVybpF3KmpeusZD0RssPtr5HJkAQQh7IdkKDR3uv+ynPlZsvGo3PK/6v6oFrUDdnTSkuyKoyWnE97vF79KqmmxjBvu61IfnAGC9blQ9W8vE54rV3WODy0wsyUn/rxhKYVZbuw/5N+JvxV2AP8LKN2A0WGMDcvkIKqk0v3EG6fY7ihyPlT82OqRBji5hr3LyjcTIZepcqFIGKLtoOwGd5FKL3rfTyImUCAIapnSkSDP5zbIhFXnViFXV41t9Yf7UffV0aHx9nc6HuM/32znimNCSPdO1OY6c9YkCu2w9kcfrOxGd4fby2svGAF/Theg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+erK0bGW29K0SJeHxD4PubkWllmjltfCuqMutxnnws=;
 b=hKSQBTit0EvvNYyNyYuuMbdbDHxRlBLSdbVTpwksvV59ONFKXP6S+z29FVNr8D41RDVYQO3L2kHQuke1eS717Nto3N7inGQQWcyIm7BCLnuWnqYuHH1j0Ov9xvSqb/VDmvuGZ+rVd6rDv9uvFqR5fIuXhxfwa669fvmBI+2AwlUxE1FZ9N05FNBcW/RYIDiuYmiBYtjCVImBisWKZVeirXEBO0p3yp8KxNnigcLCgmIoQuwKPIQfJbCwABkfCBAboUvcDBu/DfImdcVzAs0GCPyHcAHUWvAm7KiqwWHQgZbdX0TxXQGZv/Xi5EtEc+xnmtR2qwh+p2rQs9w5PzwEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+erK0bGW29K0SJeHxD4PubkWllmjltfCuqMutxnnws=;
 b=tLBnEOgesQT7bBwvCUMfzqBlA1gDSWb+U4TFSECFDIRG/EXsqRW2lE8vhukrxXohpMMjxFdVTkKYI7WdV/a0+klkUWcmDbzEDhkXQwzW7AXBFABf4KHGJsHfkjHfEGshu0UjHiYQV2BcXfWXpk6y3N6pk7Cegol9T6PUv6us3Jo=
Received: from CH2PR07CA0051.namprd07.prod.outlook.com (2603:10b6:610:5b::25)
 by DM3PPF4A29B3BB2.namprd10.prod.outlook.com (2603:10b6:f:fc00::c25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 19 May
 2026 14:24:29 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::75) by CH2PR07CA0051.outlook.office365.com
 (2603:10b6:610:5b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 14:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 14:24:28 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:54 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 09:23:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 09:23:54 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JENgoV4183406;
	Tue, 19 May 2026 09:23:50 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v4 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Tue, 19 May 2026 19:53:41 +0530
Message-ID: <20260519142341.2531948-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519142341.2531948-1-m-shah@ti.com>
References: <20260519142341.2531948-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DM3PPF4A29B3BB2:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc3b494-9357-4dd6-88b9-08deb5b255ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5cbLGcCoBBFgLHkevfLuxGdslTLnMyJbdFIvMrmOux4MfmTTM35dARpsZ4KHUgAfJPW1uXGJic9sbGHw1p+OZFV+rF6UbXr2dmESiRsw8qMSm3uOU/Bvhsl89/UrCbAqsSEqBnSHtfLZPOiWtDRW4maHZnv4p4S1gbuqFC+YeUWA6c2XuQiP0RxFfeQxyVGY1FRKXavlWm5Newty2S+ULhjZ6KMKNAeXPod+hD2xbeHK9HgdE4uv2HK/GjJwlWwlS65DULCPbWpxngLHcyNJpsc6PP7MKfIJIUlKucMRSZB34l3r8hjS196UqOGlSudhURtVyECHyBVupMhrT2T8qYnqbXZb5Lw9L+1HgGPqTjct08dBiPOE2pdMcH8klyYw6Iy+ZoKG97cflsaxRDBVYuDO6VvL9Z+5QU63g0s08Gs3YZh6QW5jCWxbzo7EA7+TVC3XFpUvOShQbBW4jKZOZsasdLDU0HLci7sSE1h/AsV8aNo08lTkNbQtFUaltUuTGitzhlbCoN/uCB1hqYeX4XM+vtgdkcfHckilGMbQUDwVuLS8mvPMHcpcqLSgqrjKnFLWTrcmtUIauzxp6rxlZvBH0//mGRQ/knNdvTRtoFmAo2eibXbhMdtrV67MTQ+EI0tqkBhDiUD+mLBqMQwBHk6Uns/nJWEyqR7LWSGZRU4=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oUneiO9xbMD8FuECm9fwMPJHG8pOaprZ7yWUSj+RY7/7pC42To3sk9Me2vyMfivEF7nOFWIwjE/ctKkLCC3sTfnnCJGmcComoQrsauaxoCe447h33liLrauCuYe+PGSSx4dKBwFFboDCUR9nz2UFu8eTZBQWMdGPD753kns/X03JKI2t3bQ+LvHyxbtE7fXRuOaiu7b2beYPsAM/x1ZvqNHHAeuuuaSbp3lIK1ugxllCYLN44sNIYG7faQRS/zmrahbSBXUBF86HyOrpl8PVLkppsv/XjHZlUpBoOjInwnSbacSJyhe9TtilvyJCkaG5eaYAW5UCXfxyVOR+kwg9JZpGKbfyGDQxJuzJoRCzE6GFa0h2/9ezXI53xoCOEVvoq5AlWacqFautRdGlyroRQc68C1A5XNpY14h6ZeFZSSSLzXYRhlSvzE6VwNz6GFGX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:24:28.2697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc3b494-9357-4dd6-88b9-08deb5b255ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4A29B3BB2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_152440_537694_12528DC5 
X-CRM114-Status: GOOD (  16.08  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

- Add nodes for sound-card, audio codec, I2C3 and McASP4
- Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
- Add GPIO expander (TCA6408) for codec control
- Add GPIO hogs to route I2C3 lines and McASP serializers
- Set idle-state to 0 in mux0 and mux1 for McASP signal routing

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 161 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..17048f2f5043 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -138,6 +138,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
@@ -264,6 +265,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-audio.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -328,6 +331,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-audio.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
new file mode 100644
index 000000000000..6ed4d6fc414d
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Overlay for J721S2 Audio Support
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	codec_audio: sound {
+		compatible = "ti,j7200-cpb-audio";
+		model = "j721s2-cpb";
+
+		ti,cpb-mcasp = <&mcasp4>;
+		ti,cpb-codec = <&pcm3168a_1>;
+
+		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
+			 <&k3_clks 157 299>, <&k3_clks 157 328>;
+		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
+			      "cpb-codec-scki", "cpb-codec-scki-48000";
+	};
+
+	i2c_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_i2c3_mux_pins_default>;
+	};
+};
+
+&main_pmx0 {
+	mcasp4_pins_default: mcasp4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
+			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
+			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
+		>;
+	};
+};
+
+&exp2 {
+	p09-hog {
+		/* P09 - MCASP/TRACE_MUX_S0 */
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "MCASP/TRACE_MUX_S0";
+	};
+
+	p10-hog {
+		/* P10 - MCASP/TRACE_MUX_S1 */
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "MCASP/TRACE_MUX_S1";
+	};
+};
+
+&mux0 {
+	idle-state = <0>;
+};
+
+&mux1 {
+	idle-state = <0>;
+};
+
+&scm_conf {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	audio_refclk1: clock-controller@42e4 {
+		compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
+		reg = <0x42e4 0x4>;
+		clocks = <&k3_clks 157 299>;
+		assigned-clocks = <&k3_clks 157 299>;
+		assigned-clock-parents = <&k3_clks 157 328>;
+		#clock-cells = <0>;
+	};
+};
+
+&k3_clks {
+	/* Configure AUDIO_EXT_REFCLK1 pin as output */
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+};
+
+&main_i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c3_pins_default>;
+	clock-frequency = <400000>;
+	mux-states = <&i2c_mux 1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	exp3: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
+				  "UB926_RESETN", "UB926_LOCK",
+				  "UB926_PWR_SW_CNTRL", "UB926_TUNER_RESET",
+				  "UB926_GPIO_SPARE";
+	};
+
+	pcm3168a_1: audio-codec@44 {
+		compatible = "ti,pcm3168a";
+		reg = <0x44>;
+		#sound-dai-cells = <1>;
+		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
+		clocks = <&audio_refclk1>;
+		clock-names = "scki";
+		VDD1-supply = <&vsys_3v3>;
+		VDD2-supply = <&vsys_3v3>;
+		VCCAD1-supply = <&vsys_5v0>;
+		VCCAD2-supply = <&vsys_5v0>;
+		VCCDA1-supply = <&vsys_5v0>;
+		VCCDA2-supply = <&vsys_5v0>;
+	};
+};
+
+&mcasp4 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp4_pins_default>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	auxclk-fs-ratio = <256>;
+	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
+		0 2 1 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+};
-- 
2.34.1


