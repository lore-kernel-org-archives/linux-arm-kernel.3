Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D821061B39
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R54LgNHSFQobFVsX7fHxSQcvp4mTFC0QLJ2acEvsUu0=; b=FZFoh4+EBwZch3VqOuWVM5bRIR
	ILXbgkZT+Xb5P+r5VgNoOlQJ8gnZXf8dZj6yRxRgL+ycCBgYgzVtwdW+sEzhzxjBX+uQUl57fXmrU
	0YHtF+tEgFsXdf5c/ucaJucGLFsEbp7MIkZaNKU5c5BSWEfsqIrGh0cNA1oNAxF+NXvgRdbCQs2mr
	RYTpihqK5T82XEbUq7MFShYYDuCgcingRIPS+aDDWH7Ns0Xd2SyrB88DgOl+nb0dDr7uz/bN311RZ
	lEm9QLUNPmnZml8U1v4YlgQCLV6rC0UNT+B2IAPcsEq+1w/0V6vWbl9t+cbX2pRNeKg2nVALn/0Cm
	Los4Ox9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTR-0000000CtHW-0rD6;
	Tue, 31 Mar 2026 11:41:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTK-0000000CtFN-0J8o;
	Tue, 31 Mar 2026 11:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R54LgNHSFQobFVsX7fHxSQcvp4mTFC0QLJ2acEvsUu0=; b=mXNjvJrJ7TMK8DXM6A1PxvpzTO
	8rvkXxwBN3H61EWzt9qKz1WCGAHohUFo/oG6GLUEoNpW7BSEMtgyCecsZerr3hd7AC1WZSxCjeONm
	KEnigE/AzJ3ReoLyjlEj9Kalaev/m1qMW4IuRV7Cts+/mnCxHezFS0dzzjuRd2IfNMMSCBwDEEX9E
	lHcMJY6ndRoo54QbNoYm+mzVLcfqNdnfAJNVCHcDSuEQEWzl+cRFmxMpNwW1jUYjtglOkEdD+JT7c
	hzc7K0jsrv2FfkF20RWaYgksv4GHZSoRCpE9PZgGZ0zMcaG/PHaZ91gyAY7UmS+e4nMFeliBDPzF5
	SxRk3MZA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTE-0000000FnPp-2VvP;
	Tue, 31 Mar 2026 11:41:24 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62VBcZbgD3149080, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774957115; bh=R54LgNHSFQobFVsX7fHxSQcvp4mTFC0QLJ2acEvsUu0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=tsHvh5lNzoiQ+YHoqn6jZtfHdalvYo5kI0cm/1ZfK4UWlg1UoGjaECW6jsKQo5D54
	 ZO54s58KfMspsCXJFa1a/+qAhT9DywFtmu4rXkLAf/sVxINdgG4E16YCEA4w1R1s+D
	 SOeSBT+oEL/rbC48rcfM8yorE4izp+sPgel5sYmQB4Z101+XGD7SPbWKO7ngyU88+j
	 J1VVxoocQJvC+rYfh3YwBjj2NBzZ0J6aQsJamtb4K+7LizZqciodPuJpWSQfh9vhdc
	 o3vymAno8Nr7rdBOrZqeSV3uibkeupVZ8vwgEVaVXPFFPCw9FgzmMnTkVpzIN7dgiq
	 w4szu6zwXlReg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62VBcZbgD3149080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2026 19:38:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:36 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:35 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 31 Mar 2026 19:38:35 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH 1/3] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Date: Tue, 31 Mar 2026 19:38:33 +0800
Message-ID: <20260331113835.3510341-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331113835.3510341-1-eleanor.lin@realtek.com>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124121_311484_969F6BEF 
X-CRM114-Status: GOOD (  13.90  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add the device tree bindings for the Realtek DHC (Digital Home Center)
RTD1625 GPIO controllers.

The RTD1625 GPIO controller features a per-pin register architecture
that differs significantly from previous generations. It utilizes
separate register blocks for GPIO configuration and interrupt control.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../bindings/gpio/realtek,rtd1625-gpio.yaml   | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
new file mode 100644
index 000000000000..e81d13dfefc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/realtek,rtd1625-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC RTD1625 GPIO controller
+
+maintainers:
+  - Tzuyi Chang <tychang@realtek.com>
+
+description: |
+  GPIO controller for the Realtek RTD1625 SoC, featuring a per-pin register
+  architecture that differs significantly from earlier RTD series controllers.
+  Each GPIO has dedicated registers for configuration (direction, input/output
+  values, debounce), and interrupt control supporting edge and level detection
+  modes.
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1625-iso-gpio
+      - realtek,rtd1625-isom-gpio
+
+  reg:
+    items:
+      - description: GPIO controller registers
+      - description: GPIO interrupt registers
+
+  interrupts:
+    items:
+      - description: Interrupt number of the assert GPIO interrupt, which is
+                     triggered when there is a rising edge.
+      - description: Interrupt number of the deassert GPIO interrupt, which is
+                     triggered when there is a falling edge.
+      - description: Interrupt number of the level-sensitive GPIO interrupt,
+                     triggered by a configured logic level.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-ranges
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@89120 {
+      compatible = "realtek,rtd1625-isom-gpio";
+      reg = <0x89120 0x10>,
+            <0x89100 0x20>;
+      interrupt-parent = <&iso_m_irq_mux>;
+      interrupts = <0>, <1>, <2>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      gpio-ranges = <&isom_pinctrl 0 0 4>;
+      gpio-controller;
+      #gpio-cells = <2>;
+    };
-- 
2.34.1


