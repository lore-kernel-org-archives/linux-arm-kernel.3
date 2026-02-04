Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B508FE9536A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STq1Q38Svgytp1eizNVXT2ZqCEukoRcWdbcAW/7u5pc=; b=aiaLpk47QbPpSj8oQDcGiyIrcT
	e8v+X6+RqiwbFX0cmy5d4TwETcRNtSSSyLODFqobXdJcaUHyaok/P23/pddjucnAQneJkeE8L5Tqz
	iUZNYEF7GNry5YjL28jUFTSvstYyXWy+Rm/5mrKJJDFDWspdFafUy6WY94zDbHfvs0WtQ3GUvWYEv
	5p+O63qKu5QZ+DdVg/T8DCavYk0MMgvIghGPfojiqJzlGlVx0Ck/RidChNd5V4IcdfIgoU1eMSKFp
	txfla8LK4aL3JJAwST8YQ23EH2FmfKj9jdaOQTp5Dj4csoM5xeIDhIYwrdlZ5id1A2K8SDawr9gVs
	bZdXwapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZYK-00000008FUl-0Gk5;
	Wed, 04 Feb 2026 09:52:04 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZYH-00000008FTO-26Kq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:52:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=STq1Q38Svgytp1eizNVXT2ZqCEukoRcWdbcAW/7u5pc=;
	b=ub2wcu/+qMyXDwC+vG+An0G4b5vqGzuqkzts6pGxZTxSx6umdHMfFQMLRHJGnBZESQwuBcUOG
	US7VVJ/QVRA9qzAtGukMO1F7b4oSPRCeWdA7UHA3ArPU5WtF7v98vX0gPxmq4QJdvEJc7hX5kh8
	e48FS4SrMynI8f1SzjuEQRI=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f5b9m5FHLzRhRB;
	Wed,  4 Feb 2026 17:47:24 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 61A7840561;
	Wed,  4 Feb 2026 17:51:58 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 17:51:58 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 4 Feb 2026 17:51:57 +0800
Message-ID: <94b8a209-7996-43bc-92ed-e84cbc252c0c@huawei.com>
Date: Wed, 4 Feb 2026 17:51:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: wangyushan <wangyushan12@huawei.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Arnd Bergmann <arnd@arndb.de>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, Wei Xu
	<xuwei5@hisilicon.com>, <linusw@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, Will Deacon <will@kernel.org>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, "Yushan
 Wang" <wangyushan12@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <a8ba1c0b-e7c8-44c5-b785-42752f7f5d8f@app.fastmail.com>
Content-Language: en-US
In-Reply-To: <a8ba1c0b-e7c8-44c5-b785-42752f7f5d8f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_015202_027138_32F50436 
X-CRM114-Status: GOOD (  34.60  )
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



On 2/4/2026 1:19 AM, Arnd Bergmann wrote:
> On Tue, Feb 3, 2026, at 17:18, Yushan Wang wrote:
>> The driver will create a file of `/dev/hisi_l3c` on init, mmap
>> operations to it will allocate a memory region that is guaranteed to be
>> placed in L3 cache.
>>
>> The driver also provides unmap() to deallocated the locked memory.
>>
>> The driver also provides an ioctl interface for user to get cache lock
>> information, such as lock restrictions and locked sizes.
>>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> Hi Yushan,
>
> Thanks for your submission. Since we are in the last week of
> the merge window, this is not going to be linux-7.0 material,
> but I'll have a quick look for now.

Many thanks for review!
>>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>>  MAINTAINERS                                   |   6 +
>>  drivers/soc/hisilicon/Kconfig                 |  11 +
>>  drivers/soc/hisilicon/Makefile                |   2 +
>>  drivers/soc/hisilicon/hisi_soc_l3c.c          | 357 ++++++++++++++++++
>>  include/uapi/misc/hisi_l3c.h                  |  28 ++
> I don't think this should be in drivers/soc/, since I want
> to reserve that for internal drivers without a user visible
> interface other than the soc_device information. (yes, there
> are a few historic counterexamples)
>
> I also don't think this should be a hilicon specific interface,
> if possible. The functionality is not that unusual in the end.

I hesitated about the directory as well, exporting a user aware
interface directly from driver may not be a good practice and I
am hoping for advice :)
The driver itself doesn't provide much more than a mere register configuration which is platform specific, what do you think about a kernel space interface somewhere else which implemented here?
> We had similar concepts using the numactl system calls in the
> part, but I don't think we should do that here because you may
> need the numa interfaces for other purposes as well, and it
> may be confusing to existing callers.
>
> Having a generic madvise() based interface would be great,
> not sure if hardware support for that is common enough for that.
As above, cache lock could be an option for optimization of numactl or madvise(), maybe a more generic interface in kernel space which is speculatively called by other infrastructure is better, and of course extra support of the infrastructures is needed. I can try to propose an interface and maybe an example of the caller in the next version.
>> +	/* Continuous physical memory is required for L3 cache lock. */
>> +	pg = alloc_contig_pages(1 << order, GFP_KERNEL | __GFP_NOWARN | 
>> __GFP_ZERO,
>> +				cpu_to_node(smp_processor_id()), NULL);
> Since this is a user allocation, should that be GFP_USER instead
> of GFP_KERNEL?

Yes, it should be GFP_USER in this version since it is used in userspace.
>> +/* HISI_L3C_INFO: cache lock info for HiSilicon SoC */
>> +#define HISI_L3C_LOCK_INFO	_IOW(0xBB, 1, unsigned long)
> The specification here looks wrong, please see
> Documentation/driver-api/ioctl.rst
>
> I think for your implementation it should be
>
> #define HISI_L3C_LOCK_INFO	_IOR(0xBB, 1, hisi_l3c_lock_info)

Sorry, I will correct that in the next version.
>> +struct hisi_l3c_lock_info {
>> +	__u32 lock_region_num;
>> +	__u64 lock_size;
>> +	__u8 address_alignment;
>> +	__u64 max_lock_size;
>> +	__u64 min_lock_size;
>> +};
> You are leaking kernel data because of the padding in this structure,
> please rearrange the members to avoid padding.
>
> It may be better to use a different interface instead of ioctl(),
> possibly exporting global data in sysfs.

Yes, information through sysfs should do the job.
I will fix that in the next version.

>        Arnd

Thanks,
Yushan


