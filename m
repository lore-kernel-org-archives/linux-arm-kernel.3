Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EC8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ayJ3s03F;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=pxxziR57
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=; b=ayJ3s03FSisTL5
	Dx2kPgXDfeznvOzHMCCYLhP0tQ+5JEZmSzc8X8reVrn1jdOsTO4MQCWduSSRUDeKzt/9qyW3AZpFy
	hnE/RRFbu48aXsGOJG3La3K02aw85iVUSqfSFkTCZzfCQE1EDEWmkNrrdFzQnivth2Jcbn5YPscb9
	gDUuNUChfG7VcObJArpyTSsRmmHOOmL4X7OSauxZAOTinlUq3V3Y86lQmQ+0YZvQ0y/mWBlc7582T
	ioOt/FF74WgWxv6PWoEzK9wydBEz4LD8jXWND7MMBuvC+XcTSNf9h7nrBljXw45XykqUgvn4v4h56
	hZ9wgUM7sLddtCUn4YRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaQ-0000000C8oG-2SPW;
	Fri, 30 Oct 2026 16:36:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaE-0000000C8jw-3HjP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:36:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8440025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378160; x=1793982960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=pxxziR57OwAgdQDJzrI7N+NW2X07GzkfUqfRsYgTNYif8M3iWldUsmSu5ZnCMS3qCS
         e8oU0p211hrfJTtri35ix95XsOr0Mp3gf4l3/xjaDlqisguNk3Xt+QpHEQkL1/qb03P8
         vUcLHEEzsoAdh9krXmHw3DNXdm9wP/YzjABb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378160; x=1793982960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUs/X1k3020XOzDHuwUgAfsc42+/e4lW6AF2roewp0A=;
        b=nNU+FvEvoZpgfusw67Xu4LAVoDz0u7MbcANhiKBYfJ0IVF93glOxeQigQU2BvvCquV
         S6zVkf9tmILcb0ujTfd6/nmtUypYDk9HKr3fblREfJHRjNLwbbga+p7KPtMCGrWQtURD
         AUD2V0ls7v4hIJMaUPGQS8O+ulHQ7eA8B/36Wj/5+bgpIu9KvgO0rnRNXwfzWeH1QGoE
         /N86k2u9y6F3Sh4xfrtDhsf+JCPxayWkUJhNpMd5jsdOE0G4ItSHCkQxsL6u41KisyXR
         QJ30YQFrVN9DAC4Q2erk6eBfNjkEa91IJqqheSXUBTG32l8T2CcqG4vh0iKw/nQuDBD2
         oBRw==
X-Forwarded-Encrypted: i=1; AKwUvBxuqPiAQVw6Ezsl0vFOyQn8HwTHhwPZxfipyf9xPY4lH1/TLCeVyCnUt/y1Fy1B/TWjjnEEZcLHYKLEN1r9Li/C@lists.infradead.org
X-Gm-Message-State: AFq9FYIlDhYQdO8z5SaiMEfMTXeHPC/DPCgEgTHvuouDzWWmJblMQmkZ
	e8z8bQpv2MiEBMAj5XIKX5mbkPyBcPOLdH1NBDpp1VbTHqBkTjXbNnQbV4gBdO0AB+I=
X-Gm-Gg: AYBFou1zUWCVN0m45H51ymbbXY1nySF+F+OvCifSr81nMekgnjMy5LkQRXZSJQ17u1K
	t4wj71Vhk+RzSWU/saEmKzoZReuQ365RlCVHWMOoPCFRwNHWOZskXcB9kpuZnVqgJh0mhO/RK2x
	MNIYDMMTRMbvFvXvHIU/S/a5SM0BiM5eBU8sCRqKw2CHbwkcdCfFz3CIkES9S6MuMuzYrRfUpwB
	Yp0ucNuWofdsbqh9733HpDJpB09AnZAwThBfHfg+YkidjYwX2FzsY3sS+VmxDZHEL2dq35Y77zE
	WIz4BhubA6jtZ5/ZSpm+xcFVxiX5ThAG0rVZ2v3Y/QfyX4n6Rb9nxFOrdjsyG6UrJ13rnv6pKeE
	ASyi0PBLX2/raMBoxmz2dxN5+bXEmN6pFw+F2o8P7d4HjXf4KzNraW8LbHx5c5K8oIDWeHOnhlB
	7I0mbN7ZqjsyNndUJpB1+SOyhrlr5cRJmhyD3xqWODgdcK0yuE0k0e01BHvZXD2JBVdzPU+bpKH
	MsEd3mOqc7+pBXm7uItGOTbhO83QD9fr+DdD1rq6eK3ju1PCp99E9ub7w3P0heeylyLB5V/wYxN
	sVAlHNexVvj62XLoXU34SV3mlRluF0f1mSiSzb6vQPMN8XuFsPIQkCgqapLVFyHIiOGPebR73Ac
	Pf/uOu3It0Ct9e3Bi88aHyhEcavFcxmBUrE9BnM/BLVAId9TeqdIMYdgD4PH5QGiokgnYnyZIGy
	zBzFJdwndQwV3o+wHkt7IG6TO/Wg==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr64953775e9.29.1793378160492;
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
Date: Fri, 30 Oct 2026 17:35:44 +0100
Message-ID: <20261030163547.2682583-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093602_840651_E58CC6DF 
X-CRM114-Status: GOOD (  14.49  )
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

Add an overlay for the C.TOUCH 2.0 carrier board fitted with the
AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel (C.TOUCH 2.0 10.1"
Open Frame). Its touchscreen is connected over USB, so there is no
touchscreen node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/freescale/Makefile        |  7 +++
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso | 53 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bf324cdec879..a3dce3310fac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -656,6 +656,13 @@ DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-fe-ctouch2.dtb
+
+imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h-dtbs := \
+	imx8mp-icore-mx8mp-fe-ctouch2.dtb \
+	imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtbo \
+	imx8mp-icore-mx8mp-fe-ctouch2-overlay-am-1280800w8tzqw-t00h.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
new file mode 100644
index 000000000000..d5a5eb96101d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Ampire AM-1280800W8TZQW-T00H 10.1" 1280x800 LVDS panel. Its touchscreen
+ * controller is connected over USB.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	panel-lvds {
+		compatible = "ampire,am-1280800w8tzqw-t00h";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <1013600000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.43.0


