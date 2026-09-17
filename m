Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3504C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqLenxL/19HM/21oW+/2Rvt5NkH8DxDP5vg8uKDbrNU=; b=V1cQ8gw8pPAkSlVR0KTI7acUwn
	NP9S+8cq8BIX+z6lIf9UV0L/JZRY4MwncAYY+Nz/Rrw0H7iRmqrhbooxnwzo+RFWKVdD+MHFPrryy
	2QHoGD3fs9khz4wDPNGBG33bfHGWr+zb7W5ezl/EW/UzkFEzpdJ2PUMDKfxdT246SsJBC+LCCba7M
	0qGJPfdBCy6gHZe/D26o2cW0DPTaYAnRiqxvpyE2gO9c+SUxEAEwnmUiFAJb6vg4AHOjHT4xteop9
	qBktkoMN0EWW4gGvOS+PRzkLha/6Ij9EtWpUw9oBwXYxb21TDSy/BR6WWwrcMDgfA4kyVtLiDhWFv
	fh4tXQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78dc-0000000B1uR-0DsA;
	Thu, 17 Sep 2026 09:42:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78dV-0000000B1ra-2QF0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:42:35 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 5F59A1FCA4;
	Thu, 17 Sep 2026 11:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789638144;
	bh=oqLenxL/19HM/21oW+/2Rvt5NkH8DxDP5vg8uKDbrNU=; h=From:To:Subject;
	b=Nu9KQPMyGvEnRxMmeqBlI2wIctwrE5oIuzPKfWniQ2FyhzhEFWZ+xoFy2uhCjxQzr
	 CLfdSnZJlQ5pKcY64xTrirR8JOaonblRZ459PQVDxWj68RXdgKi3ty94dcS/GhTBB/
	 QNMVD9ktzYf/r/GDtRxtJvK+Kz8I9GZOm+ZaIp6kSsDa2Kmcmatxvf5I1ArKWtVbeZ
	 AmrrlBs7EmF33AZXHYiDkuIUd35ygYBGj8rAE4xCPrvZ//j06i1k0LJUIs9iburs1n
	 RIXPYaKvJkeBpY8KKzmL43+jH2caQG3XjjJNbaYMvno36XQLRD/lLn5GGHVCjY68Dw
	 mQrqnDw1crT3A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Antoine Gouby <antoine.gouby@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: fsl: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 11:42:14 +0200
Message-ID: <20260917094217.59508-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917094217.59508-1-francesco@dolcini.it>
References: <20260917094217.59508-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_024233_771410_DB3F1F97 
X-CRM114-Status: UNSURE (   6.25  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add Toradex OSM iMX95 SoM and the Toradex OSM development carrier board
it can be combined with.

The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
from SGET using the NXP i.MX95 SoC and is available in Size L (45x45 mm).

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..9413c3e225ea 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1578,6 +1578,12 @@ properties:
           - const: toradex,aquila-imx95     # Aquila iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with OSM iMX95 Modules
+        items:
+          - const: toradex,osm-imx95-dev # Toradex OSM iMX95 Module on Toradex OSM Development Board
+          - const: toradex,osm-imx95     # Toradex OSM iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board
-- 
2.47.3


