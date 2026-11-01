Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE67606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ASOqmIhK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szv085wV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=; b=ASOqmIhKnV4YI1
	ads/EbLsvB8wli+0blhH8Ro25HB8ITZSl1njDRjD49lqNqSCnQNbhHIeMH0nlmuZEDt/r/pmb+kk0
	a1l3+DALnl/F/Vy5e+CohhyJmqfU5WoWtUerycWFelO21RVgI5Iy7nFgo8e9EwFQxcmGDF/G/MmZ2
	JAEnlPn/NSqBHZt8vy6h2taVLaP85UoNw2r66VjUgiApRytHwYSi1cA6fLEaNtovxNe0qdFkHull9
	zFb5VHsHTr4rhYKfzFjdFF4PHpN4MKIxnulGJbFUL6Vk5tE3EdLiXdpTHMplqcsRaSNS8u7XiunMR
	1+GWyY7474S89DffU6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNakd-0000000EmQ3-3Zag;
	Sun, 01 Nov 2026 18:57:55 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaka-0000000EmNN-3Jht
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 18:57:54 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8ab37e44643so14964417b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559471; x=1794164271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=szv085wVYrmoULYtl1xYDJ2VKykHuQwVPTgW1L3Aq/Vp75AGlg1v8imWAqUbd/6SRw
         WiLmUmzAHiTfdUrkqorDoqOl8brtxu41CorSwccmUFTJIeBETJSsq08Qb6sUEnHWq/Kr
         QlzVQfak01N4dorxygObV2410z6lBd+Nr+/iinY5ihnJ9UIcE4oiRH1G/+sjh6GPAdcH
         2SEe2eMLkhDytrn/eqoYPwppR2kAEUa/pgmW7HAFcx4buckGsFIka5M+HlB99BUBsI1W
         YHKInWalYsDz8vrfsCftfQjAqh148TnsNkJ/S6NUaBR4VfRWuPNf0J+z9coqBKDJdC+I
         YaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559471; x=1794164271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCxeVRFVH5SeA2NpIbzDmV/W44vmxhH7KVeCpg75zJg=;
        b=wWWOAr/IyiiJ+FP+vT+fLcEsmh78ssakVmQHylnLkcyOSiC6xQIVoGvg1rSL7KkQtY
         63izrkVQ/YVD+czf/dcgszNjWYtmSqR++lHC3WFtrVANw1oU3fF63pl5heD26hV+Xmzt
         28W1SXMOAcwobkjK4387n1khKlfM/PR1S+iJp/nJO96aGDtMBz9BUiecZrRjb0KIeSXv
         HpQrz6dif5XmfeYftLNrGlOQks3ZXTJLMpfhHuagrhXSOWyHDE1ZTeVjPx5HM5aWhzpa
         +7ABlCwUSjayewNu68u8RoiLoQA3daFBML/b20RBaIrybWWD7pxPyQVG7gV7Mdugqt+/
         VI8g==
X-Forwarded-Encrypted: i=1; AKwUvBxMxxAfnSscJ5+WRfzsKdfmrHQrwCUOovSom2ohSvAO1AOUeImXaznMU2YxDbh8ZqKPDIXM1elH1Laeqm9aEc8C@lists.infradead.org
X-Gm-Message-State: APuU4Z9+5Yg5jKyfNjcrNl7vENeHfQ1CoEd0frqyZ6SMSU1gP/7exoME
	Sv0d1Ok6Fnk66nbfb2J/LELG45KHswgiwrw7Sif0WgS7TZ/E9NA+GrAZ
X-Gm-Gg: AYBFou3fz1J72e1eXeZnQQ1C+sXT8DY/ylsQSKSy0DPtJSC/+YScyf9HnuEwfZLnLzI
	IvGn/hMXCIY5S+xEdYD/7j3vDYxxOG7VoxrfhUirvl9dtp18TE4esnx2aZuRfxp7oJn/+xA/WiY
	IDutr7E+NuxKkA7uWOiqvwGyUEkIioKdyeFZjA1C7X2Slb3BMGBH9DiRwT+fVZI14JiFKYN7KPw
	BJ1EpCaElYdOUIyI06nd4BQsDycAD8NgEJyBdlKc93Lo44I6jOaIEoW8FijVoQlPPixFvSPDm5Y
	GYUsoJ8rpMluYRm/aj3NKoEGsIy/FHNACS80XJGYjOUGO7PZ/0sAEMUTq6qnO8HmD+SYf0ERngA
	KnyVJpJLPjsYb9Ic58Gs0us6wCSW0yxm4MiaTUj08WYG4a4mlQSmatcBQLoV8gaRB05ig6a4ouZ
	6+g3Wuj1UOcI/vM8TRM4AfEsBLB6eGFBWenXZwspO6lLtOpg08wb+lNSy9eX7CWlcqp98Cdrma/
	sEm3J9WSrLQPZiYOtONEoHgoo8RQZx69JIxpeWbr/xtIDkGiFZ8Nm4HWHnqro0lvxjt+wNIGEzf
	MbRXdA9xHLKryAXMqzNsUQbuCfZlpKe1yv6oUDiRITCHbNTSK07EW6LWRy6erLlCyjk=
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr43226817b3.30.1793559471312;
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:51 -0800 (PST)
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
Subject: [PATCH v3 3/7] dt-bindings: remoteproc: Add Allwinner A523 RISC-V remote processor
Date: Sun,  1 Nov 2026 12:57:31 -0600
Message-ID: <20261101185735.762559-4-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_105752_846353_B97420EF 
X-CRM114-Status: GOOD (  22.35  )
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

