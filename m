Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39ACFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xS47RVDKW8GFZppjjzYsYzUHq1wMuiBPcs650CNp/VE=; b=vrQbuLxvp9SXly0SjCuobFM8mm
	XnkJSPwhiHJke/e72KJmGa8cNQd+Tm2uu+PHZlps7i+/BEqKiRYVFq1ubY0bkrk1E1NYu6xhzv6BV
	SEZYRCLhijn/GKyWhEYR3+9gIgpGmr/uQjsKvbVKlf/dNpOZbghl6k673aBUVgzzHUrzLwxT5mz8g
	ABeKlIDEw/6w8xn814zpj43mtK+P5WMzcRJND30dGrUEW5IAzls5WKCETkUzR+0j4UZkBbNZ3IqN7
	rWFTVD0G/c4DGqCISOnUIER7pngxXWAbyRubrUiu+PmJbpWADZ2Q7jEqS8WRIXYOgLWkTxgrWZ/Vr
	orLopTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSK5-000000005xO-1xVX;
	Mon, 27 Apr 2026 20:12:53 +0000
Received: from mail-oo1-xc61.google.com ([2607:f8b0:4864:20::c61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSJz-000000005v6-3Q1v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:12:49 +0000
Received: by mail-oo1-xc61.google.com with SMTP id 006d021491bc7-679b072ed3aso5102373eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320767; x=1777925567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xS47RVDKW8GFZppjjzYsYzUHq1wMuiBPcs650CNp/VE=;
        b=MIlYzXMP4aTR9sC54vT5m01L7VZjeuRqwiRTPv3HTHeTTXL8QIQ7CzEIX6yU8Dy1p6
         ejv2iCQtXjFbEB/GxD3JoS1oTsDtWY9xzGmzHQtw1sACUfLbbdG7+m4lsTkSh//tjp3U
         QwqhVZpw3TQqzB/nu0bWP/1+vnUkJSEy9V9NfCrmV8eZrbn5r3HLp5WnAFz+hACRhJZL
         magRX457hYbXC26DB5qewLAGAQ+TDxYnBJmG8I9LOh3waQokH5Lq8C9AVbIcTZDhkdm6
         LL19+n91f6DkMSywgtsLyh9xpHExAwaQPRzmnuqffHaIljFr2wPYEVucbhjmA+aCIddZ
         AXNg==
X-Forwarded-Encrypted: i=1; AFNElJ+YXweqquaSS+PG6l4++MCYqJWsI2hFss+AZzXkmWt2WAYMCeL1OR6Dsh0Gpo0P88xJQk/PaugAY/xCDzghIfWb@lists.infradead.org
X-Gm-Message-State: AOJu0YxmoQFzwz2LtGtoIr2RAIRoKoQlrIHWveIIitv/VTerltCxUfka
	38c0TAqwpY/HI3Wzu1mquWF0jz0KTleUY9XHsszi0yDhoEYKrpqfEh8W91KAeQpUEESA59eWHhs
	u1NSmIcV4LR50qB0XVWuvQb6k9ZESao22qMDaFSSf6Cw3GCYbbVRfAwbyNQPVRiByjh6hfHhx/e
	J2MuDyUisTpsi2DhV6IqHfrjH8ZEuywyrD7PlWvsRg76MmWu8fwDYDvMzhC8etNceT3S5+1Qp3A
	bwsX7KixfkdUt0avZ3odlxCz9k=
X-Gm-Gg: AeBDieuYCUEBbtbQuL8+PZ1WGkl5pm1xWr1rgaJqXH1iCrzuYtQP4UTDjVV4ZeixTkb
	4IrWwMtXSMkoEv03pX5Mza+3CADdvzLuDRQ4MJ1uLnU/zumtrDJFnzAUr/HgeMxAz48deQGNbOa
	G1dOduRxin7In6hOFdmL/jLKiQuLAT+Om4tzZQj2sZjx6CWBBbpTg6VOLB6SxOebU+BgzgzwKLo
	l0RPYmhUTfkowRfVWmNyW/cntlagO10BBtfpPofBJOPCTSOzV9IDT2OJ5OX8NA0C3ndNE3lhMxn
	ioZllJ/mVGvD8bazW8pULf0LQpj5NKofrrHFgpLLmTsiuBHgG8xL7GQK1rnEmPr+lz7vBZjT3hr
	IpM8ANLpx86G6m8s8b8RAT8HII3n6+4QOVKcq33LQybmoZtgRVPk3++i7+CX81lHxpXPHeRz674
	X08Jmj1FXo92r2kkU22j2KpXwNmRroAsMe1zf2K6MC/XeH1tYgb5cW1U9+fsAaTWrO
X-Received: by 2002:a05:6820:f09:b0:681:b070:3dc6 with SMTP id 006d021491bc7-6965ca3e4b5mr30558eaf.10.1777320766529;
        Mon, 27 Apr 2026 13:12:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6965b937aeesm20082eaf.8.2026.04.27.13.12.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12db218e265so22549208c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320765; x=1777925565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS47RVDKW8GFZppjjzYsYzUHq1wMuiBPcs650CNp/VE=;
        b=Nxr/611yp/7HRpPgaSx8vcEh1/HjZmHyYp8tWlQ1E1ENPeGCd+FKdvSv64RFKwG22x
         am6XHUqdD58ulDOPVAWGCDkCbGyU/WpnfOqgwe/OAAGUA+kw3owpC6ILywL1lWB7eoM2
         LlT0JCKKM4irNynfFS/ISqGXGoxjME5VPgFCs=
X-Forwarded-Encrypted: i=1; AFNElJ++hCsURYCtjMkocRUKRs/SSlDaY/kroJXLx4MSTJP3CDNAJ/B3ZXzVUNmTjU9BCKMei81b/XXbDHpHQ147tgsI@lists.infradead.org
X-Received: by 2002:a05:7300:7316:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2ed0a19128emr207093eec.29.1777320764884;
        Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
X-Received: by 2002:a05:7300:7316:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2ed0a19128emr207074eec.29.1777320764314;
        Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
Date: Mon, 27 Apr 2026 16:12:31 -0400
Message-Id: <20260427201233.380314-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_131247_867893_5EC92AE5 
X-CRM114-Status: GOOD (  13.64  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
new file mode 100644
index 000000000000..552f334256b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
@@ -0,0 +1,44 @@
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
-- 
2.34.1


