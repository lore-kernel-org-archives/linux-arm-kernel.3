Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCB4606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AvwpG76g;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=baHOsLGJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=; b=AvwpG76gNqCJaFUd8eU9Lwz+sh
	cg+QzjVXOiMKdRBQYkHyEAItnySb8rHDkNvIk3iYVH67/muAiiSmqejQa4Zxio3DAU3qR/nJLtcHr
	27+7JOXMBfmSU+vL74FbTrrWUv7Li293ziWT3+HXWQghsXJavdx6PUAcmx0pBVscjcN1p8GXveL0I
	/L+gBIu2I6a5Y+cEMV3ueyYHyo5asW952xDAeEmaiCnm6aml23VTO4NtwqPgK1EVllA+BzkVrJbZO
	Nz/2aWe0FT9AVg3z2rTLSp7f6ZBD1YwJiHfLRKv4Z/pZtDfxTRpBfkzZbLXlFMWJ6WIUJTcPuMMyH
	mlfZtWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1gT-00000000fhU-2tjk;
	Mon, 02 Nov 2026 23:43:25 +0000
Received: from mail-dl1-x1245.google.com ([2607:f8b0:4864:20::1245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1gO-00000000feI-0ot2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:43:24 +0000
Received: by mail-dl1-x1245.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5528653c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793662997; x=1794267797; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=baHOsLGJZhpEf0NJMGqyqKgIl4Lwuzss2IuDJsCjeiS3Q1YA02XxSLdiC4jNbbmVAs
         izSxe2QqrCzWRnHGracwE1ClK3NxUI4gDrbK6JignmCYCpHGHOEmmMIaZgBccERmvHMT
         /a0dL5V81P80idPk9IbuhsHN2fCOEYa2YOEAg+HGpOXYvVTb2EB6QBMaiH7lQJcIyTGE
         3ftjONBY/6mNJVfWs3RF6HM5LyqKX8t3ukN9rLYMRj1ZG5+B5QoAB6PJaicSZtxM7REC
         rTo8Pzvz5OAOsHW5I6SmTzMxccV71chtcylwpV24BglhPNrkoKf1IUYLxblAgVhNL1g8
         c9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662997; x=1794267797;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=U1WUjvCBCuRTwc64bKMK8Fb9vKPqp9vU2EPNaZbfFnS5BdNqI75cnmZnKw41eL39pY
         agjbAHZpc8qNWhI478sa2Zx1Ge1OSNvjmIpJqzxBr72D9SXeDqMHRIraTAWGTKaTJam7
         rL8DyzffyHZqsrr5CWqo/w23bow/SLbTqTayGF1IUhlFCMv54R6UoA40NlAYVE7ZlhF/
         /fthzOIyzkS2i6Mu6anwrdlRnptc6HfKMV+LJhty6O2wQw1wZJ34Bbk0ixB8PYBFlLFV
         Z5AZdPiy6e6RGpwCa+EEml1gOAlzfMRI/pZqiGFmZBbEEQMyXO4M2ha03MGqdPfau9sz
         GIGA==
X-Forwarded-Encrypted: i=1; AKwUvBywxs3V+27K5oVNeHTWPbjq+fzbIiohPMXUGkif8PmGDKbvMAKeW0YcEst+GG2AxFmY6PLgdP5fBqEnxg/WL7EZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJQLVp9Rd1LHrUS9W4NjXi30GZZ2q3rxoCA85Oln7lkv+04L5Oy
	NZtGq9gbilOFRBnnIiC8E8IO1JGeWa4+huSJtTZjLmNb8HZs7BmUCyIzez0N+OirE7bGZsIt5v9
	on3ZW+YPc7Q==
X-Received: from dlep8-n1.prod.google.com ([2002:a05:701b:4588:10b0:168:3bc7:9e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4213:10b0:1a4:fac9:aeee
 with SMTP id a92af1059eb24-1ac56d95c0amr16914327c88.4.1793662996134; Mon, 02
 Nov 2026 15:43:16 -0800 (PST)
Date: Mon,  2 Nov 2026 15:42:59 -0800
In-Reply-To: <20261102234301.2242242-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102234301.2242242-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102234301.2242242-2-irogers@google.com>
Subject: [PATCH v15 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_154320_408953_A9A70A77 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

Depending on the SoC and security configuration, these PMUs support
either direct MMIO access for the System monitor or routing via the
Raspberry Pi firmware mailbox IPC for the VideoCore VPU monitor.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 50 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..08d8c7c7e476
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description: |
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present: the primary monitor
+  evaluates the System fabric, while the secondary monitor evaluates the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
+  - |
+    pmu@7c012800 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7c012800 0x100>,
+              <0x7ee00000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.385.gac671c819a-goog


