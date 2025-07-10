Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE87AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 23:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQyPTyaMdzjot5Jenk6eOQc0UNxfrnd2eaBptVXTamg=; b=tTu//LNMCzo6r8xfjOEfmXPocg
	1NIUXWBcE9sQe5idZ3dGfa7ZBbD86EZFFgK/0lOJ+0oJwG7XzC03K58jZr16RdGvsiudPHddEwS4w
	MjVD2UdHpfUAEdHAUckItCxm01019oB8+94qcAXhkHqEn4Mv9T01clAxulaIL4KpHCn20BVQm8jCx
	ysXRmSoBQYZbOEo4t1OMQ0EHia3/nYHPj5xt1G2fjcPsArRLLMZSg8UpmKJwc5Xz7c7/N7BDnACrS
	IilGoTx9vUg7qkOgprXjlNvTpDDawF/kV/v166XoSxQ5kn6NgbDCrhs9/Qbw9fAIBWXkIBJZCridP
	X/TLojUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0Si-0000000DFNr-4BwW;
	Thu, 10 Jul 2025 23:13:57 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxuH-0000000CwJZ-1QHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1752179412; bh=GQyPTyaMdzjot5Jenk6eOQc0UNxfrnd2eaBptVXTamg=;
 b=AJhHkeTh8y1hShq2CFsvL+NP4RCxaxtu5VxwCcZHkDztSCNVE4WpKOX6cwbAe/ROC9sZXCcCf
 DjAarv4dwOF4CFsHn0Olc1fMRqqpx0Yy+wVjqyyow8bDFF8/X8Lj4wXTJOGxSoKPO0Zd/FIil87
 5TUECxioMqXkW+cvWY/Dq23ROWplwm+8qqURMYmJbZKUFqfWQNv58o++26a61An9/Dzd60zP57G
 BAheLkySz4s63BB85uANMxIZl3scX/UsE0eTFJVUnCSxHEl/kZJLP3afcrJaMf4f9e3Qgs05yD8
 Pr/h30v7MhMXArh1jzl4O4AMJqM0MLschY8VhaIX4r8g==
X-Forward-Email-ID: 687022d05dd88a88be4f4e40
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
Subject: [PATCH v2 1/6] dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
Date: Thu, 10 Jul 2025 20:29:40 +0000
Message-ID: <20250710202958.3717181-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710202958.3717181-1-jonas@kwiboo.se>
References: <20250710202958.3717181-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_133013_463088_B5BA830F 
X-CRM114-Status: UNSURE (   7.54  )
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
---
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
2.49.0


