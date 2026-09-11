Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494ACC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1ZwUA6aZ+bCcjphsn35lodInoiS717rQCpdkCJqvLs=; b=d5VOhM6oWYgKqRb6EAYBaF7PLm
	9KeueceePxhwB7a35AaZ8qrEeXjrFYwHRgFKThtyFHvKwFdWuXYy93Ty66xGhXPDoTbFroIWIRXoP
	C9dRbs1f5jGCzm2HsGSQenZsUd+G72leZPzhi7oJoOWCVecMyCDgfCo471CZHjz8CBsgMFrBfSCDG
	pWMDueoZ13gxBnOk+eTfWQhd2H4GA30N7wxXn7h3HSBHYT/XbN3kS3SgF0PSPTeMEvVh75WYfopvq
	k7lwMyQOfrTOvauJXXaKhMM44gm+BLKnKLZpnorPi/bj6lKdSXpodvHVpmQpVq0Izbk66ZqLXL5zA
	8Wd8QkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQt-0000000GFKS-3F2U;
	Fri, 11 Sep 2026 09:20:31 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQm-0000000GFFL-23p9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:20:27 +0000
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id 7CDF322DF7;
	Fri, 11 Sep 2026 11:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118422;
	bh=f1ZwUA6aZ+bCcjphsn35lodInoiS717rQCpdkCJqvLs=; h=From:To:Subject;
	b=z8Z9cslJklzZT8N5SvWMzkxrFZHuYzykH1FCXGhPZV0vWBWWxWfAu3xSjcLXbIBS0
	 EoZBFUJS7w0sSrKAQtq6u9ufFvDUW32PGrpnb0YpLBZrmSkDOzJreTTYKs/CFsA85Z
	 q3VyDN6KswvoQLK9yo9pqAeKONrl2ZHISFG5/AA9thCyTHm3mhI3p8V37yL96sQfjj
	 m1VJE3+CPuj9qdVk8l46ZTRDYq0YAoP0eAnPvOdW/1bGm0T7N1wsiRK8xzYZl+Wk68
	 LzOO+tE0CAEZWKAetQhm0Oyn1FzcnCaE+hWpJZhfNtLiUOnePk5UHWRQviaSgKFrhS
	 Jj3BNAUw7qEtg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Date: Fri, 11 Sep 2026 11:19:45 +0200
Message-ID: <20260911091952.96233-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911091952.96233-1-francesco@dolcini.it>
References: <20260911091952.96233-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_022024_712527_24147D14 
X-CRM114-Status: UNSURE (   6.08  )
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

Add bindings for the Toradex OSM iMX91 and OSM iMX93 SoMs and the
OSM Development Board they can be mated with.

The Toradex OSM iMX91 and OSM iMX93 are OSM 1.2-compliant SoMs based
on the NXP i.MX91 and i.MX93 SoCs, respectively.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
Link: https://www.toradex.com/products/carrier-board/osm-development-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a32f779f02e4..33ced11fa2a0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1520,6 +1520,12 @@ properties:
           - const: toradex,lino-imx91
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx91-dev # OSM iMX91 Module on OSM Dev Board
+          - const: toradex,osm-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1540,6 +1546,12 @@ properties:
           - const: toradex,lino-imx93
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx93-dev # OSM iMX93 Module on OSM Dev Board
+          - const: toradex,osm-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3


