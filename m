Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E2FE7C6F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 02:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjODQH7J2M3RODIQbs+TA8VVglZrVmh6ibD405pWMzc=; b=jIwchbFJFijB/0SKvd1fp1ZS/+
	WzpY7wFZadq+1OqqBqEXtYMhFemiMzWNCpLw+3SVuuoTIFSnz159Em0wOtxPc+tpog9uCnbhzvmxF
	tAgopLs+03VSQlwOboOdtaW7k6bSoCEYi2yHaToJWqiwkL3Re07ejMNX7rMAcf2mrY4R+enzp4EKX
	JdUeis1o9r6Mqmdx3xTaWuxIEkuxiL1gFpMnAG15inM85YmaT/pQow+cO1gX3TGe0irom/CTR8Iqb
	IqEWbcFVFnKxqeG7N62nlX1wqC6a5KbsmqDSB1j8E5wSgkFFgxkjYYHXiKp2ymtjzuQuiWPdFr1Gl
	uftxR58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmNfF-00000003Cdv-3JkB;
	Sun, 01 Feb 2026 02:58:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmNer-00000003CUH-1Zne
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 02:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BA2060213;
	Sun,  1 Feb 2026 02:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1077C2BCB6;
	Sun,  1 Feb 2026 02:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769914669;
	bh=kMjFZURa0+pQpBkA+HB6v9Ku88nudmFkiQiqSOAUbrg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UDIVeiExEg1dOp4tvnhvsbG8kaNBEzUSYlsauKYypSrBoVOVq6EAwpOaaf8OZncyc
	 ztS4ycLy103Dxb1Nm7TrEuWJym/nkvF76vXP43UK0dYF1Z0zvUYQeijtqPsiiPbhyf
	 qD1PjjCLeytxF2Yuxv2jVb5be2yewpB/ToCP0h9jLV9axvGn4t2sJ1K/S/wQejERrk
	 RbJxyR1oPqotfmtx56jy54VACdRoMR9rHPthzAtzMoMBNM10NRpl9Ngu/sZX2RA8LJ
	 qXJ+rxFQzrREwqHOiSuI6RvUYtNTVIkHggwVUZNiorPgkJOiXvHa7WF8x27DYQ1PZS
	 +aTDeQwyGgDcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FFEE7C6FD;
	Sun,  1 Feb 2026 02:57:49 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Sun, 01 Feb 2026 02:57:49 +0000
Subject: [PATCH v8 5/6] i2c xiic: cosmetic: use resource format specifier
 in debug log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-i2c-xiic-v8-5-deb2dd158d1a@nexthop.ai>
References: <20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai>
In-Reply-To: <20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769914669; l=856;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=r0phdJQdTs6GZ5RebcyDWbMdSSAKH6LIKg98MD7xqyI=;
 b=AigRR2fwVephOyiF2MFRtLe83Cakdc3okvQuTxnkty6tS3KjzFzcHHIakLU1MflawVN6CTvr6
 GtdVSB3Wmk7CPtf1FRQmUQGGbBZqzrpbdJE86j/IjUTFB4K8eEyLbnN
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
index 9880904be7ed..b8439b78d1ce 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1518,8 +1518,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
-	dev_dbg(dev, "mmio %08lx irq %d scl clock frequency %d\n",
-		(unsigned long)res->start, irq, i2c->i2c_clk);
+	dev_dbg(dev, "mmio %pR irq %d scl clock frequency %d\n",
+		res, irq, i2c->i2c_clk);
 
 	return ret;
 }

-- 
2.52.0



