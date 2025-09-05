Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC8CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S8l7G2EepH8XkBBdvC2ecofLBYVddp2ctHowG/kpVt8=; b=pQ6pkaisLUYaEfkOUfNMKvN7Xe
	eVvCkhbPxHRjrDcthvDNYG6BUVV4PJA/UH6VWfSDqynjUsIWcTKcr38hV2uUQPiu5Pul45MCc4Q70
	UdiG/EWC+trq9PFBT4m0LzJR/b1sh+eK900cE1zYuBdVq6W61vuz+Cv3IZlksnv3dMdiIPCXjsVm4
	jwLTPRcLq6pTCMtS/oxVBqCnlaNcZh4rB6TLS6IaxccsSiiysWWpJCcptiOIlMP1ojlzjhjylUktS
	rwWOshYFjCEKfL/10yZkL/eMhPCNeD+Q5TPvVJM9+Yz71O9P5BxNhSgpaT7N6BA6sjLmKraAXfAqw
	OmT7PoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEm-00000002hIE-2dpd;
	Fri, 05 Sep 2025 15:20:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuS3n-00000000Sjq-0G2x;
	Fri, 05 Sep 2025 08:44:44 +0000
X-UUID: 8f0ca0ea8a3411f09f706fa2197c6ceb-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=S8l7G2EepH8XkBBdvC2ecofLBYVddp2ctHowG/kpVt8=;
	b=lQbNGBaUvqfAFqj0PgRdoSz2VsrnlJRlyu9tAhwyKRYFrkQRKIp8dpvobrpLVvtJA61KEHhMI0j8mU5BIJmeqJA83FfRcsdf0t38o1f8+YKTDlvSASGc+KiXXim8r87h4qE/qRL56WQw+KqyTDhVHUnTt1dNIx4Vo3y3uXx/bjs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:6d63ffe5-7056-4776-a6d4-32f48968e9c6,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:f1326cf,CLOUDID:373400a9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f0ca0ea8a3411f09f706fa2197c6ceb-20250905
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ot_zhangchao.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 203631056; Fri, 05 Sep 2025 01:44:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 16:44:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 16:44:33 +0800
From: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Von Dentz
	<luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Hao Qin
	<Hao.qin@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, devicetree
	<devicetree@vger.kernel.org>, Zhangchao Zhang
	<ot_zhangchao.zhang@mediatek.com>
Subject: [PATCH v7] dt-bindings: net: mediatek,mt7925-bluetooth.yaml
Date: Fri, 5 Sep 2025 16:44:33 +0800
Message-ID: <20250905084433.26999-1-ot_zhangchao.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_014443_101106_84F90C64 
X-CRM114-Status: GOOD (  16.89  )
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

Reset BT via BT_KILL_1V2_L hardware pin.

On the M.2 standard hardware pin interface, the MTK chip
has a pin called BT_KILL_1V2_L or W_DISABLE#2, it uses
function-level device reset (FLDR) to reset Bluetooth.
When it is pulled low, it can external shut down the BT
function, it is defined as 5 on the MT7925 chip, and is
defined as 248 on the device tree pio controller.

Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
---
 .../bluetooth/mediatek,mt7925-bluetooth.yaml  | 47 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
new file mode 100644
index 000000000000..dd24312735e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7925-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bluetooth mediatek use BT_KILL_1V2_L hardware pin to reset BT
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+description:
+  MT7925 modules provides hardware pin called W_DISABLE#2 to reset Bluetotoh,
+  two methods are used to reset Bluetooth. When an exception occurs, resetting
+  Bluetooth by hardware pin is more stable than resetting Bluetooth by software.
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7925-bluetooth
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      This pin can is used to externally reset BT function. When pull low,
+      the Bluetooth and USB interface will be also disabled. After 100ms,
+      it is pulled high to 3.3V to re_enable the device and trigger the
+      next probe. This is typically used on M.2 key E modules.
+
+required:
+  - compatible
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    bluetooth {
+      compatible = "mediatek,mt7925-bluetooth";
+      #gpio-cells = <2>;
+      reset-gpios = <&pio 248 GPIO_ACTIVE_LOW>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5959513a7359..d104a5821f20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14676,6 +14676,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,bluetooth.txt
 F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
+F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
 F:	drivers/bluetooth/btmtkuart.c
 
 MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS
-- 
2.45.2


