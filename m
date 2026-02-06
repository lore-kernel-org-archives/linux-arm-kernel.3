Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFEBEA795E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gu9bfGiTnsVsicAoPuz+sw8fNtn60G7EWGkiUTQBVXA=; b=4w1apbvsSG9cQA6JBg2/mHW7Zl
	/0ovI7Ae+RTi3xMiyTDS8NKwCSw42QnaP17l/tInmf3ZxTb0uxvCM/zB6LBRBrNGS2hIzcFznp1Qd
	HuSiFtmra0r5+Gs7WDwTo9QS85jkQsKwezTQT+1ciqT6JbrYAh06LqKezgGL+ITdFkZzo9emKApid
	gaRyaIX3Qu8GYtuqEQ1Ywf/fQ6RRcuYJwJGhq+QQvT1x097ws2xcYgYIOFIsU8/8bk5RPiAgCr7xK
	LuSXrfg8zeHoZXEcePwDaz14ZXc7tA/3ryyWU1d/JyZlnrwhvToVDlgMv1vAXEVXpAPRWOPajWxLD
	FjobTYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIYQ-0000000B88m-0fcl;
	Fri, 06 Feb 2026 09:55:10 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIYN-0000000B884-0LUv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 09:55:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Gu9bfGiTnsVsicAoPuz+sw8fNtn60G7EWGkiUTQBVXA=;
	b=3Us5M4pVrs7fTsFbbgCbgEJjm87gD5Yowrm1cJ1hcMAYKyf66g9U3q7yknueqKxisZttPhCY9
	7fS68Y61FSvKZLPm/E/Gojx7eJaDH9U9pMc9r1saN4PpxoU/sAKIv1TUOsAY0YYNrtDWLLldSvW
	anRKz+/KTqRDMJjzNIV97qM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4f6q8J5wtfz1K99C;
	Fri,  6 Feb 2026 17:50:24 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id CDE5B402AB;
	Fri,  6 Feb 2026 17:54:57 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Feb 2026 17:54:57 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 6 Feb 2026 17:54:56 +0800
Message-ID: <2a42c4d7-c453-45a7-b569-89a3a2ee7246@huawei.com>
Date: Fri, 6 Feb 2026 17:54:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: wangyushan <wangyushan12@huawei.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Linus Walleij
	<linusw@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <arnd@arndb.de>, <fustini@kernel.org>,
	<krzk@kernel.org>, <linus.walleij@linaro.org>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<xuwei5@hisilicon.com>, <linux-mm@vger.kernel.org>, SeongJae Park
	<sj@kernel.org>, <reinette.chatre@intel.com>, <james.morse@arm.com>, "Zeng
 Heng" <zengheng4@huawei.com>, <ben.horgan@arm.com>, Tony Luck
	<tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>, Babu Moger
	<babu.moger@amd.com>, Yushan Wang <wangyushan12@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com>
 <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
 <20260205101814.000072ec@huawei.com>
Content-Language: en-US
In-Reply-To: <20260205101814.000072ec@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_015507_729164_098069F8 
X-CRM114-Status: GOOD (  33.30  )
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


On 2/5/2026 6:18 PM, Jonathan Cameron wrote:
> On Thu, 5 Feb 2026 10:12:33 +0100
> Linus Walleij <linusw@kernel.org> wrote:
>
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
> with what we have here.  Yushan can you add more on why we didn't
> try to fit into that scheme?  Other than the obvious bit that more
> general upstream support for the arch definitions of MPAM is a work in
> progress and fitting vendor specific features on top will be tricky
> for a while at least.  The hardware here is also independent of the
> MPAM support.

Intel cache pseudo lock requires help of IA32_PQR_ASSOC MSR, according
to [1], that register can save necessary information for processes acquired
cache pseudo locks, but Arm64 does not have the equivalent register.

[1]: https://www.intel.com/content/www/us/en/developer/articles/technical/cache-allocation-technology-usage-models.html

>
> Resctl puts the control on resource allocation into the hands of
> userspace (in that case via cgroups etc as it's process level controls).
> The cache lockdown is a weird because you have go through a dance of
> creating a temporary setup, demand fetching the lines into cache and
> then rely on various operations not occuring that might push them out
> again.
>
> Resctl provides many footguns and is (I believe) used by administrators
> who are very careful in how they use it.  Note that there are some guards
> in this new code to only allow locking a portion of the l3. We also rely
> somewhat on the uarch and cache design to ensure it is safe to do this
> type of locking (other than reducing perf of other tasks).
> I'm dancing around uarch details here that I would need to go seek
> agreement to share more on.
>
>>
>>> I haven't yet come up with any plausible scheme by which the MM
>>> subsystem could do this.
>>
>> I find it kind of worrying if userspace knows which lines are most
>> performance-critical but the kernel MM subsystem does not.
>>
>> That strongly inidicates that if only userspace knows that, then
>> madvise() is the way to go. The MM might need and use this
>> information for other reasons than just locking down lines in
>> the L3 cache.
>
> I agree that something like madvise() may well be more suitable.
> We do need paths to know how many regions are left etc though so
> it will need a few other bits of interface.
>
> I'm also not sure what appetite there will be for an madvise()
> for something that today we have no idea if anyone else actually
> has hardware for.  If people do, then please shout and we can
> look at how something like this can be generalized.

Currently madvise() "only operates on whole pages", maybe
madvise() will not be happy with the semantic change of
page / cacheline.

Cache size available for lock may be far less than the size
madvise() can handle. Though madvise() can always speculatively call
cache lock once appropriate and get back to original track if refused,
but that's a hack that need more deep discussion.

I think resctl is more suitable for this, as this serves the same
purpose as MPAM etc, to save QoS of a task, and the way to achieve it,
by tweaking hardware capability.

Thanks,
Yushan



