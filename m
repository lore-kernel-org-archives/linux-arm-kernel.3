Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC621C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJ8c4/2RED8Sh2GgwV4sJs8aJsNmeS4QcwiSdrCLc4c=; b=rUeUx0MM9kpOCEs0iCxkjbIG0M
	LxOGDUjvqYeKD5d0GPCCXqEaDQhrFz1yHQaqnbGKfeMa/vTcqcY12OhzNuiugR5BZUbsPvgEtBeV6
	VbKmhcaHE9CkQYGC0yaYB6eMuspxji2uv5dg/nzcfYP2+8xsAd/w9kyVPBBqrlqAKJyp2cjBii5/M
	AZKq/NRfSCOSK5SUH3FBzhIh9dNq6Ap4avEiDnIbvT0feLqL7ZC4HbIYe8Zmgp2t3dhqD5A5L0jAI
	FXa+zS8m+bQROZny4p6NN5xS8K1jztRIJZ1HhXzafzqw/2G/W/VEq/rDBYGr4cMvZB3kILrhOCSJo
	ZHfpCKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlFc-00000003kO4-3mTB;
	Mon, 24 Mar 2025 17:06:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlDs-00000003k2M-4AF5;
	Mon, 24 Mar 2025 17:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742835863;
	bh=KRP0aB0pusR6DQBo1puDDmnz/hEZTuxKlnUQvRPL9e4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qhcWTwB7Lw72A+2me8o8c+bw2ezh2TtX0zW8WGnP9szUu5+aLPcX9tYZxld1GLQFs
	 BjzN/BHtK61M1mmOQOxR5TO0UmjaZFLR1Nww5xDHv2tWuG1/a6MXqsSfn7MXBznc1v
	 GrCI2AIptqKFlw5ZZGtzN3JVEBfyuheZ+kRZwQq+1Hihm3EUq/4klWGwPKxgLOfhGy
	 qpTAG5oaTRNXEJsIdcGLRW/9aY76TShdiLJAIOH52q5iKoFyIgD209XDOGAPcplAqb
	 RoAeTqq2p+KLV5UfK2moqcLLu41THZrQnyoGKF5z59wvVjFtdgKZf2tB0ysSdiKWWG
	 ioYwN8i+VCdyg==
Received: from jupiter.universe (dyndsl-091-248-188-184.ewe-ip-backbone.de [91.248.188.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1DA8F17E0C37;
	Mon, 24 Mar 2025 18:04:23 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D89FE480038; Mon, 24 Mar 2025 18:04:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 24 Mar 2025 18:04:24 +0100
Subject: [PATCH 3/5] dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-rock5bp-for-upstream-v1-3-6217edf15b19@kernel.org>
References: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
In-Reply-To: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=sre@kernel.org;
 h=from:subject:message-id; bh=KRP0aB0pusR6DQBo1puDDmnz/hEZTuxKlnUQvRPL9e4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGfhkJa5ha6/bzlUoT/H5amcvXsgWlJstfOTA
 B+/e6TTdOYmjokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJn4ZCWAAoJENju1/PI
 O/qar/wQAKYdC1NWfYRLSF+z7pSP/dBf3sqEwevqmFHlNLJkmXJeFa5NTxxfvuwcX4vGn+sozlj
 VvYxkIk1VRb7evsbngaO8LYLdGqt3EGfgcHZFAGvA3X+pldhP5zWragTrkYA1Br2DGC0s/8I+xd
 8dc++0XPVS6XvCucWxGdslvFehTSx/rjPP64DcZ/5lSJHzlIg3s2Jx8CXE7q+EOUBPkAAikUAKz
 jX+QWwrgF9IkP0VEcsy8pEyjMMs2aXi9tbnJW0Ci41tz9usgDuL9DbzHgMvrtToPQ4d0kyOKz7A
 iAL/GEZfkoilnzWAsAJ0spIiA9hP3lPoPerxu9nacOOgX75iD/wAZ8Iz17gtpJM1oKaR53m2MYN
 OQaN7U44NjwImIENC92Ncq4NELtMCvd5UwKv/G8FATswloGw4t1ynWxM87ZWh4QOPmcIDjK8JWh
 synW/ILzuBKif1a0PljfrgMuWqmrZJa6brU/bJmBxnD9sPYp6jslK4FbAgYJiygxkGaerb8tWdd
 BQjQYXUdU4qwU0TW4zjXFt8Jwhq9fIFsvIB5Ei6GGPWPDDubDO7hseeiGGyK6ivqhXBIyOVyeau
 cLwWqkMLQqZTbKoZh+AfMvRyzefmxpoUPG1tv2hzywI2ScSNpa8xbOkVsIEpXSPsoU/VlTpAEDo
 YRbUI/YM0GswTPeSGsfsv+w==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_100425_193119_983C36B4 
X-CRM114-Status: UNSURE (   9.00  )
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

The Radxa ROCK 5B+ is an improved version of the ROCK 5B.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96ef67ea1bba33c0767777378a38fa7..fe1fe8fe52fa3594a0da8e0263cb46949436a021 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -946,6 +946,11 @@ properties:
           - const: radxa,rock-5b
           - const: rockchip,rk3588
 
+      - description: Radxa ROCK 5B+
+        items:
+          - const: radxa,rock-5b-plus
+          - const: rockchip,rk3588
+
       - description: Radxa ROCK 5C
         items:
           - const: radxa,rock-5c

-- 
2.47.2


