Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CD0E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVKphhhLa0skbjmdnywzaqB6ozEP2eMmC32d1fa4bPQ=; b=t2YiKaGGM8Cw8MuTbLVUWtUzlg
	hCulcLoZ/3plpD+DRyhwIwneV6eUTbHLBFWgkJjHbHPi7L4LWro/jPgRdWo7DTKjHwgcMfndnY2RZ
	GS2xS8aUTa/d90FONWiLQCS27cuCPM9q9+s2eSak6HJmCyIvnBjYW5X3JGP13f6wQ/oCdOxTGyyep
	pqNTtJH5W8zkqCx7vDtZba3wcuIywL6jgNFrGvPI+CZsaR2mmsOfvL/2FccyT+LlZKlUSEztAEjlH
	FNakv7PtFxx5Wr0goMUuS4IKyDHrIFeJYFkMxB92IGSVXFvV9vUw4yj7lMrsd7yXXYEBPjJLEaUBz
	3r88sGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs5y-0000000D9yK-09vt;
	Wed, 04 Dec 2024 16:19:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtb-0000000D6p9-1ZRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 995AA5C6F60;
	Wed,  4 Dec 2024 16:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD007C4CEE3;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733328393;
	bh=3JhEAbqjaIpg38TjTLzxVnmiyUVlm2z5VLfTs/oY8h4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dAQHGcD+ocNBc1lNCJzUhY1zBqxA+tNzqaKkl0DRB85yss+bhT9+6DgfN0tvD+mfT
	 OF+OwXLBLem1u7gpjvY0VGEoEr9zk63r2+5v0pJh/lccfBPataK9Pw9b8l7O4Avf50
	 K1qgf7k0juBP9kxKYg0ziN3dGKSDm4S8wmpyKB4mTXMM2sye4b89YU0IYvH5v7dnSf
	 Gjs93gLAX3lj70w15lFedMnCxO6CV69MpBOcltDn8MHKenEGJemCwtPo+TN5FOUegy
	 aDc/eLDFtm+gvRZZsrIqNswk8vDujh0HcvzC9rH/HUmNOwcfwZ28IFHoKeYOjrr/TK
	 JdTfIq5n4Xjdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C909CE77170;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
From: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Date: Wed, 04 Dec 2024 16:05:25 +0000
Subject: [PATCH v5 2/6] dt-bindings: arm: blaize: Add Blaize BLZP1600 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-blaize-blzp1600_init_board_support-v5-2-b642bcc49307@blaize.com>
References: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
In-Reply-To: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733328392; l=2168;
 i=nikolaos.pasaloukos@blaize.com; s=20241111; h=from:subject:message-id;
 bh=nZrtoLEBx9eSJm+LA7iUVDlX7hTZ20Riw/HSYwpf1yo=;
 b=X+HoK8cBDfO3U5Zsc18jHTANKsInOutc6BStS8FgN09ozvbyIvQsF4cWbAHf1H0/ys2VyGzZs
 MEqNXCeh3ECCUh+oeImi+YskXlmmc61MBXXt0Mcx7A0fCfy40+y9ShU
X-Developer-Key: i=nikolaos.pasaloukos@blaize.com; a=ed25519;
 pk=gGEjGCXdSuvCJPIiu0p0UeiPcW5LC710Z6KGN/dzo3g=
X-Endpoint-Received: by B4 Relay for
 nikolaos.pasaloukos@blaize.com/20241111 with auth_id=274
X-Original-From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080635_512106_440032FC 
X-CRM114-Status: GOOD (  12.00  )
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
Reply-To: nikolaos.pasaloukos@blaize.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Add device tree bindings for the Blaize BLZP1600 CB2 development
board (carrier board). This board integrates a Blaize BLZP1600
SoM (System on Module) which is based on the Blaize BLZP1600 SoC.

The Blaize BLZP1600 SoC integrates a dual core ARM Cortex A53
cluster and a Blaize Graph Streaming Processor for AI and ML
workloads, plus a suite of connectivity and other peripherals.

Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Reviewed-by: Matt Redfearn <matt.redfearn@blaize.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/blaize.yaml | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/blaize.yaml b/Documentation/devicetree/bindings/arm/blaize.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..af39e2756407baacee3030f6909cf2aa7dc5776c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/blaize.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/blaize.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Blaize Platforms
+
+maintainers:
+  - James Cowgill <james.cowgill@blaize.com>
+  - Matt Redfearn <matt.redfearn@blaize.com>
+  - Neil Jones <neil.jones@blaize.com>
+  - Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
+
+description: |
+  Blaize Platforms using SoCs designed by Blaize Inc.
+
+  The products based on the BLZP1600 SoC:
+
+  - BLZP1600-SoM: SoM (System on Module)
+  - BLZP1600-CB2: Development board CB2 based on BLZP1600-SoM
+
+  BLZP1600 SoC integrates a dual core ARM Cortex A53 cluster
+  and a Blaize Graph Streaming Processor for AI and ML workloads,
+  plus a suite of connectivity and other peripherals.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Blaize BLZP1600 based boards
+        items:
+          - enum:
+              - blaize,blzp1600-cb2
+          - const: blaize,blzp1600
+
+additionalProperties: true
+
+...

-- 
2.43.0



