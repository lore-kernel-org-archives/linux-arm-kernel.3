Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0543AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/GlA9c7JgMPGjQHtJLx36RU8AROSBuEm27xFuxdPGc=; b=gatxQyxcPixxhx0hYDL3YnLDo0
	Rh2s7pfkBXK8CPpZId/6BUenTGL53vtbW1abdSMY0SkQES58zO+dSq2Se7SxbJ+IhDK3a6HikfSty
	S1ez703BxSkR45ZHb5VfSolL7vzAEwTYicEdlwQO53deEKnkJIjpB3lAQZfZCiZ3aVzVLQKyhRseS
	PRwLPXv4Dpv28ldmTWZ7RYtM1bMshZJMVkpw+9Sw8Og0l2HP5OSni+GbmpfZkx90R8KfqyYcZTwMX
	Qim+D2HpWmpYYoWRj//qTokfPI2uZh8n86RDTs5Q5XIzqZPplkkdFQN6LtSSngJi/KHmdIUIqkWNx
	udGlVK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFr-0000000AjTn-33d5;
	Tue, 12 Aug 2025 12:37:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkQi-0000000AFXs-1Ibr;
	Tue, 12 Aug 2025 08:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=u/GlA9c7JgMPGjQHtJLx36RU8AROSBuEm27xFuxdPGc=; b=ZUFI4UbwukBnQD7k4OWO4J0FIE
	/raIVD61SLVJKasvghVF86zTGeNQCVjNhlyNTiv/9Jqbba62vQGQE32XWahOtf8qaRPU4aJT/gGGf
	5+d432p3iRPyNszwjTpKDYcClRKtINJFZbNI1cTd8qxWaIzNBH8WPUE0jytseXSUl2nGxlwHbrjlt
	p4IsnIc+eu3t5Y34UAFkaRYrwMUx9A1XolOw0LEhT1KUyeTj/oddTMLPdkEQJJQNovU7RQa+3DLMB
	HMVmSvarD8DqF8Vk+eeHoJuMrYjD3aqKhTooqSN/iCzf1bkNAT1zdeXxo7hog0zUOIr2WW/fofzUv
	8g+JyznA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulkQe-0001tw-TI; Tue, 12 Aug 2025 10:32:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Tue, 12 Aug 2025 10:32:16 +0200
Message-ID: <20250812083217.1064185-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250812083217.1064185-1-heiko@sntech.de>
References: <20250812083217.1064185-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013224_367271_27F60F7E 
X-CRM114-Status: GOOD (  12.21  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The DisplayPort carrier is a very simple baseboard only providing serial,
ethernet and a displayport output.

But its main functionality is that it routes the Analogix eDP controller
to this DisplayPort output, which allows to test that controller simply
by hooking it up to a suitable monitor.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..4a64434ad6ea 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1192,9 +1192,11 @@ properties:
           - const: tsd,rk3588-jaguar
           - const: rockchip,rk3588
 
-      - description: Theobroma Systems RK3588-Q7 with Haikou baseboard
+      - description: Theobroma Systems RK3588-Q7 with baseboards
         items:
-          - const: tsd,rk3588-tiger-haikou
+          - enum:
+              - tsd,rk3588-tiger-displayport-carrier
+              - tsd,rk3588-tiger-haikou
           - const: tsd,rk3588-tiger
           - const: rockchip,rk3588
 
-- 
2.47.2


