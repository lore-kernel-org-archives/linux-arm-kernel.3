Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327B6F4BB95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsC7AKbjiTHPqzp/xUgXJQ7GQr44d/IFVx1SjO2ugwM=; b=kdS9Kl1v8ddfM9l5NNqTsQqvjI
	qouiD+nZ2IkKS0RJ0T32LbuxImnMncVUslKjAjoFKaTAdHoIJGChFV5+QKiyuHZ7y3KqfR1UdnbWN
	PtzJDz+q1zJYMMb40qDfl69rkoxBzZwAx3EabFnESmzK9plT7pfpccPuNqSGBHkCuJPQfuIqvfTer
	/WQaQbR4OxdLKuE3MzzO7sKr+iaUbZ3SCwdV3om4/8mAJYRt4c4wLLx2zR6x5oee1laRwxNIDQKw3
	15QdSn6hYcEe9avKtYrSJOpKJrSrdIUfqOMJajT4FR8QzFaSXAuqQFqQvvSz5z8Myyv7HJn2YQC8h
	Y7GmhWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0W0-00000002pnq-19JN;
	Tue, 24 Feb 2026 22:04:24 +0000
Received: from mail-ua1-x962.google.com ([2607:f8b0:4864:20::962])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0Vw-00000002pmq-3oNc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:04:22 +0000
Received: by mail-ua1-x962.google.com with SMTP id a1e0cc1a2514c-94dd0f3c4b7so883521241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970659; x=1772575459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsC7AKbjiTHPqzp/xUgXJQ7GQr44d/IFVx1SjO2ugwM=;
        b=kzCejFetYPeaJFv7yPLc55ij1EtmyLLvw5pazUf4jDT59RSV9oSUs+Xt79u023cRBg
         0xftZ3Gsv9P/DTX0VqubqaeZTEUsMZ4KxdB6m/dB+oXpXBvlxXNaC74uH2HJU4v1zZgF
         GutLlIz+ZM/Njn3RGTUQ29GNkgpv6UfIRj/Vq+pPUuSWcJU56yIEbSWpW+zAvi2xIATy
         AxqWY9hW/26cL2yvifV9DJSgIHGufKxl2VlTCgSJW41OyOlT8FDvGjiuBKQwFmHDqNVB
         F17IAKcPUSkbD0J9uN+q2EuQQFNOz2VSHh1hqoZ7m+17rpSXmnDXjVzLpKZERZd/Tb/1
         dAPg==
X-Forwarded-Encrypted: i=1; AJvYcCX43CMsYGkpO+Xxlk3lJ/U7G5+oa9OInf1lDfBaGPU6pMpzUbeOysEVXe3WfWzgSCGil64G8PtxBj7WMGwoPvw4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv8r1IFqUiG3kZdCBH435e6BxZtUlyTuHfvqIif+DmU6YiDemE
	KbXGKxGRFdeSxmVNX/3njFFnx2xI24LY7DCL/9rOcD4BbHYYSN3fhfDl3FUjJQPL9OYNM5jmrns
	fCz3ohiBSrP8ggdASCp3OsYKp+rxL6LbV21cMQ3kPVM4KldbVkQBeQ5WlwHskqO3DUf+T/HATXC
	vqL/lP5LvCG7NQb9tSplZI1CnlIIYbNCc0FPb3tblj0L/5Nn0n2/EnnBATeOs3Jr6YL3VUaFO05
	ALJaRXCPLTGbvSd5W/Rf3pOfIQ=
X-Gm-Gg: ATEYQzxOx8bGnaLv9MgzRfIgqmefKTMM9O4f42Rt4bD3mcqjVXBB6px7wmLCaPmnYRm
	+wqQLHIHnuxIp8z0e1gfAhaZ60BzC4AeBw2LiLyq4I6olLfsOcusjKqot/Rg8Cpi68HyGSQs00K
	MYDOlleK2c/Qiv0Nj8lYij0L63jWSn6FbHBIsx6A/Fm7+LWBkW7a6EhJh54lw8tcadIYasgYgKS
	Tx3qVb7x0GatoACm8nhEiv2zXvAgG1Hm3m8hhH5WxdPtqvEmSHvw8Why7OuGB3a6v9qXgKQu9UZ
	0rDDpaXeh1lOlC2rOckiMO8+FfJTA0J22TAlOoSwmu0d+93lOiRvjpz8Wk5s2sZZsaHSKglkDJ3
	2yPjUcx+7vgkjdlMs39m7TSyv9AFPLuxXCs2HZ+CPKrDx2u2GbzvtC1aSwCsW4OYHDHO6EF2kGF
	GMnFqLOQWZ0d32s3rp0p3PQ8zUbzqpg85tMyID5GppKiJlWWdJo+B5Oaxo
X-Received: by 2002:a05:6102:3a12:b0:5f5:402b:7ee1 with SMTP id ada2fe7eead31-5feb304b6c6mr6763176137.23.1771970659428;
        Tue, 24 Feb 2026 14:04:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-94dd9cd0a9esm226952241.1.2026.02.24.14.04.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so1881276eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970658; x=1772575458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsC7AKbjiTHPqzp/xUgXJQ7GQr44d/IFVx1SjO2ugwM=;
        b=hqSZGFeCt6bK63aRdKKlxpfuFwLJAEhcGRfVJqgb29QeDPPXRsP9nzbkhqhm9tDwyS
         FfZLLv9UUvED0IQjz9YpWKKmzpvPamiIpjbj1NprYxik7gPlvYfTlClWKBxSxpf/iYcj
         VE/DgBkd3WLqaDW1Dr4TXMjd93q0Kt6lKS+2Y=
X-Forwarded-Encrypted: i=1; AJvYcCUeQ3niFMA/7Pg7VuWkpRdQYpVQ6oOwWX0ZDKTMA3xMjeD7jtOMNqx2QYGVgkaA2TE0bN7gyf7ag1HxlrULtW34@lists.infradead.org
X-Received: by 2002:a05:7300:134a:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2bd7bd3b218mr6137886eec.19.1771970658194;
        Tue, 24 Feb 2026 14:04:18 -0800 (PST)
X-Received: by 2002:a05:7300:134a:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2bd7bd3b218mr6137863eec.19.1771970657544;
        Tue, 24 Feb 2026 14:04:17 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:17 -0800 (PST)
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
Subject: [PATCH v6 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Tue, 24 Feb 2026 17:04:05 -0500
Message-Id: <20260224220407.2351692-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_140420_954993_9CD3996F 
X-CRM114-Status: GOOD (  14.38  )
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

Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
to iomap only the 16 hardware semaphore registers that are part of all
settop SoCs. The semaphore registers are based on the BCM7038 SoC
where they were first introduced in settop chips.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
new file mode 100644
index 000000000000..0d8c5b8219e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml#
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
+    const: brcm,bcm7038-sun-top-ctrl-semaphore
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
+    hwlock@404038 {
+        compatible = "brcm,bcm7038-sun-top-ctrl-semaphore";
+        reg = <0x404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1


