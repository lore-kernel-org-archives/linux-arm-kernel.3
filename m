Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E12C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lj2fhJRKeA0fLHpL8rePooCS4THgkDEEd44Inlri0wg=; b=mphmdI1mgh9b6OJf6/dPV84Je1
	0yvT+3emYheKa100WkjsEcYipabH6rU9WjA7bwdfOYs1TeTyv1ZhuCHLrWzDMnwIjVf3qBDLiGk7K
	rXEmg8/7f79rSiJkD0MM75d+1NCq7duBKZholLE/ify698gwOqIylVtJY4zjXiNFBufDfclYbHR/M
	pGBRO2sNnFJpTrAIsA5jcDIgXvjpDHAWgTGcjD4E8ik4RBCJ17Ki0VtSmVURnTb7DILIYl1YSd/ws
	GwJJiPw46MVIA3fnuRHE13c+kUheGsmuTZLHpcX0P14oiqkyaYmo2zlDo293E7butcwrJDLBDt/Io
	f/X4Xdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgBg-0000000BzC3-3e8a;
	Fri, 18 Jul 2025 08:11:24 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg4f-0000000By1t-02Hr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 08:04:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bk2QL0pHTz27j25;
	Fri, 18 Jul 2025 16:04:58 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C3F841A0188;
	Fri, 18 Jul 2025 16:03:58 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 16:03:58 +0800
Received: from [10.67.113.98] (10.67.113.98) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 18 Jul
 2025 16:03:57 +0800
Message-ID: <6879FFED.1050002@hisilicon.com>
Date: Fri, 18 Jul 2025 16:03:57 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, <tangkunshan@huawei.com>,
	<wuliebao@huawei.com>, <daniel.shen@huawei.com>, <huangdaode@huawei.com>,
	<liguozhu@hisilicon.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>,
	"lihuisong (C)" <lihuisong@huawei.com>, Jonathan Cameron
	<Jonathan.Cameron@Huawei.com>, <shiju.jose@huawei.com>,
	<salil.mehta@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v6.17
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.98]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_010409_210695_9BB85872 
X-CRM114-Status: UNSURE (   6.22  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.17

for you to fetch changes up to b1136432c97241f0e5c40d58597da00d49cd9917:

  soc: hisilicon: kunpeng_hccs: Fix incorrect log information (2025-07-18 07:27:26 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.17

- Print the hardware ID instead of the index in the HCCS driver

----------------------------------------------------------------
Huisong Li (1):
      soc: hisilicon: kunpeng_hccs: Fix incorrect log information

 drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

