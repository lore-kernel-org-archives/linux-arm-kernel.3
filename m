Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E62606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oyecrWM7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H9lT2Nus
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=; b=oyecrWM7KzReebqAlPCbha2eqm
	RoZAqfYMbvumWGL8qsd38xeN1/507kCXNFseCUvzYNWRUegMmcpEhIqzqQoLUccovBiMt30H+6rgk
	8jUrctdUuWv/yOTabTjph3NkZ6GtB96KlM8ZCnZQT00CYHi7cYQH+eXhZoL6cVkAg+6B9dz8mAUxj
	VVyIJpmbqgpm5RTPRt/vynj1ac+Vz7fFfU8enUG1+l6Lg1IFntVDbqTYpTMnkcBNsnV/nVeYZIkEn
	jvuxmN5VO7RLhr5OCm9hacubwPw6Fkaq88SZ0CYzKZMqpn4RltCZjkudnQLMAHJmOiKY1oeNM6RXN
	f7nEAHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyo5-0000000Cs3c-03uS;
	Sat, 31 Oct 2026 02:26:57 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyny-0000000Cs1Z-4AS4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:26:52 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-705cb6ceebaso905365eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413610; x=1794018410; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
        b=H9lT2Nusba33lVBxnTVVY3GC/Cp5dVPd5MFQ5ccGKH2f3qLV9Zr4o5vjAzCklqf+4W
         XISUj7MTvnKPdGrocxIOXFE4DziqYkaPKNcykf2qvr6RiL4LIQebutN53Sm9jUFIbz/0
         sjWx7Qe+v75471k7CJcK3DWz+yd53XIA8YN/MbYgiZRDItm4lf3Vcq4dHBqfkKg0qwyq
         mzp0msbhdqi6k0rmmsMqW0V4CzC1IxQiHzzUfOWjOmYixWWMiJ9PN7/qr/8xnXSkDZJE
         md3LPYj4qdvR2vhU2vJBdQGhtRNxCITENOLdmdp554fA0fHFdtNHpBXtP7EvWjjA+meO
         tcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413610; x=1794018410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=knhN+uUso/I5nZA/3isy8rW61w7+X2wALPCWBAgmsNk=;
        b=uFPU+hENAXZSop9NsxV8eeZHy7sG+UlChpnnGmDIGGJK4t324Xt4yJWKUzi6V4+abk
         JAV3US175XwHfybk/629uSHiOy38TXOWAg8Ocfc8YG3SCBcKqLSahFDmiZr80jzvMF/u
         CktQsr5e86uTL6GVDxDgfTqwBAaSorB1KH7UMG6U/d/DVUmA/R1wwfErvhPLSoWQpugt
         z9wC1vuxnYWVOr6J+aTWF9RL4mbopfzUMuEgpQoSLFuULxdKIh0beClNuD8szA0rNqLh
         rFRNUPubA02NkKJUxM/hgjTe8x10NJDQQTkExyoLJGYEjn0dtr0DeP2bUK+O3/aYfvLY
         fY1g==
X-Forwarded-Encrypted: i=1; AKwUvBzxyF26HuIwDL08wtgPQA4MP/fGt+4MM4hIi4flDs0TpNGYzKYPgJlBdshDPzsO3BrJWZ6SL3DwdoWJMbAqPpXf@lists.infradead.org
X-Gm-Message-State: AFq9FYKkOWCBl3SD5zqukHG6Kv/5f1oX24iR1PwAuuk+Uue0zWqBVAM6
	QND7mYeKcPXTf5MCidt7/RzEVIxOl6588zddzehFLHRD3a7NxmO5elUP
