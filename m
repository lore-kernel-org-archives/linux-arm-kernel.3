Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=49iGwJwa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ANalTGz+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=; b=49iGwJwaiYH5vU7jQMfk83DNj4
	B4Z5c8yXYasSTwG4lS+MWlh3oAW5ein51b+kWdI93nGdpoi2qTb/1RqSD3n7xT6K60qHEt/UDAgRG
	UiUoZopKgeNmGe9R4dtICqyVrxGg1OwxgXLHrkTQp7hcKJtui11Oxr2oyuMy92tKTEvH3KUA7Tk9y
	trYuFAEJNFUV0lzqLGLIaaYqjDJ5/4tQJyzTnEDA+obTmj1+AquAXZj5L9hQr/Nn8OY3MdAcAIvtq
	uQdHBSOEjeR1tBhgHnVJhFwgepjSHaBLu4j2VrMs3Wdbic9Hwqr/urJg1pB+iaIRfVO1zz+DEwoUp
	f5gLQ9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAsa-00000009x53-21ij;
	Tue, 20 Oct 2026 14:31:52 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAsY-00000009x3n-0CqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:31:51 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8a06e79e152so908368b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506709; x=1793111509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=ANalTGz+rjlj9TFn9Ecd3d/KUEmkNYO0wQUvxtjxXMLeetxDuDlj3+m2jp2a8SNXEZ
         IrSKInLwQKMuuv+iDpWNSpwkxVgqUepiOqImq6vQ8xBvUCgdUIgG/hGnXxTtd7GdvuQm
         OL5fWZShuS1FdjQExIEUUFv7KvOhzyvLWoDOEbklAlzdc3NiDedMO0jem9RVHm5eS5UH
         UlYmAzDzJCB0l2hsItdWfWDdjV/vAKxeDBOx1IO2VTTK6kYcoiTm11SWmmgEFnEmBXFd
         eYsJ9ly45vOpz6rY/Rh34xlRNpmObW9GZ7TMrmMYO20FE5S+GtH+sFN39qV35fnAxl+w
         Lh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506709; x=1793111509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=0Lbdyj1yJAwJwx64iNK5HjCmf4WA2obqzIZTU/l50gPp7Rbk02Sg8jBjeZrbx7dpu8
         y923A4IgNjrWNZrTXYlKx1gxCmFGHPzANy39afOpZPsKskIJ/OOmG8efFpelA016hby8
         BHLyfmx3/lbdPo6WB9fxKG6gScFPNW0vwJL+dSLYqn7Kl2RWk2riv4hDH4+vh/FkNsJV
         CbaijQieBpWt/w73f0szv9nL73zAsJBKPBqFAuraFIdKQI98MZ82xSic6g43rAcTukrj
         K9PQb25aAqSx4ZSd4IgBKrVxXvKjroCgIE7OHcVBN2YUXdqNE22hCx2f7Nii5uPbHgAW
         tYtg==
X-Forwarded-Encrypted: i=1; AKwUvBygUxx6EtiAZcDbMf3CgkSS9oVsO+Rth0In5+uk/eP1LWqY3hbIRA/kJCV8ffeanbtkzjZn3q8ZWnNJlt3dPYN1@lists.infradead.org
X-Gm-Message-State: AFq9FYIfzz/99OqnODxzRA558Jn8iZQehuKDE2DekM4b56IaNzaaeFps
	rToYAj+v0BpctT3OJ+VPAPKYl5lXVeKyAAXj6nwz75cVfbOPKRpvbLwT0trCrlGPveA=
X-Gm-Gg: AYBFou286S5zhcPtM1UqE3cPX7mkKmWFYjqCYBRCNu1Dya/Ghm78TlEluwSzFfDGIWj
	m8RX7RDmW9rL5OnvZnKxIGxDI32MHKITzPYFYN6AEdOBJOTbUeRCRnBe/9Gflsq+ym+gCAzKlJC
	fv0alBLGABO6qJ3UhxwvU5wzUt0rERISZfz50uNvtOTYiUZ73TWxeb0aaGwzx+tvH3afM6ZRXxe
	I1QEqpbOal5dhE6Yxyia7pgCIS+3qu2j1FdM7PLZKcSvs/lNdNOL05De5fEBK/4aJQwf6SoIyhv
	eeYbtbzQAxctucHk5OweKBXbPHscYF3RgUBlqvn5kc7/2zJSzPuSBXTxYKRCo5/k0BHzAJESupr
	E18qRHMJsMmyJE3ThrqPln81i+rWo4wYygw931u60HGZoDkejezoPmQfXvXbklxrjZGcmKup2Fo
	1lfHtQVJ+NThebhsiZkCM/0bfr75PACZkIP4i05J+Hu1+GoFzH1dr30fhTJirC/XkgllrxSdjru
	XlOPYqkW1mPWUmj/Rved0/h/Gqm1pytXA==
X-Received: by 2002:a05:6a00:4f91:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8a04be20ccfmr8218788b3a.32.1792506709197;
        Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:48 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: sound: add Everest ES7202
Date: Tue, 20 Oct 2026 22:31:31 +0800
Message-ID: <20261020143135.623897-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020143135.623897-1-jerrysteve1101@gmail.com>
References: <20261020143135.623897-1-jerrysteve1101@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_073150_113749_63DD3092 
X-CRM114-Status: GOOD (  13.98  )
X-Spam-Score: -1.9 (-)
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

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0


