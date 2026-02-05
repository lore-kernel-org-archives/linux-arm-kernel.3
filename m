Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21363E9128F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IRBfeCACLbxmze74Jo9LeaBNEy3b+LedRe1gMavmTo=; b=4P6d9TNEagpqi9VMBnXAAbmtCG
	5Zfo0QhpawFJ/bPIbP0Am9QI92exzIbc8VCClbyIAv+7sKaTkNzIJrXS6hnWu6m8CaJ6a/10IotmZ
	n5g25XnNLSdRvyRl/pQp07qMLfM3wjY6tykZa6Tk+diDjNdQmwNwZeO7OwYr18nZ83o0lpf+RAs7a
	298nFaQeZyDhlfZyT5K4WbnJyLCc5AfvTee8+89/3WnTcsXhPSBu0re7xTOswsFtoTtyq6iO87JfR
	C0I1GKNYQVPkQwN53Qui6c8yaakUZ9AvO5eLr/L7sfOJJOCsShHc/e70mzjRZDLhqf1riUnD37AtL
	NzxfXHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Ts-0000000A29n-2HDL;
	Thu, 05 Feb 2026 14:37:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0To-0000000A293-2zMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 14:37:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81FD8339;
	Thu,  5 Feb 2026 06:37:02 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 189DB3F632;
	Thu,  5 Feb 2026 06:37:04 -0800 (PST)
Message-ID: <3d14457d-a510-45b0-811f-347aac5cfda8@arm.com>
Date: Thu, 5 Feb 2026 14:37:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Linus Walleij <linusw@kernel.org>
Cc: Yushan Wang <wangyushan12@huawei.com>, alexandre.belloni@bootlin.com,
 arnd@arndb.de, fustini@kernel.org, krzk@kernel.org,
 linus.walleij@linaro.org, will@kernel.org,
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
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260205101814.000072ec@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_063712_979678_AC1C0808 
X-CRM114-Status: GOOD (  32.49  )
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

On 2/5/26 10:18, Jonathan Cameron wrote:
> On Thu, 5 Feb 2026 10:12:33 +0100
> Linus Walleij <linusw@kernel.org> wrote:
> 
>> Hi Jonathan,
>>
>> thanks for stepping in, I'm trying to be healthy sceptical here...
>>
>> What you and others need to do is to tell me if I'm being too
>> critical. But right now it feels like I need some more senior
>> MM developers to tell me to be a good boy and let this
>> hack patch slip before I shut up ;)
> 
> It's good to have these discussions as it makes us actually
> explain what they want to do much more clearly!
> wangyushan and I have both been taking about this for too long so
> it's easy to miss that it's not been explained properly.
> 
> Note I was absolutely expecting a non trivial discussion on how to do
> this and in particular how generic it should be.
>  
> +CC a various resctl / mpam related people.
[...]
> 
>>
>> But does the developer know if that hard kernel is importantest
>> taken into account all other processes running on the system,
>> and what happens if several processes say they have
>> such hard kernels? Who will arbitrate? That is usually the
>> kernels job.
> 
> Take the closest example to this which is resctl (mpam on arm).
> This actually has a feature that smells a bit like this.
> Pseudo-cache locking. 
> 
> https://docs.kernel.org/filesystems/resctrl.html#cache-pseudo-locking
> 
> My understanding is that the semantics of that don't align perfectly
> with what we have here.  Yushan can you add more on why we didn't
> try to fit into that scheme?  Other than the obvious bit that more
> general upstream support for the arch definitions of MPAM is a work in
> progress and fitting vendor specific features on top will be tricky
> for a while at least.  The hardware here is also independent of the
> MPAM support.
> 
> Resctl puts the control on resource allocation into the hands of
> userspace (in that case via cgroups etc as it's process level controls).
> The cache lockdown is a weird because you have go through a dance of
> creating a temporary setup, demand fetching the lines into cache and
> then rely on various operations not occuring that might push them out
> again.
> 
> Resctl provides many footguns and is (I believe) used by administrators
> who are very careful in how they use it.  Note that there are some guards
> in this new code to only allow locking a portion of the l3. We also rely
> somewhat on the uarch and cache design to ensure it is safe to do this
> type of locking (other than reducing perf of other tasks).
> I'm dancing around uarch details here that I would need to go seek
> agreement to share more on.
> 

Just wondering about the compatiblity of cache lockdown and
resctrl/mpam. If this is done outside resctrl then how would this
interact with the cache portion bitmaps used in resctrl/mpam? For
instance, how would a user know whether or not a resctrl/mpam cache
portion is unusable because it has been locked?
Thanks,

Ben


