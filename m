Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A59E9536C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lucelpwJFWkIsKwKMCkY9ZeebQjb+Vxl7uW6G8wKBtw=; b=oMoVNTIHc7BO82rpUak9AATxcF
	ozVqgpMhjsn9sCyuWpRMN6naUAWH6UiFm46AOEYDkDuxQYMoz0pNaNWsYwoXAizLMGeXO9NdzwbXb
	LknFI7XzeOSibc7nHZBRVKENSJi7Bh278bklqNK7nfhA67Y+eXBI/AAupbFPJ11Bo4dnxwPaaABPv
	9EWcsh3bnPP2wy/dZVAdW209v8fYSFjp/6oiDtfu9B8D4fCYyyWZlAtcRE8DXzAbgP/G8ZmmYjM7G
	Jx4VFuhQwGFowUX9UbfH8TgxdAgR04/893XZNF2i7Y7rurIoY4zvLiTuxnkjsPSx24AGgd+DKhKaD
	Ll7ril1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZZn-00000008FjM-1fC7;
	Wed, 04 Feb 2026 09:53:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZZm-00000008FjC-1hvY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 09:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lucelpwJFWkIsKwKMCkY9ZeebQjb+Vxl7uW6G8wKBtw=; b=GBtfQOYgVE1hxBspEQEA+4yvDa
	43mTK2CkPlq5b+Tyv9SAGSneLFniqYgHR4q225w8Vp1rscwpJNKCRE526EESWHTVONbfJAzP7IUlz
	HKv7iI4lsbmPzRepa4SiIAdeg5d24IaBtP/MSnGbxjaYSVGuIEFzCW2gV7Em2daB+D4L5yVBswFWI
	3BS1PNSZKwjCzM0q3XDItYGtUyOFHpYkN04zjM1zwC1+SbHFalh1lEjhQShnSoYYrj4/HbeXBkmQW
	l8YVje+eeXDk3F5HDmGT0HE4qgo1ettRV58f+YYPRs0Db5xbYXvp9kN4P9pBIZ2aE0KQwfKvYTwc9
	99YO1X6g==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZZi-00000000G5q-3vKi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:53:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lucelpwJFWkIsKwKMCkY9ZeebQjb+Vxl7uW6G8wKBtw=;
	b=alDdfeG720Qa2reE7VOvrq08OLnXrnx/ac4fRfrbwRwXjpPNlF+Vwr6OXbsxtq/tTh8fF5ZTs
	940OEZ6Lfy+vDY5/6mZe1r4juNpwX+u6nfQXwHcTBF7hxIGNp8XJrBPo7zK0PxkZZQ6vjB8gPJK
	zRsHgkMfbCDBNVqKGT0WdpU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f5bCM2qr6z1prLm;
	Wed,  4 Feb 2026 17:48:47 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 18DAB40569;
	Wed,  4 Feb 2026 17:53:24 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 17:53:23 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 4 Feb 2026 17:53:11 +0800
Message-ID: <cf0cc98b-75e0-40d9-93d4-dc2218a22d4d@huawei.com>
Date: Wed, 4 Feb 2026 17:53:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: wangyushan <wangyushan12@huawei.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Linus Walleij <linusw@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <arnd@arndb.de>, <fustini@kernel.org>,
	<Jonathan.Cameron@huawei.com>, <krzk@kernel.org>, <linus.walleij@linaro.org>,
	<will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <fanghao11@huawei.com>,
	<liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangzhou1@hisilicon.com>, <xuwei5@hisilicon.com>,
	<linux-mm@vger.kernel.org>, SeongJae Park <sj@kernel.org>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_095331_544399_ECB85857 
X-CRM114-Status: GOOD (  24.56  )
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



On 2/4/2026 8:10 AM, Linus Walleij wrote:
> Hi Yushan,
>
> thanks for your patch!

Thanks for review!

> On Tue, Feb 3, 2026 at 5:18 PM Yushan Wang <wangyushan12@huawei.com> wrote:
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
> The commit message does not say *why* you are doing this?
>> +config HISI_SOC_L3C
>> +       bool "HiSilicon L3 Cache device driver"
>> +       depends on ACPI
>> +       depends on ARM64 || COMPILE_TEST
>> +       help
>> +         This driver provides the functions to lock L3 cache entries from
>> +         being evicted for better performance.
> Here is the reason though.

Sorry, I will include this into the commit message.
> Things like this need to be CC to linux-mm@vger.kernel.org.
>
> I don't see why userspace would be so well informed as to make decisions
> about what should be locked in the L3 cache and not?

This question is actually: should it be kernel or user space
application to decide if a cache lock should be applied?

Maybe the ideal situation is that this capability should be reserved into kernel space as a vendor specific optimization option. With the lack of knowledge of memory interleave etc the best move of an application might be allocate cache lock as much as possible.
> I see the memory hierarchy as any other hardware: a resource that is
> allocated and arbitrated by the kernel.
>
> The MM subsytem knows which memory is most cache hot.
> Especially when you use DAMON DAMOS, which has the sole
> purpose of executing actions like that. Here is a good YouTube.
> https://www.youtube.com/watch?v=xKJO4kLTHOI
>
> Shouldn't the MM subsystem be in charge of determining, locking
> down and freeing up hot regions in L3 cache?
Thanks for the link, I will see if there's any chance this can
cooperate with DAMON.

Gaps still exists here because DAMON operate with pages, but cache
works with cachelines, though the cache lock here supports cache
lock size larger than a page.
> This looks more like userspace is going to determine that but
> how exactly? By running DAMON? Then it's better to keep the
> whole mechanism in the kernel where it belongs and let the
> MM subsystem adapt locked L3 cache to the usage patterns.
Currently the patchset simply trusts that user knows well what
he is doing, which might not be good enough.

I will try to see if this could work with DAMON or madvice()
maybe :)

> Yours,
> Linus Walleij

Thanks,
Yushan

