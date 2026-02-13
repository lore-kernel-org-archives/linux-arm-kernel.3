Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C0BEEA870
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 00:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUtmb+jNieZwWw9EpE9/PO2/fOEUKgC063vygvi3sSU=; b=CWJ4BLKPBu9pXJMImXykSgP0aT
	ydzvGWPdQH+GzsCgSDWev93ZBDSEDSkmy5mGROXEpvEBtKgTrX0jDm6cLAiX7aC6QUZjsDLX4IUPm
	SHdXq7jxoZZ+DZeCldB5t5ZOzU67LbjQdvDWRIAk4oJPJBSyZrIhM8n1exR6QEa434xBAgAr5KYNK
	245bOSUwfrSyAdFpNPIoRuaZZe45jwaFydXx+yNCTyPYoMV2Txr8qnxEYGLazpgxHqq1966j1SKFU
	vHMzlMB4PHqryqYVpryqUtcB7g/2bP5St+3PZMeCpVSEHA3MGe4vGI1SXuqBiYeAub44Z7Vi3QqP5
	8IGDrLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqJ-00000002ldO-27q1;
	Fri, 13 Feb 2026 00:15:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqD-00000002lYs-0AvU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 00:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E818D43C74;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAC8EC2BCB9;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941722;
	bh=kbn4C8NgmoBQzHsuwllEDpxc5+yBJkccQL4mCYwFGbQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SbZSLlWB+uyZw+umSQ1E7KOTp6lxAGrm9eOjJprTjFaPi3I/n7D9+g6JMVPuURren
	 coNhVEii/mxACikNsM94a3jjGRf6m5nf/uVjwDaRUXEtVxU7bg148E8usVtdUQ3om0
	 HdccU/9vl9YwuVs0zihcgqjta67Jbjv/iJx7CIWvvNA782toE9Hcox196TGgI2rV19
	 abaPpM3CmK6bVwbOtbIR7zXdGO4ucAB/6Y6/KzZezSWb0hB6Qm1sIuhSlpqD1vD4Lg
	 dlkZtokY6VX2vtwu7/N85ifQD+HGfjF5q7KFTJibW8vd3As/JAnIfbzK/cLqydwIoK
	 PSTns9qdFFh/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE75EEA876;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 13 Feb 2026 00:15:20 +0000
Subject: [PATCH v11 5/7] i2c: xiic: cosmetic: use resource format specifier
 in debug log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-xiic-v11-5-5d18aea11bde@nexthop.ai>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
In-Reply-To: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770941721; l=861;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=58fg1T38jFleb0swh741hN3S1SY1m1FGjswU0Y+gW0c=;
 b=nMJ+FAm5Y+DoCJAmk4Hyhfjm9uY2Br2aFcy0WDdixEHQkgFc+mbox3jTU66zde0Nb8+Y1TGzV
 ah8gaUDKVL+B66m71/PXFzLFcOhjIRENGzKBZbGw1Rqt7lMlnzpmwgj
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161525_151588_E4079372 
X-CRM114-Status: GOOD (  10.28  )
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
index 377fa5948c3f..373c00a93034 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1518,8 +1518,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
-	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
-		(unsigned long)res->start, irq, i2c->i2c_clk);
+	dev_dbg(dev, "mmio %pR irq %d scl clock frequency %d\n",
+		res, irq, i2c->i2c_clk);
 
 	return 0;
 }

-- 
2.52.0



