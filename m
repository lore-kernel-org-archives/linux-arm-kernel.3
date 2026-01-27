Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B4AD2FED9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDpCOanUPsymuJBKQY13SZEEsdVEYWmUDsrHWEdUyIE=; b=hkImjMd/NX6rBntcL0estKt38f
	J7oEiK8SU9+BcvChHDRW+gJQKXEJegvy/N++3HDNu/Qn5gAWfh6/50HQRWabDyO36kej1yQBG6YTB
	I8U1gUen0FVAxnalqS6quW8/VGF/bERINiLy1BJ723cIVR4fl4isLoBRKI2aeZhxOGc1GmDARWZfV
	pqPYJwdwPTXfP42UirtJw0qJHpXhEzV3O7rAMuwViwMVFKfHiSvYIYXILL1AVBsN/2G09VVZ8lsfS
	MFs1nzlZmiOvEjjR2n7F/tfsvMPxojuw/NNF+WASoBd8yP7BIPY4pV1G3e/UcjnsN42y75tmx8urZ
	nAcJLsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEe-0000000F2RY-44uX;
	Tue, 27 Jan 2026 21:04:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqES-0000000F2NE-28dl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 21:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=lDpCOanUPsymuJBKQY13SZEEsdVEYWmUDsrHWEdUyIE=; b=Ws4PKuzPoJW4JPO01HX/91MXbi
	jM0x1gbK1v3LTXrJ58x2fYtDbqUUb1SCuEW7Z4bKP9SJ5Pvl3iFI0N1PRDaEOBzLZUVHmxJrnWYtW
	7N3YAPcOkNnsm97dQRCGUmmomjQae47u3vGprhBGDkDG3CJzGtoswPalWNaacSyLxJ5B1y5l2aZh5
	1U3R89xPniubaNEhBWoJpXX7wCTZdaXHqf7Lf5wOd7zh4X7U2AHy6gHHMhFEmaLshcHcUAFJufIxg
	zt7VFIzGWfJyYCyuy1GWByvfqK5ImIORMj8dPs4lpyTRl7Oko9q8CEn03SYiecJTVmaGre1k+Fzbh
	qI6dExEA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEP-00000007cGu-0OIS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4669744364;
	Tue, 27 Jan 2026 21:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29053C2BC9E;
	Tue, 27 Jan 2026 21:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769547845;
	bh=eZPY6w3BtKVgEbAI10QJgfb0N2mPTbsUo8V2C9rWc5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fwbcEu6GBHbP4+8pyD1D3gPJ65gHZgC8DHwPIAtWGR0QSlU/eD3/xOsBvQxhhGMnm
	 EFRWYvb5LGp3cVSWUrvSE2sjOUKmIcKZDtqFT9d4ixF0SfgiUlEKuV8+eVDRAA+YTw
	 A19LMbOhuimjn5Vq1UrbBHPQ3w0IrOeAD9jhxL4teteKT54110XhnW+6MwOTaQfjeJ
	 Zhemqhieirl/AOP9zp7miI5q59eowHOmNzzOwia4UxrLUgo5TvJUARxtsCXALX+Gcc
	 XI1hE5x8ir8/Rw4JYjdlc14e3uqXesVKjpL2dpfUT1tFoEDKWBiZIUZKuS8DGi1QqR
	 4jjHZvxguR42A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5B6D2FEE4;
	Tue, 27 Jan 2026 21:04:05 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Tue, 27 Jan 2026 21:04:01 +0000
Subject: [PATCH v6 7/7] i2c xiic: cosmetic: use resource format specifier
 in debug log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-i2c-xiic-v6-7-e82e2f6f657c@nexthop.ai>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
In-Reply-To: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769547844; l=796;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=J/OOC66/6Sfkv45zHVfl6G0fbEDSnRoOH90Sob9a/M4=;
 b=z1VOfeSfINJ+Sstk8oOzEEhkqTiF6gN4ilY61XZnUqvtY+JdfITXn0FrwNvt7w5NXQLoEP46x
 gWmqDw/yDK5CjuOytBGF9I+DiHWVDhrQtAD84j7KCtB7BKY/N1qjOQ1
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_210413_753270_41EDA9EE 
X-CRM114-Status: GOOD (  10.76  )
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
index 9b763d8dbe84..75b43f469861 100644
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



