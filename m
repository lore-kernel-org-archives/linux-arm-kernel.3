Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A1FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+Hw8lQ0o+mOFqv9n5gcTSKBcsWJil+YqWJxNjP2g4Y=; b=EeunDkSP6b8x6CuwMU8IRM9Ln0
	ela1zC+5nJPTLm9HMSLi2LySstKG5wlMSIFPpqC+HBZs8oCpUUtoqukImr8UzQ1QOalMRJCuJJ4Gt
	DwAmWaZvuhVfrjI9fHpKcaO1MV8MaL4+QNOBfazmJ0VV8exymGlnMak1hhlh/3lCj8JkCxGur2SpC
	ahfshzmNs49obaORbBP7gjrLiMqAdkV9OmZs2n/I4WA9+4LipFo/MbflFt4RXcQK268LbpQjHrSLr
	ikdXIzQ2vKdKOvoX1HYAU8o3p47w3gLqEg3e6YSKZqkE2hWKlBr1a96isMT6DrltW8Q3P6o4IGZv9
	VMzN4IoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMLp-00000009vyh-3WB1;
	Thu, 17 Jul 2025 11:00:33 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLzp-00000009rp8-1ro3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1752748668; bh=h+Hw8lQ0o+mOFqv9n5gcTSKBcsWJil+YqWJxNjP2g4Y=;
 b=LqdXjgPIp9+k2/XUyn4eYsNsCpvYWg3FRpk1vuQpQc9S3D+3seKJ77aPm/NdgDYs8jEsNkDKG
 9FAKQIQTlO+CoGOEzuClG3L2EesOrGjU19WladIaw+bYppsBNY0EmBISaVe5diTTQbArY0tDjCk
 wwzJEWmDRLvg/5wT3WyqWTwnubK/3Zg9I3fSk1lxfPn1wMQn/+Q7FcabrYja4opaMEzm91EYlr2
 HK2KsYl9R7nVZEn84gnP54R6nOxRhQJhxF2D2ogbmb6JVSllblu+ZZjK+2OIQw1y8RYrta2E5uv
 U+JjJqyTPbnFZLHCIKhzSXxCyKVEWZre9eO7rE3h7JMw==
X-Forward-Email-ID: 6878d2695e51505848fe5f9e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/6] dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
Date: Thu, 17 Jul 2025 10:37:03 +0000
Message-ID: <20250717103720.2853031-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717103720.2853031-1-jonas@kwiboo.se>
References: <20250717103720.2853031-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033749_832987_4A85EBD5 
X-CRM114-Status: UNSURE (   6.90  )
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

The ROCK 2A and ROCK 2F is a high-performance single board computer
developed by Radxa, based on the Rockchip RK3528A SoC.

Add devicetree binding documentation for the Radxa ROCK 2A and ROCK 2F
boards.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v4: No change
v3: Collect a-b tag
v2: No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..c5690098f2ed 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -881,6 +881,13 @@ properties:
           - const: radxa,rock
           - const: rockchip,rk3188
 
+      - description: Radxa ROCK 2A/2F
+        items:
+          - enum:
+              - radxa,rock-2a
+              - radxa,rock-2f
+          - const: rockchip,rk3528
+
       - description: Radxa ROCK Pi 4A/A+/B/B+/C
         items:
           - enum:
-- 
2.50.1