X-Gm-Gg: AYBFou3FHtVcAcgsJgkc4befBpLBt9D0bdLR0VG8x/SKv9+iPgsWZmR98dp3hI4AZWf
	JAEWP0Gr/AYhPUaLrRa5n2JEg8iJe34naeOj04Qb0MGxmtxLwxAnEi+XHpFuU3pLO/dY0Bk2QSi
	xm94qP0pOygKh/j9PjUtBb7WXUpLPCcO6iQj7LkyanVN+I/NakZAQvKOJ9i9kPXNoA10i8q27mv
	Ii34Mt/wj0tJ7A5nRUWexd0J+zCTnJubshOPaLRgYmNXdvMcDBnPZ+Y0Njl69IuXG/K3PsNQmFp
	jm6mPLn6TFwtqjHY1Ld1EdOceRPAjmncmBFtQo5CObapSuXJzeyiOekc+6Cv7m9QRMDq6pXNzyP
	xP25VdOJRO9ahEA00V6DAWBndFDQw8PeTsZUdFz4wV1T2NmYhTmnoTA6mGhURdQrBEFQqM/tFEk
	Nyrb9d0UPvLEGhIiucggy4aWZPQXaPEA124h5K6uHbJmE3XSPjpzwqzY7nVofeW8Xy+kCkmN6hH
	OJKdBdg/G8LACEHflnuGBu0lEdiCFGk84MzrYBduUOxksiYuVYCU8u2cIMsTHnrZFD6Y3ZCybml
	KSNflPN+w7eYNJPolvYo6T6FWgTSld8tOqVngSrI+KlKF3ah9dzPcyDiZ3xynaNYOb5+pE4hs9m
	wd6/kgA==
X-Received: by 2002:a05:6820:7082:10b0:70d:9d05:dbf with SMTP id 006d021491bc7-714f27fe3cemr1676288eaf.90.1793413609920;
        Fri, 30 Oct 2026 19:26:49 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2e500d0sm3126067eaf.10.2026.10.30.19.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:49 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC controller
Date: Fri, 30 Oct 2026 22:26:47 -0400
Message-ID: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192651_051158_308F9245 
X-CRM114-Status: GOOD (  14.78  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,T_SPF_HELO_TEMPERROR
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SMHC3 uses a different DMA descriptor format from SMHC0/2: the length
field is 12 bits and the ownership/control word carries different
control and high-address fields. An older A100/D1 fallback would claim
unsupported programming compatibility with the existing sunxi-mmc
descriptor builder.

Give SMHC3 a distinct compatible and describe its register range,
interrupt, bus/module/storage-MBUS/MSI-Lite1 clocks and bus reset. This
binding permits an accurate disabled hardware description; no
operational driver match or eMMC functionality is claimed here.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This binding is a separate prerequisite for the disabled MMC3 node in
the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
operational eMMC path.

The original A733 manual and public vendor implementation distinguish
SMHC3's descriptor control/high-address fields and 12-bit buffer
length from SMHC0-2. Its resources are the 0x04023000/0x1000 register
window, SPI 164, AHB/module/storage-MBUS/MSI-Lite1 clocks and AHB reset.
The generic A733/D1 MMC0-2 compatible already in the base is unchanged.

The example uses the public A733 CCU header IDs. The tested standalone
base is official commit d89e1d186ec9271bf78e62771779e9fc03bf0fc3 plus
the clock helpers and CCU v6:
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech

The binding example passes dt_binding_check, and its disabled DTS
user passes W=2 CHECK_DTBS=y. MMC0 runtime tests exercise the existing
controller driver; they are not MMC3 hardware validation.

 .../mmc/allwinner,sun60i-a733-emmc.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..07dc6759b937c8998c4ca72cae027f9444a0793c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun60i-a733-emmc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/allwinner,sun60i-a733-emmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 eMMC controller
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+description:
+  The SMHC3 controller has a different DMA descriptor format from SMHC0-2,
+  with 12-bit buffer lengths and high address bits in the descriptor control
+  word. It is not compatible with the earlier Allwinner MMC controllers.
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-emmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AHB interface clock
+      - description: Module clock
+      - description: Storage MBUS clock
+      - description: MSI-Lite1 interface clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mmc
+      - const: mbus
+      - const: msi
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: ahb
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    mmc@4023000 {
+        compatible = "allwinner,sun60i-a733-emmc";
+        reg = <0x04023000 0x1000>;
+        interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_MMC3>, <&ccu CLK_MMC3>,
+                 <&ccu CLK_MBUS_STORE>, <&ccu CLK_BUS_MSI_LITE1>;
+        clock-names = "ahb", "mmc", "mbus", "msi";
+        resets = <&ccu RST_BUS_MMC3>;
+        reset-names = "ahb";
+    };

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
-- 
2.53.0


