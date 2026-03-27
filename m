Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAB510BA431
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:MIME-Version:From:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyqVda/JjNdjXtcLyeju+CukF5PpQZ3xDxa4b/RlBfk=; b=zBR6Xa5RC3/1t74XrLO2+y41sz
	JjdwfcKw3Lr+jlVZJdEhS61BuYrMSQnHX8gDpsdms+qXBmVAjtKPe8xN086Eym6ftNkLqltkQe/pH
	XzkjEbQxu2jaTcdiMYISqZtgAvEoMxHmRNwC+DV5Myg3TxtvUd0HdlFD9mT0hO6C7fkOOLicCTLwU
	5g3J5pfLRlbA1kzoWiadjHrqEWCEdoGnHgK4nVPayNdHreNRkjeRacqj/PspCkeflCwYeBOh5OBcR
	JgQKVfPpIP1MX/21k/UBFpCMhbxu1fXMry/rTK92li3YAAMJg60u5GeHs6YiPDdRUzK/B0BcwsYgf
	ZEezWUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61Qz-00000006rsx-0DtY;
	Fri, 27 Mar 2026 07:16:45 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61Qu-00000006rrV-3Fys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 07:16:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yyqVda/JjNdjXtcLyeju+CukF5PpQZ3xDxa4b/RlBfk=;
	b=JcvWvuzlTpohpEirVMRGhHQix+JYpp73W5ctgk2L4oUqcRpHiMqnWDtg/9qewc+DKs8yFDRM5
	JSHPoKhenyjtkZaxIoVXDSxixrtW1YVdmjGelBEOm3FvEfNjWKVbs7flmFZobFTf6KmYC8dnCc1
	YdrW8Gw2xTntERnm4FKAcF8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhsHd6wBtz1T4Fv;
	Fri, 27 Mar 2026 15:10:53 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id B5D5F40571;
	Fri, 27 Mar 2026 15:16:27 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:16:11 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:16:11 +0800
Message-ID: <69C62EBA.6000608@hisilicon.com>
Date: Fri, 27 Mar 2026 15:16:10 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, "Wuliebao (Joab, Turing
 Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)"
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, "lihuisong (C)"
	<lihuisong@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shiju.jose@huawei.com>, <salil.mehta@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v7.1
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_001641_342386_29D369B9 
X-CRM114-Status: UNSURE (   4.56  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-7.1

for you to fetch changes up to a8f5c98517c7c89947024f79e5854e6b09766b79:

  soc: hisilicon: kunpeng_hccs: Remove unused input parameter (2026-03-21 03:55:35 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v7.1

- Fix two compiler warnings on kunpeng_hccs driver

----------------------------------------------------------------
Huisong Li (2):
      soc: hisilicon: kunpeng_hccs: Fix discard ‘const’ qualifier compiling warning
      soc: hisilicon: kunpeng_hccs: Remove unused input parameter

 drivers/soc/hisilicon/kunpeng_hccs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

