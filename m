Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2835CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNCBeBBdkJ6krQ6n6YSc9TV1L3hgIbHKEJb0ek4nU4k=; b=p4htuqk7UQWOz637P/GSy0Quao
	ZfV4AcWIAXFXRJvlQXxWhhGK6Tu+C4pQi1DKJUeKOaI/vaRfa1ZmLmxvQEkUhJjPW5XV3TET4n4Mu
	S9JHVtkwSlfqruVkf1eRMYtCEa/wopjonkWP/w8Gli4W13t+s0qjSkpwV++/Gx6GouKu8j+CskGZL
	2N2f3LGTD9SWRwSCMnOmUsKSJqVYcJNJRcuzrZCYFmZTPpzSHYukFjgCuOF404wVHaOWxpCsowIHN
	uAJz2zmE2Ix9e+fcRFwia75jdH2Hp777ouI4XIWWzKZWffjivMVTZt+69zr6tQ+AOgW6FofEKE6hg
	tRmiPUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y3z-000000078nH-2wPM;
	Thu, 09 Oct 2025 21:20:39 +0000
Received: from mail-qv1-xf63.google.com ([2607:f8b0:4864:20::f63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y3x-000000078m2-2mqN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:20:39 +0000
Received: by mail-qv1-xf63.google.com with SMTP id 6a1803df08f44-78ea15d3489so13407496d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044836; x=1760649636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LNCBeBBdkJ6krQ6n6YSc9TV1L3hgIbHKEJb0ek4nU4k=;
        b=Lc69S23FZH3pjlRib/EoH6nLcFgiG6iFsxRqArh2twAYIqISL3dAwBfy1FYRVYtFfn
         QuA5Wm0QFSZ3/mPEpCTah+crJWwcWRxD1iWXdHrHWqv7LwrIP50EUVedTHbMTXgioklv
         w2juJbRIbsTzsN5ELWMgIZ/ecz5l9wpdz/zF2KaqGBTMUy46EeX7MOroh/FOTI94nsSj
         tXIpHmP/v8HXwGQh3qGyVbRAH6aWjBzsx6Hx+kX8AplLDiPcSDteiB2fpkaYRCf96oLB
         o+X6A98y7TIGRxsXHbcwVyCAd9s7KJ5LAyC9f/Wr5GXfxRoPqrNleFCSRsVWvGbY+tXo
         4MTA==
X-Forwarded-Encrypted: i=1; AJvYcCUlOEXdc5mNgClDWGc/tIueEuNzOCjXZV5jNVE7VABo16mce5ndUxpqhJI4hhOplX/CABNjYvuy1m9D9NIBbekp@lists.infradead.org
X-Gm-Message-State: AOJu0YxVdqH4fA27szj5DFEU3TPah4XG4i62of27IqRVgqN0KPR1/uWK
	SVQCmu9DtMWdaJfOS3fvLvEcbqkUy6W/b7M/dckY2/YgQDPqzOjrKujiEjEGu2PonUzdo9NbiWv
	yM5aG+HisaLE4Z77J4Fzd4ziAu0Kcpme5wLiv+8XSfcIW7kuMqgLa4BkUN6MeqCYW4T3xJnGKO/
	xaPQoPGGTxo6p1oTt7xO/raYoINvc6+0gcUM/RXB/Qb/jpvsfQQZ8/drUUAe+uGPyKffSBPSUjm
	7WEauofuv2IgdWQTTF/FSu2lBw=
X-Gm-Gg: ASbGncuB8JaCfoji1pGwr4dx/sf7dAngWfkUpEStwR8IBZ3upT9GdXlyfcr11ISaMiB
	4clIkZJaTxm/2Rsj8GiOV9yKmXNRWv+pe7yIk6zqKF62S1FznYQ9rrOgdz+XgP08J1nR4aagf0S
	JAa5fhL1oOPnT5qYYmjuKwc2H4zM0bUCfOhfUmV3C06rn1LzeNTilS4ztodw3gRuSNcFUcu/O5t
	cku1TYlCUsS7EYlrmI4msGmHpZn+Lfqqq87gZL2N2EViv51Una/kXlqEwgUUrqFRSBRVn8uTOLV
	rU4bU6evKtx+WQ6gtp6+I4nsDR+VBCyD+4UoB/T3vyNPikkWOUDRVkBN5jtpZyamnz0Kb5SX7fn
	aaEBQonAmBb8f4o4fx4+jSGwvVxs8w1CD8/VTRGHZrvkXpHBT+DAgyvbboNem4AZeHgg6FsvZtT
	xx68im
X-Google-Smtp-Source: AGHT+IGs21VOZ3p4YdBMRMk+3KgdlhX9nzPVcr2kj8bdpMSUqlpmP8g0FhoxFnb/uBah1nLs/UBmDFdGqCTR
X-Received: by 2002:a05:6214:5482:b0:879:dad4:4eda with SMTP id 6a1803df08f44-87b210153famr85040266d6.10.1760044836364;
        Thu, 09 Oct 2025 14:20:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-87bc346163bsm329226d6.12.2025.10.09.14.20.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 14:20:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8635d475523so471387585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760044836; x=1760649636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNCBeBBdkJ6krQ6n6YSc9TV1L3hgIbHKEJb0ek4nU4k=;
        b=FNmdYXMR/BGNR7JYFcLpxA8rzohjBZJ1KpiHSDtyQeUWgb1wQ20BVK5svkDbV4f62a
         lVy6YmzISmdnGuGKOjumUm1b7YZeulJs67la9/LyF4i1b94IbMgOy+3MD3yiDBWBvb2S
         5rjT+g8nFY01v43W+Ya6sQzjni0/8z2G8IakM=
X-Forwarded-Encrypted: i=1; AJvYcCXtXGczF4OTj8R4esT3OeNaVM+oaGCVzbomNiaRsKsz2KJg8fkg7PWhx4KfII0Sj4AlrZzTf9R1JW/dTl1uJkQc@lists.infradead.org
X-Received: by 2002:a05:620a:462c:b0:85d:aabb:47b4 with SMTP id af79cd13be357-8834ff8dd75mr1273447285a.12.1760044835658;
        Thu, 09 Oct 2025 14:20:35 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:85d:aabb:47b4 with SMTP id af79cd13be357-8834ff8dd75mr1273442585a.12.1760044835103;
        Thu, 09 Oct 2025 14:20:35 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ae428sm274832685a.16.2025.10.09.14.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:20:34 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v3 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Thu,  9 Oct 2025 17:20:01 -0400
Message-Id: <20251009212003.2714447-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
References: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_142037_710258_54B9E3E6 
X-CRM114-Status: GOOD (  13.78  )
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

The broadcom settop SoCs have hardware semaphores as part of "sundry"
IP block which has other controls that do not belong anywhere else.
e.g. pin/mux controls, SoC identification, drive strength, reset controls,
and other misc bits are part of this block.

Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver to
iomap only the 16 hardware semaphore registers that are part of all settop
SoCs. Hence the bindings shall use the common "brcm,brcmstb-hwspinlock"
compatibility string.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
new file mode 100644
index 000000000000..f45399b4fe0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom settop Hardware Spinlock
+
+maintainers:
+  - Kamal Dasu <kamal.dasu@broadcom.com>
+
+properties:
+  compatible:
+    const: brcm,brcmstb-hwspinlock
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
+        compatible = "brcm,brcmstb-hwspinlock";
+        reg = <0x8404038 0x40>;
+        #hwlock-cells = <1>;
+    };
+
-- 
2.34.1


