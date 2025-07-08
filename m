Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F53C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 23:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61CNx8jWm6k6gYCQPCbrbHlIUBzdc15o+3AlaTE4Qpw=; b=VltBFo3OSUeX8KAVioXMLyEBG9
	AScIf1256sL3kBES94KB++oL/lqFct0BkzVYw7aEnRd525wxZRTFhqqpp23QqcEzUJQaNjTsioaY/
	9OhmK0TTfE1xSe3bHRScHTZLaFrTUfDiuE++B93tpjh/qtUE5MQtIOtsiAeDRLIaFewsh1B47FVCd
	F0L6dSKO/KeECyx0TN75GbxruJUu0Z7JemY1GDGa2WCXtNDFPmF1Iym8/KriqVgZ2V6Dx4RBqsUpb
	l57CyLdyZsLHACvAtpH2NE9KJwcHrdbqWf8x0EBmmhYee8i1vNMXcrMribbBlro2OLMJC6J/BMyLF
	EFdObExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZHM4-00000006rNZ-3EvE;
	Tue, 08 Jul 2025 23:04:04 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZH8S-00000006pky-1cXr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1752014999; bh=61CNx8jWm6k6gYCQPCbrbHlIUBzdc15o+3AlaTE4Qpw=;
 b=UIvDqOlCZ1ULKMma708G7Lx46A49CMI0HahtxXPPNz7np5Ret4qEr/eDVU91fjbasiQw8Q5uK
 TNWrjJxlwR1GFYy94kSVD06fAcbPmv1AQkeP029IxFdGNNhyIXcXEiZT4tjLMU7HBFZyIBLlyML
 G1BYWdZEIvImig8Yjwlfd8WPuXG4AO0SG1keULDhj67ShdPdyV1SzpTUzriEI7E0nhFNYp+3IFy
 uUeb+gikdHFl0OJfv/kU/gx/fbAcJ/9Kqfg4h6FNPFO1/GxmsYWjLrEClVNz1Mx4aWG33QnE94Y
 7Irn1EMVDJb05ZiSW7BzWERESqZ2EOu760l331v3jZgQ==
X-Forward-Email-ID: 686da09575317ad3cfdad433
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.3
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
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 5/6] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
Date: Tue,  8 Jul 2025 22:48:55 +0000
Message-ID: <20250708224921.2254116-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708224921.2254116-1-jonas@kwiboo.se>
References: <20250708224921.2254116-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_155000_469517_122ABCC3 
X-CRM114-Status: UNSURE (   8.56  )
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

The NanoPi Zero2 is small single board computer developed by
FriendlyElec, based on the Rockchip RK3528A SoC.

Add devicetree binding documentation for the FriendlyElec NanoPi Zero2
board.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index e955e3334e35..a84076841504 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -319,6 +319,11 @@ properties:
               - friendlyarm,nanopi-r6s
           - const: rockchip,rk3588s
 
+      - description: FriendlyElec NanoPi Zero2
+        items:
+          - const: friendlyarm,nanopi-zero2
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPC T6 series boards
         items:
           - enum:
-- 
2.49.0


