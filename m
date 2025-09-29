Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09115CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 20:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=; b=mYDlkJF1ToerPxIukdpgbGaWTJ
	g4hXAWZWMUYJ4jpvtqtnBFzb31IyfcSV7pfaePg1g6rtDnLHn5uQ+e0Lo5IvlD7HqgoAmp2ziOdx4
	AsVoo2fKwkmiW1WYwUki0vsolLEvAsk1zk4XcoVOANktJRr9YHnAb7Cuo2GQa6ExHgd2x4wiS6+cK
	O2AMNpAbkP7kLxI24CSw79PiJLv2JGepOUHypqugVZuI1TlvSNECEKPoM7z0WSJBDUGZ/7LNAnkw/
	Y6nIDFbaf86XUd9Uhd7A29wO4borZwXRHZ9e+/ewx+JsnScAE8Lf1FTQU4z9Mg2g2AlAeYDXvAdsX
	saqS6m4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9P-00000003Py0-3Kco;
	Mon, 29 Sep 2025 20:07:11 +0000
Received: from mail-yx1-xb162.google.com ([2607:f8b0:4864:20::b162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9N-00000003Pvs-0r0I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 20:07:10 +0000
Received: by mail-yx1-xb162.google.com with SMTP id 956f58d0204a3-6360397e8c7so5378484d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176427; x=1759781227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=upqRVzexCSR6io0SgqD6W0V40aDoBOHBfG1hR5hQEBw7pNQEQwsJRmgGrOXEVI5gYf
         IHlaOL4nlIxzAOlYnTXOdaTBHlvYVEIz0uPEuBPT199+LXgmpacdrkHcJDbhnzMtiqJr
         8fURZmh6RJo+Lnv1h71XwWm8KBTtJkD2pjAQa+ZvlEQhlwtr7jrECPtFc2zYfCSt4h7s
         GJhe/JM3ogjDFnX/rLqxQmVYnhNRqTFCvN++4JY/uiAaschka4yWHiTAFUurQDC4JoCc
         66+lgF8mFatfW5Ss3aygW+jmZMm5cnVuocIvorzPXBpYn5BswHS5UmZzLJhQo2UnRFXa
         Aoag==
X-Forwarded-Encrypted: i=1; AJvYcCVPbhY1HSN9Y5AGAwg9TF/OSr+PVwxVMOfh1i9tUKmn5xlzWTR2EnrGGwJW9YaIBNJ//VaKyArQ206PDRss0tTj@lists.infradead.org
X-Gm-Message-State: AOJu0YxyMja9WYlmFUIPX2yEbun5oMoZjOdcRi+Hsa3Vjlg2fUvpcqut
	Xdvn2TrIWM1DcC/c30zgJgCS7HXQkrc4D/X7diCN92d+wutFDmhkHiSUmjcbjpVckPtWbx0liZ3
	N/Y/T3PD0SfO+/EYljho68+S3HW/E1P+vsaniGuKN2G9biXjhzAAPrxQsomOeiZX3H/GPD6wV/m
	VTP39t8+HWUIDS+QcOZY/Yip/42su4+Szdx/OvF1+xaQphy+2Ud6pLts6w2RzrUrbwTruCk6OIi
	E+xffBygsStsj+I3ja+T2sKbbU=
X-Gm-Gg: ASbGncsxEjqLGirCEMz58Q++V9F85/rd8/HPsrIKHnGhaBQjIeLQtN4Y2NGQgdiaQkG
	MX04aVni+VfD4OTF01yzANw3gS8OTmy7yGDvXLPtb/Jx0qqFqOQcaAAxtu6zn5YbUOaQ22zz2cy
	bXuLgYzoCshie4P/2+JL2wRZRIwH7iykNIR/1yn0MdkqoQbov7xH5D5FfaRLLtUvXRDTdaNfB+z
	xEap+1graH3v0LGnl4RkNgPst69l7VQymh/gQlxaJPjJNGOMSTd3E0BF6keqkI+sbonRNijGtEz
	MkaM2xZZiVgvgo1WaOf9L1vZ4dDa/ywUDuPShvbOa/JHF2QEWSPj6nCBJV5FEb64F1WiQM0E+gv
	aRGcUfXZTxbvc1Wi9iuBBNjHMpclSjzdfA8o7b647K3r7/uAqeawEzwv+NFkMKGPCuo/9Yt/W1j
	4=
X-Google-Smtp-Source: AGHT+IEPyd65/HQCEZnpbhgCAagHrtLNp+bnGWnbYKD2SHmwm3steGnlZBqGtxxV2l8w+hHFQY9Gwc+oEN09
X-Received: by 2002:a05:690e:d4c:b0:636:111b:a4c9 with SMTP id 956f58d0204a3-6361a745f42mr22839338d50.21.1759176426971;
        Mon, 29 Sep 2025 13:07:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6361e9416d5sm556471d50.14.2025.09.29.13.07.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:07:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-330a4d5c4efso4769512a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176425; x=1759781225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqovZHXYm5Oo5CU4XtE9N0uxOF2JJp5QxUlgkpF6rV8=;
        b=SqEoM1ZcKwMihMWysOuXs+ozudA8ZwGhd2OQzW6HTWcUmmYftjK7RJs6bmUJwHcSlx
         dfsT7dyXYGoU4dTL/iAkmZP4kwGnaunPK9ye9DTfiQk3zgtdklDGTncUpRsSJpZu1yfm
         fGB4nyja4d/oYTL4T2h0V22ECPF+m7R+CfMsU=
X-Forwarded-Encrypted: i=1; AJvYcCWdErwQf8aEaQsCMUvFYWnzcI4W/q6rhf65Yy+9Dq8LL8mP+PCSWJwq6rUwVRSmngGBG4bIjwVbLH+LQv8E9DHj@lists.infradead.org
X-Received: by 2002:a17:90b:1c81:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-3342a2bf175mr20116987a91.21.1759176425636;
        Mon, 29 Sep 2025 13:07:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1c81:b0:334:29f0:a7e4 with SMTP id 98e67ed59e1d1-3342a2bf175mr20116976a91.21.1759176425253;
        Mon, 29 Sep 2025 13:07:05 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:07:04 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 1/3] dt-bindings: hwlock: support for brcmstb-hwspinlock
Date: Mon, 29 Sep 2025 16:06:25 -0400
Message-Id: <20250929200628.3699525-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_130709_245829_21612F41 
X-CRM114-Status: GOOD (  13.49  )
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


