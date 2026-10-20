Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0E1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qx/DZtXJ;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=E+joAH90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpZL/A2+qsi8uhO6SICkf1CtFQ2dmgcD/wuRkz2Mz9k=; b=Qx/DZtXJNCF3ofjZN/TVvgY9v+
	FpzMglqMG2NPbTVN3eYmQ4cidxZUEMB20gujxEdjwPkrydZIDENvZWabVlI9y9pNA8dhSzlrb0Omf
	5I38x6UiZH46F9oK9N4Ugg0bdUrm6eSlBGSmdxH0g7EnltQHQmn9Cp4dFpq+p4210Ch5Q5RmxR58c
	p1zTE1Unh/ISqWvPELL5ACWfjVt4h72X3BVSQzNUK6zSU6cq6vq0SfjsUSUVsv9a3MkrHhJURO3vi
	1fxOZ2c43nrDdhbsxNOpk3+StzRFtmajS4iQM4aOoM6FmHheQCCk0cSIIW7oUafg2Z63ZXkq5YwmA
	B6KGeWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ47z-000000090fm-3HRD;
	Tue, 20 Oct 2026 07:19:19 +0000
Received: from mail-westus3azon11021120.outbound.protection.outlook.com ([40.107.208.120] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ47w-000000090da-2Jlx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:19:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vps14CL2MPj1BXeUfROeGE0TjMG51bOaVkLL7nbkHUojHuFqM9LeO5O08EWblFknzReeBHOufDybo0SIo474yuzdMPm8gtn/75vvj7aps532Q6I5j8bFOS4/LDKht+WLymHZQNLIap7c7Z9lqTeliYkXZKK3os+PaTQJLwzNoD2KbtIEPuLCE96xYmRQujjfOexG7OGLF/cNAUkQ2JuzEeaE1FZom1l+UC6iHSM4hwtln5L+uNO4QwU7nnNclXwn9BPfjYHpNbnRSUfjHWSpytmOepeg3eBDbPVJOsLdX9ZpI0Dj9symv7ELevunZiruorfviywup+5VtDjpBX+EQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpZL/A2+qsi8uhO6SICkf1CtFQ2dmgcD/wuRkz2Mz9k=;
 b=c9bnDVsEQTvqBnnZMtKJv/3jkTOIzPsiGfgW7N6/IGptUu7noAzOmIjpc+inA7+YS5yYgzMActHw+DFsJcHzbHd9lp4YwcPJnHrlZPTOtmfunaNkehxOc82gCaTMjn1vt+3niyhgPT5g5mfugpxuCws5z81fO+LoTT2Z27ZIYuv5tk//bGF/5+uER7muihH3Sulm2bsHXTRuvq4Ra2QTtIpqFcghNbJyCPcMzoxmeqLi3boRCDj/jUDILi8babwnr6Aw+fj0va6k6TsW7erHV/bctb/b8mAGc7+qfakgry3p7uGTlYIA2CMCJA8FvAo3GkJ18EpCfLPdzURPMd4gvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpZL/A2+qsi8uhO6SICkf1CtFQ2dmgcD/wuRkz2Mz9k=;
 b=E+joAH90/d3QMuHBnQtjhCJ0ASEvdpcQGRzOUGwlZZffKsrY0bu59pjLoiOEvCVwPHJ+sRmx6+iF5jQwqAu2eQ1o4fBtHhGap+m7frQMB/zGFXCcYAwMM3V8x08AOo769jPvQnYo/6koetEWME3RzxGTl4sWd9LKVUtFT6apUz7VF8BIhXnw5oelumCOkLi0dtJznx2+ti25ui5DqmLKlPioko2WyEdix8DDjvcwR4BCU3Kcq4tr78VOkIQv73uJExaUFQqzOY0qSFo1o9AvRsKzC70oGq7Od49wEymQEfesXWq96Z9aXew11Q+6B4/fDSGukiMQuDkSxbTm9IFTgg==
Received: from DM6PR07CA0115.namprd07.prod.outlook.com (2603:10b6:5:330::6) by
 PH7PR18MB5379.namprd18.prod.outlook.com (2603:10b6:510:236::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Tue, 20 Oct 2026 07:19:01 +0000
Received: from CH7PEPF0000001B.namprd21.prod.outlook.com
 (2603:10b6:5:330:cafe::a5) by DM6PR07CA0115.outlook.office365.com
 (2603:10b6:5:330::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 07:19:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH7PEPF0000001B.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Tue, 20 Oct 2026 07:19:00 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 2BC7E4186B58;
	Tue, 20 Oct 2026 00:19:00 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 20 Oct 2026 00:18:55 -0700
Subject: [PATCH v3 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-axiado-ax3000-usb-device-controller-v3-1-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792480739; l=3567;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=bEliB/uHqZMvmN73vNuz0Gy/A4MeC70lyvrvuvaleto=;
 b=NeziPrHzzys7h0zKAqAcnVbKSwgi2vFEoTWeQJlCQ1w+p25p6g6RCIjqHppvtTDtenInUG0AG
 2psM5TWZNIUAmfcp4cmq5S+f7Euif9pgllXSXlqF2SaRP9xXNNj2lTA
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF0000001B:EE_|PH7PR18MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a81ab46-a644-462a-f382-08df2e7a6a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|7416014|1800799024|261009223027099003|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|13003099007|5023799004;
X-Microsoft-Antispam-Message-Info: YbTTi83CvS8Ynywc/loP3dEyrRBeR3uSvz3ICihjZ74uoA93oUvkRH99ZZlM6VsvmRALUwxbOAmKaXQISMne/IcCs8fG1VFDrGSJexWhlQRh/lHqJMKEvIxR0c1h4GtUs69adLitJmG+txv990TC0Q+wpmx2PE6VsHQkhu80y1xCMPdZnpn+JbNg4U9n4nhXdBqrHvahvBSxFQ+XoBxy2qcJ5gNqhvXhQMap2N4oiH6Fm6UnDEKtKlcdbdbWPvcFN1kMBBGXQOdKFcFI2uq/O8jlEhkgLy6g89TKEnwgDsh1WR+I/QXYnRV5Y7NM9dI8girkzWN2880+EUqDJYW2dKLdyjsJfI+u/Po/IsgQEotujntx9dAfkHmjEf9nnSUBU0u7hSkW8WC88QMcCVWHyHFQb/XDkfjODb2MWeUJBpBG2j/FSLrBkje+EsPEJQyNesBox5CNg2wgvaDLN8CCEDnBA7FwRJm1scwALoubd2/GPPin8qSqoOk1XkCa3wiBfIdwoVz3F0D139IPvbWOu1mhdXHAyuOkyul/fUECQTWOwPNBcUVCtwoq1eBzDxeUiHM1eKCeauX1zei3gR7gf7+3bBHhIKIdDhpEReVaTmmk7ZcRZyI1vEIA/dVJ8cj2ww+LE8EiWWxF1NNbbOKW1w==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(7416014)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(13003099007)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6HYaMY9ZUkc2MAoAxi8xKLbT1DOb3sQJXUZHZit8DjfB6kHa/n2Xiv6aBa6PgoivIvV5R0H8s1p1FG2XkraksfrmFEaBFDzToTskJeTWzgdtzuIFJn6zn6V+dQMsVgOh5/dW+eercZoacMlbBJvEy5vFbnIx/vZO9T07xTR5JUonXedn0tZaiA057pJxhk4tXxYdGnnfO49jVqHOBKhXVTjUWRQwvmteZHfTO5srpsY7mCd3FsVsJXIx7YN2NNETmVi4YXZQeHDLOnnayfFcvr2O/pUKPNIdbikOA4XopSFjqYXGILI8CPx+VBaVafcRENd/jsA9GWfW7EVvQ9v9mt5YD5HAOc5ia3iu8/jPjA4EmUzPo96lrGrrk6NQrTczbdCRU5bo56+T3BJC4JiKIyxOJ6NOsXuBTYvqYW8DzX+IzTN3Rz9CyrDhumEWrcKS
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 07:19:00.7635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a81ab46-a644-462a-f382-08df2e7a6a18
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: CH7PEPF0000001B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_001916_612969_1D4B6063 
X-CRM114-Status: GOOD (  12.92  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a Devicetree binding for the USB device controller integrated into
the Axiado AX3000 and AX3005 SoCs.

The controller is based on a Corigine USB 3.1 IP core that is
dual-role capable (device and host), used here in device role. It
provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
supports control, bulk, interrupt, and isochronous transfer types
across multiple configurable endpoints.

Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 69 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
new file mode 100644
index 000000000000..b9f7f4879ee0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/axiado,ax3000-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000/AX3005 USB Device Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  Axiado USB dual-role controller based on the Corigine USB 3.1 IP core.
+  Supports USB 3.1 SuperSpeed and USB 2.0 High-Speed device operation
+  with control, bulk, interrupt, and isochronous transfers.
+
+allOf:
+  - $ref: usb.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-udc
+      - items:
+          - const: axiado,ax3005-udc
+          - const: axiado,ax3000-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@81200000 {
+            compatible = "axiado,ax3000-udc";
+            reg = <0x0 0x81200000 0x0 0x100000>;
+            interrupt-parent = <&gic500>;
+            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&reset 0>;
+            phys = <&usb_phy>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..58c5c8e00870 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4508,6 +4508,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
 F:	drivers/spi/spi-axiado.c
 F:	drivers/spi/spi-axiado.h
 
+AXIADO USB UDC DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1


