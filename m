Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E90C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 03:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzoDT/PRwDCtqMjDceenSWphVxRlBV2GwUms0t3AvAg=; b=kRDnQwVbrcDGUoONbi31cVbx9P
	qHDXe9hP+nHfB6zjHoM1lQnrG/Kf6hCZi/TXsQzH2OGs4PoR6JVxx7wbr+LKW80eQzaZIBvf+DnzH
	S5VJD9E+W35EAcgpesBR4GG/hDDJkA85WVHsOMJV43E1o0iyHNdbJGtQh45HHAGZX84Wv6UmkYtrt
	e08sFIjRGDkurkbEN+V3h6WdFlYgjg8k8wqVEgVzmnzkq1uUkoP9sAAtGnuRUfGEunWNPreQn1jHo
	s9YfHvkpFhXR+QmHw8aGlbeMO++DSD3r+5B2bUVh6/PMYq1X5yGFJHrblfw0974KPcbDvjccvNG67
	Awft5aUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KNI-00000000uWX-0pHs;
	Fri, 04 Sep 2026 03:13:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KNF-00000000uV2-0tlk;
	Fri, 04 Sep 2026 03:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RzoDT/PRwDCtqMjDceenSWphVxRlBV2GwUms0t3AvAg=; b=G0VB0nRABw12Ad3yiserdFO8fc
	zxX/zxjwh9PTsotGT1x7JtKSzPlKW4DuvShYnGdAvYXYujx4F0Pvm9IgaoC8A8nBdBonuFbFBYMW+
	8X/CpTDGp/nOyEJF6dUX05YXL8jEZ5cezzJncaEyr3ug7pj+mA2kitahTTCW9rzrXIT0zdmReYQiA
	7eZusjxZ2KL8RC2hHRTZp2WiaCGUHYfkojf2SAQNbZ36pYtFv9hAmSSvGb8RhuNRl/rvC4/RnxDIB
	A+hoOtHENZugwHnF01NrnHyt+YEDHMnT+j3aJ99hNCLGetzOoKXekCCOkmN0ykKPu2dAwiKoVb7HF
	6PmtEjJA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2KN9-0000000Desi-22hS;
	Fri, 04 Sep 2026 03:13:51 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6843CrAjA4114201, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788491573; bh=RzoDT/PRwDCtqMjDceenSWphVxRlBV2GwUms0t3AvAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=StYNBLrtcVS4gHkELc+RWNnqWj+mJ6xkstXljvlgZhLtyLUr2awySuZJdtAjPXU4t
	 Z2tp+tgjI3s/Lzw5GEgSL1+4n7sWUbzc5VYapTyeVTDuqCJuJX9JrHzXjMaT3ZrKEa
	 CVvgggKUEtQulq3gymSrgpAYNmOKpr4My+K5m3INANFCvbMDrZ8r1d6X/9dJAq2M2H
	 6+OeDI7vCN84eIW8td8qeGWJiEatUxkOGtoXwZsIcMSKYJOgmHSm+mMyYQPFWkO81c
	 Sz9g2MVt+G6oGl/Oxu5wVexctFd2RTwyD+wkw2wUYmBDFlto6w2nD8r/Msaau0e3KF
	 YOWy/6gy06hCQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6843CrAjA4114201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 11:12:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 11:12:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 11:12:52 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 4 Sep 2026 11:12:52 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, <jyanchou@realtek.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: spi: Add Realtek RTD1625 SPI support
Date: Fri, 4 Sep 2026 11:12:50 +0800
Message-ID: <20260904031252.244280-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260904031252.244280-1-eleanor.lin@realtek.com>
References: <20260904031252.244280-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_041348_577802_ED270D0B 
X-CRM114-Status: GOOD (  12.16  )
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

From: Jyan Chou <jyanchou@realtek.com>

Add DT binding schema for Realtek RTD1625 SPI Flash Controller

Signed-off-by: Jyan Chou <jyanchou@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../bindings/spi/realtek,rtd1625-nor.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml

diff --git a/Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml b/Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml
new file mode 100644
index 000000000000..2685ca3f851c
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/realtek,rtd1625-nor.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/realtek,rtd1625-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTD1625 SPI Flash Controller
+
+maintainers:
+  - Jyan Chou <jyanchou@realtek.com>
+  - Yu-Chun Lin <eleanor.lin@realtek.com>
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1625-nor
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: ctrl
+      - const: dma
+      - const: dirmap
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - "#address-cells"
+  - "#size-cells"
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/realtek,rtd1625-clk.h>
+    #include <dt-bindings/reset/realtek,rtd1625.h>
+
+    spi@14b000 {
+      compatible = "realtek,rtd1625-nor";
+      reg = <0x14b000 0x50>, <0x14bf00 0x30>, <0x88100000 0x2000000>;
+      reg-names = "ctrl", "dma", "dirmap";
+      clocks = <&cc RTD1625_CRT_CLK_EN_MD>;
+      resets = <&cc RTD1625_CRT_RSTN_MD>;
+      pinctrl-0 = <&spi_pins>;
+      pinctrl-names = "default";
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.43.0


