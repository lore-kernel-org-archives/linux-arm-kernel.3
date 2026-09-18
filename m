Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D59C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bkdmz7kElIYF2GwuMkeCRcf8REsk10kJpvZgqWy/n6E=; b=Fi+uM/DGvD+RVgPHzcfi77mSkG
	h/yEHJp2Pqi7id5FghnimPwj8o25GG4Rdaq6XpuCJM5BwO/DnMVzv2HGvX5XUoIYieVsO4BixIFdG
	LZJq1QhGJ80ezlumKNLN9wKUZ5BHnIH1SSIFD0Yz8Z/LFhMpAC2YOZg8ES+2iLsOSyzDKG7rpAE9a
	cevxCgKCCrc9jqTzFXKsAiVm22eanNBcfyd12HMbcW8ExsDp9VIYyixhngn2/LGlzcDtLw7LG1UPh
	fVH7fwsOqSp832xpVxpOVABEM99gWA9J7S0BB0zfxAzlq+A9X44c/IwXDbQ/6gtE8MoVRXTKjdy6V
	WKSa1lCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ehv-0000000FScu-3f7D;
	Fri, 18 Sep 2026 19:57:15 +0000
Received: from tunnel231050-pt.tunnel.tserv1.bud1.ipv6.he.net ([2001:470:1f1a:93::2] helo=trabant.uid0.hu)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ehs-0000000FSbU-2dfM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:57:14 +0000
Received: from wigyori by trabant.uid0.hu with local (Exim 4.94.2 #2 (Debian))
	id 1x7ehW-0000ER-K4
	from <wigyori@trabant.uid0.hu>; Fri, 18 Sep 2026 21:56:50 +0200
From: Zoltan HERPAI <wigyori@uid0.hu>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kernel@pengutronix.de
Cc: wigyori@uid0.hu,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm64: fsl: add Olimex i.MX8MP boards
Date: Fri, 18 Sep 2026 21:55:58 +0200
Message-Id: <20260918195559.130443-2-wigyori@uid0.hu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260918195559.130443-1-wigyori@uid0.hu>
References: <20260918195559.130443-1-wigyori@uid0.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_125712_668180_FC814D20 
X-CRM114-Status: UNSURE (   7.19  )
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

Document board compatible bindings for the Olimex i.MX8MP-SOM and
-EVB boards.

Signed-off-by: Zoltan HERPAI <wigyori@uid0.hu>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e..aef153222 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1146,6 +1146,8 @@ properties:
               - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
+              - olimex,imx8mp-som      # Olimex i.MX8MP-SOM
+              - olimex,imx8mp-som-evb  # Olimex i.MX8MP-SOM-EVB
               - prt,prt8ml             # Protonic PRT8ML
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
@@ -1225,6 +1227,11 @@ properties:
           - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
           - const: fsl,imx8mp
 
+      - description: Olimex i.MX8MP boards
+        items:
+          - const: olimex,imx8mp-som     # Olimex i.MX8MP-SOM
+          - const: olimex,imx8mp-som-evb # Olimex i.MX8MP-SOM-EVB
+
       - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
         items:
           - enum:
-- 
2.39.5


