Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0B8E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXlUOmiW1N7BTlHkd6PT+qkEpSdGkOxQCnEbz+c+ZfY=; b=iATV45GCLyRdAXEikzSN4jm3HR
	GBObGp0vu064g+04L7kim5Ojc/uJtHYhQyjjF3F3KGa6KTb6/12xJZb5ZH5eA4UVPBu6ZW6gmlIdd
	/PyXV3+adBMfVfHjRajI892UM/s8NkSHohyp1JqBc9yiZ4EtNTr3NeyrFtqB5XAnTlq5e1u8GQQL7
	r5hyxjLG3yOfNCU9O1f1flyen6ko29gGRTjh7RdkDWwf4+a5uMvPRoRiU4wZuUN/oyCnSXp1n0cdB
	MeIX6jl93NrhgsBYQ2dyh1TbyGtjnb95Pp+T5ntJdrKOk1cPAULE7pkNSygR/o7gXytEjHf7RFrAl
	mANzYbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskJi-0000000A4RY-2Y3e;
	Wed, 18 Feb 2026 16:22:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskJf-0000000A4R9-46Yg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:22:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEB6339;
	Wed, 18 Feb 2026 08:22:09 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F5A23F62B;
	Wed, 18 Feb 2026 08:22:10 -0800 (PST)
Message-ID: <1acf06d1-08af-4b05-82e7-655c8ef7cf0e@arm.com>
Date: Wed, 18 Feb 2026 16:22:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/41] arm_mpam: resctrl: Add support for 'MB' resource
From: Ben Horgan <ben.horgan@arm.com>
To: Zeng Heng <zengheng4@huawei.com>, james.morse@arm.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 linux-doc@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-27-ben.horgan@arm.com>
 <20260205165018.0000089c@huawei.com>
 <f6f865bc-319c-8944-9989-4fd83a59d4b8@huawei.com>
 <61684bd8-8156-4fe1-8033-eaa12c6d3437@arm.com>
Content-Language: en-US
In-Reply-To: <61684bd8-8156-4fe1-8033-eaa12c6d3437@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_082220_147435_257A9F8D 
X-CRM114-Status: GOOD (  24.01  )
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

Hi Fenghua, Zeng,

On 2/16/26 13:54, Ben Horgan wrote:
> Hi Zeng,
> 
> On 2/13/26 07:38, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2026/2/6 0:50, Jonathan Cameron wrote:
>>> On Tue, 3 Feb 2026 21:43:27 +0000
>>> Ben Horgan <ben.horgan@arm.com> wrote:
>>>
>>>> From: James Morse <james.morse@arm.com>
>>>>
>>>> resctrl supports 'MB', as a percentage throttling of traffic from the
>>>> L3. This is the control that mba_sc uses, so ideally the class chosen
>>>> should be as close as possible to the counters used for mbm_total. If
>>>> there is a single L3 and the topology of the memory matches then the
>>>> traffic at the memory controller will be equivalent to that at egress of
>>>> the L3. If these conditions are met allow the memory class to back MB.
>>>>
>>>> MB's percentage control should be backed either with the fixed point
>>>> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
>>>> bitmaps is not used as its tricky to pick which bits to use to avoid
>>>> contention, and may be possible to expose this as something other than a
>>>> percentage in the future.
>>>
>>> I'm very curious to know whether this heuristic is actually useful on
>>> many
>>> systems or whether many / most of them fail this 'shape' heuristic.
>>>
>>
>> The current MPAM driver has restrictions that limit MB control support.
>> For example, on some systems, the MPAM memory class MSCs are not located
>> at the L3 cache but rather at the memory controller (e.g., Mata). In
>> such cases, MB control and mbm_total bandwidth monitoring cannot be
>> enabled.
>>> I'm unsure whether the community would welcome and be willing to review
>> a patch series supporting such systems. Of course, the changes would
>> involve minor refactoring in the resctrl common layer.
> 
> Having MSC at the memory controllers is quite common and it would be
> good for the mpam driver and resctrl to support this. My current
> priority is the initial MPAM support and look at this and other extra
> features later but I'd be happy to help progress support in this area
> through review and discussion. There is some discussion about adding new
> schema at [1] and we should make sure  this is consistent with monitors
> too. James has some out of tree patches from before that disccussion at [2].
> 
> [1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
>  mpam/snapshot+extras/v6.18-rc1

Fenghua gave a talk at LPC on supporting cpu-less numa nodes in resctrl
so is likely to have some patches/ideas around measuring bandwidth at
memory controllers.

> 
>>
>> Any feedback would be greatly appreciated.
>>
>>
>> Best Regards,
>> Zeng Heng
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


