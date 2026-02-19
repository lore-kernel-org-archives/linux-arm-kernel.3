Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E11C531E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQ1MmI1k/9HenpReSZ3vHACiJQQcYWd1RGFuc30M+ps=; b=sUEcVsslcgDZSDnl0zoMH/zpmg
	7silItK0b74tvatKkjmoG51r9s9/EBk1kOsmzIBBQL7NiGs+PKuK7jsTdZQnZ1HBMn4ECSwby7e+H
	94MxHzDK+Ro1Cuia4omrVjlP7ChJDJ6DfV5OmAn6zjR9BATt+TQyv8sRYVZwVNBExct56PHmhNdth
	QZhWWnQTOjb8Bdu3GJuovNIfExjdotENKk1xgmJBC+ZQxTPKvBYlFxIjywICRqd76dLzZjoLxnVLQ
	WTB2H7k/xmIteQXwUHok9RnURWCkjniZgjxSO0rXF7HjGtZfvgYVm/UtHTZXVI0dOwHNnozILoD1P
	g6SaoG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1Q-0000000C7Mf-3Mzw;
	Thu, 19 Feb 2026 21:57:21 +0000
Received: from mail-oi1-x262.google.com ([2607:f8b0:4864:20::262])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1M-0000000C7Kc-0I2F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 21:57:17 +0000
Received: by mail-oi1-x262.google.com with SMTP id 5614622812f47-45effa36240so859191b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538235; x=1772143035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ1MmI1k/9HenpReSZ3vHACiJQQcYWd1RGFuc30M+ps=;
        b=eZJ9D7TH8zjTTSw0raglLH4o7zgGsklnldChYUThm+oe3xlawBlNLAAIB4j66DT0Ys
         PK6DUJJVAKO6PYnfvQmKirAsGAmEHJ83cUow+3pysRkginpbsssz6v7ItsZExaqUVcJH
         kV7bs1/9zaWyQp4rIAj1gxfOx1fuwN6Ly2A6wMkO89U5VFSwVV0NqM8T63msG0JGPPps
         wM1Fq/TR1/ZdQrNCfqqCqfe3jmlNy9ActLdgxWyeT3l52souy2pTb3m90yN0dfqkEmDp
         8T3IS4eIjn0inRSTILGYPzRiAgweuTUUeLSfsBkEhmgGa5wQudBi90zzG5vo4TknuDWj
         /Teg==
X-Forwarded-Encrypted: i=1; AJvYcCVE++vxilcmRnYK6FyEmFUk04/9M2fQpSd3cmHg5e/CJIFw6lgcXwyjRfNglQrcMPnwkhLzkKVHGhoC12cgadZn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+vyy3Gcj8vw6ZsHUvBkmXVUu6v7pBnfbZwWK2RzoXCK9hXjGx
	jPjNt2wV7i7bhW0Mavz+mZ4tdwbMcZuyZ+omaeJUnWA2bZt34ZtW/BGb0VSD5NczdbeqlijSyyG
	Zg9g2Bdd6JDX/ukH3CDBgZsC90bULiAwiYQWQ9s2kU3QHtvE/3rgvfcNQ9nXs9ZRe851GCGSp9T
	VquRBdQUz/6WR+eYoJ9ZtQB4IF6rNHc/WyzlRdWKzrRlfUlkCk6HGaYMiQe190rAuOnyqj2s3PP
	lauM2oxhrRzbSEXh6kdz8ZsRw4=
