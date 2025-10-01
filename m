Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B5FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=; b=zXjQ0Nx/p91Vt8s5G3TeiPtmGw
	6U8ammjOjQCDh5tDFmKdgY6/jJd3K3p5VVF6c6FUSiu0EaZJP6vMM+M8rj6cPKXYGF6r8HQZsNL/A
	5UT0iTLWTGdJu5iswSbePteyFaQJLTGuMMnlTuUqP02WOv3GiILNu9AJAeC3nihcctXR1TP9phLkZ
	A2J8YOnLlrohzWSzMUBOK4mTpthP/zOqzAq+c44sUJnggv1P6FMAqRH1C2VefeDMzjNCFtRe8c5Vb
	sAT+5cYzL5gYAWLJecL9KcHfgdg+6oWbkdTDmU6UKfzJF48w/kqse+0fzWaU62WZFYm4wpcJy/Y1t
	6VQcnuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OL-00000008jAg-3C4v;
	Wed, 01 Oct 2025 18:17:29 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41OI-00000008j9K-1EmV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:17:27 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-79390b83c7dso1925776d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342645; x=1759947445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=CFjWPRrZonZm2qJKsx9p1h+Tto/tGRSBllFqH4/dKoC0yQxXFH7K2vUEw3dQX2V+qK
         OGdYWlsqbR51HEHDWazr86Nk1XHw6d1r9vmWOS3ohWiOKyKrd8igFKX5KNuRWiFpR4ER
         qI4x3OahG8yhut9HYyNsuuM/TWyeZKeax8D0KKq7/iriWX0Cvy/B7BWoI5ghSYPxm0a2
         pHHR/rIBcawsTDqyuVLlN9S2P1P4yjcj8i7aO8pTgd0AivXJZcUnO5RhYg6B/pC6deGY
         DOm1R5YPUdVoZLOIREcSf9hvlcAn1CItBVZlNJVfHgInpNMbFmv5rg1CbAL6WAkyrWSc
         GDEg==
X-Forwarded-Encrypted: i=1; AJvYcCXmYL26C3YaNoILDyYVjkG0hiL3gqHqusayrUuim+Q5xfisax/mSE3xNzmtHDfoSagdnHxRWLp6w5k1EAwaJa/V@lists.infradead.org
X-Gm-Message-State: AOJu0YwEmSBrN0QfM0ra0A1s5zN1kHU5Gq3rJwSqtHeKQziW1FWkedGA
	j4EgMebKp6ZQfXpcD4ppbfng7dMGsz/2npfxWn9RwCDdAotvCNZ2qLql/GJ7HqomigQvdK62T9E
	7lhvIm/gr6WnSBYRkfdca4zcX9d5e+NfTHlJsYq2VSUHOHCoqcXiUrKRMuxLy3bOTwU5hqCq3Q1
	FKRg1D0hKps9sookX7q/+D12LfUD4E6VYiRbolJ4EgkR7ezfsGLAP9quthMqp/STYFJM69gzl3s
	2ixP0jCZhhH3d29Kib39QMqghc=
X-Gm-Gg: ASbGncs6Veew6pugunW/L22pRM3VT1L+fbyXcNHWULkVVHr1qfwHab7vQBoE9nx2kz6
	4+pb+37MmLEB4lcZA5QLDcKgGgTN4ZR0wjb6ARXyrHeKUVM34dki6Qp4NeU3uytdbHjykoCf23D
	wdWMV9sGaKQgoVyRTiR/AlOVeiCPGVFAjFbS0NsvhMYZCnz0qHt6qM9KYxUmJNwtjAs1qLZhavx
	1L8H1OlihUmSYtBrUxg9YI/LOgzS9+pScREUqTMZ31eLalLw8YQWtFRwiZpOvfelhZvQaSgPPka
	K5er/VnYxiuqZL+HDJI1bCkLKZEzle1n4X76XV2qPK0F/bbOXZVt5aXwLXBFVOckYeXJoIJ0xd9
	DQhwDbISwvqcwxshaIPtRocFMeQFLOGkG8WPN6DO5Wn61xqi79Vn/sdqoyfkLQTAvZ6PWjoUgiH
	4DCK4M
X-Google-Smtp-Source: AGHT+IEpKhcTq35uzeTpKaqVzgZd6deJOSB593Thh0NBckVaatSrGV0MJndWT69aksgZdaYIGymIuFiEQLr6
X-Received: by 2002:a05:6214:d8e:b0:7ef:d35f:e1de with SMTP id 6a1803df08f44-8739be1b847mr62834206d6.12.1759342644970;
        Wed, 01 Oct 2025 11:17:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-878bac6bb31sm232026d6.7.2025.10.01.11.17.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:17:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dec9293c62so4071961cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759342644; x=1759947444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=BLydbM/Esxr9mXkQIVYgXhx+VbxZppcQLP9p/FoByHGl/giAJMOu9BtkOWzQh8ESqF
         o4jS/fni2JoUjntge+AlcazPWyfRcUVyM3O7gGwR0UhTZL5VsQ+hmQ1N2mzWLlVgrAXV
         Ur4U4Q0XXaxuktXb1gEUmt54tHh2Xl7MSKEyw=
X-Forwarded-Encrypted: i=1; AJvYcCWXZNABPzM9ujkyf+QKlWjHaSEhZnM6dkGLFQR7Pw8Uw5jQTjzzHR8UmJjoUGYJDNyYEE70udmriRs0eEt3n7iV@lists.infradead.org
X-Received: by 2002:a05:622a:258e:b0:4df:3960:a963 with SMTP id d75a77b69052e-4e41c923deemr68250431cf.7.1759342644353;
        Wed, 01 Oct 2025 11:17:24 -0700 (PDT)
X-Received: by 2002:a05:622a:258e:b0:4df:3960:a963 with SMTP id d75a77b69052e-4e41c923deemr68249741cf.7.1759342643640;
        Wed, 01 Oct 2025 11:17:23 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e78cfsm3847671cf.27.2025.10.01.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:17:23 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
Date: Wed,  1 Oct 2025 14:16:39 -0400
Message-Id: <20251001181641.1561472-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_111726_339558_9943AA92 
X-CRM114-Status: GOOD (  13.43  )
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

Adding brcmstb-hwspinlock bindings.

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


