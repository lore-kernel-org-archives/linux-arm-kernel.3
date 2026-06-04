Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0809CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp3CXR9786IlCOU/M2dXnjgdAwiYVzueeangPNGEtds=; b=cCNO3oMyhGIS9bGallxOT5eb8C
	mpn9Wb5LulmRKMDk3Cd313WV7spdPgy5iI/NMx0k+yHXBvsv1P/ukGslitBrd/zADlahqqZmkQJU/
	vGNIanjCGoDxwkkzta6vLKfMPZZwyx0o7zeVaO/KWpgCbRByDI+He/s1R5m85QWvpOuv2MITsyhnX
	Td8MlFwXq3Z01ehOuOQm3GH9ix2IICZ2BsWACccDlhdJUeL0K0bidoIL5glwJVtodvlUqacOw7ZTp
	NkOB6F/vDKTf7qUDb+jnY/QByM744JPbmd3HUBMj3k/WfvLa6/at48ckJoqHmJsqsm4LH7s0kDodd
	jOKOcgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66J-0000000Gd74-3OJ4;
	Thu, 04 Jun 2026 11:19:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66I-0000000Gd6G-3J1Z;
	Thu, 04 Jun 2026 11:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kp3CXR9786IlCOU/M2dXnjgdAwiYVzueeangPNGEtds=; b=Uf+fWco+kYl2fc1wQXxSlk6DTO
	qRluGN7N4NbAmvy0vfEWnfgGgOCYaxpHJfZLPZoqxu6M/BIZqhX9vzNG4zIkUdp14wO/+UD7ZCgwx
	qxLMK2iEvrdEbbAh0dkm7D156AHIPI53Le8XV8psEkuOO2G3A9LRhB8AcPtlrPW7+wQh38+CKGAGu
	3pyPagg7i8C6A0Jrma8x3SOAJpsS9cDCYEuZS9gLFQP48L8hW+EIMwpkz0ZWI2kGseWuzds0iTqf9
	gBEGBpuIaNrb2c9NhMYlscJDLdLHDodXUoOUx4IWt6NwLIkU+ZbFvibLwRphjM0M5vt38tzogguh/
	D95jh1Jw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV66E-0000000EEp9-44ID;
	Thu, 04 Jun 2026 11:19:01 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 654BILTF0299932, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780571902; bh=kp3CXR9786IlCOU/M2dXnjgdAwiYVzueeangPNGEtds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=dWU7W28mk3hUn247ZGwKCpLbiI0R+gXsdptVw+RDpZIpB91NYlTw3DwI2K6YpeOTs
	 iKDeqoaAUKyC1ppRT3Zc7IcRrEo/iY5+JZUmZCQx687L3rX3OLdNEzMtkkluwaEGXX
	 lSfKISLoxhKsOedBHFrJYOVaRQhQjJ/vSwLPanNydaqACENyAKKyo3AAjCWFMVxlMu
	 JWIkQX1uTw/pSDnjwrVMuMkT0joSdH9NSkQIGoOy6wyzbRiAtvpra53/Nh5aoC92wd
	 gNKawUSnOuKE85xhP6xCI7evl7OtNhmU7ohy1nurlC8pAAkc3hyBMFBmjQUBuOlV6I
	 d+o20mUU25afQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 654BILTF0299932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jun 2026 19:18:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:21 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:21 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Jun 2026 19:18:21 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tychang@realtek.com>
CC: <eleanor.lin@realtek.com>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <james.tai@realtek.com>, <afaerber@suse.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: soc: realtek: Add Realtek DHC I/O level detector
Date: Thu, 4 Jun 2026 19:18:18 +0800
Message-ID: <20260604111821.975624-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260604111821.975624-1-eleanor.lin@realtek.com>
References: <20260604111821.975624-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_121859_695401_C82228C3 
X-CRM114-Status: GOOD (  12.30  )
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

Add device tree binding documentation for the Realtek DHC I/O level
detector.

This hardware block is responsible for detecting the I/O signaling
levels (e.g., 1.8V or 3.3V) of various interfaces (RGMII, SDIO, eMMC,
etc.) and applying the corresponding pad configurations via pinctrl
states.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../realtek/realtek,rtd1625-io-detect.yaml    | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml

diff --git a/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml b/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
new file mode 100644
index 000000000000..badf27212dfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/realtek/realtek,rtd1625-io-detect.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2026 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/realtek/realtek,rtd1625-io-detect.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC I/O Level Detector
+
+maintainers:
+  - Tzuyi Chang <tychang@realtek.com>
+
+description: |
+  The Realtek DHC I/O Level Detector is a hardware block that detects I/O
+  signaling levels (such as 1.8V or 3.3V) to determine the correct pad
+  configurations for specific IP blocks.
+
+properties:
+  compatible:
+    const: realtek,rtd1625-io-detect
+
+  pinctrl-names:
+    items:
+      - const: rgmii_1v8
+      - const: rgmii_3v3
+      - const: sdio_1v8
+      - const: sdio_3v3
+      - const: csi_1v8
+      - const: csi_3v3
+      - const: sd_1v8
+      - const: sd_3v3
+      - const: uart1_1v8
+      - const: uart1_3v3
+      - const: aio_1v8
+      - const: aio_3v3
+      - const: emmc_1v8
+      - const: emmc_3v3
+
+  realtek,iso-pinctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Pinctrl phandle containing I/O detection registers.
+
+required:
+  - compatible
+  - pinctrl-names
+  - realtek,iso-pinctrl
+
+additionalProperties: false
+
+examples:
+  - |
+    io-detect {
+        compatible = "realtek,rtd1625-io-detect";
+        pinctrl-names = "rgmii_1v8", "rgmii_3v3",
+                        "sdio_1v8", "sdio_3v3",
+                        "csi_1v8", "csi_3v3",
+                        "sd_1v8", "sd_3v3",
+                        "uart1_1v8", "uart1_3v3",
+                        "aio_1v8", "aio_3v3",
+                        "emmc_1v8", "emmc_3v3";
+        pinctrl-0 = <&rgmii_vsel_1v8_pins>;
+        pinctrl-1 = <&rgmii_vsel_3v3_pins>;
+        pinctrl-2 = <&sdio_vsel_1v8_pins>;
+        pinctrl-3 = <&sdio_vsel_3v3_pins>;
+        pinctrl-4 = <&csi_vsel_1v8_pins>;
+        pinctrl-5 = <&csi_vsel_3v3_pins>;
+        pinctrl-6 = <&sd_vsel_1v8_pins>;
+        pinctrl-7 = <&sd_vsel_3v3_pins>;
+        pinctrl-8 = <&uart1_vsel_1v8_pins>;
+        pinctrl-9 = <&uart1_vsel_3v3_pins>;
+        pinctrl-10 = <&aio_vsel_1v8_pins>;
+        pinctrl-11 = <&aio_vsel_3v3_pins>;
+        pinctrl-12 = <&emmc_vsel_1v8_pins>;
+        pinctrl-13 = <&emmc_vsel_3v3_pins>;
+        realtek,iso-pinctrl = <&iso_pinctrl>;
+    };
-- 
2.43.0