X-Gm-Gg: AZuq6aLYZBjXnyqYQMxYneHBLt2o8d54xk1h47V353H607M5Fw0C3l0iez9HDUGTvyO
	BXR9mZ7mOqGCBchlxsD0E6/0FYfed3ODpDcuFF4doD6naefeFXWjfNocT/7dXqmi7UzUM6A3KxP
	56ds9AH7JtucyPqgwE61dwOZy4++wGQGnp4wHCh8jgFhvt0zY5RU0XhF0RoUGQd+/dS7dU/LL7M
	mcdwFkP4aXKYhi+G7DpTnwxrGu1EQ1TsP94XuIaujYkc4ApdM3tSsEp/Vrh7uSU4yI1l4AQ7iMB
	tf3NrVe8UvuwuhNuUbb/u1d7nkgWQKCZSp96r3uebbS/A/UgSUSOK61/JWf4hru6zvBY7sPIYx4
	PlWsKXyIrEHEJ8i4lG7ohCUho3MyCaFbAv76ejZcs0XLCN91FOcMEIl9ycUS7kHvnGvAhIbIokm
	2mY/+4UB+uA7Gw2GxfG640+tGxfR/QuXa8dlshhyhl/f8QVza9YwI=
X-Received: by 2002:a05:6870:e9a5:b0:404:4238:b328 with SMTP id 586e51a60fabf-415291a57a7mr3931915fac.56.1771538234754;
        Thu, 19 Feb 2026 13:57:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-40efade020esm3501077fac.3.2026.02.19.13.57.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b7f04a11so83030765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538233; x=1772143033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ1MmI1k/9HenpReSZ3vHACiJQQcYWd1RGFuc30M+ps=;
        b=ELaHeTSqQdxiAM/w6q5+rnJ5k7gj9AfU9l1E4JWWKBZObDynNEVQm/x0YPSdyS/pJL
         FRe8LQr5Y9I3vQdenEa9shc6R9ngiLnVb02xGWcmauSye9XOEZi7dBrP2KOqWHPY3LXt
         VgnzC/CuAH5jaHVCBQCdCvY/e5hojWQ/Elf5k=
X-Forwarded-Encrypted: i=1; AJvYcCUDLTdzqeYD2vPChNdkROPvrkqVS5qfear2YyQa58fWYeJRXzuNIszlqDkCnnCmfn9nzKb6oZ9xjti7cvJf8qR9@lists.infradead.org
X-Received: by 2002:a17:903:b4e:b0:2aa:e285:f231 with SMTP id d9443c01a7336-2ad50ff2374mr61212735ad.60.1771538233286;
        Thu, 19 Feb 2026 13:57:13 -0800 (PST)
X-Received: by 2002:a17:903:b4e:b0:2aa:e285:f231 with SMTP id d9443c01a7336-2ad50ff2374mr61212615ad.60.1771538232851;
        Thu, 19 Feb 2026 13:57:12 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:12 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v4 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Thu, 19 Feb 2026 16:57:00 -0500
Message-Id: <20260219215702.63321-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219215702.63321-1-kamal.dasu@broadcom.com>
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_135716_114832_B7A978CB 
X-CRM114-Status: GOOD (  13.99  )
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

The Broadcom settop SoCs have hardware semaphores as part of the
"sundry" IP block which has other controls that do not belong anywhere
else e.g. pin/mux controls, SoC identification, drive strength, reset
controls, and other misc bits are part of this block.

Adding brcmstb hwspinlock bindings which allows hwlock driver
to iomap 16 hardware semaphore registers that are part of all
settop SoCs. The bindings use the common
"brcm,brcmstb-sun-top-ctrl-semaphore" compatible string reflecting the
actual hardware register block name.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..0a9a1bf19fe2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Settop Sundry Block Hardware Semaphore
+
+description:
+  Broadcom settop SoCs contain 16 hardware semaphore registers
+  (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-arbitrated
+  mutual exclusion between drivers running on the SoC.
+
+  The semaphore registers belong to the sundry hardware block. The
+  node describes the semaphore register range carved out of the larger
+  sundry block address space.
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,brcmstb-sun-top-ctrl-semaphore
+
+  "#hwlock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwlock@8404038 {
+        compatible = "brcm,brcmstb-sun-top-ctrl-semaphore";
+        reg = <0x8404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1


