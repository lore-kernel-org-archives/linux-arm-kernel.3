Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FFDC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scVkhJAXmCTdP0a6fxMbAsiiiW2o8irbfDoDbP6cwlw=; b=p+W4LvPqp8ubBrjbZnOvP5zOj0
	8tHOJoQ1ltOIlgbnhbS2LjLM6lZ7y4N89GZxI7Ah0sj2y1dscO7NKRVtlbqBVu//j9mMYgGnBYdMr
	6Ig/aVVES7PL+JpNzsJCvQXOyzstsClxLFO+2foAkow/dzsQwZx5cGEKJfl7Ybb9VLQSi8DEfunAB
	1d2Snof/Hj7shLJM06Ic6MWvh3b0IZ8e16Lns+NAiIyoGnH7UCTs/DB0MGA2rsWN0Jw7B4XVJXf6u
	18TO42/7FHBbxJFxbU1iJo82we25lfZM1EQYsXnHzd9Ns4803IwpEMGsd2mPKprTKu/2X4z0jfxTE
	rtGlXUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2puN-0000000ADqW-3ozz;
	Thu, 10 Apr 2025 11:17:23 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2odN-0000000A0ST-3WBG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:55:49 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A62MMD009620;
	Thu, 10 Apr 2025 10:55:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=s
	cVkhJAXmCTdP0a6fxMbAsiiiW2o8irbfDoDbP6cwlw=; b=CV0cHlDF3JOwzzeNS
	xxjSuaoL+E2Pt0W3ZBfCwXnmxbApN3eJK4HzXfmjvrFVGj64mG8WkWnNIn9a9KjC
	EOZNpsqVeUwgmwsxPQiQ3ySmABwP53u4wRgiDiYBprXoSp37TW3D9V/ILP/u1pvH
	zPPEpfahzXYN0tjuMErAFZEJOgPST0316T9MreH8xtWrSJe91ENxq8npc1Dls737
	peEIhuVpjMeIsMYogqhHFVBqA9rsai5hYI84g+/4foy5kQF0UcuIVpJlH7NbmyMk
	yK0qhggixbgtUq0aB0H/Ta9S+ISV9IQcLtpc/OO7AQGJkuslzuLIfC8VAWLxGTwi
	y/Uew==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45ttssbgdy-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Apr 2025 10:55:18 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:17 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:01 +0100
Subject: [PATCH v6 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-2-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        "Michal
 Wilczynski" <m.wilczynski@samsung.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3192;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=fhRK6V4a8oVHsi+Z355xgHItBt9W8Q1EnMu2lgZoUb0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9oYcb/lW+WWHM61oq8b+Ot0X13OPaY5YZtzsMH7t
 fYl9XIzO0pZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAizvyMDD1TDl53m+2xoKny
 Wo1Z87Yt2U13Dq2/9mHiOu4Px/+nzutkZFi19O10riuVHUE3qyWirj2+8c3afo7M1fU97u7erXM
 cCzgA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: AEYioQ_KxR-IbWnvZwRwBHSSLzKt_PiP
X-Authority-Analysis: v=2.4 cv=I7hlRMgg c=1 sm=1 tr=0 ts=67f79586 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=KKAkSRfTAAAA:8
 a=p7jsAhIcb97OX6hTVYYA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AEYioQ_KxR-IbWnvZwRwBHSSLzKt_PiP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_025546_217621_48553152 
X-CRM114-Status: GOOD (  11.50  )
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

Unlike AXE-1-16M, BXS-4-64 uses two power domains.

Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
integration in the TI k3-j721s2.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v6:
- Add Krzysztof's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com
Changes in v5:
- Replace anyOf/const with enum
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-2-d987cf4ca439@imgtec.com
Changes in v4:
- Add minItems: 1 to power-domain-names so we don't break single domain
  bindings
- Add back power-domains to conditional constraints to match
  power-domain-names
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com
Changes in v3:
- Include adding the second power domain so it's in context
- Remove unnecessary example
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com
Changes in v2:
- Use normal reg syntax for 64-bit values
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 38 ++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index e1056bf2af84c3eb43733bdc91124a66aaf51d35..0fb2cd939aa45b48b0a6a95ed7f01e0c6f64a4f3 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -21,6 +21,11 @@ properties:
           # work with newer dts.
           - const: img,img-axe
           - const: img,img-rogue
+      - items:
+          - enum:
+              - ti,j721s2-gpu
+          - const: img,img-bxs-4-64
+          - const: img,img-rogue
 
       # This legacy combination of compatible strings was introduced early on
       # before the more specific GPU identifiers were used.
@@ -48,11 +53,14 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   power-domain-names:
     items:
       - const: a
+      - const: b
+    minItems: 1
 
   dma-coherent: true
 
@@ -82,7 +90,33 @@ allOf:
       properties:
         compatible:
           contains:
-            const: ti,am62-gpu
+            const: img,img-axe-1-16m
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,img-bxs-4-64
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+        power-domain-names:
+          minItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,am62-gpu
+              - ti,j721s2-gpu
     then:
       properties:
         clocks:

-- 
2.49.0


