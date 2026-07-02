Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4502C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lV/xZDDgSlSRP98zJPAdi6pUrMZvKZGFFOqnDcqXWoQ=; b=yTdPmqGHUeiYCEIzhHUxyocX7J
	JUC9zQC1uDruEhZRFSumAe6rXCs5f1o5XsozioDITgFABZ7sXq9tMG9VvACiLqtUNIscOyhFfyB2+
	FAJzYZmxBCBfsTZRewcpKkVcL/zMZBJTbZIvk/WivtClXyANh40oelQ54XnsKSOqsLnsP2Wry8TNb
	mrEAn3IxGN3pQI+4XEHHOltoBED4xyLXyvVhZaqbcENheNpa8BVpccYWeK2lB1nSkTXWuZJWD0Cru
	N7wC+7Wz4DqyJ+NOMUn7RV+lIFryvIgegmlI6zE9r799R252wXC0NnjxP5dH3HcelJ/nJYLcQGfmd
	027Sx6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHRr-00000004WBN-3rCP;
	Thu, 02 Jul 2026 13:27:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHRq-00000004WBC-1BCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:27:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F2C660120;
	Thu,  2 Jul 2026 13:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122871F000E9;
	Thu,  2 Jul 2026 13:27:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Expand MFIS acronym in RCAR_MFIS help description
Date: Thu,  2 Jul 2026 15:27:16 +0200
Message-ID: <b92a4b39a18aec7cdffdfdfbc75de4ecadb0395d.1782998764.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

People not very familiar with Renesas R-Car SoCs may not know the
meaning of the MFIS acronym.  Hence expand it in the help text.

While at it, drop "core driver", as there is only a single driver,
unlike early development revisions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2f2251d06457c9e3..8a625bc17091773f 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -490,9 +490,9 @@ config RCAR_MFIS
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on MAILBOX
 	help
-	  Select this option to enable the Renesas R-Car MFIS core driver for
-	  the MFIS device found on SoCs like R-Car. On families like Gen5, this
-	  is needed to communicate with the SCP.
+	  Select this option to enable support for the Renesas R-Car
+	  Multifunctional Interface (MFIS) device found on SoCs like R-Car.
+	  On families like Gen5, this is needed to communicate with the SCP.
 
 config PWC_RZV2M
 	bool "Renesas RZ/V2M PWC support" if COMPILE_TEST
-- 
2.43.0


