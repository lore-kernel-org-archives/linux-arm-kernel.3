Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E8C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KkCjLGin8VBSyRUFqdEAC5Ls5N/o8F13r5OT8O7IgI=; b=vQLhtJWbfO0o0p4tuZH9mhaSc0
	4q6GFvcxxVjPcFWK6caoOhwDdMDhq5qLrP+P8dznBUSyYXIUNNfhEZW4VFLuoQWUqG+RkkcN5wEJW
	0yibiKSn6FmJyjM3s9opHpW8uJxgJ98rYV9POh/y/ElneruPbXkHyc3VCebLokRkqLjWTH0+yj7S+
	OyeMbVzWo4Xu/nXuI4JwIeMmFEPCkWxKFkW9nmhQjSnsVWi1jwlJvIKT14RA7gXMbBdgg3MQj09Zq
	CIIJLo7MioFftknGgbqc82Dd/FGkdKzCndxMA8IynfbN2W2kLw2+KSIxi1zzzkdbUswSy7njpTyTC
	lDzj6K+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug2vt-0000000CpGH-2Lj5;
	Sun, 27 Jul 2025 15:05:01 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug2c0-0000000Cn8h-1RBP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 14:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753627467; bh=5KkCjLGin8VBSyRUFqdEAC5Ls5N/o8F13r5OT8O7IgI=;
 b=FMvMNvkOLUppX9yRr0Qhh6ag3WCLIoob45kasFLHVRwBrmIQ6aCUeER7wDZgnIyZ7V17/Epnn
 RFqd2hmw6VmSXE+an6SjYY5x+/Svha1ISbVGzgP2e7vOaa1d0sU4blsApakuYON2Op7Rhdjnj4w
 EJEolzDpGz71JvqInHvX0yVNWKRufxBiUVgtvPtz623QF0VcRAITzD++gkUZ88YkszLI1MVSfC0
 eFpDzUQBzCTYFQht0ltv1RMmcK0WzIR+sh4LyRj6kiiiK1mIjXrlcTYpHf27Z2VMejKDDhiC5Hl
 YnHJe0yxOZZQtBhzj5rXwonQlvemUgmi+vEegoGA3ceQ==
X-Forward-Email-ID: 68863b46c752737c6c09788e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.7
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
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Radxa E24C
Date: Sun, 27 Jul 2025 14:44:02 +0000
Message-ID: <20250727144409.327740-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250727144409.327740-1-jonas@kwiboo.se>
References: <20250727144409.327740-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_074428_476909_9CBD256F 
X-CRM114-Status: UNSURE (   8.88  )
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

The Radxa E24C is a compact, high-performance network computer
developed by Radxa, based on the Rockchip RK3528A SoC.

Add devicetree binding documentation for the Radxa E24C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index e3d3d483de4a..15b019caefbf 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -875,9 +875,11 @@ properties:
           - const: radxa,cm3i
           - const: rockchip,rk3568
 
-      - description: Radxa E20C
+      - description: Radxa E20C/E24C
         items:
-          - const: radxa,e20c
+          - enum:
+              - radxa,e20c
+              - radxa,e24c
           - const: rockchip,rk3528
 
       - description: Radxa E52C
-- 
2.50.1


