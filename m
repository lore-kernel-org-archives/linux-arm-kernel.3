Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F67C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hkgdWFIWdzAmzG1XT39OWbOtzfhpTHZ1x8VgAGml28=; b=zBLKOxOOenK14K4PbEopMlOfet
	xyM3f3oyRPgFAeR2By3/DYgwVxwueTzkwd19jqh4gaRQcF4qBf46mPv9tt+rBvdUedcD56YCpfdlo
	WIQ/wVdAL8KEMPY9V08+mwFmUGmU6ULfj3OVPJRcRPggK+CMQ9B24cxAcFLV/wGaVthz4H0cRNue3
	K+/nmA1SkZBu6J8dPyZTOFQQrZ9d7AUBwtCexhkkiV/NhIoKTTiG/Mmlgumg5UnCH1VX+eKVORNtd
	HAt/cuFTrSwVHAhTz7Z/GUYvx6zA4SrVu1Pbo7LFBBzb0rfHBuzbXdK3QtrA4w1/h6NR6FF12Z0jN
	CgAArxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2L6-0000000BTq7-0jhl;
	Fri, 28 Feb 2025 15:31:48 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to23t-0000000BPig-29Nt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:14:03 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CB11D1F9E6;
	Fri, 28 Feb 2025 16:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740755639;
	bh=8hkgdWFIWdzAmzG1XT39OWbOtzfhpTHZ1x8VgAGml28=; h=From:To:Subject;
	b=xp7g9AkdCUGOL/OBKwOT8ObzgR/Ozld+LFZsNkm9VDEIpTmKfIDsVWWIADhdOyzD0
	 lwEFAj12Id4IcelTGGMr/KffVvHSVZiiAMe8MZPOXnglxVagQdgbJOfd4kzdlS2p+Z
	 cdzPOw4BG8Id5xruT8E/lscMvNIcZaZOWGjuWKuR53RBzTaxVCDzwl6iiZLDCeHCmT
	 oR07EypWlRcgMdBQ+56S7VHBcT33g0oQjOidlMEH6l8GLZg5Acav0HnA73G9/wc/pW
	 DnVIQI5ejMliWPDMLUHNZeSWrzBdH6PgVNtKdOCBUyi9gmSAvC+ytugIuL/6qjeTG0
	 s+7K7a8RVpNxA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/4] dt-bindings: arm: fsl: drop usage of Toradex SOMs compatible alone
Date: Fri, 28 Feb 2025 16:13:49 +0100
Message-Id: <20250228151352.91768-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250228151352.91768-1-francesco@dolcini.it>
References: <20250228151352.91768-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071402_161838_9A930772 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Toradex SOMs cannot be used alone without a carrier board, so drop
the usage of its compatible alone.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: added Reviewed-by
v1: https://lore.kernel.org/all/20241004160842.110079-1-francesco@dolcini.it/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0db2cbd7891f..fc566cce56c6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -296,7 +296,6 @@ properties:
               - technexion,imx6q-pico-pi      # TechNexion i.MX6Q Pico-Pi
               - technologic,imx6q-ts4900
               - technologic,imx6q-ts7970
-              - toradex,apalis_imx6q      # Apalis iMX6 Modules
               - udoo,imx6q-udoo           # Udoo i.MX6 Quad Board
               - uniwest,imx6q-evi         # Uniwest Evi
               - variscite,dt6customboard
@@ -490,7 +489,6 @@ properties:
               - technexion,imx6dl-pico-pi      # TechNexion i.MX6DL Pico-Pi
               - technologic,imx6dl-ts4900
               - technologic,imx6dl-ts7970
-              - toradex,colibri_imx6dl      # Colibri iMX6 Modules
               - udoo,imx6dl-udoo          # Udoo i.MX6 Dual-lite Board
               - vdl,lanmcu                # Van der Laan LANMCU board
               - wand,imx6dl-wandboard     # Wandboard i.MX6 Dual Lite Board
@@ -730,9 +728,6 @@ properties:
               - joz,jozacp                # JOZ Access Point
               - kontron,sl-imx6ull        # Kontron SL i.MX6ULL SoM
               - myir,imx6ull-mys-6ulx-eval # MYiR Tech iMX6ULL Evaluation Board
-              - toradex,colibri-imx6ull      # Colibri iMX6ULL Modules
-              - toradex,colibri-imx6ull-emmc # Colibri iMX6ULL 1GB (eMMC) Module
-              - toradex,colibri-imx6ull-wifi # Colibri iMX6ULL Wi-Fi / BT Modules
               - uni-t,uti260b             # UNI-T UTi260B Thermal Camera
           - const: fsl,imx6ull
 
@@ -891,8 +886,6 @@ properties:
               - technexion,imx7d-pico-hobbit  # TechNexion i.MX7D Pico-Hobbit
               - technexion,imx7d-pico-nymph   # TechNexion i.MX7D Pico-Nymph
               - technexion,imx7d-pico-pi      # TechNexion i.MX7D Pico-Pi
-              - toradex,colibri-imx7d         # Colibri iMX7D Module
-              - toradex,colibri-imx7d-emmc    # Colibri iMX7D 1GB (eMMC) Module
               - zii,imx7d-rmu2            # ZII RMU2 Board
               - zii,imx7d-rpu2            # ZII RPU2 Board
           - const: fsl,imx7d
@@ -962,9 +955,6 @@ properties:
               - innocomm,wb15-evk         # i.MX8MM Innocomm EVK board with WB15 SoM
               - kontron,imx8mm-sl         # i.MX8MM Kontron SL (N801X) SOM
               - kontron,imx8mm-osm-s      # i.MX8MM Kontron OSM-S (N802X) SOM
-              - toradex,verdin-imx8mm     # Verdin iMX8M Mini Modules
-              - toradex,verdin-imx8mm-nonwifi  # Verdin iMX8M Mini Modules without Wi-Fi / BT
-              - toradex,verdin-imx8mm-wifi  # Verdin iMX8M Mini Wi-Fi / BT Modules
               - prt,prt8mm                # i.MX8MM Protonic PRT8MM Board
           - const: fsl,imx8mm
 
@@ -1101,9 +1091,6 @@ properties:
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revb-lt6 # SKOV i.MX8MP climate control with 7” panel
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
-              - toradex,verdin-imx8mp     # Verdin iMX8M Plus Modules
-              - toradex,verdin-imx8mp-nonwifi  # Verdin iMX8M Plus Modules without Wi-Fi / BT
-              - toradex,verdin-imx8mp-wifi  # Verdin iMX8M Plus Wi-Fi / BT Modules
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
@@ -1273,8 +1260,6 @@ properties:
           - enum:
               - fsl,imx8qm-mek           # i.MX8QM MEK Board
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
-              - toradex,apalis-imx8      # Apalis iMX8 Modules
-              - toradex,apalis-imx8-v1.1 # Apalis iMX8 V1.1 Modules
           - const: fsl,imx8qm
 
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
@@ -1435,7 +1420,6 @@ properties:
               - fsl,vf610-twr             # VF610 Tower Board
               - lwn,bk4                   # Liebherr BK4 controller
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
-              - toradex,vf610-colibri_vf61 # Colibri VF61 Modules
           - const: fsl,vf610
 
       - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
-- 
2.39.5


