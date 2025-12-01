Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC0FD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+SW/EbITYooF5ZS8yeRh4CwPq41D5CEQq+PdeNurkE=; b=zADMjDPnWJMi9VZZ+mxOuVbtu4
	RGz+nlBTXoIhdJgyOPN0jB8jmZO6pylK2jAh/FKVo/gK4lyvs/AuYR7q4LKnLvywAdFq10Hv/bcUW
	qaJR9yLC3YTOrv2u3p84Q2TRZCSarr67BzRMHrEz6MQ2Ue0nOroEUCt893fUxQ/Fyum+6jepqMVp4
	lSxDjnXtMItT65NuNLqPPcJ0fBjpY8V1H9maqZbe+IFDtyPbNFea0I2VFvcPbvHYHC7igoHzgGiWb
	VjCCRJs5YnhNAOT2PtFPCs23Nw0Pb1ZsOnVuiz3QSbWTff4rW6Ds8lwRLrk/QlOXz2yh2O9fR+R/3
	WAN+zmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2Wc-00000003V10-0X12;
	Mon, 01 Dec 2025 11:57:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2Wa-00000003V0D-1UDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B59726017F;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46D81C116D0;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590219;
	bh=f9QEnmqnsWDZUfL2GXKBxdVY8OzItJOp3WQ9SYd3RfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UiA8GHekIF9RrRKE4o4mtTsFsjQe1Epo2rAx5qpeLKyzNJGii172bBNfVi2R74Vo+
	 B8o0S1A1Qusyz9sA7l0CKLNa0TOgRk4uDMEQWOa0EUg//cBpBCU6NV0ZjRYAu7IXty
	 xuOotn6h3X7UrCLWDOIQRdAfIV4inEoQTlAZLC5wWt9V1fvSXjrdGzDtTycK5xUE64
	 szzFcfcbMdbvFE6I/TRmZViQKeY31xkDAjywRysI9QOrHZ3/kqL1zasECtv7mCtDY7
	 8aIEH0TTe1j1IPfWyIy/oZiLvvLsjqxznGxQDiWDTJ+xiIn56Ji1j/1KrydslhJql4
	 bnaFpRt1dtnFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3558CD116F9;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:56:50 +0100
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-disp_fix-v2-1-9b03026311b6@gocontroll.com>
References: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
In-Reply-To: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590218; l=2122;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=wXt3WiP0vtdg5opoCrY8YMr9jeuCt1sqacON3Gj18VI=;
 b=dGEyya9PxoluEeZNKYrLl9PPX4+vSLb60Xx6eXUGHdjyI2MHA6A21Qi622qMi+FBszZYctbLr
 FrYwekqk62ZAb3l4F26PBa5BgS8yq/OWSLp3MLJsVqCXdnuTfkyWBcB
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

The compatibles should include the SoM compatible, this board is based
on the Ka-Ro TX8P-ML81 SoM, so add it to allow using shared code in the
bootloader which uses upstream Linux devicetrees as a base.

Also add the hardware revision to the board compatible to handle
revision specific quirks in the bootloader/userspace.

This is a breaking change, but it is early enough that it can be
corrected without causing any issues.

Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 21b7168d61f5..0aeac16843b5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1105,7 +1105,6 @@ properties:
               - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
-              - gocontroll,moduline-display # GOcontroll Moduline Display controller
               - prt,prt8ml             # Protonic PRT8ML
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
@@ -1163,6 +1162,14 @@ properties:
           - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
           - const: fsl,imx8mp
 
+      - description: Ka-Ro TX8P-ML81 SoM based boards
+        items:
+          - enum:
+              - gocontroll,moduline-display
+              - gocontroll,moduline-display-106
+          - const: karo,tx8p-ml81
+          - const: fsl,imx8mp
+
       - description: Kontron i.MX8MP OSM-S SoM based Boards
         items:
           - const: kontron,imx8mp-bl-osm-s  # Kontron BL i.MX8MP OSM-S Board

-- 
2.52.0



