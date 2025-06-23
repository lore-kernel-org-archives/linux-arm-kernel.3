Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE57DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsbsauwEEvVYFUe01KKy9XW9qM0WY3YfPjxbbUkSvKM=; b=M6AzHmMTLh5fAD
	tod2tj+Bj1j/63gGOc/I9jlVAjidMvXc/K0dSt3Throi4KSWVeMVqdz6F30jTfxKdfRKcTb4ZYc5Y
	9cUw3e/uOu0yoRM3jP0mPytPKAa412C8+JpqOBl+b/g2eEoIjClfPQiXt0ZCQ/nOgL9O9/fHpqup5
	HuWSt7fotr0DMnhAiPfbIMuwewmm10/dSrXLBSxxUz7048Lzanmuu8Tz4rK4Rd7RAytE5BfrEPC15
	O+bkCmECviKV4CLKwTGjpGsuTwLtjum5I4b/TK22YYSXQ+6tcyAno4B77TDnagmRLjkM6xAVQzvOw
	dC9XpRCHNQuvU91O1skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdAJ-000000027C3-0WpA;
	Mon, 23 Jun 2025 09:08:35 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcoA-000000022pZ-1FH7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 08:45:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bQhRr2l9Dz28fQJ;
	Mon, 23 Jun 2025 16:43:04 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 55DD2140276;
	Mon, 23 Jun 2025 16:45:31 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemo100006.china.huawei.com
 (7.202.195.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Jun
 2025 16:45:30 +0800
Message-ID: <c7222b9c-316a-d6a9-efd0-49de136f2fbd@hisilicon.com>
Date: Mon, 23 Jun 2025 16:45:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 0/2] PM / devfreq: Add HiSilicon uncore frequency
 scaling driver
To: "lihuisong (C)" <lihuisong@huawei.com>, <cw00.choi@samsung.com>,
	<myungjoo.ham@samsung.com>, <kyungmin.park@samsung.com>,
	<jonathan.cameron@huawei.com>
References: <20250619151456.3328624-1-zhanjie9@hisilicon.com>
 <508bdca6-eab8-4661-a8e8-560b1ef0a325@huawei.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <508bdca6-eab8-4661-a8e8-560b1ef0a325@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_014542_648951_5FC99E54 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: yubowen8@huawei.com, zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, liwei728@huawei.com, linuxarm@huawei.com, prime.zeng@hisilicon.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 23/06/2025 11:39, lihuisong (C) wrote:
> LGTM, for series,
> Reviewed-by: lihuisong@huawei.com
> 

Huisong, thanks for reviewing!
> 
> 在 2025/6/19 23:14, Jie Zhan 写道:
>> Add the HiSilicon uncore frequency scaling driver for Kunpeng SoCs based on
>> the devfreq framework.  The uncore domain contains shared computing
>> resources, including system interconnects and L3 cache.  The uncore
>> frequency significantly impacts the system-wide performance as well as
>> power consumption.  This driver adds support for runtime management of
>> uncore frequency from kernel and userspace.  The main function includes
>> setting and getting frequencies, changing frequency scaling policies, and
>> querying the list of CPUs whose performance is significantly related to
>> this uncore frequency domain, etc.  The driver communicates with a platform
>> controller through an ACPI PCC mailbox to take the actual actions of
>> frequency scaling.
>>
>> Changelog:
>>
>> v5:
>> - Comment more on error code related stuff about
>>    hisi_uncore_mark_related_cpus(), and return failure early on errors
>>    except for -EINVAL, which indicates possibly broken firmware.
>> - Separate error prints apart for two cases in hisi_platform_gov_handler()
>> - Make the 'related_cpus' sysfs ABI description more generic
>> - Some coding style cleanups and typo fixes
>>
>> v4:
>> https://lore.kernel.org/linux-pm/20250530081722.280776-1-zhanjie9@hisilicon.com/
>> - Allow devfreq core to accept device-specific sysfs ABIs
>> - Replace custom sysfs attrs with dev_groups and let the devfreq core
>>    manage it
>> - Update 'related_cpus' description in the devfreq ABI doc
>> - Remove COMPILE_TEST in Kconfig as the mailbox_client.h doesn't support
>>    this yet
>> - Replace dev_err() with dev_err_probe() during drv->probe()
>> - Replace mutex_init() with devm_mutex_init() to warn on UAF
>> - Replace uncore->dev with dev in some places to make code a bit shorter
>> - Remove redundant uncore->pchan check in hisi_uncore_free_pcc_chan()
>> - Use __free() to let compiler release temporary memory
>> - Clean up the error handling and redundant 'status = 0' in
>>    hisi_uncore_send_cmd()
>> - Some coding style cleanup
>>
>> v3:
>> https://lore.kernel.org/linux-pm/20250522031701.1912458-1-zhanjie9@hisilicon.com/
>> - Remove redundant resource freeing processes when drv->probe() fails as
>>    they're already handled by devm
>>
>> v2:
>> https://lore.kernel.org/linux-pm/20250520074120.4187096-1-zhanjie9@hisilicon.com/
>> - Make devm manage the release sequence, remove drv->remove()
>> - Warn on !uncore or !uncore->pchan as they're no longer expected
>> - Remove ioremap of pcc shared memory because it's done by the pcc driver
>> - Fix compiler warning of discarding 'const'
>> - Minor trivial coding style changes
>>
>> v1:
>> https://lore.kernel.org/linux-pm/20250506021434.944386-1-zhanjie9@hisilicon.com/
>>
>> Jie Zhan (2):
>>    PM / devfreq: Allow devfreq driver to add custom sysfs ABIs
>>    PM / devfreq: Add HiSilicon uncore frequency scaling driver
>>
>>   Documentation/ABI/testing/sysfs-class-devfreq |   9 +
>>   drivers/devfreq/Kconfig                       |  11 +
>>   drivers/devfreq/Makefile                      |   1 +
>>   drivers/devfreq/devfreq.c                     |   1 +
>>   drivers/devfreq/hisi_uncore_freq.c            | 664 ++++++++++++++++++
>>   include/linux/devfreq.h                       |   4 +
>>   6 files changed, 690 insertions(+)
>>   create mode 100644 drivers/devfreq/hisi_uncore_freq.c
>>

