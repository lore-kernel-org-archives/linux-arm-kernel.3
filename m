Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6336CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu0enXB+ArZGeFWjrEyem2PEeeOOWIQywdI0rseHg5M=; b=iXZsT0DJ+ZiNNT63kVdC+JqIBW
	UydnOS2TK5nzyUS6vQ4AMouGDwDtWKTpmrPgjc7CsEMI568xSvTvYR39tbLjzUrbNuDU4pZMN1A5s
	09gghPxqMM1QqBouPBkuHxT/42+ifzPbqXu/gnAb2K0rAMXPKx+17WMze9MhTv7QEQPgIkQw/j0Z4
	NpxGElNlGwNp62YdJg+r0U6fmPVU691iH+Vtqdz78JzjYFgNoj+zhOBJJ8pVIp9yTTLmDAOmoCMRU
	gyCr0ZEDQ1u8eqAjmCeHAaal1z88HyvFmybA56eF71+GzXNIHdzSmAKqubq8U+r9nTaVP5RQuX9Pd
	93u6YIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kb-000000079RA-3bZm;
	Sat, 30 Aug 2025 00:47:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1s8-00000006Nbp-1eK6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 16:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gu0enXB+ArZGeFWjrEyem2PEeeOOWIQywdI0rseHg5M=; b=hmYZe9XWOaaMq+8KwfFVnt8yUj
	14ku80uFwCp4JmRCaTBgpjg/edBt6XyaboIwwt5w381kRmPJbZXHgozA1KHfFswDvWOLADTz+TW30
	8HujFS1OPmDbXFj/YAj5Zmis1hVrueiMF6r2ieuBu03ECGYy3jMeUV6LjPKuc0afSkc51pXCG4c1v
	ha+IwxEf6b8hv75EOt3LrPiHYXRhmodUzIdJcwbucyHqubwtnifVc/INiBsL2j6QtetIRaVB3e1Xq
	5rZh5vDERauDPWAOqdQP/NK58Z/6guMUfqTk4R5J0cP+1/Si/c3POPVdThNlgHAPgDhgrI3e4RIIp
	kZrSEjEQ==;
Received: from mx.olsak.net ([37.205.8.231])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1s0-00000003Dt9-3WDq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:22:39 +0000
DKIM-Signature: a=rsa-sha256; bh=gu0enXB+ArZGeFWjrEyem2PEeeOOWIQywdI0rseHg5M=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756484469; v=1; x=1756916469;
 b=i8P9jvJCdKmX9Nq/+UtnHYj65FaoK9Tie2CdS1FehfS5l+OEIBU2t0+5OwKMGmGn4OFrAtzy
 nrS0jB70jyHVtTaZLT9I5INKreih9VIw3n/3T3SHG7JRK+n0JbGiepO+v57HJpTDVLoUz1awgRJ
 tJOzpmvc95O0VQsYgrXrL3KFBfaYPij7CMssRrx58sj2I5b/mkhl3G7iwmVXeUFv3oIZp3P0H1m
 V8KEm8JS1GW8Iarea7rtUHeOqmtzT0cp9DZWyLhxDRqTJEyJKc81xEERhwAKPiiTNKt3T8nAzvl
 9Ju2jiYQ+H/WzcqrNLGv9Zx9kaqEfQCOMlDXtuNCoUIwQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id c64a8848; Fri, 29 Aug 2025 18:21:09 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Fri, 29 Aug 2025 18:21:04 +0200
Subject: [PATCH v3 1/4] dt-bindings: clock: marvell,pxa1908: Add syscon
 compatible to apmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250829-pxa1908-genpd-v3-1-2aacaaaca271@dujemihanovic.xyz>
References: <20250829-pxa1908-genpd-v3-0-2aacaaaca271@dujemihanovic.xyz>
In-Reply-To: <20250829-pxa1908-genpd-v3-0-2aacaaaca271@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3482;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=Jv5PaARGZu6okRJJgZpKnXYroqtQSHqcc4g3VsEQcj4=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBkbLxdzN+zaoxTS/MN++YQZpnX6x25fD5KY3SORvVZou
 cXWRqW2jlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZhIkTDDP7t8g6jsvKbVrX71
 e/cwffj59av6Wj5jK93WE0GKG210mBkZPi6c8f3pu63qUUHnq94ua7GfUK9qZWJXclB+y72NzNG
 LmQA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_172236_270913_B3F2CD84 
X-CRM114-Status: GOOD (  13.45  )
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

Add required syscon compatible and #power-domain-cells to the APMU
controller. This is required for the SoC's power domain controller as
the registers are shared.

Device tree bindings for said power domains are also added.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v3:
- Squash power binding patch
- Update trailers

v2:
- Drop simple-mfd
- Add #power-domain-cells
---
 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 30 +++++++++++++++++-----
 MAINTAINERS                                        |  1 +
 include/dt-bindings/power/marvell,pxa1908-power.h  | 17 ++++++++++++
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
index 4e78933232b6b925811425f853bedf6e9f01a27d..6f3a8578fe2a6810911fec5879c07c9ddb34565a 100644
--- a/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
+++ b/Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
@@ -19,11 +19,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - marvell,pxa1908-apbc
-      - marvell,pxa1908-apbcp
-      - marvell,pxa1908-mpmu
-      - marvell,pxa1908-apmu
+    oneOf:
+      - enum:
+          - marvell,pxa1908-apbc
+          - marvell,pxa1908-apbcp
+          - marvell,pxa1908-mpmu
+      - items:
+          - const: marvell,pxa1908-apmu
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -31,6 +34,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#power-domain-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -38,11 +44,23 @@ required:
 
 additionalProperties: false
 
+if:
+  not:
+    properties:
+      compatible:
+        contains:
+          const: marvell,pxa1908-apmu
+
+then:
+  properties:
+    '#power-domain-cells': false
+
 examples:
   # APMU block:
   - |
     clock-controller@d4282800 {
-      compatible = "marvell,pxa1908-apmu";
+      compatible = "marvell,pxa1908-apmu", "syscon";
       reg = <0xd4282800 0x400>;
       #clock-cells = <1>;
+      #power-domain-cells = <1>;
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index fed6cd812d796a08cebc0c1fd540c8901d1bf448..88f7bd50686eb1f6bcd4f34c6827f27ad44ea4e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2872,6 +2872,7 @@ S:	Maintained
 F:	arch/arm64/boot/dts/marvell/mmp/
 F:	drivers/clk/mmp/clk-pxa1908*.c
 F:	include/dt-bindings/clock/marvell,pxa1908.h
+F:	include/dt-bindings/power/marvell,pxa1908-power.h
 
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
diff --git a/include/dt-bindings/power/marvell,pxa1908-power.h b/include/dt-bindings/power/marvell,pxa1908-power.h
new file mode 100644
index 0000000000000000000000000000000000000000..19b088351af138823505a774ff27203429fe2d97
--- /dev/null
+++ b/include/dt-bindings/power/marvell,pxa1908-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Marvell PXA1908 power domains
+ *
+ * Copyright 2025, Duje Mihanović <duje@dujemihanovic.xyz>
+ */
+
+#ifndef __DTS_MARVELL_PXA1908_POWER_H
+#define __DTS_MARVELL_PXA1908_POWER_H
+
+#define PXA1908_POWER_DOMAIN_VPU	0
+#define PXA1908_POWER_DOMAIN_GPU	1
+#define PXA1908_POWER_DOMAIN_GPU2D	2
+#define PXA1908_POWER_DOMAIN_DSI	3
+#define PXA1908_POWER_DOMAIN_ISP	4
+
+#endif

-- 
2.51.0


