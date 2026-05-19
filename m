Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1EDCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7V5aA7Sn0mc0rgKl/4t8vSK/W7SBjMvzr/ezwB1cGk=; b=Fxq/OkKq6sLY1m+ciRTdm2MVFV
	mS0jKiDhme/FTNjF4KqarjM6/kFkzoViqYoYlaqCY66EM1O4gtrTzUdrdXdA5gz5II4i+wGkamd8p
	TBO7hbLwD6yl2cdZboVBBh3kBNLWVRySAhBlTX0Z3GizUn3UQkqk2TqTN6i+Ei6qdJUlSvsYhraRo
	nGCwHLfUhmNHpJdFF/X0M+aJgsMMA6LfjMnvDNuawNeOHB/cXxe3RDkbisxWbgZPFaE0yTfoGSosp
	dLweMcCI8BnHVbMn5otO/D4eHHA56Bfuhc8/GFSsUP5YgZ3u74tPyrnZqUfTfoMjT1l9s+Vp6z1gd
	ePFN26UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG2P-00000000iSj-3ViZ;
	Tue, 19 May 2026 08:42:53 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG2L-00000000iQP-3rI5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:42:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c7V5aA7Sn0mc0rgKl/4t8vSK/W7SBjMvzr/ezwB1cGk=;
	b=SefT0NFmpCdZYjLm8F+3vlCilhNbunIrP0FhammjUBjLRhrqxEUKLfr9BibqRv/P7TKRAP1KK
	5tgLNanfKlixFsPsS0aOsGdi8sSIv3qJyTqRX1wJoQkmFsvzoy+qOW8XM5ttkMs2O7zO8bnJbO4
	2im7V3oUNaYoSXiLMTsV6Ns=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gKSf61Cr9z1cyRG;
	Tue, 19 May 2026 16:34:54 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id A884640561;
	Tue, 19 May 2026 16:42:33 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 May 2026 16:42:33 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 19 May 2026 16:42:32 +0800
Message-ID: <001403a3-513a-4c17-b2ec-2beafbf221fd@huawei.com>
Date: Tue, 19 May 2026 16:42:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260423152959.1458563-1-wangyushan12@huawei.com>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <20260423152959.1458563-1-wangyushan12@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_014250_452710_D96CA38B 
X-CRM114-Status: UNSURE (   9.90  )
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

Hi all, a gentle ping on this.

All comments are welcomed!

On 4/23/2026 11:29 PM, Yushan Wang wrote:
> This patchset added support of ITS PMU, and new version of MN PMU.
>
> ITS PMU supports counting number and latency of interrupts by catagory,
> and statistics of micro-ops of ITS.
>
> The new version of MN PMU added cycles event, to be used for MN metric
> computing.
>
> Yifan Wu (1):
>   drivers/perf: hisi: Add new function for HiSilicon MN PMU driver
>
> Yushan Wang (1):
>   drivers/perf: hisi: Support uncore ITS PMU
>
>  Documentation/admin-guide/perf/hisi-pmu.rst  |   6 +
>  drivers/perf/hisilicon/Makefile              |   2 +-
>  drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 365 +++++++++++++++++++
>  drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  |  61 +++-
>  4 files changed, 427 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c
>


