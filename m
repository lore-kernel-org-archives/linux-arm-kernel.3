Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7B7C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ybjRS2GSw3Pmydj996/wagr78u/EZ0PNM1XPfd8Tp6A=; b=fECHzQ2M/OPHneExlnkpc/6nrh
	ZSBbUgziXEHYxB13xljn0MQOUUvOSGRq2PLhpDg6VQFdROzabwHTvMBjGIHwjgasDIkrxtD3t5oCT
	xKXqOMfXel4Q1LvnxRLsztnfH+MaLmkA4ZRwRsSE6JC2FgarXgId2oL2EK4PqY3p+i6qwj+f4J0Ed
	+Y3aU3tI4K/1rrQ81mFbjXZXt71zaBGRPLoUtOQ/0u+NAqYjofGLwLVVuwexI90a2OJiwU2uhQiqN
	F+wJdckX0TdG46vpNIyp5e950ch2JJSZlEtEDtf1doodNDdU6Gy4CTTyJtI3+4tuO0Grt3eqf/Y+M
	qxunWOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nOR-00000003f1C-0GSd;
	Mon, 21 Sep 2026 23:25:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nOP-00000003f0f-0oy8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 23:25:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D88860235;
	Mon, 21 Sep 2026 23:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A431F000FF;
	Mon, 21 Sep 2026 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033148;
	bh=ybjRS2GSw3Pmydj996/wagr78u/EZ0PNM1XPfd8Tp6A=;
	h=From:To:Cc:Subject:Date;
	b=iDG8KvA8iBP4UjKFUa43QBfLhdAKoIpEd8eZNFhca3orc62mYoOuvPVcqYV+5rQoj
	 fPnDzZILWhq9z5/DSOYCQY1RKAyAQ765aa2szZxOb+kjaWBVLjIEKn7JY+4l6vm/M6
	 1Ge3uuf15/s8RvOghJweBg5ZMOtZ0US4jD9wex15C3yHGv+afMEpcZWHtFq5n3unpG
	 fNj8rtyj8FIK+NJHgRqUqmi1Jq66lHunJgguh5Gofg1ONHsQGFToa0vjsJdOQaW2mg
	 9XFPrU5KmNwwvnT5/I0ZJSrRMV2swu8ETOxCfsrHh0pkx19xv00svJnVgj5m06MYvW
	 QWx9EH8syQiyQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wei Xu <xuwei5@hisilicon.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Date: Mon, 21 Sep 2026 18:25:39 -0500
Message-ID: <20260921232540.3128596-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. The
node only contains the compatible string and one register window on the
local bus.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml

diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
new file mode 100644
index 000000000000..f9d48b871a4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/hisilicon/hisilicon,hip05-cpld.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon HIP05 CPLD registers
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+properties:
+  compatible:
+    const: hisilicon,hip05-cpld
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
+    local-bus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        cpld@100000000 {
+            compatible = "hisilicon,hip05-cpld";
+            reg = <1 0x0 0x100>;
+        };
+    };
-- 
2.53.0


