Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACB2CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rvdBRXuVZQm8G2d5SpNLaJ207ItUCAtXqb2fjgCGcoQ=; b=zCj9+D75oJgOI76CP3whF/Izx2
	jOc9EAXrI9lLRHN8utbECRs4gIaNpwDkLaf/829Pg2NXrLIOq5HVCG5zkm+WC9rizU3zGUweowSr5
	LULx3d6libSUiKotAxk6K2XqxTTDWrIV2qhXQTbQNhrRU5PX4kL9gxkvCIw5BFhH+nQfvBs4Dg7gw
	8MkE6qqYtcEfhZoVdFHS8c5dUCRFSj5cEqWKXbFcvWN59X+Apu4EV+Fv9d6f3vSZ2T1Wm5x6QZLaW
	ftY7IPrVEdcfzdSz9d76B5eeIb+UMMl7NenqxsPRBJQ8p6EZPeny0OZ4hl0icpSgvJm8A6+VYj40V
	aXR2hNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3KO-0000000Fybn-0UhU;
	Thu, 06 Nov 2025 16:59:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3KM-0000000FybQ-0hsM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D7BC6191B;
	Thu,  6 Nov 2025 16:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7582C4CEF7;
	Thu,  6 Nov 2025 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762448353;
	bh=5zVxDLJDS4HgZvm0mUPMa4NXwy0uzOr1eXabb1arNpI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=m/pF21hXXdxtUQjEpD7ImAPfMVCmNCJ2tehEPz5uAKfbfWxrAQnoXZPNFBbgOe+A6
	 VyU4Gr6tnm/VOVLcTJIsz8H2+IFUox0CEJF3M25ALvUjI6qwJ+M23+yi68cfIhFcg9
	 Iokb74FJ1ZmUNMPv5qBKvvCpMQbccALrAlRtUB8dCFNz+k4yk+hyUm8ZIAk9m6qREs
	 ZaA0G8RRFZCikQck59el+G/yILo0vRrVxw/9zzEnfmLM+1PGZ/ozslAgVoenTS1X64
	 uobNY6wQ7vIDer2ViUmnr7nFcyCNtQzy4CjD60pQd3QwRygy+NKpxX7XZg6rDF+VCG
	 Bh0ISPmF1I24g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D679ACCFA13;
	Thu,  6 Nov 2025 16:59:12 +0000 (UTC)
From: Kimi Chen via B4 Relay <devnull+kimi.zy.chen.fii-foxconn.com@kernel.org>
Date: Fri, 07 Nov 2025 00:58:39 +0800
Subject: [PATCH v2] ARM: dts: aspeed: clemente: add gpio line name to io
 expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-dts-add-gpio-to-io-expander-v2-1-585d48845546@fii-foxconn.com>
X-B4-Tracking: v=1; b=H4sIAL7TDGkC/42NQQ6CMBBFr2Jm7RhaAaMr72FYlOkUZmGHtIRgC
 He3cgI3P3l/8d4GmZNwhsdpg8SLZNFYwJ5PQKOLA6P4wmAr2xhTtejnjM57HCZRnBXL8jq56Dm
 hq+lqiULTOgfFMCUOsh72V1d4lDxr+hyxxfze/7yLQYN9fWsbqu6We34GEQy6ksZ4IX1Dt+/7F
 3ryuuvMAAAA
X-Change-ID: 20251106-dts-add-gpio-to-io-expander-a4c32ccf56aa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, Kimi Chen <kimi.zy.chen@fii-foxconn.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762448350; l=1406;
 i=kimi.zy.chen@fii-foxconn.com; s=20251105; h=from:subject:message-id;
 bh=q3Hjka33GAqrC98JfV2gHVz/SyvVpQc9OOGcXtH2A3s=;
 b=NrYZXH/6ZM0K5uh1E4Dpz9BEY/90j+EqlD+xpSNYCWBMgYSWb8gU3AUlhgA9eKPNOTBjBQ8xF
 hI/8nERMKFgDSBf2fbZg1SHASISyBZ14VLdDlX6u4mgFSYLGXe1XLtL
X-Developer-Key: i=kimi.zy.chen@fii-foxconn.com; a=ed25519;
 pk=3zHetsW/3CYYIgQlYV9dqSS7aW7aZXLUaIvc+OKr3NM=
X-Endpoint-Received: by B4 Relay for kimi.zy.chen@fii-foxconn.com/20251105
 with auth_id=559
X-Original-From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
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
Reply-To: kimi.zy.chen@fii-foxconn.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>

The chassis power cycle process requires a forced shutdown before
cutting off the standby power. Therefore, SCM CPLD adds a hard shutdown
host function and triggers it via the IO expander in Clemente platform.

Thus, a new GPIO line named "hard_shutdown_host" is added to the
PCA9555 IO expander at line 10 to notify the CPLD to execute the hard
shutdown host function.

Signed-off-by: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
---
Changes in v2:
- Add "hard_shutdown_host" GPIO line name to PCA9555 IO expander for Clemente platform.
- Link to v1: https://lore.kernel.org/r/20251106-dts-add-gpio-to-io-expander-v1-1-b4765c092ebe@fii-foxconn.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 450446913e36..0eafd8ea04ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -983,7 +983,7 @@ io_expander4: gpio@4f {
 			"",
 			"",
 			"",
-			"",
+			"hard_shutdown_host",
 			"",
 			"",
 			"",

---
base-commit: 6953afcd81a2cc73784e3dd23faa0a1aaf97441a
change-id: 20251106-dts-add-gpio-to-io-expander-a4c32ccf56aa

Best regards,
-- 
Kimi Chen <kimi.zy.chen@fii-foxconn.com>



