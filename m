Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBED6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=864IBWPR/g77N41nse+BQX0aC8cI/YU4haFPAwkPj8Y=; b=OU6ezLJgaFFeQd8HkN7rdxnM0W
	8ve9sxNAMvTZPcupRjFQO8o7JX/nRVLTcLTYBck0MwiCbmXIMdGXJM3jb8BK20zHsX1elaAClBg9s
	d9uRhqYcXhaDhYKVSk15QurMQJsaXlcSLy+lFaOGHbXlUW/jLRDVMyp2Tjoy8Ys414JoNpGZdNF+n
	nTXOzEx/+XdFiYrTSYkVmYGMr9pLh/OnxqjGVz/GcCYOfV0VVpLvBqPabamnN/ZYSwc/vKA2c/Gez
	luU2lbYGTXzJuGW8F0LUEZrq2qkziI+IbNQlNbioSM9QWNL1Skrt4EDXTrHkhP8m8qpgt2NNAEJY9
	IoKQS6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iod-00000006MJj-4BR9;
	Tue, 15 Apr 2025 16:07:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iLg-00000006GlX-2rKl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 15:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E5A54A28B;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45DBBC4CEEC;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=tKCZ1U57MVrN0lerBtOC7DMLUFHO1/PGHr6C3AN/kw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rsTNqLfyi72SZ2jdirJeSjURBXX62aZ3L4pWjWLptiWpw2cfwZe/aRXiQoEaOh4g5
	 RLBOosAfAdYQtJgmkQoTKYqqnhgD6zjHH2wtCPTV/YJltfh4aZs3h6P+ObW3x1zwWo
	 CtLJFr08sd65Rrec7g9PTaXiGScXZa3ArJQla2WLBTVQTRskWfFcRoTTpACdHw0GZx
	 /fbvokcvpvMPAZqSOZB9qn9hyf7MPRAYfpf92zozbk0aN42rIqjTfSw0J8WMc5sbjS
	 GaICvSypnddmjlIYeLpm4LrLFSX44d7INNmiyQA1ngqw98f+TNdtdO5ZGweFn9rBIu
	 qWr8fXD3ygmSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B65C369C1;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:56 +0000
Subject: [PATCH v2 2/6] i2c: pasemi: Sort includes alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=d4SrViBETCvEIVGrCu813u0fCI79k8TBuEJCcmGpDI0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WtWl7ddnLW1MubOp8d16cesWr2/7U2cXBHtceHk94
 Xb343vXOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATyZrO8D+9Oq6hSL4vb+s3
 aes9x67wXZ7ywlla4kKDZuwqy/eW7yMY/ik9+WNdy5A+zzfXXDRK0vDdoZPBj/T0lJ3n3axrt+s
 uZwUA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_083720_764357_11E1AE11 
X-CRM114-Status: UNSURE (   8.58  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sven Peter <sven@svenpeter.dev>

No functional changes.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 10 +++++-----
 drivers/i2c/busses/i2c-pasemi-pci.c  | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 71cc8cfc7c5cbf3924269f6217712d42008c03ff..df1b0087dcacb0a3b94196368137d5e20b0e6d7e 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -6,15 +6,15 @@
  */
 
 #include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/kernel.h>
-#include <linux/stddef.h>
 #include <linux/sched.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/io.h>
+#include <linux/stddef.h>
 
 #include "i2c-pasemi-core.h"
 
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 77f90c7436eda2df16afd7f1cac79355fb005bfd..b9ccb54ec77e22bb1b77848c858e2e0cc51db7e3 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -5,15 +5,15 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/kernel.h>
-#include <linux/stddef.h>
 #include <linux/sched.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/io.h>
+#include <linux/stddef.h>
 
 #include "i2c-pasemi-core.h"
 

-- 
2.34.1



