Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEE0D3567F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 06:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=36pTNeA0z7lK++OvPBLCKeebVmsgDPwkZzQuPT3i1I0=; b=M/8bv0JFu6yi/TeRd65UMii8Cd
	WJViYq2fJ8jhbNPGjbfjm78j7QefqjC6Sg3MhvXvOgt3BWnBh5cI3cHS3aGit00YOPRu9+81LWTkV
	zBaDzlZ0ETLn2qqqwW6sH0XgenXWwlnqNLrpdsqWoWjeMJUssroL8z3ankExMymgO8aPeVCCmcoA4
	8ejsJeIDbYgYMkm0OUj6CheUf4KVmHmJ/wU8pcr48FF7gCwBj+u0KUyZhNJ6YCku7IuP4UPkhklIo
	gfIgnfUcMCGWKSq1ku9aiIeDDvfWBwhoNgBqY0murIaHDcTrDSNdbsMaT0uzTOuwlD8qbPOJg6rBT
	8cEeLRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyz7-0000000FXJh-2rBl;
	Wed, 28 Jan 2026 06:25:01 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyz5-0000000FXJ7-43zM;
	Wed, 28 Jan 2026 06:25:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH] pinctrl: s32: correct kernel-doc bad line warning
Date: Tue, 27 Jan 2026 22:24:59 -0800
Message-ID: <20260128062459.402841-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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

Insert a "*" in the kernel-doc line to resolve a warning:

Warning: drivers/pinctrl/nxp/pinctrl-s32.h:18 bad line: this group.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP S32 Linux Team <s32@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>

 drivers/pinctrl/nxp/pinctrl-s32.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260126.orig/drivers/pinctrl/nxp/pinctrl-s32.h
+++ linux-next-20260126/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -16,7 +16,7 @@ struct platform_device;
 /**
  * struct s32_pin_group - describes an S32 pin group
  * @data: generic data describes group name, number of pins, and a pin array in
-	this group.
+ *	this group.
  * @pin_sss: an array of source signal select configs paired with pin array.
  */
 struct s32_pin_group {

