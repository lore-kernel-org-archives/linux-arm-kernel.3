Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61DBE7FDD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7UH7lyVO7tf7ig9Alqe+1tmhI0qmFQSgJ2ydigA0EE=; b=dgaz/PTtytB7GwA2VX9GQ2nXTS
	eibQXIv5WxROAvYTWmRl/JL1VosUoRBt+J/1NUBkYfq+Fa4Fkl5fICE40xTsi6uU96DrJwz3qQZZQ
	05b64+ZBLT32glB6426cN7Lh2MXe/ky6qN9qifGU0PE79g/2uszx+w9gLfJJ52SpTrGgCZu15c7JC
	oY0fxfxGoA4kDFwsdG8f01dYtD7KJKE73VAgLxq/9PJRgjQZJowmyw7ifLLMA+HWnVjMV0mk1GRZs
	eQT4bt3xB8AKOj5hlNWcU44HremXBtlzJHDfBuZL3jMv+eclhnSkbK0lP9SxpLuA8OxTNeHo/RkwM
	t1NZ3evg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0fz-00000005caw-3tLq;
	Mon, 02 Feb 2026 20:37:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0fw-00000005cXL-49Xl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 20:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5383444C5;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56D55C2BCB1;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770064656;
	bh=Xksoe2+S7Mf+L+o1XLDCUHOeZtAgXsNJ8wt02v5c5fE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uD2LGyb79vtLQ27ZflKOdGS31cNVKV16K1yKZAqPGM0X7keSbvKWPlejyAYZbGMxd
	 IrU1PQzTW5ybZO91p8VBqORtypSss0t1N9dpdKk+WKqQY/kD24hE/yTrv0Y7iAMqbx
	 o5qF+EBMpov0ZYcJPlG97wga2oGS+vWDzFvX5WN7+6SGc1f0b8knsL6qJXhxc4w4Hw
	 PpUatl0or53JPtRqA9LAHVgw2sjcdkQjoVCEPiLvaHeQ6iEQ9+O2LhfqBDYrdvx6yv
	 LU32jWOcTQ5l7Mytuh9PGybtZ0ErxQMKyCvFebdOMiym2Tvfnzf1dD4O++x410biUl
	 091HTGHncwFng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47768E7FDD4;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 02 Feb 2026 20:37:22 +0000
Subject: [PATCH v9 5/7] i2c: xiic: cosmetic: use resource format specifier
 in debug log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-i2c-xiic-v9-5-ce4695f5267d@nexthop.ai>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
In-Reply-To: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770064654; l=856;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=t2F391AQVy1CL9rMsRzI2NPAaYKBn3gbJ/BmjKyoXVM=;
 b=W3gV+F76fdQ6UqgI5HpUynyGfb5qvfIWV9fvKzLobDKxlBrKDdvI9S8L9/eeV50woSaJbJUYs
 qnRcBQYalwQAnRxJqrUci5kHgtCWUlFjDY67md93N50xL8ZdEltZZyp
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_123737_083337_2A502905 
X-CRM114-Status: GOOD (  10.49  )
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
index ade0fd66451b..eeb8ba8e131e 100644
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



