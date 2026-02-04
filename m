Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C3DE8307C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3S2eFeBqI95ThTL+RFDYW730kuwN/y/t9bX/jDdD/g=; b=qVmoZu6hFroSl8GuS8Q2b4Wz7u
	scFVdeY0GlkrCufNaGTHfvcz/vTx6SgwTiTFU1jSaF5aUcah4yTMi1FEE1opnvq2rDs7ZzNjSED8j
	7RSXUdcqy5uSjvHE2o1XbiIZYHeqZuJk1O5LCRBMMxFGYhGE00So+RNfDJXe4Nz1Nlt+LGRQdy0Dj
	+h7EZ2YeCNTxXRZc0bfWdsKAFUMaJe9j0zFrfx7a1bk2Mn8Vhe7rZwC0cZ5w9b6r40a54eNEIqnMQ
	L8+NA+DKGpOvFMGuKvK0NHk0bOQooXJRjjsKhFqpPD3+Q5q7P5jE1n9TWIOdL+8fijyv+ZHe4iliN
	Zmmvfg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWtu-000000081y2-4BDy;
	Wed, 04 Feb 2026 07:02:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWtr-000000081ux-2tXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 07:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C09AA60134;
	Wed,  4 Feb 2026 07:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 808DFC4CEF7;
	Wed,  4 Feb 2026 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770188526;
	bh=LxoVmxDXXmBVVhAwbDaeJQFyxYsskpuHqN1apdaJrQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qvOsPjvlRvEeB863eDniO9/cNx7xpbkYJ9PJs/VbIhCsGngxfWlzo4lOlhI/pu9ag
	 zZROTKOdwP31rUV9F7m9GTvhGzE5fCKFRKoeuPcR/tGDAIxkRE3p01Va5LO+0mu20h
	 T92AsDvX7iG4LGarkrbNIcmASwodrhrQhLEDijLL2jrfr6/rP+mPILmoLttAwY0qjz
	 RG9bzhBjUT/6x9a58ZagjIwejDimtSrsMGARyt1hLuq0T3KMqy7AXbKkKB8I3gjkvP
	 wxvBFuLMNHQmviO8rq5v3ndrIfEyj1gltGLVgP3Dllk/+QelAOT30cVhLXXCTy7Vyg
	 iEJacJnlPRJOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DEBE83046;
	Wed,  4 Feb 2026 07:02:06 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Wed, 04 Feb 2026 07:02:02 +0000
Subject: [PATCH v10 5/7] i2c: xiic: cosmetic: use resource format specifier
 in debug log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-i2c-xiic-v10-5-c2b996425235@nexthop.ai>
References: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
In-Reply-To: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770188524; l=863;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=GiIahtjK7bofJukLRpl9r+0ubtXiljSfc9Z/DVdZ0TM=;
 b=72tWL1XIDqJBVGstyFSC+vlQjYPs0Sjvsxzk1Ub8ypO9jg+iDiKrYc6LfJ3ZUZlGO7gBgoIr5
 drnWtMdenUhCSAMUvkhIIcVBdRzS60KY3L5S2CcYi69rBSj0iG2aAiV
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Use standard resource format specifier %pR in debug log.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index bee663f91f10..eeb8ba8e131e 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1518,8 +1518,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
-	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
-		(unsigned long)res->start, irq, i2c->i2c_clk);
+	dev_dbg(dev, "mmio %pR irq %d scl clock frequency %d\n",
+		res, irq, i2c->i2c_clk);
 
 	return ret;
 }

-- 
2.52.0



