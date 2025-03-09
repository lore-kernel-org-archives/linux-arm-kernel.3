Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D18C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmZAJnwVdeb36PC0uWDUFCDQtkHDVfLiHfmoIbAgzmQ=; b=NuqvXWOEO1fCOuhwabqGfwtPTf
	iBNsQ6zCjPmZeXBx6P0gy3ULkcEINz7psEScGCSNoKGO46+NhRaqRdCz3+IutGYbElEcHBN6SDpmv
	inGEdrw9clTmB0fXcJLzx+9sW0jf5S0GI2xjioAbY9HTte9ICorfUo002CzrpmXssWzrpwkgI7wLr
	+DZ60urD76Y45tXFSdXJzTyCCtJQTNDZw7r1fB+JkQzgobE0gLoMhL+89JrbWZTN5md3w1IAHQNCX
	eqWnVtpXtKyBWkD3IZcvJGWzsV/bX5eLWLBXulc8Vs3xQtx1aKOVylxoQLgjiBAcTUZ5fHIe+aYgo
	P326YM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGqJ-00000000bad-0qtq;
	Sun, 09 Mar 2025 13:37:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGjs-00000000aQs-2fEx;
	Sun, 09 Mar 2025 13:30:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so1549096f8f.2;
        Sun, 09 Mar 2025 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527043; x=1742131843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmZAJnwVdeb36PC0uWDUFCDQtkHDVfLiHfmoIbAgzmQ=;
        b=KT5tf/KHhkMTiWxStrA87VkNlolDbdQ/+1SN7/91fckUY1h+9G3YeSlxDqtaqUbi1q
         HE/lsh185cXjJ2MABnjwdWgmKmcIqR7qf62WmXHiqdaWPO4BwN/P3eictEPtxSnaV9kl
         r3ad16RYvMLQX1Dh0EZvzMpSNblbQUU9cObG9MGCebYM4RJCvHidqmo+LzlwGaxetvhk
         udrE2qHgruXgo23DowGOCcAUivsdyJozuLYJ3R3XwqJngAu34jNxBFxF8yL8qOFvncMU
         Sb9tf0NR3cqANPaYFAfd3bigMIFflabGNoD0Nfe4NwJ7yxbc6ur6avrV2m35V2dauJ49
         Fuaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527043; x=1742131843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmZAJnwVdeb36PC0uWDUFCDQtkHDVfLiHfmoIbAgzmQ=;
        b=YBTdmWT8pPXA8ALnPDla1GYYLOjpfrdE+BXf6rjYSBSXQmnmx8nbt5gdrpT7pdTeub
         tJ40fDIUzkeIfHnIh+GJ5EbS1Rh8edjwrv3nZNMBbPlIf53Rr+rDMcd1a2qBI7WbH6dV
         3APzepEbvAAFaOwTTYS4c1wY/LnxywVdDcVzMfaWY5M+qN+5+KH+N0+PMCvxS3yi18Ku
         R/g1tKJJf4CjMJzWW9SsCl8fVwqPVIwDPcAjLtjl6065KqvhzIsd5bTkdekkFjsKx339
         Lbqr0eF2GqPPUuiDuptG8cTsokCytg2xjWFXYk0gqcFw805oOhjYV+/rkwCriEy4VwPN
         a2zg==
X-Forwarded-Encrypted: i=1; AJvYcCUsLTj49O0+NPuPRzLvDdzlKlfY7gI8DmvwgOrUDgDqj5jcexLp4kquXmwNMcCU1/2O7FoqaiSvg2Df7OIjtUY=@lists.infradead.org, AJvYcCVkxoU7S1F41MmuglrCaoRs212G6SWAzjLB5P0KRLZT9knEktPofNb1jwjlw2U18tuJle/hee6v5pm4d+dmz88Y@lists.infradead.org, AJvYcCVmuOKOFRFqJ/YWzOeWsiF0otAb5TU8Kq9nTfKPuTK1Eve5JzgnN2kaNisJ7yrAUpas0FCMFXPKpYVT@lists.infradead.org
X-Gm-Message-State: AOJu0YyMwqMJ0UU4A3zj5FY5oeK02Wkie5o4p1oVQpMaHUNURiaVDT/K
	yzWpedR4kXj0WaCtxVot8GjKj9EBec8+eaPJrZCrEBsIfM92xAsA
