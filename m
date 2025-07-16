Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9BEC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP8L2/Q/fL9MEvSrQAgzxFQOX5QG4Of1oWP6kDp1o1U=; b=o4eTMtxx5t1ppd
	QMX2YdDBebrLqt7/lybUqDLt30HVou1wdeyCI8Mk2gShn4hyVLSjjEfhKucyIWa8iiD3Onjeza/Ci
	VwaOshvnvd4Eq4HazUhJ+diBzxAfoFk6JEFf4WJx8Lko/7hc2z71iqNm6kCFDTErqedJdY/zG46cd
	BmMRt61sdg9jHGknWxke3mnOxOGJKYYgQtJhDEVk9Oeu6E1K0vA6sjBqfQtBwzETL4e3TfLZ9WaPk
	n7/NuIt2dr9ILZb8a9OM/qDTY9JuaJVnFXvUgqD699qU7770zcrDsCHVXGmFTDGTe0cZG3MMvVmyh
	md4KrGA/u4k3o1+/BtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwCN-00000006xb5-3Uqq;
	Wed, 16 Jul 2025 07:05:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvwI-00000006vQh-2frX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:48:28 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bhmjG3SLtz14M26;
	Wed, 16 Jul 2025 14:43:30 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 32DC6180489;
	Wed, 16 Jul 2025 14:48:17 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemo100006.china.huawei.com
 (7.202.195.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 16 Jul
 2025 14:48:16 +0800
Message-ID: <bab969f4-819d-4f81-6487-328014c94491@hisilicon.com>
Date: Wed, 16 Jul 2025 14:48:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 0/2] PM / devfreq: Add HiSilicon uncore frequency
 scaling driver
To: Chanwoo Choi <chanwoo@kernel.org>
References: <20250623143401.4095045-1-zhanjie9@hisilicon.com>
 <9e028620-75b9-5a9a-dab6-8374b0a4fa4e@hisilicon.com>
 <CAGTfZH0eHz8aRDkSOTNosNqZGv9Qhf2K-Rtz-Yt+_GpNQzXo5g@mail.gmail.com>
 <0038c928-60ff-f6ab-763b-6958f1c24200@hisilicon.com>
 <CAGTfZH0fY1Bv5=a8t2w0iNH0shHkQ6-v9077F0XWheK6iGMoZA@mail.gmail.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <CAGTfZH0fY1Bv5=a8t2w0iNH0shHkQ6-v9077F0XWheK6iGMoZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_234826_991984_D8A7A001 
X-CRM114-Status: GOOD (  30.60  )
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
Cc: yubowen8@huawei.com, Linux PM list <linux-pm@vger.kernel.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, liwei728@huawei.com, linuxarm@huawei.com, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, lihuisong@huawei.com, prime.zeng@hisilicon.com, Jonathan Cameron <jonathan.cameron@huawei.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 16/07/2025 14:45, Chanwoo Choi wrote:
> Hi Jie,
> 
> Yes. I'll send pull request to be merged into v6.17-rc1 within this week.

Sure, thanks!

