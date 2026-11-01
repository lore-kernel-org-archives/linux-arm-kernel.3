Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EB9606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XR2Um1Hl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7lShIIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=; b=XR2Um1Hlpz5/0h
	cJYO4MC1+50GamCmu05LBR46EpVKgJPbYj6oHsa62VAqNb9yykMHWJEW+vC1dVYOWlkoE+wox7Lb0
	EgOzlpJPHsSSeDfcOogKU1k3Dk164QDB4BcqT5lAJhsQyjCbD4u1pEiakT4DBkjnQRSfuBeVOzvmp
	yxPmVpCCtoW51JYGl23Yx0AAXNDb+qC0yK6Z7JEodmihiHrIJVjK0DwvxjHQjdlt/EOt/JI6m3liz
	/OOQYTPXq1G4bul6GpYPAbfi8SBYyLhhRCsh2daNYRE8CPjDRsNJ8Fc1f16XaPXHNJnh74kK9ssKh
	KpvSV6oj0s1Xl3BkZUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNakd-0000000EmP1-1HSD;
	Sun, 01 Nov 2026 18:57:55 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaka-0000000EmN3-02p7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 18:57:53 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b09e07e149so17383147b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559470; x=1794164270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=B7lShIIWVY2QvYNpO5iJ3XQBvjavtyBZ1LSpdLi2gDUX0IWoLjrlNVCM23FYN97eOf
         zMF1pJQlOxBd/lpSPF298yS74Tw19jkKdHJ0reVJUdj5wCn67N1t2WceLscpFRky1Eo2
         OEybyIprFySZ6jaj2oKu1yW6F9Uo75qKs9UN+PyA3nHN0R56z7o4KMiIBTIy9+x1WiIb
         bTbx4z0RMr4JCDbFh5IcErV7fVDoRLkl6KGxwFmvD0k43nZWppQAujtxuoBEeb0nHYkM
         JOo8c6+TTQpPx3qrgVACBCizDUNgUOIG9OJJHLdPzkew/yrGzkW0gTXGp+oLPevMGwBf
         PH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559470; x=1794164270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCLnIVK8ye/bESNuFomvrDeJnabWiC0A0WpugO9hxMo=;
        b=yDjzSfiDBDzKmF9c0eRUCy7KxRiyD1I7YaTKJR/zkyLtgngH/EeiBv/N/L0QZTnkrW
         vLVHp9hfFiuIjPYy2RknVm85RctYzBzSL6V9dO+jmih9FnKZfDT3xzo8fBT9aCh3RXn8
         1OTEbnAArmzzrH5K1RR/6QKnRBY8xHe7NrSEFNpKodyfMthxAHzgGo08GDhjqXogd20w
         GnuhkyJAvBuMRw69J9Wy3iz/9HQseppBpelUQfm0/7GbmmKWVwTlRO0GVHheP0rtMxbU
         pBbd32sNaj3Hu0SRd2ZOPtWUSGmnkwgWf83qVy3KpQanaIYc8R5wj4VYxOh68mJjcsiC
         ao5w==
X-Forwarded-Encrypted: i=1; AKwUvBx5p6b4NlMRQo7Hg8nYsOE8A0jiHXaGykw3p4mA0gPy90my5qYmzYtxT1IUz8udM0KduvmrHQ4t5sgBN/zaEwPM@lists.infradead.org
X-Gm-Message-State: APuU4Z+vJyv7xs8f8dG7Pmir4AtxfqZJjLOxyV45oCTbLBj8Ov3/nC4b
	oIwm8h4gNZRV3cCT81ESvbNM5xkAX7yI+Bv5ezNH+dSGWdTsyOX715ur
X-Gm-Gg: AYBFou3AbkVAja6iZULvtaB3Ih6wOne2z4BQ7ixJ61EfpQC4uv9EnSxBFhPVpZPTujd
	0wpzS6roW+KlfPR7T7zQHJ+YRzLp9kETjedgoK0vFZqR7hF1eKSGq/MLCrDPLURoBlWbYpsxgTt
	jzLWJ4maOf1twqnVqqqRwPNmV59K0M7ULvWUexmxp1wrCpu4tuCdLc+cuHM+0a4OPN+HyzqUnMY
	NMcQoLN4PvL/zycXzDiQi8CWGHzmhuNxRzu4VM1xbNkN/NloMOKhcDSEsyE/5iBFV5R7yhJcR+5
	cuNPtDEJANJTDQ4JvrJGJT6l+uLr68Yv9VfVTFg5JhBHWd1iiB1MLz932OBQVFH9eMbV71b7yoK
	RpyZGyTskpa3CmmHaPR5/x9XiSgsHb+8ZmYPwHSyGbfPWio/AlYIzbA4N9ekB6OrWJxioZTKw8i
	Zf4wwCoxUX98ICuCGfo2uIdn03P+6R+U6ZAF5jWmdiyHOVYOrSDXPM3FJ1yIzkmnpq7sioq4HWq
	CX+DOLqFLv39ODuPGzh5hiXXsfueUthFI2dI9YgPVYC8PvQECDcix7B9Q9nQFEM+hSP+WujyPAi
	TdQWnx7h6dDw5EORUj2+v2N9rEQcRWlgLzSx/t6PU5xMHN9kl0hIATClighF2Qx7Ins=
