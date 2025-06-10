Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BFFC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ll/xvnMsmo1ZWc9dc4Xkr+Afm7qksvoXsZ3rt5gld+c=; b=It26Z8xZsaPuC/IgOk2tmuB84q
	l/hkG+XKk1aect5y+RwjkyPMChbjoJr+OqB9W+YZuytjTEkRnO0X8/WL8KPTxT2QAEahH5/yBhj1r
	YHn7MbifS2pa/M4w9v7jnhYzZc7cBxf0rDNvffZdqL17kaa5Zro4ZlvcdKaBVm6mf6zspiNbKvV34
	5itUQcbqYcuR89tPynJHFS6kyDBJaJrv0VHYsuBZznzR1VZnS4HzGlqTNz7P9QAuEfsRWVMX3eTP7
	Rsb6AI5FaXiJYjmtn++4fKz9/zlgq/b0pVCzHxYsbB0hm6L3CfJ4RHPy+68wq60t1RPGi52LximMV
	+O1HF8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuql-00000006GA1-1atc;
	Tue, 10 Jun 2025 09:00:55 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuhZ-00000006EjG-1ofI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:51:26 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 10:51:18 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 10 Jun 2025 10:51:18 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v5 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power domains
 for iMX8QM and iMX8QXP
Thread-Topic: [PATCH v5 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Index: AQHb2eTUmYXqpIxcQEOHEU52RD3qfw==
Date: Tue, 10 Jun 2025 08:51:17 +0000
Message-ID: <20250610085110.2295392-4-john.ernberg@actia.se>
References: <20250610085110.2295392-1-john.ernberg@actia.se>
In-Reply-To: <20250610085110.2295392-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.49.0
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B1445362776A
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_015125_481901_D52C33EE 
X-CRM114-Status: GOOD (  10.58  )
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

Add compatible strings for these SoCs (QXP and DXP gets to share as their
only difference is a core-count, Q=3DQuad core and D=3DDual core), and allo=
w
power-domains for them only. Keep the old restriction for others.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---

v5:
 - Fixup indentation (Rob Herring's bot)
 - Collect tags

v4:
 - Reword commit message (Frank Li)
 - Add explicit imx8qxp compatible (Frank Li)
 - Move the job-ring constraints back to the job-ring section under an
   'allOf:' to avoid the warning from v2 (Rob Herring)

v3:
 - Fix warnings discovered by Rob Herring's bot
 - Declare the compatibles correctly (Krzysztof Kozlowski)

v2:
 - Adjust commit message (Frank Li)
 - Only allow power-domains when compatible with imx8qm (Frank Li)
---
 .../bindings/crypto/fsl,sec-v4.0.yaml         | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml b/D=
ocumentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
index 75afa441e019..dcc755d2709a 100644
--- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
+++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
@@ -46,6 +46,8 @@ properties:
       - items:
           - enum:
               - fsl,imx6ul-caam
+              - fsl,imx8qm-caam
+              - fsl,imx8qxp-caam
               - fsl,sec-v5.0
           - const: fsl,sec-v4.0
       - const: fsl,sec-v4.0
@@ -77,6 +79,9 @@ properties:
   interrupts:
     maxItems: 1
=20
+  power-domains:
+    maxItems: 1
+
   fsl,sec-era:
     description: Defines the 'ERA' of the SEC device.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -106,7 +111,10 @@ patternProperties:
               - const: fsl,sec-v5.0-job-ring
               - const: fsl,sec-v4.0-job-ring
           - items:
-              - const: fsl,sec-v5.0-job-ring
+              - enum:
+                  - fsl,imx8qm-job-ring
+                  - fsl,imx8qxp-job-ring
+                  - fsl,sec-v5.0-job-ring
               - const: fsl,sec-v4.0-job-ring
           - const: fsl,sec-v4.0-job-ring
=20
@@ -116,6 +124,9 @@ patternProperties:
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
@@ -125,6 +136,20 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32-array
         items:
           - maximum: 0xfff
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                enum:
+                  - fsl,imx8qm-job-ring
+                  - fsl,imx8qxp-job-ring
+        then:
+          required:
+            - power-domains
+        else:
+          properties:
+            power-domains: false
=20
   '^rtic@[0-9a-f]+$':
     type: object
@@ -212,6 +237,20 @@ required:
   - reg
   - ranges
=20
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx8qm-caam
+          - fsl,imx8qxp-caam
+then:
+  required:
+    - power-domains
+else:
+  properties:
+    power-domains: false
+
 additionalProperties: false
=20
 examples:
--=20
2.49.0

