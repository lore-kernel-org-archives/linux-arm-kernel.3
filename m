Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFE3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ56D317gEmcn9NpcsH9EbXwzgNo8eOGXcdkL4nJ2YA=; b=Fk1pfQjfkz8RkRiTJFfCLmpH7x
	5dAdGjPlcdvf31djU6OpQOWWLU1dHqvi2doAljPHt5UTiXbNm8+YpyHfS6tt4YprO9+LXs54m9rYW
	Yp729ei6EgPP9Zzo/sws02lv+/5g8+4MbaKHbFKhBrAdirijb44Kqx7nrISwEg8X6/IUX5S5m9QK5
	PzyDx+Kt7bauKbudiJa4hYqTrJKOkgBgXpPETwFNx/JLkIm586JG5pfhUkVrx/oBFVVxGW5IDSqkp
	cDFFk7CkPiCxT+41YDLDzoGE9ZIiPt66N1tE6F5/ABsuaf8CLyfffRvMBwluT1AajZZ1/+llbDwm5
	NvDpdGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVtR-00000001rOp-2kZn;
	Sat, 28 Dec 2024 12:26:09 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVpu-00000001qWT-1WqG;
	Sat, 28 Dec 2024 12:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=UZ56D
	317gEmcn9NpcsH9EbXwzgNo8eOGXcdkL4nJ2YA=; b=ojB/XMx0+bKzV/c64b3+T
	CyfZGunaKKS6U8Tr//Nx0ZdSWISmPE76P1OFQNW9q5/YhyHmPPwYI8lf5+Cv51Zk
	lRHcbMDVSzPZZXF8n4Q7z/8wHzvIQw/mgZyXoR4/mG8ioL/D3X/TIY2YwH2STzYm
	hlZy1zmQ6lZ8xf0mY2Ui7Q=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3t0tl7W9nUxdCCQ--.1009S4;
	Sat, 28 Dec 2024 20:22:04 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	krzk+dt@kernel.org,
	joro@8bytes.org
Cc: cl@rock-chips.com,
	robh@kernel.org,
	hjc@rock-chips.com,
	vkoul@kernel.org,
	devicetree@vger.kernel.org,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 2/8] dt-bindings: phy: Add rk3576 hdptx phy
Date: Sat, 28 Dec 2024 20:21:45 +0800
Message-ID: <20241228122155.646957-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228122155.646957-1-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3t0tl7W9nUxdCCQ--.1009S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF48Cw1xXF45tFW3ZryrWFg_yoW5Jr17pa
	nxCFykJF1xJw13ZayDtwn5CF93trsayr4ayrnagr13Kws3trW3trWa9F15Z34Yvr40qay5
	Krsrury3ZF4avrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j39N3UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRPDXmdv5wS0uAABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_042230_833955_CAAC3AF7 
X-CRM114-Status: UNSURE (   8.36  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Add compatible for the HDPTX PHY on rk3576, which is compatible with
rk3588, but without rst_phy/rst_ropll/rst_lcpll.

In fact, these three reset lines are also optional on the rk3588,
they just used for debug, then they were removed on the rk3576 IC
design.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Wrap commit message according to Linux coding style
- Make "rockchip,rk3588-hdptx-phy" const for "rockchip,rk3576-hdptx-phy"
- Make declare phy/ropll/lcpll reset line are not exit on rk3576

 .../phy/rockchip,rk3588-hdptx-phy.yaml        | 62 +++++++++++++------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
index 84fe59dbcf48..7a307f45cdec 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3588-hdptx-phy
+    oneOf:
+      - enum:
+          - rockchip,rk3588-hdptx-phy
+      - items:
+          - enum:
+              - rockchip,rk3576-hdptx-phy
+          - const: rockchip,rk3588-hdptx-phy
 
   reg:
     maxItems: 1
@@ -34,24 +39,12 @@ properties:
     const: 0
 
   resets:
-    items:
-      - description: PHY reset line
-      - description: APB reset line
-      - description: INIT reset line
-      - description: CMN reset line
-      - description: LANE reset line
-      - description: ROPLL reset line
-      - description: LCPLL reset line
+    minItems: 4
+    maxItems: 7
 
   reset-names:
-    items:
-      - const: phy
-      - const: apb
-      - const: init
-      - const: cmn
-      - const: lane
-      - const: ropll
-      - const: lcpll
+    minItems: 4
+    maxItems: 7
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -67,6 +60,39 @@ required:
   - reset-names
   - rockchip,grf
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-hdptx-phy
+    then:
+      properties:
+        resets:
+          minItems: 4
+          maxItems: 4
+        reset-names:
+          items:
+            - const: apb
+            - const: init
+            - const: cmn
+            - const: lane
+    else:
+      properties:
+        resets:
+          minItems: 7
+          maxItems: 7
+        reset-names:
+          items:
+            - const: phy
+            - const: apb
+            - const: init
+            - const: cmn
+            - const: lane
+            - const: ropll
+            - const: lcpll
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


