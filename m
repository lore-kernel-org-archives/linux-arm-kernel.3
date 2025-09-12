Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B22CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 01:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0U+R6CiuqVFcAIqGzCDGZAJfFiE3GUoruGO7pjTxHts=; b=4hBvUF2TG4tC63
	jC7TKPy3exyBX79CBporaKF+Tw0V4NFlb/KcxbPwHN3NKLS+CCot+iJSZC/YvCA/AG4mHkx3FXn4Z
	Y++QlPNjMjWRHWP6TQ+zy4QwSFOS8xgSOejfE/dDe8miuZGB5sAhIKsRzv0w6WMZujWY4RIgU/jij
	leYFSGTFviXSCChlNk6RTiwVIpJyc64jUSVLsbrYD+i+/s/hAX+25nu3VajmXB3NdXiREKQK1lTbh
	IfFTgQ2TkP1w/DMe9NgTQa2V5yslnX/pJHYV94iewBcoGoxZ/8XGnA3NlszVAW5t+xAac1EFjZPmD
	Ve23bmvkv2fwap0kkc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsYq-00000006Iic-1NCr;
	Fri, 12 Sep 2025 01:26:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsYm-00000006IgH-3SwW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 01:26:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cNGvg3HQgztTcY;
	Fri, 12 Sep 2025 09:25:35 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 539411401F2;
	Fri, 12 Sep 2025 09:26:30 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Sep 2025 09:26:30 +0800
Received: from [10.67.113.98] (10.67.113.98) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 12 Sep
 2025 09:26:29 +0800
Message-ID: <68C376C4.2030808@hisilicon.com>
Date: Fri, 12 Sep 2025 09:26:28 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
Subject: [GIT,PULL] hisilicon: driver updates for v6.18
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.98]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_182645_018673_39369D62 
X-CRM114-Status: UNSURE (   6.36  )
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
Cc: salil.mehta@huawei.com, daniel.shen@huawei.com, Arnd Bergmann <arnd@arndb.de>, tangkunshan@huawei.com, xuwei5@hisilicon.com, zhangyi.ac@huawei.com, "lihuisong \(C\)" <lihuisong@huawei.com>, Colin Ian King <colin.i.king@gmail.com>, "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>, huangdaode@huawei.com, liguozhu@hisilicon.com, wuliebao@huawei.com, linux-arm-kernel@lists.infradead.org, shiju.jose@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-6.18

for you to fetch changes up to 07188450191da0e3cff6f6d0c42de74d6cdb3602:

  soc: hisilicon: kunpeng_hccs: Fix spelling mistake "decrese" -> "decrease" (2025-08-28 11:23:08 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v6.18

- Fix a spelling mistake in the HCCS driver

----------------------------------------------------------------
Colin Ian King (1):
      soc: hisilicon: kunpeng_hccs: Fix spelling mistake "decrese" -> "decrease"

 drivers/soc/hisilicon/kunpeng_hccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

