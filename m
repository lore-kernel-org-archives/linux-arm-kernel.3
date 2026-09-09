Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F8C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P67qbos3D+tWJec3niEbndAJClHMkcSjY99grIP5ELc=; b=dJWPCB8R70dQW83WbJ7OU+sPUa
	lj7FADOkd/B586lyGx9HX1gGCJgOmodgdg48lq6tW1KUFZ/v0rZmFAD8jl+qvSxEtThhMP3GsuXmS
	GbUcLsMGLaGYGvGud4uox3XlymeDtPEvL+PSPriLl+kkf1HhZW6kwMYyjEoW680pqTloe/TD5svIy
	njrlwYvCfnJNbkJZPp7CR7kwIozEl5gP1Ch4USwsAGnyXEAS/vAN+TX/AAvgUCO1yDnruQYeVUGJT
	CHGHC/mqXwe4cxhvO4uTEPqTfQtQyyYU+W45fWJln7/SoGz2mppTqMVKTHWC8XksQgMEiUC7NXBWf
	UBAWkmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Obe-0000000Cmm5-05zL;
	Wed, 09 Sep 2026 20:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Oba-0000000Cmk8-1rHj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 20:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P67qbos3D+tWJec3niEbndAJClHMkcSjY99grIP5ELc=; b=mefa1sFLphKC1p/LJR2xxoauub
	hkSW6mmRkOwrExor24QEe5pJHNeOcDY9YJaZphXB7JJ3C23hpNhjzAtdeUUygsvA+xmEDnDzaM2EI
	FbGVFCePCV+LckuwdvcxdfLz9zke8u3xGjHCpoEaBf4Jc6xC8B83mL5psM5P/K5PRGKBIljznz0dR
	rEoSaMpjZxCTX6zJbAArJLD1xP5V0bzasSzPshqHY6zWyae0DW251tY2LABlgAx5HCNv2qTTJlB2x
	v/YGQ63si3rLMpDhxSwJHLzHWw3oUV/qi2W0MKq9B8xrwoZef5fY/PHsTwqe+w+TSU1x5U2+eU2oD
	JWUAxEfQ==;
Received: from out13-173.antispamcloud.com ([185.201.17.173])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ObW-00000001dLA-3pSI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:09:13 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx321.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x4ObF-003TNT-0l; Wed, 09 Sep 2026 22:08:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P67qbos3D+tWJec3niEbndAJClHMkcSjY99grIP5ELc=; b=yIgzJ5Lx5YfACdaj/G0IrNlFZU
	TEN8H8eoo41uDwyUbXg27nG8hMDIFBlAOtLTdYeZ+Yk/bnGHRPBPckFju6G4Jv/4k4BlBuaI1/oba
	dsb+q51BABP8TqRq8NxCLETeXvtF7iwTSrH8DzqK3PkB9/TGOqY+Pvi3VhPZUoyOKLIbtic4Yl+Sh
	23c/5Ssb0HiuPrA/TfMBFn6wHQDJXDYBRkSKaD6LG+scYYYh1pEg9Ck4eRDWOuA1FjpgqVXnmpjDv
	a1YBGrdUCWzh9FbFgBpChBg/Gdwx2sZw3hRqwbwa2EmTaVufeO8T7OQNbP1ChemE4shOExXpksu0V
	bPezqXxA==;
