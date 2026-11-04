Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618D9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZG2Cnb+;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YKSSjhAm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=; b=gZG2Cnb+64RPxLxFxxkVTB7BJ9
	mc1irb1a3r8jNDrs3u+LfxmxF/uyC/Q4BIJ6jVSeXfK/+G8M9wFmd2ux4fO5dP/ovGYVZYm5PfIxV
	UZYrsWv//EV3/EY5HkRjzR79IzDJ9wXQg7FkadPdElRH3o3gsXE5tmZMJeVi4lr4UT0OQarQxoO8m
	2iCMFZcGjgdibF268RZ48P0ogx/6+vRwMkXnowDptfzVvW9dJTHwzySTXmu84k6IwEO7FCivJ9Vya
	nVWEMIW7L+AI9dEjx0XKSqD5py5Rlinz6ExVtiBcTf0QhXsDAOthcVv1dxTb9rGL46Y9lhiyhj2un
	mdb0spoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORHO-00000004ESJ-0jwM;
	Wed, 04 Nov 2026 03:03:14 +0000
Received: from mail-dl1-x1246.google.com ([2607:f8b0:4864:20::1246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORHJ-00000004EPb-12iZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:03:10 +0000
Received: by mail-dl1-x1246.google.com with SMTP id a92af1059eb24-1b0d864826cso945043c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 19:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793761388; x=1794366188; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
        b=YKSSjhAm/zgF60Y3KoOkrc5wGHvMhYQH+kRzhrPMTYUK3rgE9otn/AYCQOhD1skoNX
         wV6H9G4HYOnR8HtIEW29foeN2pYQ1FHm/NbZDQYNokLYA4lXGIn4IpbTxZedqe4clNbH
         4Pg2fuOrh+Ce+HeH0PU9ITadujg3KokdcnOnD5+hXS+BJ9cDR/b+iMMc7qkEWW+e+K4S
         Ey2Wufr9XPcAW5NTW+TDNp07G68llIjH5SdEDgllqhM5JsrGn4ejfUGrnn2zL4klbwwl
         YUQZGYHrRM49tIV1b36o1QEJ+URfRYHookx3J8y6JnGMJP2pNTGktBxKWb2MpHF0EYeR
         3LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793761388; x=1794366188;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JODTwBcTg5LnDv4KmwCkQfqEz0wC3Hbmzw/64fppHts=;
        b=KWvR62zL5IMJpqJtIgWIWIotBoAEXkSm4Vvz+D8O9DfvyD4JwXbE1bAsjsT/C89v9Z
         6NYQ2iclYRCTFhPW74h0ArI1Iwsezc28fxFCJGn2Ha0OpTmMM/QArdEFzMtR7wd4C5L9
         AUsBSW306Zh3MfZ7j0onp+VbfpfEOeTWHyrUtTdxIqN2yyAm5y6gD6vsNWiyEzaxYlQX
         1TFUB1SuYaPurS8/1ceYoMHYmgsakC5gwrf1DQtDOhuoxXYw7XpIRAbvJ4WR1ND4sqdl
         m6DXwzOYDSXOtY1PuXtXvxrfeB6JT4ZfLsutrf160m2dymctDJjluDVE0eHnqgBQ9dfC
         g/+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/HdJymObUqRqZSpP5hKcD/iD1+E+DF+2nsLUqrxmX+V9YXHqs52IBnkZONk7GQkNIk1Kb65HrV8mc6Bm95XzO@lists.infradead.org
X-Gm-Message-State: APuU4Z9dK0iOVgFR8g2vU39znb9fa56HQ8SHYmaAYjKAxsncpT4uqwJs
	/DNmElFEjJ1FCr5iHtcqpqtggz+XnXuGX+p0W5Pr2jS563rgt0vQ8m0tQQoPEZKvQCMKtmpKj4s
	9aCF3Bs7tnA==
X-Received: from dlbur23.prod.google.com ([2002:a05:7022:ea57:b0:185:5973:326c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4512:20b0:193:9aa3:474c
 with SMTP id a92af1059eb24-1ac5ac4efa0mr21972153c88.21.1793761387538; Tue, 03
 Nov 2026 19:03:07 -0800 (PST)
Date: Tue,  3 Nov 2026 19:02:58 -0800
In-Reply-To: <20261104030300.1140180-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104030300.1140180-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104030300.1140180-2-irogers@google.com>
Subject: [PATCH v17 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
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
X-CRM114-CacheID: sfid-20261103_190309_293610_BD0F788A 
X-CRM114-Status: GOOD (  15.88  )
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

The hardware exposes two MMIO register blocks: the primary monitor
evaluates the System fabric and the secondary monitor evaluates the
VideoCore VPU fabric.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..2f1f4f286ab5
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,44 @@
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
+description:
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