The Allwinner A523, A527 and T527 (sun55i) contain a T-Head XuanTie E906
RISC-V core. It runs from a dedicated 256 KiB SRAM and can use a second
256 KiB SRAM and DRAM; a bit in a PRCM remap register shares a further
512 KiB SRAM (SRAM A3_2) with its subsystem. Its reset vector is set in
its configuration block.

Describe the configuration block, both SRAMs and the remap register,
the bus, core and SRAM clocks, the configuration, core, SRAM and debug
resets, the RISC-V and SRAM power domains, one message box channel, the
reserved memory regions (a pool for virtio, DRAM for firmware, a trace
buffer) and an optional crash interrupt.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- File renamed to allwinner,sun55i-a523-rproc.yaml to match the
  compatible
- reg and reg-names are a fixed list of four (cfg, sram-a3-0,
  sram-a3-1, remap), all required (Krzysztof); the SRAMs are named as
  in the T527 manual (SRAMA3_0, SRAMA3_1); the description says the
  remap bit shares SRAM A3_2, not SRAM space 1
- clocks and resets are fixed lists, no minItems (Krzysztof); add the
  debug reset. The msgbox and parent clocks and the msgbox reset are
  dropped: they belong to the message box node
- Add the RISC-V and SRAM power domains
- One message box channel; mbox-names dropped. mboxes is optional: a
  user can drive the message box from userspace (UIO) instead
- The crash interrupt description says the A523 has no dedicated line
  for it; it is the only interrupt, so no interrupt-names
- memory-region[0] is a shared-dma-pool; the example has the memory
  regions
- "schema" dropped from the subject (Krzysztof)
- Jernej Skrabec and Samuel Holland dropped from the maintainers; the
  MAINTAINERS entry moves to the driver patch
---
 .../allwinner,sun55i-a523-rproc.yaml          | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
new file mode 100644
index 000000000000..b119acaa2df6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/allwinner,sun55i-a523-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A523 XuanTie E906 RISC-V Remote Processor
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+
+description:
+  The Allwinner A523, A527 and T527 (sun55i) SoCs contain a T-Head XuanTie
+  E906 RISC-V core next to the Cortex-A55 cluster. The core runs from a
+  dedicated 256 KiB SRAM, can also use a second 256 KiB SRAM and DRAM,
+  and a remap register shared with the HiFi4 DSP shares a further 512 KiB
+  SRAM (SRAM A3_2) with the core's subsystem. Its reset vector is set in a
+  register of its configuration block, and it exchanges notifications with
+  the Cortex-A55 host through the message box.
+
+properties:
+  compatible:
+    const: allwinner,sun55i-a523-rproc
+
+  reg:
+    items:
+      - description: Configuration block, including the boot address register
+      - description: SRAM A3_0, the core's dedicated SRAM space 0
+      - description: SRAM A3_1, the core's SRAM space 1
+      - description: SRAM remap control register
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram-a3-0
+      - const: sram-a3-1
+      - const: remap
+
+  clocks:
+    items:
+      - description: Configuration block bus clock
+      - description: RISC-V core clock
+      - description: MCU public SRAM bus clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+      - const: sram
+
+  resets:
+    items:
+      - description: Configuration block reset
+      - description: RISC-V core reset
+      - description: MCU public SRAM reset
+      - description: RISC-V debug module reset
+
+  reset-names:
+    items:
+      - const: cfg
+      - const: core
+      - const: sram
+      - const: debug
+
+  mboxes:
+    description:
+      Message box channel to the RISC-V core. Each channel has a FIFO in
+      each direction, so it carries notifications both ways.
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Virtio vring and buffer pool, a shared-dma-pool
+      - description: Firmware code and data in DRAM
+      - description: Trace buffer
+
+  memory-region-names:
+    minItems: 1
+    items:
+      - const: vram
+      - const: dram
+      - const: trace
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt the RISC-V core raises on a fatal error. The A523 has no
+      dedicated line for this, so it is present only where the system
+      integration provides one.
+
+  power-domains:
+    items:
+      - description: RISC-V core power domain
+      - description: SRAM power domain
+
+  power-domain-names:
+    items:
+      - const: riscv
+      - const: sram
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
+    #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
+    #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
+
+    remoteproc@7130000 {
+        compatible = "allwinner,sun55i-a523-rproc";
+        reg = <0x07130000 0x1000>,
+              <0x07280000 0x40000>,
+              <0x072c0000 0x40000>,
+              <0x07010364 0x4>;
+        reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+        clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu CLK_MCU_RISCV>,
+                 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+        clock-names = "bus", "core", "sram";
+        resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+                 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+                 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+        reset-names = "cfg", "core", "sram", "debug";
+        power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+        power-domain-names = "riscv", "sram";
+        mboxes = <&msgbox 9>;
+        memory-region = <&riscv_vram>, <&riscv_dram>;
+        memory-region-names = "vram", "dram";
+        firmware-name = "riscv-firmware.elf";
+    };
-- 
2.53.0


