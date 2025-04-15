Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967D4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWGrnOqysJizSR01smsSWh2TP1Mi7MZUbGBVnPLFD8I=; b=1np3Y4hISssr31YxBijG5pcR6V
	r9bXxVONdnchPifywe3O4Cme2kezeZTmPNDMDxPPNzQ+cujUGtofU+6nKXAE6Baqjc0w0c29H7523
	/TSGWpJVhhtmfsZZ9URkMOewGVvkAFJ8qISluL/3mwFYFe3gJckD5czLnmoQ+6YRnY2KWEHGxtDic
	cO9EXL4BECkwaHoaNsNSx6AGf2KEl/Cj+Ffno4piR3fQjf0fbLXfreClyPVI1A1MjP0Uxe63YJou2
	siD6GUNWpkSGh0OM3DiPsFS1/joC1ir/weltSin3JxtCQXU9QZJzSlykd3qwf3ssLPwKRK4kGpEwk
	unkH/24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4imq-00000006M2f-1B7Z;
	Tue, 15 Apr 2025 16:05:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iLm-00000006GoY-18dp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 15:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=aWGrnOqysJizSR01smsSWh2TP1Mi7MZUbGBVnPLFD8I=; b=cQYeQygKY84EZMwl47zQuXAvo+
	XtTpk5qhOoAse+eKXTX3yJydG0g0tFNBJg1bLDaduPKB2+FMATOR8awUbZEMnScNivkipVJ8fQUUH
	7zk0q1YEMzeE70WBcZjU8dXyW53kDEegfzi4UetlMWoX6jpzNSRkWNhz9jw1DmqUjvWAvCkoVTtOu
	Q7LZt+UDMqFtMVdk9kj/HWqmfS7IysbVQy4Uq78iHYznwQo1gE0ZeRglZdNBdwM9s9OsgIEx/qbOv
	7tGjHPXfpFaSWr1KpibR6EhFJ3lV31hZL/AHEqEIqzKmWqjKTFMJ+vDxp1APY7zJWzdaU7J+MKZv/
	iUeDQOqA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4iLi-00000009uss-3gbx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A55744A347;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DA19C4CEF6;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=NZgmwCPRLWI3kpiACRhVK8RgHlS1bLhmnT/HYgkFGdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TSKpof01gBcDIqp1QhNNuavMJvKiQDekMhNXaX1zqpSboLdMZt2sYK64S6kK0yoTR
	 LTpr9IzVoTwInti3CLtqjFiBpJkfUGK8MhvbOt0AbXjUMvLTuAjrHJg0vPyQ/KX+7k
	 cukVgT0d2r99Tro+Av5nrtkIWP7a8irZ06tj6nDyHxm2cx+QO8g4ZdpaRCoK8Br/nv
	 Utq0cRG96+rjcwCiEa2j/KTBEzkc4dkkwPSPCDwMQpY/E/pUJkltn6+ceJlhBZW1F4
	 rfDqV0kct4pAWX6u+H4Dr08bpjttADS/WZY7LGZynCuFhZTkG3sBicTH2id5NbxwqT
	 n9vXb2FCIxmJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB67C369BD;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:59 +0000
Subject: [PATCH v2 5/6] i2c: pasemi: Enable the unjam machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-5-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=avtSs0p55pNQJTNl3swTi6LwCmUmFUOOKuZ3dOr9VMk=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/Ws2ndfPmtB3bbO2jqvDW5Ev4LGcDy+r+knvZS59Pe
 X71jezqjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEbHkZGU6nTbw1R/BPS4jk
 jcyrs3Uk5026L3Qj8fylVBc5TZurXrMYGd5u+bD78K+fK15NMFWyPLghsbbqqc4xs/jri+yaTOL
 5uXgB
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_163723_456334_BBFE2BEA 
X-CRM114-Status: GOOD (  11.71  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 2f31f039bedfd7f78d6572fe925125b1a6d0724b..41db38d82fe62c73614b8fafe4cb73c7d1a24762 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -78,7 +78,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1



