Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92695606D83A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MHY9aEQy;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=PDybQWtJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sh8XuEouFSxM3Nere9HIciNOvbIlIxwEdyp0u63ZD0M=; b=MHY9aEQy3hUKZKNyhAg5wf4c1K
	biKjCUYzWwUh2/6qNF+ICMedWdh1t33GrrsFC8w+y2xss3vg0kIK0KZPlzwREJ9FhpBO1exKia3xC
	QnF14syUOx9SKlaLFBXrw/uyBToWCecYjDCsDGPdA1scjHtWufkaMoXBi2o7jdBSxXXzs3wFPpj4o
	gDKdq4BtmUwdXiq6mR8WHUofDQgsZ6PHdjHT696ZQGvWSerCwj9ELmXl9fp4UWmk+RBlxskS6Rdea
	vONB80zhImbGOGqGjtgR6ow3w+xdWosusC9GlIaVj9T0Ia4iezbo77vZGrtqwGsNcmpV9KBrw2EKU
	hflpX75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMZ-00000008s1U-2QzI;
	Thu, 05 Nov 2026 12:14:39 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwMW-00000008s0F-0g8m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:14:38 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261105121431epoutp02327bb44d4a5c6680f757346baad114cb~lJSX0tMzD1352913529epoutp02h
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 12:14:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261105121431epoutp02327bb44d4a5c6680f757346baad114cb~lJSX0tMzD1352913529epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793880871;
	bh=Sh8XuEouFSxM3Nere9HIciNOvbIlIxwEdyp0u63ZD0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PDybQWtJtaT7HN37J2PX4Ws4OFuscgdPQbVh8Efrhh4YTk8biaj49+hOvWkpkY3M7
	 vuw6S6E2CD3toP5oXcs4wYxPamYgkt4L8WrAbtLRhbllk0nzfJqO3uh0dJrkBstrvk
	 LF4RuyEfEwphJsWdcYwHWtkgQ+MTtz1Oj0BlcZL0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261105121430epcas5p34f3ca1eb34c18b8da084aae5b60407af~lJSXKYc_Y2560125601epcas5p3B;
	Thu,  5 Nov 2026 12:14:30 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jL1T15JsDz6B9m6; Thu,  5 Nov
	2026 12:14:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261105121429epcas5p39d2113969a054d297cda76a67f309c14~lJSVreVaO2344923449epcas5p32;
	Thu,  5 Nov 2026 12:14:29 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105121426epsmtip1d622e1345811eb639be62820813704d9~lJSS_xApT3060130601epsmtip10;
	Thu,  5 Nov 2026 12:14:26 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v5 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller
Date: Thu,  5 Nov 2026 17:44:00 +0530
Message-Id: <20261105121401.1661711-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261105121401.1661711-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261105121429epcas5p39d2113969a054d297cda76a67f309c14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105121429epcas5p39d2113969a054d297cda76a67f309c14
References: <20261105121401.1661711-1-selvarasu.g@samsung.com>
	<CGME20261105121429epcas5p39d2113969a054d297cda76a67f309c14@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_041436_546468_32F8F78A 
X-CRM114-Status: GOOD (  14.93  )
X-Spam-Score: -4.4 (----)
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
X-Archived-By: <archiver.kernel.org>

Add the Samsung Exynos8855 DWC3 binding using a flattened node
representation, where the DWC3 controller is directly addressable
rather than nested as a child node of a glue layer.

This is the first Samsung Exynos binding using the flattened
representation.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
new file mode 100644
index 000000000000..664c26c1a9ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/samsung,exynos8855-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos8855 DWC3 USB controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Selvarasu Ganesan <selvarasu.g@samsung.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on the Samsung
+  Exynos8855 SoC.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos8855-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Reference clock for SOF/ITP generation.
+      - description: Bus (APB) clock for register access.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@13200000 {
+        compatible = "samsung,exynos8855-dwc3";
+        reg = <0x13200000 0x10000>;
+        clocks = <&usb_clk 0>,
+                 <&usb_clk 1>;
+        clock-names = "ref", "bus";
+        interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+        dr_mode = "peripheral";
+        phys = <&usbdrd_phy 0>;
+        phy-names = "usb2-phy";
+        snps,quirk-frame-length-adjustment = <0x20>;
+        snps,dis-u2-freeclk-exists-quirk;
+        snps,gfladj-refclk-lpm-sel-quirk;
+    };
+...
-- 
2.17.1