> 
> 
> Best Regards,
> Chanwoo Choi
> 
> 2025년 7월 16일 (수) 오후 3:33, Jie Zhan <zhanjie9@hisilicon.com <mailto:zhanjie9@hisilicon.com>>님이 작성:
> 
>     Hi Chanwoo,
> 
>     A quick check. Is this series queueing up for v6.17-rc1?
> 
>     Regards,
>     Jie
> 
>     On 02/07/2025 11:21, Chanwoo Choi wrote:
>     > Hi,
>     >
>     > I'm sorry for late review. I'll review and then merge until this week.
>     >
>     > Best Regards,
>     > Chanwoo Choi
>     >
>     > 2025년 7월 2일 (수) 오전 11:37, Jie Zhan <zhanjie9@hisilicon.com <mailto:zhanjie9@hisilicon.com> <mailto:zhanjie9@hisilicon.com <mailto:zhanjie9@hisilicon.com>>>님이 작성:
>     >
>     >     Hi devfreq maintainers,
>     >
>     >     A kindly ping on this series.
>     >     I believe it's in a good shape now.
>     >
>     >     Jie
>     >
>     >     On 23/06/2025 22:33, Jie Zhan wrote:
>     >     > Add the HiSilicon uncore frequency scaling driver for Kunpeng SoCs based on
>     >     > the devfreq framework.  The uncore domain contains shared computing
>     >     > resources, including system interconnects and L3 cache.  The uncore
>     >     > frequency significantly impacts the system-wide performance as well as
>     >     > power consumption.  This driver adds support for runtime management of
>     >     > uncore frequency from kernel and userspace.  The main function includes
>     >     > setting and getting frequencies, changing frequency scaling policies, and
>     >     > querying the list of CPUs whose performance is significantly related to
>     >     > this uncore frequency domain, etc.  The driver communicates with a platform
>     >     > controller through an ACPI PCC mailbox to take the actual actions of
>     >     > frequency scaling.
>     >     >
>     >     > Changelog:
>     >     >
>     >     > v6:
>     >     > Consolidate hisi_uncore_init_pcc_chan() related stuff:
>     >     > - Move devm_mutex_init() to hisi_uncore_init_pcc_chan()
>     >     > - Move devm_add_action_or_reset() into hisi_uncore_request_pcc_chan()
>     >     >
>     >     > v5:
>     >     > https://lore.kernel.org/all/20250619151456.3328624-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/all/20250619151456.3328624-1-zhanjie9@hisilicon.com/> <https://lore.kernel.org/all/20250619151456.3328624-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/all/20250619151456.3328624-1-zhanjie9@hisilicon.com/>>
>     >     > - Comment more on error code related stuff about
>     >     >   hisi_uncore_mark_related_cpus(), and return failure early on errors
>     >     >   except for -EINVAL, which indicates possibly broken firmware.
>     >     > - Separate error prints apart for two cases in hisi_platform_gov_handler()
>     >     > - Make the 'related_cpus' sysfs ABI description more generic
>     >     > - Some coding style cleanups and typo fixes
>     >     >
>     >     > v4:
>     >     > https://lore.kernel.org/linux-pm/20250530081722.280776-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250530081722.280776-1-zhanjie9@hisilicon.com/> <https://lore.kernel.org/linux-pm/20250530081722.280776-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250530081722.280776-1-zhanjie9@hisilicon.com/>>
>     >     > - Allow devfreq core to accept device-specific sysfs ABIs
>     >     > - Replace custom sysfs attrs with dev_groups and let the devfreq core
>     >     >   manage it
>     >     > - Update 'related_cpus' description in the devfreq ABI doc
>     >     > - Remove COMPILE_TEST in Kconfig as the mailbox_client.h doesn't support
>     >     >   this yet
>     >     > - Replace dev_err() with dev_err_probe() during drv->probe()
>     >     > - Replace mutex_init() with devm_mutex_init() to warn on UAF
>     >     > - Replace uncore->dev with dev in some places to make code a bit shorter
>     >     > - Remove redundant uncore->pchan check in hisi_uncore_free_pcc_chan()
>     >     > - Use __free() to let compiler release temporary memory
>     >     > - Clean up the error handling and redundant 'status = 0' in
>     >     >   hisi_uncore_send_cmd()
>     >     > - Some coding style cleanup
>     >     >
>     >     > v3:
>     >     > https://lore.kernel.org/linux-pm/20250522031701.1912458-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250522031701.1912458-1-zhanjie9@hisilicon.com/> <https://lore.kernel.org/linux-pm/20250522031701.1912458-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250522031701.1912458-1-zhanjie9@hisilicon.com/>>
>     >     > - Remove redundant resource freeing processes when drv->probe() fails as
>     >     >   they're already handled by devm
>     >     >
>     >     > v2:
>     >     > https://lore.kernel.org/linux-pm/20250520074120.4187096-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250520074120.4187096-1-zhanjie9@hisilicon.com/> <https://lore.kernel.org/linux-pm/20250520074120.4187096-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250520074120.4187096-1-zhanjie9@hisilicon.com/>>
>     >     > - Make devm manage the release sequence, remove drv->remove()
>     >     > - Warn on !uncore or !uncore->pchan as they're no longer expected
>     >     > - Remove ioremap of pcc shared memory because it's done by the pcc driver
>     >     > - Fix compiler warning of discarding 'const'
>     >     > - Minor trivial coding style changes
>     >     >
>     >     > v1:
>     >     > https://lore.kernel.org/linux-pm/20250506021434.944386-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250506021434.944386-1-zhanjie9@hisilicon.com/> <https://lore.kernel.org/linux-pm/20250506021434.944386-1-zhanjie9@hisilicon.com/ <https://lore.kernel.org/linux-pm/20250506021434.944386-1-zhanjie9@hisilicon.com/>>
>     >     >
>     >     > Jie Zhan (2):
>     >     >   PM / devfreq: Allow devfreq driver to add custom sysfs ABIs
>     >     >   PM / devfreq: Add HiSilicon uncore frequency scaling driver
>     >     >
>     >     >  Documentation/ABI/testing/sysfs-class-devfreq |   9 +
>     >     >  drivers/devfreq/Kconfig                       |  11 +
>     >     >  drivers/devfreq/Makefile                      |   1 +
>     >     >  drivers/devfreq/devfreq.c                     |   1 +
>     >     >  drivers/devfreq/hisi_uncore_freq.c            | 658 ++++++++++++++++++
>     >     >  include/linux/devfreq.h                       |   4 +
>     >     >  6 files changed, 684 insertions(+)
>     >     >  create mode 100644 drivers/devfreq/hisi_uncore_freq.c
>     >     >
>     >
> 

