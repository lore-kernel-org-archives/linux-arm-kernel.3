Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBCFC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 03:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gKjlrnbwV/Bn4pcyTfOfkOx95etPTBFvpaV1v/x9X04=; b=lJCEO+4vBCA6AEuBDqytp3e88C
	1c1Clcmf10l0vLVlX598cMnACZ7agEo2+tuDjrTfKwRkfFvn31iOlc2Hq2CUGUdOq0iu7zQWDFTth
	3GZbX42dQbX+UFHktSuYgZpKauE098qfSfWdWpxB+YnZDWIsKfer9hDjfx6wd9t2skqD58ZMNd55T
	5kUS45/MJUGlSdBIl1lqlXfHEv6tQfsVSVF5B/bibEnC9tbNCY6SKECgJCzzElWBC2Ctyj1dd1J7O
	TJ2Ohpj++ulQOW4tXUiZoI5S8KRnHrnQKH1gWERFDk/DXftQrWjUeMeCa9fzyyDSe4+1EOZHwip41
	dVYXD0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHwXJ-0000000HKOx-16Wq;
	Thu, 22 May 2025 03:24:01 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHwVD-0000000HKG8-2qJh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 03:21:54 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwCHi2c8mC5ozMwLCw--.1360S2;
	Thu, 22 May 2025 11:21:32 +0800 (CST)
Received: from localhost.localdomain (unknown [219.142.137.151])
	by mail (Coremail) with SMTP id AQAAfwA3zCU4mC5oAmE4AA--.310S2;
	Thu, 22 May 2025 11:21:31 +0800 (CST)
From: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
To: robin.murphy@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiyuan Dai <daizhiyuan@phytium.com.cn>
Subject: [PATCH] perf/arm-cmn: Broaden module description for wider interconnect support
Date: Thu, 22 May 2025 11:21:22 +0800
Message-ID: <20250522032122.949373-1-daizhiyuan@phytium.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwA3zCU4mC5oAmE4AA--.310S2
X-CM-SenderInfo: hgdl6xpl1xt0o6sk53xlxphulrpou0/
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=daizhiyuan
	@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7Gw1DGryxuF1rZFWDtFyrWFg_yoWkGrg_ur
	yxWr1xJ3WkJr9Yyw1akw4rZ34S9F48ZryxXF1a9wnxZ3ZrJw1fWr4kZa4Sqw18Jw1xJFs0
	yFsxuFySyrWUKjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
	Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
	UUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_202151_852686_27713A4F 
X-CRM114-Status: UNSURE (   8.18  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The current MODULE_DESCRIPTION only mentions CMN-600, but this driver
now supports several Arm mesh interconnects including CMN-650, CMN-700,
CI-700, and CMN-S3.

Update the MODULE_DESCRIPTION to reflect the expanded scope.

Signed-off-by: Zhiyuan Dai <daizhiyuan@phytium.com.cn>
---
 drivers/perf/arm-cmn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index d4fe30ff225b..479bc35dccab 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2016-2020 Arm Limited
-// CMN-600 Coherent Mesh Network PMU driver
+// ARM CMN/CI interconnect PMU driver
 
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
@@ -2699,5 +2699,5 @@ module_init(arm_cmn_init);
 module_exit(arm_cmn_exit);
 
 MODULE_AUTHOR("Robin Murphy <robin.murphy@arm.com>");
-MODULE_DESCRIPTION("Arm CMN-600 PMU driver");
+MODULE_DESCRIPTION("Arm CMN/CI interconnect PMU driver");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0


