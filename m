Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8516EA4FD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a34nkWKk0xxrzLr59oDck6ElSUS/E6YyWVngWLMX0No=; b=c3y5lcp7b7rFUxTJ9dQhlrgkCu
	BcUwigI6SZCGaOuJCXkNrSKBlFQkWtEcIh4+tK44OcuNOv0+uVg/GOIB0AzYMGkWHtI+edoLWRxEo
	KSfJYdpl7xINUAJNAORiYBIUGZhcPyCIn7CSIysh5GqAeJsEo7r2zELwhLqf3GjI/1J14BOWPt7ZL
	8Vru3lxRPtpSX3YhVbl4juvQu4jADPESckxqey8Ckg/DNkE4bA97UxvX4Mu237fhFG9tm54cT+y8+
	HEem6SuTUywmLIq7bJM7fpE7dgKOFYkTfMv0Ilm/82X286LkuHkHk4XZDe9O/w2bOY51xfPgRToIR
	+9kNh+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhXB-00000001Ize-0FOM;
	Tue, 24 Feb 2026 01:48:21 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhX7-00000001IyP-3O9O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:48:19 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-c70b4a69bc7so868039a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897697; x=1772502497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a34nkWKk0xxrzLr59oDck6ElSUS/E6YyWVngWLMX0No=;
        b=LAwdUdWJgPOLbv+qHVB66Avl+mlRvd2Vy45SCas8Pefg3Q6UudPd8L/ctqLd6Wh0tM
         7YrkKE4+GVdaVQJzs1qKDhBvjLxFG0ys7vuvmZy/4ODlfby4ReEML/i8vTF9p1CcWgCD
         jn7b5tXiGqKRQS3tkfPmCeB8RwgjAxDtILmit2FLMgROw9Vvyeqb4UYVvnGx6XeeAiFm
         hF8ZQ6+ChNNE/39CjWJKn+tjf0SJoj5DIDAWVKFk4tx1HpxCUDlGd51h7utw7ATs7L9J
         HcJBDCL9SuBE2UGW2Gk2c7L1SPTg++1o1VDVlPgLqChTE5SRX1BjgXC1U4SXi33nAgcR
         Az1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKQhVKlNSSOFgpdCdxD76Ooq9EbL4EY8TBqPvAnHZd2DT+sF8mgEyIs/OtemBuxt4i6DyIVPkYR8cb/e23zNLN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx0MJRdmQggki7k0toLg6TYzLZdJp7gkXH4XkbRWl7PzZoP0/r
	G+u0uOXsUVbcmcjGoG69sryRMPuzspTMy8GTV2BYH1DiiPJx3N3rLXA2EUuQyXbbiEheq26urN6
	xDlldpfVG2IdaXSPlybqpAzDl7/uIJouJhfqnk6SWT9OzIr7xKO0Iqb05or9BeLp3z6qQl/WQSl
	IKYWxypBnPSMLdTkfeP0rTqzVWPd6UAOhCF8uG09Cum87I+GABKAoaF6sWlQcADk5ayJL7SKwQ8
	dSLQVN+/oDcgAC4nmQAgHeeZyE=
X-Gm-Gg: ATEYQzxclDsOBzJvPnxkO5KEvf7gCVWOztJuVe/aDSNafl2bjKbVUCYvzMNlpG4XUeK
	VBMpA2Q987MPtyxlx0JdSGL7SO4Y79pXYvJEd3KrKTi5XPtM25pGz0yWgYv8i1kG/Z2uYwfz0DH
	aNY/rtzFMVVxmRMzflW/fhMRfIp7ZO899M1mozL9QBb78nB9Q/41G/nIMz+PVfm2LQq+6BEG1Oz
	ov1Jc2rTOxw3sRLc6ep3ImWN0cq1kAeU7cyiV7Q8GbXRgOHIIC6M3Pg0fALFhLcS1q6kzoFNNeq
	NRMNDA6DGv/VCBLhGmgO1h2niIiBB8VbKKAgucBq9eMc2stEpqKiQbo4u+Ugv+0F9bkJTiPtH5X
	/OIxX8EF58dZxup1S+oVWSlR9UmEIlA/8eo+J+o+hBA4qk1PAoeCqLjj4YhjxOTxWNU0GhnYWCx
	oLBgdA9MqclU3lG7SHtGtIiRsOlXQL2zC1QQoapbXb1ekj7Nuq1WsCjHWw
X-Received: by 2002:a17:90b:564f:b0:352:d0cf:9d18 with SMTP id 98e67ed59e1d1-358985015b0mr12033588a91.5.1771897697094;
        Mon, 23 Feb 2026 17:48:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-358dc1166c5sm48582a91.1.2026.02.23.17.48.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:48:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1273dfdaf5dso4406351c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771897695; x=1772502495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a34nkWKk0xxrzLr59oDck6ElSUS/E6YyWVngWLMX0No=;
        b=DKg/Fmsh8cZBf0PCGf6UDEo6wWG7KikRbNThWA4MV/iykWS1YKi8ZqXMoaH2LrDhOQ
         Bqd4lRqnTUyLi3VPdIOa7GP6IgNObNUoHRaXHW4Ns/Mz6sOecOAWaVn88/pkyXDWD5JD
         KrLBlpYvIiDdcyuNQqL8UwSVJGFXFtXpalxyA=
X-Forwarded-Encrypted: i=1; AJvYcCXXuqnyPUd/V7x9gw2BoGlM5q/2lJ5EtFiAm5tg+HV4m4PqZhoKdsiuujFGUfOYH/Ol9a0Xb+kK64mS/XAZNZpI@lists.infradead.org
X-Received: by 2002:a05:7022:2529:b0:11b:3eb7:f9d7 with SMTP id a92af1059eb24-1275fa9e0bemr6403276c88.14.1771897695233;
        Mon, 23 Feb 2026 17:48:15 -0800 (PST)
X-Received: by 2002:a05:7022:2529:b0:11b:3eb7:f9d7 with SMTP id a92af1059eb24-1275fa9e0bemr6403264c88.14.1771897694586;
        Mon, 23 Feb 2026 17:48:14 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af102d9sm8470964c88.1.2026.02.23.17.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:48:14 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Mon, 23 Feb 2026 20:47:56 -0500
Message-Id: <20260224014758.2660318-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
References: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174817_863249_23159024 
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

Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
to iomap only the 16 hardware semaphore registers that are part of all
settop SoCs. The semaphore registers are based on the BCM7038 SoC
where they were first introduced in settop chips.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..416d8d2948af
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


