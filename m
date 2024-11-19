Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43163D44157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai2f0tah5jxeBFbms+6cTIy86wh/DEb+Zml1HlpGnbU=; b=BxzrHNmeEzyatOIXBJMJ3hpLx5
	OeldizAJPZ7C63PV77a98ZKHAUm2MrktLBFfBgq3SraLoJBXO8e7LTalZHap/loYQ6IiMXLKUShpa
	XY8wb4/rrGdchQj+1sd/qNFBpOpL/3OHxkUJWlT3WJoV32oyU/RCl4hm/rJaR6UddpqA0W2MtxHZz
	NQ9BMiVtb+E/B7fWKRnu/mEzjbiF7Zy9/q1sqnPRqWD6+88ZjdNRLMarO5xlucwlPlcGOw1nOejlT
	VwshmGawuZWNRpKbzKOyZOhjKk8jEnkdIqSvhEKFkBv3RDh2kudqbakVtybhr+mSuCCyD7XSPoDTl
	huFB+IPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOMW-0000000CWVm-2qRr;
	Tue, 19 Nov 2024 13:33:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOIr-0000000CVcF-2NdD;
	Tue, 19 Nov 2024 13:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ai2f0tah5jxeBFbms+6cTIy86wh/DEb+Zml1HlpGnbU=; b=K+lv0vqFGN2jXni4MeYTVKJO70
	Sr6nk71LUV1RXmyQcg5zOyNf/0G9eayXPZzCxtgd0K09d/yj2/Oz0ZFPCVy2bZms8RqHMnjG41z9K
	iOo4LugCcZd6mq/PdzW85UJ+/PYIpC77+NnNmayNwbFAxcZgfeOYruQfYPBA3W61xx8Xo4wQNRy3c
	lM7kTySi7xu7UL6pr5Cwfq8uYJtO2F4PfRGYjz3dWPISiXdVit676hQ5kRgww5Im+b30CQDR1tohj
	HhTYhzGSB/W7TeRNZmc12eruunTu4/EoOW2qcM4LijtpKvg7PeQPGP9tVILHDif9X2W3XdfxK0L10
	V8GBzhlA==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tDOIo-0006z1-Fu; Tue, 19 Nov 2024 14:29:58 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	sebastian.reichel@collabora.com
Subject: [PATCH 3/5] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
Date: Tue, 19 Nov 2024 14:29:14 +0100
Message-ID: <20241119132916.1057797-4-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119132916.1057797-1-heiko@sntech.de>
References: <20241119132916.1057797-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053001_606900_9B0ED06A 
X-CRM114-Status: GOOD (  10.96  )
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

Document the OTP memory found on Rockchip RK3576 SoC.

The RK3576 uses the same set of clocks as the px30/rk3308
but has one reset more, so adapt the binding to handle this
variant as well.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/nvmem/rockchip,otp.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..dae7543a0179 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3576-otp
       - rockchip,rk3588-otp
 
   reg:
@@ -68,6 +69,23 @@ allOf:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-otp
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        resets:
+          minItems: 2
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+
   - if:
       properties:
         compatible:
-- 
2.45.2


