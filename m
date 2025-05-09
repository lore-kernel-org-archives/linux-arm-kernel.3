Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF03C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MW8E4Or1IxJBN7QwPDIkElHP1FabHgznpGfu6wzbwI4=; b=jbTS0cI1135Z9lyzkedcDnOI4Z
	h3jZT6qwMjJpuxJ/TDNIBdDuQfsKMm/MSBcMnLrJm73G1TfSuBgvfO8EBfVkgaiJkVHK2ibHVbbLr
	HRwHStuYlRMtb7ikjNRS2M5fks9bjd22Ff9z6F4YHtyevImBd0oJG2mX0o3NlGauHxbPvm9eNvKk5
	SlQrKxSzXtQDu96jkv8zAlnj511IKDPw5Uo162ntdNL2Rbb+ctqkwJlsSRfq5qinafV4x0iBJrZPE
	QtvQ2jZwJoCbKqHWlpPqF2lbN1Bw/D3dRTnWKW6KMQljnvCgAq0nu64p8HTnqDO6sTc53cKCOYpJS
	m2G/70mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHCk-00000002bh7-1X8d;
	Fri, 09 May 2025 06:27:30 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHAi-00000002bZw-01I7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:25:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZtzVp0dYYz1k1JG;
	Fri,  9 May 2025 14:24:34 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 71C7018001B;
	Fri,  9 May 2025 14:25:10 +0800 (CST)
Received: from [10.67.113.98] (10.67.113.98) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 9 May
 2025 14:25:09 +0800
Message-ID: <681D9FC4.6080508@hisilicon.com>
Date: Fri, 9 May 2025 14:25:08 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>,
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	Sudeep Holla <sudeep.holla@arm.com>, "lihuisong (C)" <lihuisong@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <salil.mehta@huawei.com>,
	<shiju.jose@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.16
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.98]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd500014.china.huawei.com (7.221.188.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_232524_207328_CFF07750 
X-CRM114-Status: UNSURE (   5.04  )
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

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.16

for you to fetch changes up to 49da9105781d99db3650c5e9a0d58ed9526d07c7:

  soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region handling (2025-04-21 12:00:27 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.16

- Simplify PCC shared memory region handling in HCCS driver

----------------------------------------------------------------
Sudeep Holla (1):
      soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region handling

 drivers/soc/hisilicon/kunpeng_hccs.c | 42 +++++++++++++-----------------------
 drivers/soc/hisilicon/kunpeng_hccs.h |  2 --
 2 files changed, 15 insertions(+), 29 deletions(-)

