Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA76EE20B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSvytk37U4Xgaj3d6RQMXwC6c17Hmlh8sv3gVxNh4aM=; b=HuaJtG7iNeyE/AxwPiYlLjzEQw
	wNiEv/jZNYwG0t/6aHXJSLwzKaljDQ5Gq5sLQ8RVqsJEAvO0miTnBkt5DUgUwBwW6dRtQEc/GftWe
	kJ6+95RmREcdvAiAsSN4L6omdTp7OT7nn2krg/cgwCzmGmuW6GQYlcHOXx87jbV4iUc2ne0WA6iFv
	O7bJBJ+Kgncsv+3pGEu/jQjezSCJAw+K4U3VQt2sDvt/rdGW4JnJJ+yAz4ymUIzQhE/XlnD+P9B/s
	Bnjnk1QZoYWNpcZcYqKwbG7KmYgjyk+Wu59HuYGQ6+sZ+1uQH92hu+N0pLAGkMnponf4MorOPgiv4
	Zg7su6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOUu-0000000BXuj-1Obr;
	Fri, 06 Feb 2026 16:15:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOUr-0000000BXu9-3GsM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 16:15:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37384339;
	Fri,  6 Feb 2026 08:15:43 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE4B93F632;
	Fri,  6 Feb 2026 08:15:45 -0800 (PST)
Message-ID: <ccedea22-5a90-48c7-8feb-a6f9da6e931a@arm.com>
Date: Fri, 6 Feb 2026 16:15:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: wangyushan <wangyushan12@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Linus Walleij <linusw@kernel.org>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de, fustini@kernel.org,
 krzk@kernel.org, linus.walleij@linaro.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fanghao11@huawei.com, linuxarm@huawei.com, liuyonglong@huawei.com,
 prime.zeng@hisilicon.com, wangzhou1@hisilicon.com, xuwei5@hisilicon.com,
 linux-mm@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 reinette.chatre@intel.com, james.morse@arm.com,
 Zeng Heng <zengheng4@huawei.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com>
 <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
 <20260205101814.000072ec@huawei.com>
 <2a42c4d7-c453-45a7-b569-89a3a2ee7246@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <2a42c4d7-c453-45a7-b569-89a3a2ee7246@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_081553_893517_037CDABE 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Yushan,

On 2/6/26 09:54, wangyushan wrote:
> 
> On 2/5/2026 6:18 PM, Jonathan Cameron wrote:
>> On Thu, 5 Feb 2026 10:12:33 +0100
>> Linus Walleij <linusw@kernel.org> wrote:
>>
>>> But does the developer know if that hard kernel is importantest
>>> taken into account all other processes running on the system,
>>> and what happens if several processes say they have
>>> such hard kernels? Who will arbitrate? That is usually the
>>> kernels job.
>>
>> Take the closest example to this which is resctl (mpam on arm).
>> This actually has a feature that smells a bit like this.
>> Pseudo-cache locking.
>>
>> https://docs.kernel.org/filesystems/resctrl.html#cache-pseudo-locking
>>
>> My understanding is that the semantics of that don't align perfectly
>> with what we have here.  Yushan can you add more on why we didn't
>> try to fit into that scheme?  Other than the obvious bit that more
>> general upstream support for the arch definitions of MPAM is a work in
>> progress and fitting vendor specific features on top will be tricky
>> for a while at least.  The hardware here is also independent of the
>> MPAM support.
> 
> Intel cache pseudo lock requires help of IA32_PQR_ASSOC MSR, according
> to [1], that register can save necessary information for processes acquired
> cache pseudo locks, but Arm64 does not have the equivalent register.

If you have MPAM, the per exception level MPAMx_ELy registers are
somewhat equivalent. They tell you which partid and pmg identifiers the
CPU is using and IA32_PQR_ASSOC tells you the closid and rmid which are
much the same thing. Is there a difference that stops being equivalent
in this scenario?

> 
> [1]: https://www.intel.com/content/www/us/en/developer/articles/technical/cache-allocation-technology-usage-models.html
> 
[...]

Thanks,

Ben


