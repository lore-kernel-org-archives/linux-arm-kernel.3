Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA2C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvM8beBW0+j4a9DqUfRhNLS0/sPUgWj2CrOTeza38CI=; b=I60PpyxWX76sTil+m46ccK288w
	R87Ar73870uwyJvSLjeu5NxYe50aZPXQBWoZQpuNnNDf8A+teMepZSePRc2XV46lWn8pbU+9ZTiC5
	paD30jrdvg7ulQCuxRkJOXO6nFQefe5ig6yhBN0UpT9poAiHU73akVxXgqXeBpgdzsER7ztV+0zmu
	2RAOxQeshNNTFrQa9FcTtULC3ScnrjgrK2wfICBQruvuJaU1f2x6OHCWz8A1LvxzOkp0fcv9ZdErQ
	bMf+FE8/utyOOWT7ObhO7iZGgtYWpapfqpdfXGwhduhvqK2ASjAoX3/4kzToIGiyj88WZQ/DXKo6Q
	TG/uqNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHHl-000000002vt-1aIk;
	Sat, 15 Feb 2025 12:28:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHDV-000000002H2-1W9z;
	Sat, 15 Feb 2025 12:24:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso1260254f8f.2;
        Sat, 15 Feb 2025 04:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622255; x=1740227055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvM8beBW0+j4a9DqUfRhNLS0/sPUgWj2CrOTeza38CI=;
        b=dFe4m2oWBHPx1wL3U49OIl1ncJ8hcOpZ6PuRAq6yNQr0OpT1JVPmBFhR1rd0YLgdNz
         A/rh1LucNBnwmnjAcj2+ix4DPqEoGSnzV/5mviwXCGyaxRuZT6vphVJJt8qTM3lRNLnN
         OPMAksx96MfpgUs5wUm7t9xpK95uKyaPvzprCCw4ckLdO5aDfAlmLMINNhL+8gHSSiGp
         E5N6tBB+uWkqbIU4C4K9Q5l79PqFmr5W1tLJslulbAxZJBhzYxmXyqMBRvoag2qACni+
         1ausl/nOru11h/oPEhKTjL2Ea2e8/6vKLaQe4Mk/jFlzhM7h+gWSwWm2Io6umK6dcasC
         5pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622255; x=1740227055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvM8beBW0+j4a9DqUfRhNLS0/sPUgWj2CrOTeza38CI=;
        b=HthLJsGyeMyqo1PbKCz62A5MhOq9ACqx3k7cmC5/EZRzR8ZaPcSlQ3x61oj9ZcaTDm
         0CNZcY8SBp0zjBqq+i71gC3wLKQp/z+e4eIJTZjMKxwwhW3O7YmK1WawB5oMJsI2kYcS
         gWGK8S3+BbcKFfriEGFwD2sF3buHng+3zXBIA8KpkopnTm7pe4GKoavvpGc0qMK9sq/Q
         BbM70lJJGuQ/f7794P5ufMRiuser5CVQTvzvw9U4sXqlsyz+1fusJJl80YJGqjlgTjpW
         m+VE8UdBOuKNvrzhld+I4D6Zg9TXzv1/mCZcyW0evYmj8K7Zd/EqF4kaiASbzVZWsOOz
         TbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeE7h3RWd7lSE4gj7rDxnkSYCgWkM/0bYxvkwK249UFJhFyqtFp5QdSWZMEU4HMe/1x5Nb3x7q2Bg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRe4mL5ET6IJrWX88Zrho9BijSh23+b+hP2vz39ESqcjdcq3e2
	vYWTPwp9AGjB8XkBDnnGGDBrZlcx+VkL/ybq4tieXSopyV1jixHC+SN1jw==
X-Gm-Gg: ASbGncu/uDS6/Z64oOhgBEJ5h54BnBB6R05qTaRuutG+BM93xdDBWjJgGiZ6xR2rAdA
	omlKQj/eBvYV/IrUV/hTQzMO9HAFbWe1xwIaC37kjuKhQhiGJiPAsGtLwwvw5vzgf/PZPi6UZSi
	oexB7HBUV9amOgqDUxpNAo4wVEs/zjSc/IXKjPfqYoMzv5ptgCO7n9+tFvjAEH0fsAjLctw+22P
	T2b5UnJ0xp+a9iFhw7YI1Zb2sjd9l8NW+NpTq0/SusfCqdQv2pLHkloQA7Qige/DQirsxvvyScA
	qMHVAbj+aQYt31iJiY8x08Z3xMs3aZuEN+9W0gjJ2y6WWkpNzSJbliVzIhHhHQqdiWo=
X-Google-Smtp-Source: AGHT+IHRj3ctJwmFgu0FqPPD2xs6RgkuS/hjPZ4U863BoKmIKTy4qe9wWajhFwMjyim4BV4BthvZRA==
X-Received: by 2002:a05:6000:18a9:b0:38c:5dcb:312e with SMTP id ffacd0b85a97d-38f33e7f9a9mr4019150f8f.0.1739622255398;
        Sat, 15 Feb 2025 04:24:15 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5b40sm7188175f8f.68.2025.02.15.04.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:24:15 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
Date: Sat, 15 Feb 2025 14:24:07 +0200
Message-ID: <20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_042417_399235_11E5D74A 
X-CRM114-Status: GOOD (  12.35  )
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

The Exynos2200 SoC has a USB phy controller block that controls the
usage of USB phys. Add a dt-binding schema for the new driver.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../phy/samsung,exynos2200-usbcon-phy.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
new file mode 100644
index 000000000..468dc1560
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Exynos2200 USB controller phy
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  USB controller manages phy selecton for UTMI and PIPE3
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-usbcon-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: apb
+
+  samsung,pmu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle for PMU system controller interface, used to
+                 control PMU registers bits for USBCON PHY
+
+  vdd1p9-supply:
+    description:
+      Phandle to 1.9V regulator supply
+
+  vdd3-supply:
+    description:
+      Phandle to 3V regulator supply
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - samsung,pmu-syscon
+  - vdd1p9-supply
+  - vdd3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200.h>
+
+    usb_con_phy: phy@10aa0000 {
+        compatible = "samsung,exynos2200-snps-eusb2-phy";
+        reg = <0 0x10aa0000 0 0x10000>;
+        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
+        clock-names = "apb";
+        #phy-cells = <0>;
+        samsung,pmu-syscon = <&pmu_system_controller>;
+    };
-- 
2.43.0


