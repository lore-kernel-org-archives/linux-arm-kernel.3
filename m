Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05371E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gytLW1uJzuhhxQEZKDdgGHtaJwCeWoAiEDihz80BX/Y=; b=QccfOefSWjFavPjOCO4vUpXMrx
	nUK7FM5Q2BnMWyqOfWnBvHP9oAGYLw0NeJFrZvmK4GclmvSbqsx76y+Sc+Z/6W+0R+slMgctsv2Uu
	gJM1MRnHwG4J8T+kOD9bk7UfDdKfTGtPWqKfdUfRLLLewQIUvGRPGcm8Ag9oqIJF2H5eigQSLgwJH
	FRNDoFdsW52af5W6gfXduQDcF/1c/RTTwVLQxyrsJDGUaKee4DZ+J13BMdoNTWCEKT+G8/BRzGiri
	wXYxZ0VspC5OZEPcyDyCR3jfXF9RVRG6Rgdh8kxir2YpyHCivBCTHuv02UDEd712QKwjzwr2fpWT+
	s1Ap8+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaFV-00000004av5-0Aal;
	Fri, 20 Dec 2024 10:28:49 +0000
Received: from mail-m127112.qiye.163.com ([115.236.127.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa3B-00000004YUO-3chJ;
	Fri, 20 Dec 2024 10:16:08 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 655ee91d;
	Fri, 20 Dec 2024 18:16:00 +0800 (GMT+08:00)
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
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH v2 5/7] dt-bindings: arm: rockchip: Sort for rk3568 evb
Date: Fri, 20 Dec 2024 18:15:49 +0800
Message-Id: <20241220101551.3505917-6-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220101551.3505917-1-kever.yang@rock-chips.com>
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR0fQ1ZCTkgZSU9PQx9JHUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e39125ff03afkunm655ee91d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PEk6Lzo6ATIUUQgRCj4UMitR
	QgwaCQNVSlVKTEhPTUNCTE1JSUpOVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTE1KNwY+
DKIM-Signature: a=rsa-sha256;
	b=KNgWgvQeYFvSxv/FK+q6QnhfM247mnWi4DkigIfRkDMWOPtmJFdXb/9srfQdgzA8f12XmgV0UGGK5sCYGxvtKS62hc4IB0oGddS6LIP4X+bIFguYxRJ8St1TQG9TTZ9sPrhD6pwlcuoWsvaQdZ1OTcF3DrnKZGC/xfDN8ZUgu3s=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=gytLW1uJzuhhxQEZKDdgGHtaJwCeWoAiEDihz80BX/Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_021606_134691_FA4550BD 
X-CRM114-Status: UNSURE (   5.89  )
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

The info for rk3568 should before rk3588.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v2:
- collect acked-by tag

 .../devicetree/bindings/arm/rockchip.yaml     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923..45ee4bf7c80c 100644
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
@@ -1099,16 +1109,6 @@ properties:
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
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro
-- 
2.25.1


