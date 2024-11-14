Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898B4D65C57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOSROv/ealMV5vU8TAZ9nIhvVTkOoOVosV++hhIi2Qs=; b=Ik26hufEYAZFUVBgqYcpcNmhSH
	UnKShEbnzC5sFx02eXTWGlcXOA7SS7AtZ/Hsi7QymG8cHImHWw8aeBr13Jc7rMK/Ck3w3qSSlm/kD
	pa8KAffEbGraoXOra7iCIakniXsBVqsurAq21EOfp3N6yUyQpL8RdsPYhQWHMtYyNZYDIlzHWyDcC
	7XNDlBVpaiXp76X7WZW1Ifyh6jzhu4QJ074RnE2TSBYwAfgzYJ7Teb6EZFwyrqcSyACyqjbVBm0co
	ttgdDedFLCaqG1tjxp7Ym5PrzdV2aZGXPL/9crgdalYgzRNRWK+IkZZ98ecb93fcB5hTy7HlIlnll
	JUTIkgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBVA2-00000009CYh-0Ym2;
	Thu, 14 Nov 2024 08:25:06 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV2r-00000009BV9-4Avm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 08:17:44 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XptHV4t4Hz1V4PM;
	Thu, 14 Nov 2024 16:15:02 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id EC95F140154;
	Thu, 14 Nov 2024 16:17:32 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 14 Nov 2024 16:17:32 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
	<james.clark@linaro.org>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 2/2] coresight: tmc: Add missing doc of tmc_drvdata::reading
Date: Thu, 14 Nov 2024 16:16:53 +0800
Message-ID: <20241114081653.24328-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241114081653.24328-1-yangyicong@huawei.com>
References: <20241114081653.24328-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_001742_242098_21F87388 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

tmc_drvdata::reading is used to indicate whether a reading process
is performed through /dev/xyz.tmc. Document it.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/hwtracing/coresight/coresight-tmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..fdf7955e7350 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -174,6 +174,7 @@ struct etr_buf {
  * @pid:	Process ID of the process that owns the session that is using
  *		this component. For example this would be the pid of the Perf
  *		process.
+ * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
  * @buf:	Snapshot of the trace data for ETF/ETB.
  * @etr_buf:	details of buffer used in TMC-ETR
  * @len:	size of the available trace for ETF/ETB.
-- 
2.24.0


