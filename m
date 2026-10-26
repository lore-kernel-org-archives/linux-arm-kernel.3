Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B54606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NAyBk3sk;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aK60vapI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JKdhQiOmdCsaaqBF8qWcsHGORlwa7z3ZiWBezdGBF/g=; b=NAyBk3sk/O011S1Ki/Es1ir3oM
	osIthGHv9hyM3WDrOplGNRSFLToptqyGNBHmTnHJRLluarPv19pveM3pUsqnUK3nrjvKDhYsSN7l5
	yXRiXHAePFhJyTRsloqBubVX0o/MdVtOJ4KzCFi0swDJ+3W7mUFNpEa0lyZr1aM42rtcExz09R8G+
	prS8LcXwJHJo4A7dTF6GpCeArl8SDiH75PZxIoCdvjtWue7OrNCJzyG+huCS7FIoHEIuIUbzvlxSD
	bjUVoqWhS4/8/jFBVpxniiAe+F7uRUd+8DuWjZ98cr4rIUOWxkBdtNsuB03l7j9Qpd9LqhFTudXUD
	UxySDJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLD8-00000002eeO-3geI;
	Mon, 26 Oct 2026 13:58:02 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLD5-00000002edS-0hqM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:58:01 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261026135754epoutp01b52b0eb1d1f631996994e13f05dece4f~iGPxo4pqM0285402854epoutp01e
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:57:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261026135754epoutp01b52b0eb1d1f631996994e13f05dece4f~iGPxo4pqM0285402854epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793023074;
	bh=JKdhQiOmdCsaaqBF8qWcsHGORlwa7z3ZiWBezdGBF/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aK60vapI0AWHbrOew2Lu7P1t9SC5KiJEgf1FvVsJD6wHezPXO9JXAuVRVXVsEDCjz
	 cWjRuWCA/y+IjURe+kJ61GXAihngER1ycum1SXXn5vxjc2k0XmouIMeWiwvRmqy+1q
	 n5MIxrNGmP22ed5jDB5He45tFTNoPnmTyF9eK1bc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261026135753epcas5p45ab627f117aa3abac4e60a193f90fe66~iGPxKHSBs1250512505epcas5p4A;
	Mon, 26 Oct 2026 13:57:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jCwDw3ttYz2SSKY; Mon, 26 Oct
	2026 13:57:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261026135751epcas5p42c28c8315cd25554a11032714b85bbed~iGPvuSnZ41250512505epcas5p4-;
	Mon, 26 Oct 2026 13:57:51 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026135748epsmtip24fb2850f7c59f2c8e06a5ae1f9928f87~iGPs3FI2B1343713437epsmtip2x;
	Mon, 26 Oct 2026 13:57:48 +0000 (GMT)
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
Subject: [PATCH v4 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller
Date: Mon, 26 Oct 2026 19:27:14 +0530
Message-Id: <20261026135715.33071-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026135715.33071-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261026135751epcas5p42c28c8315cd25554a11032714b85bbed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026135751epcas5p42c28c8315cd25554a11032714b85bbed
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
	<CGME20261026135751epcas5p42c28c8315cd25554a11032714b85bbed@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_065759_853775_E2866AA4 
X-CRM114-Status: GOOD (  17.32  )
X-Spam-Score: -4.7 (----)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


