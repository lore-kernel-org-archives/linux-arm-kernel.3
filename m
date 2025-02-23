Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72950C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TbGBzUDvgVe7DZmZtqsqC9SxMmEhDsYTwwUDb5o6oI=; b=Vn5daBeN3r3DoN+b8LqKDGjWGb
	QQ45UicGakhm1c/Pm+y36N06EFlywQkDJfGOB1q3gOwy54Y+56ucR2p9DThceXonmAn9UtG5HnbOp
	rgnXAEuJ700ownyMuT6+kODRsXlwerYMXzdFvzEB0FEIT1yTrxVJ7joSE3M/b9iUOpQlMMfDQlbp0
	sQJ5dG7Cbk/PKbatItjPeEVySbEggrvo4Xgw0SNghpovzFfilBAdv4Ia5oGA1IHHNoUlZwUjjhh3t
	jcvkxqoyCSVFLIfhF6/v5szAuyl6tPKys0QF5/qRJs2Jwxq9PCOpd6PTksJBpEmHiur58nixM7rJK
	NoP36wsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB62-0000000B5sE-0yrL;
	Sun, 23 Feb 2025 12:28:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0G-0000000B4qg-1hYX;
	Sun, 23 Feb 2025 12:22:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so1901169f8f.2;
        Sun, 23 Feb 2025 04:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313355; x=1740918155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TbGBzUDvgVe7DZmZtqsqC9SxMmEhDsYTwwUDb5o6oI=;
        b=Kw33UKd6+71um4AmgkoL3O4PFB+bGr9dHcE7AfelFmvgZzZxHfBlLwXn66bU1YtxNT
         q4rNoo1wKxq6vI8AgIzg869Q8rS3B0FTNDL6nWwfxX9DhRrNqR/JOqkHhCSxOSNvv/aw
         hnzyhFRaWIOFqD4LnA9y/cVuyZHhErlr3dVon2js5PytCLBlq3ffOm7VbhU92PdfLH3i
         6udGCcaOIxIOzy6VcISeMASQjJKv+zT/XYMr7oA99yqrsOjm9ayuC/m5KQaX66nNHtoF
         6bfwy55oyezMu2Vsozlm8rLHy7zwoaedPXtBEpZlmiPGqjI+gSt0Tn/f1ijVTjib1xF2
         xung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313355; x=1740918155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TbGBzUDvgVe7DZmZtqsqC9SxMmEhDsYTwwUDb5o6oI=;
        b=evdAG0Kba18/FD2a+MQX+0ekkAXnIviKc+yMn7Sboqf4bXPqBIDGO8EEfc+Jr1OsRo
         ODle4sVc57/wkUwJp2ybHDiFfIzRcoY1E4a0n23F21U1Ce0GoT4UHHgJlhqBfa7zAYdZ
         zBqHU1GrwKwoW4V1kJoY/vAXIeW6u0PPF59BsQMzyVbIyGcHesGZbqYK9KCsTr2EcKkw
         NyjLmRMadTHUODq2uHRY25NmdakYy9poUCU2wdCRQtISVHGpVxu2s8hZAhdNrrHD/aiz
         xseLJQ24yqT8LxHVzzPk/9Q3ei63JwnLUgM/t81V/yQw2pUon64LpzALnDCggltJnncT
         2L0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL9dJhHdYA2+IrBMM1PIFd0y21LeCm1tYjVCZrM71Qf3jhZPAQtaIyS+leF4MtxNbcaGk1vMc/wfFKLtilGest@lists.infradead.org, AJvYcCVgI/llYbApWcLZp12qjPWxXJzMkYoVvHucwrtUMbXt8rwqIcox6TFxL5hOyInsfZd64d89l2XMTYxw@lists.infradead.org
X-Gm-Message-State: AOJu0YwHq4G7TG1Q/eGjynnla423CV6FlSpDB6PMelRP4LEyFwPxb7zh
	0VElHOBO81KKiTxYvs+cW+m0TSVNaU+xKUiIHVO6UEJB4yEcX1Bt
X-Gm-Gg: ASbGncs8r/W5byOFqtrCSey3FdEgWXutCHDK/IXipEf9b25KvgaekxMoKcHz1Lthzj1
	wCse/XiysPU3/9xde6TboO/Vo5N37Fx+IuyI0u3opDoJel+Kd0aFyDTRu3ELuC0pmfqXXtFtAr0
	+9u51rY4evTO1GUWTpppvv9JwcuG2ukVPf1QLRnAgI7BCrQ0dB8MAVM7Ksux0pOvV+2RB3tN3LL
	aBdh7VhIQyu6tOyKBgW3Z+4x+UY9aBU4H7ToopCBkwQkpzBS08vLRs8oV6dGbu/Ct1pWvw4vM0J
	WkT65vtG32bBQdVbZHTQC8hCkIUIsE8WVJTHkAM5emU5ke3QSViGzU3uiJFpBSlbhWlEV2gXz5y
	kJA==
X-Google-Smtp-Source: AGHT+IFMMFEPDMQAE9igHIO1s4NQHd7QMje6bLzkA+Bu0OEI2dPAuclKIJlYvuVA53CK1jDPbgzvtA==
X-Received: by 2002:a5d:584b:0:b0:38f:3b41:c952 with SMTP id ffacd0b85a97d-38f6e754b82mr7082161f8f.4.1740313354607;
        Sun, 23 Feb 2025 04:22:34 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:34 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
Date: Sun, 23 Feb 2025 14:22:22 +0200
Message-ID: <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042236_444911_6AA21475 
X-CRM114-Status: GOOD (  12.83  )
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

The Exynos2200 SoC has a USB controller PHY, which acts as an
intermediary between a USB controller (typically DWC3) and other PHYs
(UTMI, PIPE3). Add a dt-binding schema for it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
new file mode 100644
index 000000000..7d879ec8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Exynos2200 USB controller PHY
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  Exynos2200 USB controller PHY is an intermediary between a USB controller
+  (typically DWC3) and other PHYs (UTMI, PIPE3).
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-usbcon-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: bus clock
+
+  clock-names:
+    items:
+      - const: bus
+
+  "#phy-cells":
+    const: 0
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 PHY
+
+  samsung,pmu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    items:
+      minItems: 1
+      items:
+        - description: phandle for PMU system controller interface, used to
+                       control PMU registers bits for USBCON PHY
+        - description: offset of the pmu control register
+    description:
+      Should be phandle/offset pair. The phandle to System Register syscon node
+      and the offset for USBCON PHY.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - phys
+  - samsung,pmu-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
+
+    usb_con_phy: phy@10aa0000 {
+        compatible = "samsung,exynos2200-usbcon-phy";
+        reg = <0x10aa0000 0x10000>;
+        clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
+        clock-names = "bus";
+        #phy-cells = <0>;
+        phys = <&usb_hs_phy>;
+        samsung,pmu-syscon = <&pmu_system_controller 0x72c>;
+    };
-- 
2.43.0


