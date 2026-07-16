Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147CBC44518
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZtzv9o10ZMx2F6vFuMJvun+X6TGnWbmJeFNWGVcEIU=; b=YILCW52LqZpbJPkU7hHAbHclnG
	4rdIkS/gXpX0WFZUT3GAOySuWiX9tHSed4LhfCODwkMValYfJHYy8jaz/Pi2mA3MIMKXglet8xVxZ
	gp1ivcAy/4uV08tfQaL2hVfbktclL54MGC2fPRC9qC7m63GhFocnwipeTXWd2zoP2tDSOaFGOcL/6
	lmZbka6yY7CHbn7RsRQSYUcVwu97V9b7ipLHEwxAM8kSN/oHfOrKL3yQJr9NJS6Oj2aDQ4riZAHUU
	7CUtuwcfIWcXZDv5tyfYHjo9u9QekciHK3/uthLqKu8/BcVRR/htxlA1Rsi0wQmyPMYfHxGt6HXDJ
	jALaZaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNlh-000000000My-0mh2;
	Thu, 16 Jul 2026 15:12:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNla-000000000J1-3TAk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:12:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91C14168F;
	Thu, 16 Jul 2026 08:12:45 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6D3E3F66F;
	Thu, 16 Jul 2026 08:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784214769; bh=C+2y21SzSSI5bBBMqUfgCI72tsdvLF0AoiYIAGFmQUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lh3ErWbLEzySaVWygtLPcmV0OBEGWZ0bhFlNFIfPV8qqZVYvlurv1sNu0sCjhNl6E
	 iEgSkfdBzch5XNzreg5MVcMn16WOzoAkd9veVTcNBZfoM2hqqRdi6RGgSjMpSggyvq
	 DsiUkofZLzE8tOExzVIwW1XRg+MUIcAMTlX6AnC4=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: perf: Add Arm Bus Monitor Unit
Date: Thu, 16 Jul 2026 16:12:40 +0100
Message-ID: <1cc6acae06fb4910e27cc89e2270a52e80e310ef.1784214112.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784214112.git.robin.murphy@arm.com>
References: <cover.1784214112.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_081250_927703_7875533F 
X-CRM114-Status: GOOD (  11.76  )
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

Arm's Bus Monitor Unit is a low-level performance analysis tool for
matching and counting transactions at interconnect interfaces. Typical
platforms will have multiple BMUs each measuring multiple interfaces in
various parts of the system, hence for the sake of usability we make it
mandatory for the platform to label each instance such that the end user
can correlate with platform documentation to know what's what.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---
v2: Invent example
---
 .../bindings/perf/arm,bus-monitor-unit.yaml   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml

diff --git a/Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml b/Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml
new file mode 100644
index 000000000000..3da59e5447e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/arm,bus-monitor-unit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Bus Monitor Unit
+
+maintainers:
+  - Robin Murphy <robin.murphy@arm.com>
+
+properties:
+  compatible:
+    const: arm,bus-monitor-unit
+
+  reg:
+    items:
+      - description: Full BMU register space
+
+  interrupts:
+    items:
+      - description: PMU overflow interrupt
+
+  label:
+    description: BMU instance identifier (same as ACPI _UID), per the
+      platform optimisation guide
+
+required:
+  - compatible
+  - reg
+  - label
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@12340000 {
+        compatible = "arm,bus-monitor-unit";
+        reg = <0x12340000 0x40000>;
+        label = "ddr_ch_1_2";
+    };
-- 
2.54.0.dirty


