Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA7E74903
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cqpSBWZTm3ItKpqET0vvUJxJ4ZTJqkwttG2v5AY8IE=; b=dJZsA3bjSc3dMHAKBKqzBxUrhe
	YthjlVHz9VKNK4bXJxUvxpQpN82C39ikMCRN74f3CXuiTdM8R2RsTn6GhfgK+HKQB0K8wtMjf/dm6
	tQCZYxOdUEiBTH9fM4HWTkWwoNg4C5t0up5TNnU93gFQCx/atXjOStj82qjqM5MLzkNRT/SsC3XAB
	Uyh0Xwe/IUDDMihpe7NhRrCBCAFe9gtnF62zAtBFG9TwTRTvNYvTImovmOB4tIS5pNEqB69kEGOwW
	r4ubBGcSx8Qfwpli6nbBBO2dpppSVfrYQhsVL2XDMPKVFdnWA94+p5dtqDwQ3zW/YU7NdgCteoi3A
	93I8ox7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHZA-0000000GRhV-3hcq;
	Wed, 24 Dec 2025 05:37:44 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHZ6-0000000GRdc-2Pxo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 05:37:41 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Dec
 2025 13:37:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Dec 2025 13:37:23 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 24 Dec 2025 13:37:23 +0800
Subject: [PATCH v16 2/3] MAINTAINERS: Add entry for ASPEED clock drivers.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251224-upstream_clk-v16-2-8c1318f56c3c@aspeedtech.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
In-Reply-To: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	"Ryan Chen" <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766554643; l=829;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=GAvow/VegJcR+SznQ1U89Bb19y2myE8OgX+jpQtvYRM=;
 b=0DgzmB1KgK1DHqUvIXQ+w1pgqYdQkPpiyiGNpTYJXmQBzfbrQ1S43sjL/D4pBPjFjW/16Nqes
 UiwN46W0Fd+AT3WHmRBKTz68a4DoaUzUtQMvUsxIYuFGP/6ZZXeNcRt
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_213740_621070_7FF146D1 
X-CRM114-Status: UNSURE (   7.76  )
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

Add support entry for ASPEED clock drivers.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..201ff5d5c31c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3836,6 +3836,15 @@ L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	drivers/net/phy/ax88796b_rust.rs
 
+ARM/ASPEED CLOCK SUPPORT
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
+R:	Joel Stanley <joel@jms.id.au>
+L:	linux-clk@vger.kernel.org
+L:	linux-aspeed@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+F:	drivers/clk/aspeed/
+
 ASPEED CRYPTO DRIVER
 M:	Neal Liu <neal_liu@aspeedtech.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)

-- 
2.34.1