X-Gm-Gg: ASbGncu9pMFFWjClgCxothIsKIASMX1zISL7/L68EQWhIWUTnlTUJiQVYbAPQpcaAOH
	vzdxWzceJLOv66rkuZO8oiCmwsGxSUyBK8ksrzoobpw0Fhd2d844Mli0ZRVhRR4F2pU3/gcVw4g
	dAP0Ns93s0/gEXAUWY1MkgEEUBEKRGBglSb7MXkW7AVg+qJQbi10k2c+H/rKOQ7L/gWwqFOff7C
	0VUqOx7rQmfRSHIgzeHuksGIZIhrByiqqJ52fRreH/8o1OjId+kquzcd1f7Sqbbt0dP28qOJVsq
	rPwRUX6S2TEJ2EkOcCV4DPREqpGT7gxNlU4DWYsS6pdwuxlCBWMHYb/4Ur17HfNydAKbON+s7fk
	rVR60Lk4kR9nT8g==
X-Google-Smtp-Source: AGHT+IHYvjueTBKth2+iZLDZ1shgffPIvVWESl7zWZ3vriip/pFaWdphySinGg260hn/heKTJUJu2A==
X-Received: by 2002:a5d:64ce:0:b0:391:3bba:7f18 with SMTP id ffacd0b85a97d-3913bba8128mr2142759f8f.12.1741527042854;
        Sun, 09 Mar 2025 06:30:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 03/13] dt-bindings: soc: airoha: add SCU SSR Serdes port binding
Date: Sun,  9 Mar 2025 14:29:34 +0100
Message-ID: <20250309132959.19045-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063044_672114_B30F023D 
X-CRM114-Status: GOOD (  16.00  )
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

Add Airoha AN7581 SCU SSR Serdes port binding to define what mode is
supported by each Serdes port. These special binding are needed to
identify and provide the port mode from any user driver.

These modes are mutually exclusive and driver needs to correctly
validate the current mode for the Serdes port in use.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                              |  6 ++++++
 include/dt-bindings/soc/airoha,scu-ssr.h | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3eee238c2ea2..d3125268d63f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -736,6 +736,12 @@ F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
 F:	drivers/phy/phy-airoha-pcie-regs.h
 F:	drivers/phy/phy-airoha-pcie.c
 
+AIROHA SCU SSR DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	include/dt-bindings/soc/airoha,scu-ssr.h
+
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 M:	Ray Liu <ray.liu@airoha.com>
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..b14457c10d77
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+/* WiFi1 port can be PCIe0 2 line, PCIe0 1 line or Ethernet (USXGMII/HSGMII) */
+#define AIROHA_SCU_SSR_WIFI1_PCIE0_2LINE	0
+#define AIROHA_SCU_SSR_WIFI1_PCIE0		1
+#define AIROHA_SCU_SSR_WIFI1_ETHERNET		2
+
+/* WiFi2 port can be PCIe0 2 line, PCIe1 1 line or Ethernet (USXGMII/HSGMII) */
+#define AIROHA_SCU_SSR_WIFI2_PCIE0_2LINE	0
+#define AIROHA_SCU_SSR_WIFI2_PCIE1		1
+#define AIROHA_SCU_SSR_WIFI2_ETHERNET		2
+
+/* USB1 port can be USB 3.0 port or Ethernet (HSGMII) */
+#define AIROHA_SCU_SSR_USB1_USB			0
+#define AIROHA_SCU_SSR_USB1_ETHERNET		1
+
+/* USB2 port can be USB 3.0 port or PCIe2 1 line */
+#define AIROHA_SCU_SSR_USB2_USB			0
+#define AIROHA_SCU_SSR_USB2_PCIE2		1
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.48.1