Received: from [188.251.249.2] (port=52430 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1x4ObD-0000000DWp8-47g0;
	Wed, 09 Sep 2026 20:08:50 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Wed, 09 Sep 2026 21:08:08 +0100
Subject: [PATCH v5 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-bcm2712-iommu-submit-v5-2-2539c52b249e@reactivated.net>
References: <20260909-bcm2712-iommu-submit-v5-0-2539c52b249e@reactivated.net>
In-Reply-To: <20260909-bcm2712-iommu-submit-v5-0-2539c52b249e@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00433844911397)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuWEzRp917teJpwtmUPNDZBo0usM7jSAXZPF
 HlQWJujTSCu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIOYn9vhoNExpT0rpjg2lHVHGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWBp35AJbRNknLgMOj3O/cqXeB7itP8hgjDRserKv4bhb7ubyJcscJCC/8jhyq4eIIJWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5Ay6i8PhAwy
 ohd+GCGjMSaCo2g+pLXSstFFr2Pmsof7eeRHKvLDzn+sBlvbv5VnduIaCC8T432LXhcN9iDypd/G
 jBIJaw3nA0JWQqC5+Jig4CpfjrlgQefNeWcxSH+UCzbtFoUUErjvkjClnO+z3Y8BCB4GKZ8tHsR5
 A+L9kzDG/K63IFf1tTl6XjJBLr8hyqcPiIfzvuBQjcdRxCwh8eiHlonTJYQp6P0LGGk5YcssJBnE
 oCFelNEuPkquluSoEnYwJqEylk1bBhjIWUVQpiEaCXgutbnJ8XLRZlxuyGE4ZkJ+Ct1rytEV3nXE
 30Z2uRLE/8mc4sO+W8vok4IjJdnmU8DTX941WdbezDc4vvZrV3V8zxJiAh4HD0pbHodESl7kaNlb
 x8xIGSNGie95MFeWVyO9Qfhfm+3ZVXwsV2bUYWW4ep6BcO097ndMLXudKQNeFU4oFhi1MNpONIVI
 cKQLYpRI/YdWVB4RLR9xg0malhL/zrerFdzyp80QodgbrP5s8nByAM67kkfx5CxJZu8aTgJ5f3aq
 udJOEH3RuyZ+8leu7vxlwaJe4HXvh1KDzbyuhe3rKagUdobsFC0Ri8UJKkNYEwQtgFkgklp04bUn
 b1qdOer54gFeYIyf/VI1wUg/RktiFekFeW+7U10rT7jLCnLvR/Y0+hqFCvJ5ztihCGpdCKDGFJnk
 5eJFcFklVb9231/E3ahF5MMcDI7KdpjQKdEz/+/QkUVhwSqO+QS+xjCZ3JKVmi72ocgY5kMQSjs7
 CnU3Vkswnvz2sY575f5VZdC7A9EkfupFeybqiokSL/UoBa9Z74L1QD5u7fk/CB2ffOy/knOaqu9M
 jU02vQscbFXfLr4QfL2DDLcpCTGg9PS1ky5OPdlHgN5e9b5Lw3uYQPd20BP0KnfPWQcPrGKRVBY+
 C3NKVBiu9E09fH2QcWWDSTfRyaGsL+KZNwpYGCN6yCqJqJMY7uMzxq3+Ecx6Ww+vAj0HbLbveTIz
 fDDueIdjUxTaa0dmGx2m78JeU6J5dQk8TiQJh7U9utxWE7LPnybsgEYdqBiEd1NUIwnN5yy6OdCX
 ruFiDfpPjR+W8zc/PAlbDjazCbhs7qBpykynMlI8ehauFjA7dVMOTKcW5c6UnY64mAykh3LBvXwi
 LIjlrjIuKSKddsFYTaIZy4Zvun7pGU7uz9Qh2BYl/pOFic8JjqapLpwrwdUQz9MPWEmV3jR5NeVa
 JQBh0uawl0Cg8hPs+cRD5TJxNzOPadp3mtqXN3cCIyIm263/n4zqghav48Y+3YiJRbPwEKhVXmMF
 SH7pGU7uz9Qh2BYl/pOFic/qXKRF3uOx1VRdI9vLlOBy9jihx+Za/cV70jOJzN2r4A==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_210911_343012_1661AF5F 
X-CRM114-Status: GOOD (  12.88  )
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

Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 54 ++++++++++++++++++++++
 .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 40 ++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
new file mode 100644
index 000000000000..5ca8ce469ec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2712 IOMMU
+
+maintainers:
+  - Daniel Drake <dan@reactivated.net>
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Jim Quinlan <james.quinlan@broadcom.com>
+
+description:
+  The BCM2712 SoC features multiple independent IOMMU instances providing
+  address translation for multimedia hardware blocks, such as the VC6 display
+  pipeline, camera receivers, and ISP. Each IOMMU has its own page tables,
+  control registers, and local TLB, and is additionally linked to a centralized
+  L2 TLB (IOMMUC).
+
+properties:
+  compatible:
+    const: brcm,bcm2712-iommu
+
+  reg:
+    maxItems: 1
+
+  '#iommu-cells':
+    const: 0
+
+  brcm,iommu-cache:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the shared IOMMU cache (IOMMUC). Each IOMMU instance caches
+      translated descriptors in this centralized L2 TLB cache block and must
+      trigger cache invalidation commands on it when updating or unmapping page
+      table entries.
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+  - brcm,iommu-cache
+
+additionalProperties: false
+
+examples:
+  - |
+    iommu@5200 {
+        compatible = "brcm,bcm2712-iommu";
+        reg = <0x5200 0x80>;
+        brcm,iommu-cache = <&iommuc>;
+        #iommu-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
new file mode 100644
index 000000000000..47c584ad667a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommuc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2712 Shared IOMMU Cache (IOMMUC)
+
+maintainers:
+  - Daniel Drake <dan@reactivated.net>
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Jim Quinlan <james.quinlan@broadcom.com>
+
+description:
+  The BCM2712 IOMMUC is a centralized Translation Lookaside Buffer (TLB) cache
+  which accelerates address translation across the SoC's IOMMU devices. If an
+  address mapping is not found in the IOMMU's local TLB cache, then this
+  IOMMUC is consulted as a L2 TLB. The SoC includes a single IOMMUC which is
+  shared between all IOMMUs, and it must be explicitly invalidated when
+  modifying or unmapping IOMMU page tables.
+
+properties:
+  compatible:
+    const: brcm,bcm2712-iommuc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    iommuc@5b00 {
+        compatible = "brcm,bcm2712-iommuc";
+        reg = <0x5b00 0x80>;
+    };

-- 
2.55.0


