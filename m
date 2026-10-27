Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A3606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjsNYpDy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r0l7owgL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=; b=rjsNYpDyUI3EVdx5ZPACuRSTKQ
	K82NsCkMzHk7vVeMXW29s0iKE8x32cZkuFeZc/h8Y4O57JONdJyLSIWsmVVVMndfNvkAFVryYBLDY
	xBJ3nq5PTiqaG20fSrEmU8gKQNt7f0YY+41ZDHjzDSa4w8VGROKLT/npnOHLPaDkpZCp6AicQ6hgn
	i7g7nI/5xyR485V5ZbGAoqb0niLbvJmZKUI3U9wRKQsMk4lWpX6OvLg4pwxuZdvC0rJQBly9gKDLp
	WHc3Lx797GuWkUkIq311LtDEv33QHcV/7TwSvGwJrh5o6uOno3AHbCRVkoW2h4e5WPwPtEX/LFZDc
	p++WXG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh6z-00000004muQ-11VT;
	Tue, 27 Oct 2026 13:21:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh6w-00000004mtk-2fCj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:21:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so7098185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107265; x=1793712065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
        b=r0l7owgL0WMFQRCzQIo46Z4J2aHTVnzF73aFGxx4F31Xfdyk3e2bLuh1DUBAm3y00m
         0rckHUnOTIqoYBBAxFaKaW9JcErGNw7kV8XmhZd2l/Oev13vWQJonKq9vOYipRSFv9Ni
         U/2NRYZr4LkoND6TGJ5Zw4OUNkN/lWfl8AY5L2ZpVhUwbnpKWwdPxU4tl180eWqSjTmg
         5rzp1pmFem5K++3+FNQq1Sp4Y/p9TJsb7YW4v4Y9vVO9eiXs6kXD8iWgfdEaMi6Mz2dR
         Xh8XHdouSjMF3lRVp3pIr849Ow/V8OBuSMXDUsXn4zCJn2X7rS0VnlDkLvouXX1huZca
         S9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107265; x=1793712065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PI+wWLA/0HjZUtFhvg6XuCK4doWx6E1ESuzMR7f3jIc=;
        b=Pr+NAWmnqniUPyW8Zd2jBrDbzENPhrh+E25QIAvz+Wp7y6/67fk+zXPnGZgnl7QjuB
         6t0SaIgR5Ax06xCeXF2PhLXHE9R2kOelNBoV9KQ2fnCB85gT5j6pM9GFPwOCvvtJ9ybi
         1eJd832IzzTPKE9btPISUJAp+M9xGHgwntmuIB41IEFmBnY4y1OkP/5YEB/uKyqtgGHO
         LnM/VUY1RDNLyRDY18s9zpYl/Oq2zh3fpCCo3MOl3vVZRnj0dAgQKBk35cJT33L+R1sq
         RWLvQ7aRoCUGZ4L2t9+ZUdXD5VDP+xtMIl//Db07FombAGzqOF3foVMCGRtu/3nRBqUX
         f2LQ==
X-Forwarded-Encrypted: i=1; AKwUvByczxEDQPy1YqV0c0bM+3k8MLHshHyo0IO/lIJJQNhULDocvvbyn0JAZtBAJcf7YhNgflzkYIBleRpnC8J7FAPX@lists.infradead.org
X-Gm-Message-State: AFq9FYKJFxP5S3DYUPgEitOQNAnfItrWbQtMRM8WmrP6R3D65huBehTp
	dhAUwg7LrqxeEjuyH58GE1/OL24mJF4HDT4OFJFbZmhJRMGV2DlDXCLM
X-Gm-Gg: AYBFou19nCinSP/fkxzh6ErX/MxtJKx1U/LvXJaoqsN7pXiixa+y/wDVRejpEXDL5GW
	0KYFinZGCh1c38jQADf9skh344raU/HY0cKE3+eJJcrNuCClHD1gL0PhzfkAhTdFBRvRZvlcpty
	5zIV3/tRYsz/tQmmmtLeW0dPZwv7HsmwLqVxfNrgk2j/VkDl1YuuXV93zln21lmXHNZLKATHt0I
	RxZ2N1Te5SHKe05U9ChQSMJgpLaWmr41GrKA4hCOR9ky+Dorae/VtDadzxkATseb8m5gp2V0jpC
	nrCgUXg7Zmpng3bkHvG3Az6+TdGni1XmTQlmKRkYiNd4ZDK8WE5eyJtSMd4f+TqW6phAr3nq1iu
	vTkG7kQ8tPIi7y77AoGoiUUW7fm0EvWWuybw9D93xB4WXV0J63LJezoAMTHCq3P8zLNbOCR+7z7
	t6dG+tUf1HvEUw6a0t8cdfVmO6GSq4KJVcq0AHBSQIG4PsbS6oBBAPruAB6xDttn/IGlc5iY/L/
	iEtgzRL+mbnydyTjmCyfI9bjIFXqqBtm5R/rtVEWCO+2+ToaJDJ+J8xMXgghyyWBq9ULZKs8DMX
	91Pac5wLZ9w7X5KDwIh52AS+cG22kw==
X-Received: by 2002:a05:600c:3c98:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a7c1c845a2mr58333335e9.16.1793107264222;
        Tue, 27 Oct 2026 06:21:04 -0700 (PDT)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08dcbfsm177568315e9.2.2026.10.27.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:21:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx95-navq: add USB1/USB2 nodes
Date: Tue, 27 Oct 2026 15:16:30 +0200
Message-ID: <20261027131630.575-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_062106_705880_DB6F600E 
X-CRM114-Status: GOOD (  11.82  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add and enable the DT nodes for USB1 and USB2.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
v1 -> v2:

* change USB2 DR mode to OTG to match TypeC connector configuration. The
controller should actually support the software-based host <-> device
switch.

---
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
index 7860c113e9e0..b668c752905b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-navq.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
+
 #include "imx95.dtsi"
 
 / {
@@ -80,6 +82,72 @@ i2c3_gpio_expander_21: gpio-expander@21 {
 		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
 		pinctrl-names = "default";
 	};
+
+	ptn5110_usb3: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio4>;
+		/* USB_PTN5110_ALERT_B - shared IRQ line with tcpc@51 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP32) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB1 3.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec1_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_usb2: tcpc@51 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x51>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_typec>;
+		pinctrl-names = "default";
+
+		/* no SINK circuit (EN_SINK1 tied to TP30) */
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB2 2.0 Type C";
+			data-role = "dual";
+			power-role = "source";
+			self-powered;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+
+			port {
+				typec2_con_hs: endpoint {
+					remote-endpoint = <&usb2_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -145,6 +213,10 @@ pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD1__GPIO4_IO_BIT25				0x31e>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		bootph-pre-ram;
 		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
@@ -198,6 +270,55 @@ pinctrl_usdhc2: usdhc2grp {
 	};
 };
 
+&usb2 {
+	disable-over-current;
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+
+	port {
+		usb2_data_hs: endpoint {
+			remote-endpoint = <&typec2_con_hs>;
+		};
+	};
+};
+
+&usb3_dwc3 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec1_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec1_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	bootph-pre-ram;
 	bus-width = <8>;
-- 
2.53.0


