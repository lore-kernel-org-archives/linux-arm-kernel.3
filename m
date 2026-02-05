Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F68ECD9AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1U5hhK+rQlR00/k3EtSMrklWPqzzU+7KvzJRyjKH+Zg=; b=VSBbxzVu9z/sXWHlTjzdxZWRu9
	xuzYXpbAmhUuBsGrcqUw7kmj/3AXgSvp83AVDrTRaiDm5X+u3DFTN7G6mLYiH0KHhWzgcNRGxXXpA
	/a2w5sTwknz7RiRpaJWNtGS9d+R1y/4NoBSrPz3LGh4wVfTlFhwhnl7QVM9mwGqVjHO3MIE/Czudc
	PfhmX6eRPIvMXs/RyXZeiuOME3mKHMCqC7BI+vsjRxBqKtCJo4/kVJzTb7SU78YnqeBiwae6ZelqK
	212265UTDUH75x29ewjGzwlCThm0pZExdVE5VQ7Ehc01/ttIfLX0iawz0e93zJfB0KrE1tZVbUtfV
	QG/Xzjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6la-0000000AV5R-3Ol1;
	Thu, 05 Feb 2026 21:19:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lV-0000000AV2H-1GWi;
	Thu, 05 Feb 2026 21:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=1U5hhK+rQlR00/k3EtSMrklWPqzzU+7KvzJRyjKH+Zg=; b=cDljldwEFYTs2Gusti/WLTPfYX
	xY3TJrU6MsZA2uo/gMKOJ7dMtHRuqxMOH1XwindDtM7V/VN3j5YUdiF4fbDyxTEA2X8DXMRa91L6u
	emicl+h30laRj2WDwa6se9v3U41ZRwtR1ekc0ogO9jNiRAJIKiA3mpCiu6W5Q64o9YCoQBE4+GcWL
	L8CzdlBPiXi612hrn+vOEV8U2rwq80WimyPNSjyXsYnIQFIunQGSfLzUH3rVuiiqTO6zuhwKTuzLz
	SAuDXC/x88a55OxR5fDzgwo9qguKel0PExUiiaPtEwwl3xrO8wB7gbP58ThYnALYQXHZfjZLp6hmV
	NTivuDiA==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6lO-007GGK-7W; Thu, 05 Feb 2026 22:19:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v4 2/6] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3528
Date: Thu,  5 Feb 2026 22:18:57 +0100
Message-ID: <20260205211901.490181-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205211901.490181-1-heiko@sntech.de>
References: <20260205211901.490181-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_131953_346300_BD929E4D 
X-CRM114-Status: GOOD (  10.23  )
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

From: Jonas Karlman <jonas@kwiboo.se>

Add compatible string for the OTP controller in RK3528. Compared to the
RK3562 and RK3568 the OTP in RK3528 does not have a phy clock or reset.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/nvmem/rockchip,otp.yaml          | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index e90136f7dcfb..7e4d5e1c4ced 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3528-otp
       - rockchip,rk3562-otp
       - rockchip,rk3568-otp
       - rockchip,rk3576-otp
@@ -72,6 +73,30 @@ allOf:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3528-otp
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: otp
+            - const: apb_pclk
+            - const: sbpi
+        resets:
+          minItems: 3
+          maxItems: 3
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+            - const: sbpi
+
   - if:
       properties:
         compatible:
-- 
2.47.2


