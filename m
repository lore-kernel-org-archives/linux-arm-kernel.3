Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E409FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ac7l5dVkk0vpzdT7SKs5XS4Zx6HoDGJagXwG71sDqrA=; b=Z9g3AG3yXItt+/Is1h+6bZvtA8
	SoVOfZP4mE7x85qyxOSAA6J3gGNKsJ+IrYIw2zLNyegM9jkAQLlHGsaybBwyNhcc/aFmVFI4uGrw2
	CiV99raE53MnIUsIbSNNLCZXzJuzSTeyRyLh+1z6EEvr3DVsOk/9VkcMNbr6RTpDqVLR9mOl3ukDE
	wsA61Z3Ire/TF5E/w4Bgk+dgyQG2/ezJ1+KbVviAoj0wR7bzk3QsF3LycuF3e9gcclE/ALLy5zKGI
	mheyc/hsYKHUtO5BMV9yNUw5kxXIoDrKLMLIy+YzyXBmxLYWoY2H27k4Jp4GcneeAiSvj65mP1Bv/
	a98HD2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsG9-00000004v10-32jo;
	Tue, 09 Sep 2025 06:55:21 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvnFq-00000003U84-0vEE;
	Tue, 09 Sep 2025 01:34:44 +0000
X-QQ-mid: esmtpsz16t1757381628t9ba36c9e
X-QQ-Originating-IP: Mh/hsRNNK39po3NG8qvNWg5UqjGRImn/yE4N+a68b9w=
Received: from localhost.localdomain ( [183.51.121.90])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 09 Sep 2025 09:33:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1423506342381787432
EX-QQ-RecipientCnt: 16
From: Kaison Deng <dkx@t-chip.com.cn>
To: Rob Herring <robh@kernel.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kaison Deng <dkx@t-chip.com.cn>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588-RT
Date: Tue,  9 Sep 2025 09:31:47 +0800
Message-Id: <27b2ce7950fdbf28c6c8404c3f8be3c1c35d6b3c.1757322046.git.dkx@t-chip.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1757322046.git.dkx@t-chip.com.cn>
References: <cover.1757322046.git.dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:t-chip.com.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OENz0Cxqfor1vmo7Qt24HauySYYaZO2W8FLwydcR6A3EoaP7PHYdUib+
	SnoxmhK2wLBp6tB7H707elFHY3aGeHlmnrSmdRMGbMIkCBy8uUlCp997eTKLiXpedUA8nd+
	XzaZk5BOQSVGvBgSj5tu0uCuJx0+H0Rs3V5mtx0ea1pa+/+HSce0d8lN7x2pH5pREaF4VlQ
	nw/qrzIeoDiwyUGPscEsp5nfiYUsZVv9y1j80LJ+CE403+5NqkJlrmepL/mrQSjDMQ1Rih4
	pcqvOPwWJtVfjSho2iVjNevxBFJqWktgqhAmuPAdOfGRb4zypv5LzGBxci5Ob8f/KUNv2tN
	pgGxkeLA25IkcRnHVxgM5Ofczx9jkvi5GsGdfLUQ/LdP3s1Wa9yn8XeXwNlhn2zaty6fxQq
	og2L8ldbYE9aJ5x3xP2o6vvsW93wmEwKSq+NHVjv/MRmkxhQuiACz4W7rbX0ann2zZ1v1SF
	cwG5kb/ni8pPPAzp4YVfW/GjP/QKVZWOv45IA34hFteoFB67MVCRVE93LL6cBKCsCOQgGMZ
	20vuQ4gVdygkaDGCkCGYEQJAYRTndd5lEKZacAkm3bgkql8Dg3oSgCp6wiK7sctbzEt7lgQ
	ji1YK3RUGQLzk25Vp/gzf1emubSawMbHnIYCupkhJZtW0u0qHda6dXPSzaTlTZ2u6geEixj
	lOEg4SXP4XojHKmo6YL9fDY8nDtqCfpwE4Cz2cdYmc6N3/HQsZbnCPPAp1l2H0T7jdCPOQI
	LHtvGhCl5UfpSSg25Qxjr92Li/Ukqf0OwdSHha31cmjJFYXGe3EEWYibfj91cysebxwKjtd
	6Bc4Xx5yaR6QJ/iy/MgNN5bW6o9vd31SMQRUdEhnb16x879HJRqNd5atQ1hSGVKgD3fjDOh
	AHHh7SNjOE/O8jMAH7pX05IIZ8hrc+OZgYZcaUnwZyZ+Jrlu5X8KlEd36HsTV7Lv0NrYq08
	5jmWvWkF+f3vu+dQsuWjBNJrp44w4xajVdQTqWZXoTRuR3v5UFa+LJEFRV0vospnqjtCjrh
	mH9VoCYBbLM89z1hbMT8NtQkJVJRFXqE4wUck6GlNwKqbgdFT9GTeyV4HnhqauYBP47/rEe
	J9r5vBrTdqPxqMaGLzVTmC4nTX7G6yi7u8SR32hIB4ZRURGpOx9Kaw=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_183442_824001_B508E575 
X-CRM114-Status: UNSURE (   7.99  )
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

This documents Firefly ROC-RK3588-RT which is a SBC based on RK3588 SoC.

Link: https://en.t-firefly.com/product/industry/rocrk3588rt

Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index f9ee77f17ad7..6aceaa8acbb2 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,roc-rk3576-pc
           - const: rockchip,rk3576
 
+      - description: Firefly ROC-RK3588-RT
+        items:
+          - const: firefly,roc-rk3588-rt
+          - const: rockchip,rk3588
+
       - description: Firefly Station M2
         items:
           - const: firefly,rk3566-roc-pc
-- 
2.25.1


