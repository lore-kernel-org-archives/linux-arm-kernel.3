Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CDF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h27A40gY;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=FFCmnN52
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5kI8gmY1B2lqy3EqGixZzS2Fx5POa83a6PEWgQ3NNoQ=; b=h27A40gYIpLSR5
	e3gKRoashJoUuWUfEujMUwTfmuir1ASIZIhCGyrDZY2qHwnzDRrjcdW2KEV77T3YhrslY2u+5Q+h2
	pN4cFGtHXnW/gzBylR1fscrKrud+K2SHhAoh7ZpCVM/8Xho71n2h2Bs/rWAcHNOWCLt7uSBAZD8CA
	tmsxaAPHEifkmmB5l3Ogesgbz7+hpPRifRFOQqzVVeRu2UsnyF7tjGsj0SfF1zY/2kTUYI75TYm9k
	+E/ocAsT0dEgrlgsTpXXZe7MdaA/3h4IBt+EhFSoCjFf7rBw2dYsjW3JFkqz3fpaqROrf6GxOyzu+
	88i28FlDsrniSYHleaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqdQ-0000000DzCM-35cB;
	Thu, 22 Oct 2026 11:07:00 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqdG-0000000Dz5s-2BAZ;
	Thu, 22 Oct 2026 11:06:55 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5C9D92010EB;
	Thu, 22 Oct 2026 13:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kI8gmY1B2lqy3EqGixZzS2Fx5POa83a6PEWgQ3NNoQ=;
	b=FFCmnN52JVqOI9tKQwg37iQSmP7QSJB9tafgox/BJ7yGDupV/FFx7YHu/XOB7yl9OSIvgD
	dOQs1YOtMejgxB1JMK6w4FdMiCu9tCnHDtCwuHMqMOAZa7HWEpIDuZrSsc3bSI3u7IuVq/
	KKp+r69+emj0aLh0/Ltx782Dlv8U1IgFc2G0eOOiytLzi6JYwQNtyMZlANQMfa/gQxWXXg
	G84gbeHj/xjWyUo+GkJdk423YllqBVwk+AYnSALDuDpt7AqxDXPD+KAljj/i9NVJZGREtV
	tVZRX6HCFp1tsEGgXRCu0Yxae7utgWR/WVmcOCyFWq8TISpOw2dYBqhb69NUGg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792667206; a=rsa-sha256;
	cv=none;
	b=G6+37O0I7HBLmev6+Jbp9qNPoGF0Nc7CGQcP7CUAg+bBAkoLe2kbVQM9D5+YmtBoJkZmxf
	JGVbXQXgsUpb5ZyKHrhYULC9w1S8Nv0X5kjfz6TOLlJ+9ZHdK+GtlGVX8hvfKOTr4mOKMV
	BHIu3eUoQJlxUiPdk0ixrSUY3CIeMOhexfLBOTOgEQSk1zDFje1M14orA0hJYVX4tmvdnc
	znSwP0YQ5m59KJZYo2iB1KlV7nWFsmmS5wVKvDWhW6a00uKtidZ1ENaOTMLG19BIBryIYy
	pkD8/jW2SGeIp5erQcpUw2SMMx/q7czi5QpirFhbK9F+i9PHNpNIvddbMuYakA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kI8gmY1B2lqy3EqGixZzS2Fx5POa83a6PEWgQ3NNoQ=;
	b=KPUUiuOODCYE48OiSIDovX1KI0R0rZ2Ln9iUHraMzhS3j/xbqGKfG3vhD4n9oGF8udfXU4
	yfucEc8KTcjQaDdv2wNU1pxGozBLKhdGtmMIlfH7+Z7qc9HXb8sZhxXZ/omMF9U15C09rG
	yLto4zVTBYO/YFS4c4IopLRBB8I0eFM1n1aiNhpm0+jRMCXOAMH4pWb7jOlsRiSzGiiSvA
	zDZYtN+4gG1FMoBCGspi2/3q+nSkj87esVm9+z0KgAw5BNqdQ166pAHv/So5rD+HnDjY0+
	8q16Ku2RGb8VOBSadzzIx50mMMFc8J+2VWUuhlKSS2Yysdww8Dbl5Z3qEv6/jw==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 22 Oct 2026 13:06:39 +0200
Subject: [PATCH v7 1/4] media: dt-bindings: Add Rockchip JPEG decoder
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-rockchip-jpegdec-v7-1-3fd7dd55f408@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
In-Reply-To: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792667206; l=4940;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=w0ZyeOuPJN4G/4KlIW7sG2pYv8p9hc+BbbJymlcGgu4=;
 b=/o1VgtZif13SPvn/vNeAjyC13pOPqNddMd6Tr3hCUPAqZNyLRd/hmuZovsg3pPnrqPPrwFuzB
 ofrEG+sVHt5B8HkJyBBUaFCPW4p3PL67i+Q8qrZLwxedVPfRsmA1cAU
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_040650_991188_CC12AED6 
X-CRM114-Status: GOOD (  18.61  )
X-Spam-Score: -2.1 (--)
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

Add a devicetree binding schema for the JPEG hardware decoder Rockchip
integrates into a number of its SoCs.  Documents the single register
window (task registers plus the LLP link-table block at offset 0x300),
the decode interrupt, the AXI and AHB clocks and resets, the IOMMU and
the power domain.

The core is not tied to one SoC.  Downstream it is known as the VDPU720
and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
RV1126B, with only the clocks, the resets and the power domain differing,
none of which this schema constrains.  A compatible per SoC is all it
takes to cover them; the RK3568 and the RK3588 are the two that have been
tested and are enabled here.

The resets and the power domain are required.  The block cannot be
reached with its domain off, and the driver takes it out of reset when
it probes and puts it back into reset when it is removed.

The IOMMU stays optional.  The driver never refers to it, it is a platform
integration detail, and rockchip-vpu.yaml does not require it for the
other codec blocks on these SoCs either.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../bindings/media/rockchip,rk3568-jpegd.yaml      | 92 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
new file mode 100644
index 0000000000000..27d85f17922ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-jpegd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip JPEG Decoder
+
+maintainers:
+  - Lucas Sinn <lucas.sinn@wolfvision.net>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description:
+  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as the
+  VDPU720.  The same core is integrated into a number of Rockchip SoCs, which
+  differ only in the clocks, resets and power domain they are wired to.  A
+  dedicated Link List Processor (LLP) register block, located at offset 0x300
+  within the same register window, allows the hardware to decode a chain of
+  frames autonomously ("link mode").
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-jpegd
+      - rockchip,rk3588-jpegd
+
+  reg:
+    maxItems: 1
+    description:
+      The decoder register window.  It covers both the task (function)
+      registers at offset 0x000 and the LLP (link table) registers at
+      offset 0x300.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI clock
+      - description: AHB clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    video-codec@fdb90000 {
+        compatible = "rockchip,rk3588-jpegd";
+        reg = <0xfdb90000 0x400>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+        clock-names = "axi", "ahb";
+        resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+        reset-names = "axi", "ahb";
+        iommus = <&jpegd_mmu>;
+        power-domains = <&power RK3588_PD_VDPU>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3d..f47f614dc6857 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23714,6 +23714,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP JPEG DECODER DRIVER
+M:	Lucas Sinn <lucas.sinn@wolfvision.net>
+M:	Sascha Hauer <s.hauer@pengutronix.de>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.47.3


