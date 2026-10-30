Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32954606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fsiRQ67d;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NQkE41oM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=; b=fsiRQ67dwzKZw1
	EYH7uEWq7Vh91epVwcx0J0ahid/B1C2cTw+MMzeGf7UBJZ5ubBbaLiv2VxD5nPEYYQrFXRmqkIFF6
	iC60gdcZG1GkOGSY5xssvKlKs4xuz6RY//J4MohQ+TxQ9j90Pq0g2L13IA3bRHUZNWc5eQJQWhEL3
	p8YmttJmP4z3GrK9jvTY+Bx7MfZDTuC3i0xERL40i7pMZ7smz4lOT2DsJ+u4C7jF3g0ppk0K2taZa
	0kQZxs5rUe/EDoJsC/5HkWkGxAXHmoUgp0E15mYPnBSIkWu6eMduBtDArI/1u14BPub38ruqTlJMJ
	knld+CB6ldebtfEftV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaP-0000000C8nd-0nIe;
	Fri, 30 Oct 2026 16:36:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaC-0000000C8i6-2VQt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:36:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48df4f540ebso479779f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378157; x=1793982957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=NQkE41oMI5Cd5qpn3102vgdlKFhoCscOrr0j7LTJVeqh3QiqiouRTw2BLKNQudSR8y
         IurqFSo9MmvML4JeC+P/tGIJqenelppK9R7kU0PL3nl0l5ESYhYoc3Y8MausOOGjZwns
         MiNr6Bg2pWwN9X5zeI+OIeFDKssYVX2rp5XiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378157; x=1793982957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfYGmQ2TsPCF1Aeg7POfMnuEwpwJrElHbkZ/EO4eVuo=;
        b=JO2Q00ZXG7iviBTBjNyba9003HQiVy2Sd0/siUZ1fLbry/GHXNdrPedZ3SlEPa6WLF
         02qU/nv6uvTOhKTeriopZSDzG1LRzRIOdXaxhk01LMRRSCxkyxrSmnawXGeYnZDEmsPI
         EfGEKINTEx6nhtHMZ46mMk5xtRhSPkWoptuFuuN2bUxLq4bCf/NyifqmETNFvY0ZPpAT
         9M0S/fJJpAe8r94u3Ua4BJ1aLazRlBxGUG8vFqlRAZ+lry6D9u3EksJdtZNHBX09BerP
         LAcWdmfy+rlUFCyMauNbPCS8yICd0qkTPVxa34/itd1emYf7EHzuuH6HAYOZhKnWzis/
         47zA==
X-Forwarded-Encrypted: i=1; AKwUvBxqtEkfSckR5/tb30GyDhd3eB5lSXpd0qyx9Qta2TjyjA8n+vobfsG8OXWfoC8mrLkFvGkiG3rqbxYarIi5dpjU@lists.infradead.org
X-Gm-Message-State: AFq9FYJfjdk7QDGsv9+RU5kKTexe9yVRHDFdBnxXwwnyO7AG8Hz0KlEu
	J5SUBgP8zC5Tzwo4NVfiBSlHGit9XqK2a4XylL+o4/yhX3RKJcCqeK0P6IiStedNV2Y=
X-Gm-Gg: AYBFou2r52mdgGwa9QiVEx291RyGsJSpPNNeNwwLTknA3UqbO9v4Gzm3EI7+ifFfyI5
	vaC32EPd8hqAU12Uf7FoKxoB5y1bjO80VG0VQR/c8WsJeUYc49cQhASez2ZqjQ5VvcSwUW3j3Ez
	ZFuHV8XPI1R4Ll4CAk4YUFPaqYa3tkpijCbilwfbsTpkxfebprexvX5yEeVXc+B5UlCiJvAyqwO
	k6edkPVvEotH3+6SgAb7cDZRGvusarRQbq9ryr9Ut8xTnkh+oJnv8kpivqegRv7OJQ/bd01psfa
	6Jmd4h5I2K3YABpodfCxEtjRxWW2nPzgJZ8V1ls+n15nIJTi1mnvptAHev08GVk8ucI45tOCxcZ
	ixomSVXwT5zTWX3Nlvuaq3cGZ5Ny6/sleeR5vjwCz8H92OLgL27d/3uUT6rXmVfB9Kf0wrOAWnt
	dLBxMNQzv0r5Sr4g8G256VVaOvLBDWxcN411oxBObTBCJ6BsR1CbEAcH7SwwmqGq51SQYQG6j//
	bQTmLjuB/DuEOlEkwq7tvFy0bQg3xDXS1eMne2GdnO9nDqnm07JrsleMPjmRbCPF0MYr2i/hfN1
	Aw8d0RgO0BoNqi3uWoJwOUbMKzvmPxAU2VZBtd+ZcQd6mqKjiLohbpkD+o5Zjamp5NSIfebe7Df
	ZuBjDC7XfTvjMRrFe3YCxu42IZrL3BGaUaZJz6ywrEnDQE+Ik4pAnQtDe/wvWwhIxfqikyxNrpP
	N4UOVE5az9DLtaUtko73pEdny8IA==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr63214265e9.0.1793378157371;
        Fri, 30 Oct 2026 09:35:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:56 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
Date: Fri, 30 Oct 2026 17:35:42 +0100
Message-ID: <20261030163547.2682583-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093600_662071_90414916 
X-CRM114-Status: GOOD (  13.71  )
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

Support Engicam i.Core MX8M Plus Fast Ethernet SoM, a variant of the
i.Core MX8M Plus SoM which embeds a SMSC LAN8710 10/100 Ethernet PHY
connected to the EQOS controller in RMII mode.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
new file mode 100644
index 000000000000..1341de0ba4b5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+#include "imx8mp-icore-mx8mp.dtsi"
+
+/ {
+	compatible = "engicam,icore-mx8mp-fe", "fsl,imx8mp";
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rmii";
+	snps,force_thresh_dma_mode;
+	snps,rmii_refclk_ext;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {	/* SMSC LAN8710 */
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy0>;
+			reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500>;
+			reset-deassert-us = <500>;
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x3
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x3
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x12
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x12
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x12
+			/* RMII reference clock input, provided by the SoM */
+			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x12
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x1d0
+			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER				0x91
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x1d0
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x1d0
+		>;
+	};
+
+	pinctrl_ethphy0: ethphy0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_RD3__GPIO1_IO29	0x16
+		>;
+	};
+};
-- 
2.43.0