X-Received: by 2002:a05:690c:dd3:b0:8b1:b916:69f7 with SMTP id 00721157ae682-8b2b671f289mr46540577b3.55.1793559468878;
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:48 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 1/7] dt-bindings: mailbox: Add Allwinner A523 message box
Date: Sun,  1 Nov 2026 12:57:29 -0600
Message-ID: <20261101185735.762559-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_105752_088616_F88A54D5 
X-CRM114-Status: GOOD (  21.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Allwinner A523, A527 and T527 (sun55i) message box connects the
Cortex-A55 host with the HiFi4 DSP, the CPUS power management core and
the XuanTie E906 RISC-V core. Each processor has its own register bank.
A sender writes a message into the receiving processor's bank, and a
channel has an 8-entry FIFO in each direction.

The host bank has 12 channels, four for each remote processor. The
binding lists all four banks, since the host writes to and reads the
FIFO status of the remote banks, and lists the bank interrupts in the
same order: the host bank read interrupt and the write interrupts of
the three remote banks, which every A523 has. Each bank has its own bus
clock and reset, and an unclocked bank drops writes, so all four are
described. The optional allwinner,tx-done-irq property selects TX
completion by the receiver bank's write interrupt instead of polling.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- One compatible, allwinner,sun55i-a523-msgbox: the A523, A527 and T527
  are the same die; the A733 entry is dropped
- reg, clocks and resets list all four banks in a fixed order, with
  clock-names and reset-names: every bank has its own bus clock and reset
- interrupts and interrupt-names are a fixed list (arm, dsp, cpus, rv),
  all four required: every A523 has the four lines, and
  allwinner,tx-done-irq only selects how TX done is detected. This
  answers the v1 question of how an interrupt can be optional; no
  free-form text (Krzysztof)
- Remote bank interrupts in the example corrected to SPI 181/174/205
  (T527 manual, Table 2-15; checked on the board)
- reg: the DSP and CPUS bank addresses were swapped in v2
  (0x07120000 is the DSP bank, 0x07094000 the CPUS bank)
- Add allwinner,tx-done-irq
- Description rewritten to describe the hardware; "schema" dropped from
  the subject (Krzysztof)
- Samuel Holland dropped from the maintainers
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..47b6fe304dbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The message box on the Allwinner A523, A527 and T527 (sun55i) SoCs links
+  four processors - the Cortex-A55 cluster, the HiFi4 DSP, the CPUS power
+  management core and the XuanTie E906 RISC-V core. Each processor has its
+  own register bank holding 8-entry receive FIFOs for messages from the
+  other three, and a sender writes into the receiver's bank. The host side
+  therefore uses all four banks and exposes 12 channels, 4 per remote
+  processor. Each bank has its own bus clock and reset, and an unclocked
+  bank drops writes, so the host needs all four. A bank's read interrupt
+  goes to the processor that owns it; its write interrupt, raised while the
+  FIFO has room, goes to the sender on a separate line.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-msgbox
+
+  reg:
+    items:
+      - description: Cortex-A55 host bank
+      - description: HiFi4 DSP bank
+      - description: CPUS bank
+      - description: XuanTie RISC-V bank
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    items:
+      - description: Cortex-A55 host bank bus clock
+      - description: HiFi4 DSP bank bus clock
+      - description: CPUS bank bus clock
+      - description: XuanTie RISC-V bank bus clock
+
+  clock-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  resets:
+    items:
+      - description: Cortex-A55 host bank reset
+      - description: HiFi4 DSP bank reset
+      - description: CPUS bank reset
+      - description: XuanTie RISC-V bank reset
+
+  reset-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  interrupts:
+    items:
+      - description: Cortex-A55 bank read interrupt, messages for the host
+      - description: HiFi4 DSP bank write interrupt for the host
+      - description: CPUS bank write interrupt for the host
+      - description: XuanTie RISC-V bank write interrupt for the host
+
+  interrupt-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  allwinner,tx-done-irq:
+    type: boolean
+    description:
+      Signal TX done with the write interrupt of the receiver's bank instead
+      of polling. A message is done once the receiver's FIFO has room for the
+      next one either way; the write interrupt is raised while the FIFO has
+      room. Without this property a full FIFO is polled. Received messages
+      use the host bank read interrupt either way.
+
+  '#mbox-cells':
+    const: 1
+    description:
+      Host channel number. Channels 0-3 reach the CPUS, 4-7 the DSP and
+      8-11 the RISC-V core.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/sun55i-a523-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu CLK_BUS_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu CLK_BUS_R_MSGBOX>,
+                 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+        clock-names = "arm", "dsp", "cpus", "rv";
+        resets = <&ccu RST_BUS_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+                 <&r_ccu RST_BUS_R_MSGBOX>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+        reset-names = "arm", "dsp", "cpus", "rv";
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "arm", "dsp", "cpus", "rv";
+        #mbox-cells = <1>;
+    };
-- 
2.53.0


