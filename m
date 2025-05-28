Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795CDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+GR7KqifG/hoxA80BGM5aHd6V/vsSmJeIziOqF6FLU=; b=vfPfdghBBDDyVdCNFgJ1HqsPUq
	p0TzALPVutrNT8LpS+h2f7o55jwc5FdIStDD+1aeLAlZqglRkPVoBfypQnMV6JjcrCsJmHbDQO9Uw
	8Sw44L4zKDGgtGsyP9x4p24PqE55DuYF2WzKCRh5Sp0yIgWHly3HFr8vgsV9gIvjGyI/73Pshvz5t
	MbCYHjcgbnzaxB0lcAczxrp9go7ZFil8m8ixayTQxNkYjRs6+uPmPeEe+WnGPeomI/UbiP0y5t2Ri
	XNMjWvisFDNzQE8fCm9uiOz3JPzwFodC3Z7PefQVXmNkjDNeQnEz9hpQ8yysUns2wBnd0uqGbNlLR
	qmMVbXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKI6J-0000000DTDR-1hAT;
	Wed, 28 May 2025 14:49:51 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHzv-0000000DRuP-3Ekq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:43:16 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 16:43:08 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Wed, 28 May 2025 16:43:08 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.li@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Richard
	<thomas.richard@bootlin.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power domains
 for iMX8QM and iMX8QXP
Thread-Topic: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Index: AQHbz97TDhLekXOKbkmerT2PfEO8vg==
Date: Wed, 28 May 2025 14:43:07 +0000
Message-ID: <20250528144259.2603914-4-john.ernberg@actia.se>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
In-Reply-To: <20250528144259.2603914-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453607C60
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_074315_816503_5B88469E 
X-CRM114-Status: UNSURE (   9.75  )
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

NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
resource management.

Allow specifying them for such SoCs.

Signed-off-by: John Ernberg <john.ernberg@actia.se>

---

v3:
 - Fix warnings discovered by Rob Herring's bot
 - Declare the compatibles correctly (Krzysztof Kozlowski)

v2:
 - Adjust commit message (Frank Li)
 - Only allow power-domains when compatible with imx8qm (Frank Li)
---
 .../bindings/crypto/fsl,sec-v4.0.yaml         | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml b/D=
ocumentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
index 75afa441e019..a4ada0e2d97c 100644
--- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
+++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - fsl,imx6ul-caam
+              - fsl,imx8qm-caam
               - fsl,sec-v5.0
           - const: fsl,sec-v4.0
       - const: fsl,sec-v4.0
@@ -77,6 +78,9 @@ properties:
   interrupts:
     maxItems: 1
=20
+  power-domains:
+    maxItems: 1
+
   fsl,sec-era:
     description: Defines the 'ERA' of the SEC device.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -106,7 +110,9 @@ patternProperties:
               - const: fsl,sec-v5.0-job-ring
               - const: fsl,sec-v4.0-job-ring
           - items:
-              - const: fsl,sec-v5.0-job-ring
+              - enum:
+                - fsl,imx8qm-job-ring
+                - fsl,sec-v5.0-job-ring
               - const: fsl,sec-v4.0-job-ring
           - const: fsl,sec-v4.0-job-ring
=20
@@ -116,6 +122,9 @@ patternProperties:
       interrupts:
         maxItems: 1
=20
+      power-domains:
+        maxItems: 1
+
       fsl,liodn:
         description:
           Specifies the LIODN to be used in conjunction with the ppid-to-l=
iodn
@@ -212,6 +221,40 @@ required:
   - reg
   - ranges
=20
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-caam
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+
+  - if:
+      patternProperties:
+        '^jr@[0-9a-f]+$':
+          type: object
+          properties:
+            compatible:
+              contains:
+                const: fsl,imx8qm-job-ring
+    then:
+      patternProperties:
+        '^jr@[0-9a-f]+$':
+          type: object
+          required:
+            - power-domains
+    else:
+      patternProperties:
+        '^jr@[0-9a-f]+$':
+          type: object
+          properties:
+            power-domains: false
+
 additionalProperties: false
=20
 examples:
--=20
2.49.0

