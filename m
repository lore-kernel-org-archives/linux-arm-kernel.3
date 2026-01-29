Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E70D73EA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFVT1pQs1GHMeM+Lbjza+f69sNdZ+5+TNlKYfgaRaRI=; b=abTa/n4r2WOKJoO7pyEb/eK8Fo
	/NYzw5J+NgFj5OuD0BElftVPmpXyCxsZ67XVr/lbxJq/Ke2cVc2mlayt9OV8H+9Ze+RPwmCUDgE71
	kKfoJW5KonqrIuGocjB6npVzCZSLiYnVMS+0BplieLNgJTCNYsKSbA/xe+VLtk2wmx0Uxzh7ea5z5
	Ucb1i8XhPrFQprHrJSE9h5BPP/JQaXyrIAecK1MwDe2U4sUlFxiYH8sJ0bKtSgAAIheoEWV88Ofj7
	PfR4jY4f97YSOY3PcBRBWE3Blz3dKZiH8qq0roSyOyYIgidWQsUPd9AufWbkyhGkmsz0yY8eRkky/
	C3EMlDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnf-00000000gvA-00vA;
	Thu, 29 Jan 2026 21:43:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnU-00000000grW-23zp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C457444EB;
	Thu, 29 Jan 2026 21:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B307C4CEF7;
	Thu, 29 Jan 2026 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769723006;
	bh=63LIznqFOs+vjoKgYNAGULivL80MwirjxtzcB50EozY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F17P0uMtYIGb2OgbcRMRPnqr7mzmm8VMjda/u8aBKUKo4NmcV39qOnU9ufh8EBe2G
	 QUbAcuAQeo10NNTQkdfN6WnqwP0VMxX+fOXzxBSCXuLCSQcAIXbnoT6hXBO859edX3
	 4AFYm9Ucf9mZoBdJl6mR1PqUnGw+I4LiOdDyXsnZsa0aKeipWxjHLvhGlv7ZBkYdJY
	 H886VBWcU8pR35FEZFv8GIwAgco3YIoRc0b+HdmzzUOa/IZ99BdPxydjtP7Hhl6wCB
	 1b4V/aL17a8V88+Hb6+wWmsS1c3hDvUSaEvf3uiqP6bfStKcdMt3LvXX/VlxIUrTnW
	 3ejr3THvlccoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02631D73E9B;
	Thu, 29 Jan 2026 21:43:26 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Thu, 29 Jan 2026 21:43:18 +0000
Subject: [PATCH v7 6/6] i2c xiic: cosmetic: use resource format specifier
 in debug log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-i2c-xiic-v7-6-727e434897ef@nexthop.ai>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
In-Reply-To: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769723005; l=796;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=AyCNoRBKLYKfBPlFJJJUJ1HZ4ulZ88H5iw5TKWG8oFw=;
 b=uQhYS1vit0sv+bhMHnHmHsL2lmmclZrijbdaPDHxYdtFj5dfVi4YedI9NYD+Z/SyM+YsYV4vz
 IZ6i3jzydC0AASM1+x6xkBVi5X/v2/P+CWVis0tU9y2DhXTR5v7qGMU
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_134328_584940_F164A9E9 
X-CRM114-Status: GOOD (  10.31  )
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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 37a15065db60..b24b7a7bab8c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1520,8 +1520,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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



