Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1B2D77897
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63aBv2c3pXs2XobHAH5K9dgBiS+SuEEne4QukKV03Ew=; b=I6nzXLLQc/92a15kJR/M4OLWFP
	CqSpRcOJ86+slvEXFNokn78qiuyjDVEgdNTmPykOYs3f2jIB9uRRqWfTL8WPrG3asqvkayrmB+4fW
	dhl5CGVupBnO2QovBxMwNOHn/sJERpD2JEAP+MV+ce2m33hRwsPfsxZF1TRicIuUUOcCL6s29MZqo
	TDa5thnIo/UHIvdMr85DhLexgfnLsxZWfxJVdnC5c5LHfrr51PNeLaBU3YJmFAtj0jXKqiSrMVMSD
	TwA7uG8pSRKwHRxeWNCGccAO5/pMfrD1gmr+ZmptT507KPJ98YuDyta1xjD2HXIvhHI1yVzjIrpr+
	nrD9s+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL7v-00000009IRi-36ri;
	Fri, 23 Jan 2026 17:39:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL7r-00000009IQT-2jr9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:39:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A17C1515;
	Fri, 23 Jan 2026 09:39:06 -0800 (PST)
Received: from e137876.arm.com (e137876.arm.com [10.33.10.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B00E3F632;
	Fri, 23 Jan 2026 09:39:11 -0800 (PST)
From: Debbie Horsfall <debbie.horsfall@arm.com>
Date: Fri, 23 Jan 2026 17:37:46 +0000
Subject: [PATCH 1/2] dt-bindings: arm: Add Zena CSS compatibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-zena-css-v1-1-34adb95cdf89@arm.com>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
In-Reply-To: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Debbie Horsfall <debbie.horsfall@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769189949; l=2085;
 i=debbie.horsfall@arm.com; s=20260123; h=from:subject:message-id;
 bh=l0iWjHbipPa1ijZkFAgcLPQniaiAMUAfDzX0le3Yfso=;
 b=dw/o4m/lNZIwCP4dyBjk5k6HBlbBcZQelmXDl0DeJskrhe7iQMiJXJO9uUzpmKTUtn4Yj0MZS
 4JdhJk9mRsjCjUvsRAWxbcPP16kVAqOSQD2+cSX88d2CNFEObwAZRUC
X-Developer-Key: i=debbie.horsfall@arm.com; a=ed25519;
 pk=PHSQwhhwfluuPcWn1fk950OfqGxCy2cjbyQb7dfAcFY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_093915_739023_F8B500F8 
X-CRM114-Status: GOOD (  10.68  )
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

Add compatibility to Arm Zena CSS Fixed Virtual Platform [1].

[1] https://www.arm.com/products/automotive/compute-subsystems/zena

Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
---
 .../devicetree/bindings/arm/arm,zena-css.yaml      | 31 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,zena-css.yaml b/Documentation/devicetree/bindings/arm/arm,zena-css.yaml
new file mode 100644
index 000000000000..42699b4db41e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,zena-css.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,zena-css.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Zena Compute Subsystem Platforms
+
+maintainers:
+  - Debbie Horsfall <debbie.horsfall@arm.com>
+
+description:
+  Arm Zena Compute Subsystem (CSS) is a compute platform targeting
+  the automotive sector. Arm Zena CSS is a high-performance Arm
+  Cortex-A720AE Application Processor system augmented with an Arm
+  Cortex-R82AE based Safety Island and real-time domain.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Arm Zena CSS Platforms
+        items:
+          - enum:
+              - arm,zena-css-fvp
+          - const: arm,zena-css
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6863d5fa07a1..90d88137adf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3723,6 +3723,11 @@ F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
 
+ARM/ZENA CSS PLATFORM
+M:	Debbie Horsfall <debbie.horsfall@arm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/arm,zena-css.yaml
+
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.43.0


