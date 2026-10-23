Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7782606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UvSr5tH7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MLCZSXjI;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mVGGwHjl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cdpF+fVt2Hy2HfAcjpixN/WDxEX2Gn1Ra3OqY32SpVU=; b=UvSr5tH7AmHthM/+UJ0e5a2ZZn
	Udpi6FV9zwq3eWFa8ClHQfUPyx7mqa9hqpIcCqzemfKs1WrmmM/rSYRZJa/ogNgzSPBN8kf0VSrwd
	NUeK+PAV28sgOif3o4OfRtmAakxGxOQ6F+Dl/l9ijCcsIaqiGzB+7K5dg/T92q/Ew1+3PZGA+lxjF
	k8POvC61O/1XHHNi/QAlnhHZRB/BjMkQ2gZujl/vhgjKZjAB/TDuGkV5ulDKrJopgvQNvNRSO2U78
	h8Eg4D7bO+5rJQjhk7ld3nz/BhSH4ss/cS2CGHWCv/MCTkf8iZRy2rN0ySnmDtRsnZQgA2sgp8Rzu
	4Ff4dT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7v-0000000GMRD-1qEY;
	Fri, 23 Oct 2026 13:16:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7s-0000000GMPE-0r8c
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cdpF+fVt2Hy2HfAcjpixN/WDxEX2Gn1Ra3OqY32SpVU=; b=MLCZSXjIJhEqtGTDuNeJdixsy7
	JVh5aeH2K4SAkLhQ8DSu43a/54+IzXl7FbvhKZWKN64Nr1OV1eEQNryn1/8bf7B+V8bqwY2lyVp4H
	AeHbSYvTNjjR+62f4k6ZvY45ZKVmYUPKhV9Lm+44qUsuzD/vZ0hOd+tyzxv4FWAs79WsvSpEvFGCa
	/f2Xtzk22g7AxTkP0OAcBtFVTeB917GZDbVUDkfHuaYvT5nhbyTV+lh9fXoeLEfjgmZHCRBDYfe/z
	AJ4ubA7EuW0vZHi306wh9clRHDHLIHx01oyS5q92W0VYlzV0Wo03SYx+Ui1H48DskQQGDNn9JyJFc
	Q/KVxm+Q==;
Received: from mailout2.samsung.com ([203.254.224.25])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKF7o-00000009fOp-2Oec
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:16:03 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261023131548epoutp02d5e1358b97f8d98559764a8942bf0bfb~hKvK6P4332878028780epoutp02z
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:15:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261023131548epoutp02d5e1358b97f8d98559764a8942bf0bfb~hKvK6P4332878028780epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792761348;
	bh=cdpF+fVt2Hy2HfAcjpixN/WDxEX2Gn1Ra3OqY32SpVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVGGwHjlJfnuh/4+7+Ci5EO+0VrPVE/ID3N16GY7xk2HufMz8Zu7DApt4jlTHlBa7
	 Kn2rzMwGmklvJWSYc8OYYp8/3WbazSLys/EwhLEjvJr5+KJNWo0S2D6LNDmPQCmemu
	 Q41VhPDT0SfgZqQAvVd2It/p6hQFyxUGmb3YMlYo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261023131547epcas5p209499d6511be03591bb323d282998a0a~hKvJ8q5X10460604606epcas5p2V;
	Fri, 23 Oct 2026 13:15:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jB3Rk4SDdz2SSKY; Fri, 23 Oct
	2026 13:15:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc~hKvIRFYpW3047030470epcas5p1q;
	Fri, 23 Oct 2026 13:15:45 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131542epsmtip2ba58969fa0472da8c45d845928488ab5~hKvFhqAQp0806808068epsmtip2C;
	Fri, 23 Oct 2026 13:15:42 +0000 (GMT)
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
Subject: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Date: Fri, 23 Oct 2026 18:45:00 +0530
Message-Id: <20261023131501.3157463-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261023131501.3157463-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_141601_200269_1CE523C9 
X-CRM114-Status: GOOD (  15.64  )
X-Spam-Score: -2.8 (--)
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
 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
new file mode 100644
index 000000000000..d8983c310d31
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
@@ -0,0 +1,74 @@
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
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Two clocks are used:
+       - ref: Reference clock for SOF/ITP generation.
+       - bus: Bus (APB) clock for register access.
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus
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
+        interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&usb_clk 0>,
+                 <&usb_clk 1>;
+        clock-names = "ref", "bus";
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


