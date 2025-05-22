Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84A6C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4al1jfV+gfDcE24VQEE5ZPdX0f6fZQNGeI5FgpmdT0c=; b=Ohaojzp79izBMV0LRBdlBJED9h
	4lNw0EltbN2SHDWHK86+MyNDN3an0U47ln4Pp08qYVJLIWyuK1yZWkEi+dLRNiaXN6sRiQZJE+i4D
	QP5sGNqNXgk/eBki4QCLNQeNXDhXYb9ukBGFdVF6+p49NWD9A3bN6ysXpHA+SiLX+xOEBgwV8uw7t
	+HJ3ALIEJ9o2HDN0RvoPRdRGfykWIFLimex0Fmownt82NLUDcmsNsIXcmIoGGNLQc2YMEpSgVCT18
	TIEJsdVRSCNFdShWLDHmVnf0J7cCbyOX3VyCehaKjY0aULVBX6OXlPKHmMxuQ+r56kKTB8yi1UrTN
	WAFDSFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0im-00000000BgE-3C2j;
	Thu, 22 May 2025 07:52:08 +0000
Received: from mail-m3273.qiye.163.com ([220.197.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0dE-00000000AkE-1P16;
	Thu, 22 May 2025 07:46:26 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1605e6616;
	Thu, 22 May 2025 15:46:19 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	cl@rock-chips.com,
	kever.yang@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: can: rockchip_canfd: add rk3576 CAN-FD controller
Date: Thu, 22 May 2025 15:46:14 +0800
Message-Id: <20250522074616.3115348-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522074616.3115348-1-zhangqing@rock-chips.com>
References: <20250522074616.3115348-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhKGFZKT08ZTkpJSkJDH0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96f6f5159403a3kunm9938470210de7df
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6DRw4EDErSRIdFDkIDioR
	Sk0aCg1VSlVKTE9MQ0JCQkNLTE1NVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUhNT0w3Bg++
DKIM-Signature: a=rsa-sha256;
	b=FK15/UGOrM1d3ijQsGPHOP+kfPIGzLjpaJ3Cy7BZp44G70Jxtk1kJn8JZU7dNcEQl6zRNByLFT1r/PuuA4LbYoAXM8ogBb+DqdwJ7hNUvG28VWYMOL77J9rcn6XKXu6lkzR32R8HJLojpd+9+cQzLYsXDXe65JidE1s9o91Bh/8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4al1jfV+gfDcE24VQEE5ZPdX0f6fZQNGeI5FgpmdT0c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_004624_998966_271E4D0A 
X-CRM114-Status: GOOD (  10.95  )
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

Add documentation for the rockchip rk3576 CAN-FD controller.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 .../net/can/rockchip,rk3576-canfd.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml

diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml
new file mode 100644
index 000000000000..c4526bfe2073
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/can/rockchip,rk3576-canfd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rk3576 CAN-FD controller
+
+maintainers:
+  - Marc Kleine-Budde <mkl@pengutronix.de>
+
+allOf:
+  - $ref: can-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,rk3576-canfd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: baud
+      - const: pclk
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: core
+      - const: apb
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: rx
+
+  rockchip,auto-retx-cnt:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: After TX fails, it attempts to automatically retransmit the number of times. If it is not configured, it will keep trying to retransmit.
+
+  rockchip,rx-max-data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: CAN Rx data size(unit word). CAN frames can be configured as 4, and CANFD frames can be configured as 18.If not configured, it defaults to 18.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - dmas
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        can@2ac00000 {
+            compatible = "rockchip,rk3576-canfd";
+            reg = <0x0 0x2ac00000 0x0 0x1000>;
+            interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru CLK_CAN0>, <&cru PCLK_CAN0>;
+            clock-names = "baud", "pclk";
+            resets = <&cru SRST_CAN0>, <&cru SRST_P_CAN0>;
+            reset-names = "core", "apb";
+        };
+    };
-- 
2.34.1


