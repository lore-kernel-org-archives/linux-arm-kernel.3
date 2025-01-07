Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C919E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdLym5gWP7Ggt3zKKLw5r/EC2/WqbZu0Dz4bqOTYEU0=; b=WcrmABGx82FAfnHOds9fqjpGZ+
	NfewZcfjp+vU6c+ywWgxDNV8XgH99xESXymq+8ZLtFJQzFJgvzDr0Sb22L034kNmaU/GlGJ4Omngm
	pzBEuSPtPUCFVq24yG9IEAqEImlIUc/Tp/BRoP0yCkZaqplurJ4tBqBfx/eE2PxpSDqVHbIvdbrUr
	SRWmnNrsKfxBiw/wHLuD2doJKJdV7KUXcPkMXQ3wP/JZSXb7ZFgfTHHE3kK5eoAIR5XO1H0rE02FJ
	+e6YfqiDdU++sE8izzph9lbFySJgRqU7afeC8Pnv+9Kt+0c0BeMehZhYY4fGtFjJTKzKgCX0Y3Khq
	GpLuicMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Ta-00000003pDc-11R7;
	Tue, 07 Jan 2025 07:58:10 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4L7-00000003nlm-3L4x;
	Tue, 07 Jan 2025 07:49:29 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f3b5a97;
	Tue, 7 Jan 2025 15:49:21 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org,
	Tim Lunn <tim@feathertop.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/7] dt-bindings: arm: rockchip: Sort for boards not in correct order
Date: Tue,  7 Jan 2025 15:49:09 +0800
Message-Id: <20250107074911.550057-6-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107074911.550057-1-kever.yang@rock-chips.com>
References: <20250107074911.550057-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1CTFZLTUIaSx0fGh8YS01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a943fbd59ba03afkunm7f3b5a97
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06Aio*FTIRAxM3SSo1SAEh
	Ti0aFD9VSlVKTEhNSUhNSk1JQ05LVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISUpLNwY+
DKIM-Signature: a=rsa-sha256;
	b=hYHrX78dVT9Z2Cm3e9bxy0rM7H+FPJ5m+rpzZPbtOlTqP2WpeT33VTPzQ54M0yWDqdnMcm8NkR7gg99tTJNz0jIM9W039ZDiAP9EzNBTC5cVXJnAAff5oZVC3xhk9RsHSaEjPmM5sYnVPwuZr5vHADhsl0+SlUuDXkSfvh0zf7I=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=JdLym5gWP7Ggt3zKKLw5r/EC2/WqbZu0Dz4bqOTYEU0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_234926_060265_4509F159 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

The board entries should be sort in correct order by the description
string.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v4:
- Update the commit msg with sort rule per required by Krzysztof.

Changes in v3:
- sort for all the board entries instead of two rockchip boards
which suggested by Diederik

Changes in v2:
- collect acked-by tag

 .../devicetree/bindings/arm/rockchip.yaml     | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923..01439d7bbde9 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1006,6 +1006,16 @@ properties:
           - const: rockchip,rk3399-sapphire-excavator
           - const: rockchip,rk3399
 
+      - description: Rockchip RK3566 BOX Evaluation Demo board
+        items:
+          - const: rockchip,rk3566-box-demo
+          - const: rockchip,rk3566
+
+      - description: Rockchip RK3568 Evaluation board
+        items:
+          - const: rockchip,rk3568-evb1-v10
+          - const: rockchip,rk3568
+
       - description: Rockchip RK3588 Evaluation board
         items:
           - const: rockchip,rk3588-evb1-v10
@@ -1026,6 +1036,23 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Sinovoip RK3308 Banana Pi P2 Pro
+        items:
+          - const: sinovoip,rk3308-bpi-p2pro
+          - const: rockchip,rk3308
+
+      - description: Sinovoip RK3568 Banana Pi R2 Pro
+        items:
+          - const: sinovoip,rk3568-bpi-r2pro
+          - const: rockchip,rk3568
+
+      - description: Sonoff iHost Smart Home Hub
+        items:
+          - const: itead,sonoff-ihost
+          - enum:
+              - rockchip,rv1126
+              - rockchip,rv1109
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
@@ -1099,33 +1126,6 @@ properties:
           - const: zkmagic,a95x-z2
           - const: rockchip,rk3318
 
-      - description: Rockchip RK3566 BOX Evaluation Demo board
-        items:
-          - const: rockchip,rk3566-box-demo
-          - const: rockchip,rk3566
-
-      - description: Rockchip RK3568 Evaluation board
-        items:
-          - const: rockchip,rk3568-evb1-v10
-          - const: rockchip,rk3568
-
-      - description: Sinovoip RK3308 Banana Pi P2 Pro
-        items:
-          - const: sinovoip,rk3308-bpi-p2pro
-          - const: rockchip,rk3308
-
-      - description: Sinovoip RK3568 Banana Pi R2 Pro
-        items:
-          - const: sinovoip,rk3568-bpi-r2pro
-          - const: rockchip,rk3568
-
-      - description: Sonoff iHost Smart Home Hub
-        items:
-          - const: itead,sonoff-ihost
-          - enum:
-              - rockchip,rv1126
-              - rockchip,rv1109
-
 additionalProperties: true
 
 ...
-- 
2.25.1


