Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD69BCD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD8Vo7G3hd1AVbEMJXv/0ZixEKzrJoGmlOFxQphnRH0=; b=1qkaoETRMs2OKdZXZcmG8mm5fE
	EJ0Rgc3uoxMlaVlz+VXAgV4xqWcektLBITWof54qY7msrVWIAZ73ClP8ixm+GCwqEIshh95aHQiwI
	gSOTRzsOBcstUQJUt5b8zdPif/vKj1eKlSpXNkrze3+A8P2aWzvueJ4Y9G3DPnmLSjmI2hqJ23tTa
	thZFiCcLbvZ0g8k/MaVriTB6j/tRU+xq98QuJ4IfM+zkDZFE2Xmb2lU9XapmVlOWIkc5jafL48CzW
	mLYGn3r7XAZOLpvWkibdcGh+NQfrfArZDc3LLCmpMKWcttRhrZtLvNT3C2EGMCkpqZELw8J5Hpt3J
	MMlBshrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSXa-0000000A5Mk-0Vsi;
	Thu, 13 Nov 2025 08:18:50 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSXX-0000000A5M2-1uii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:18:49 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4d6Y5s6RTgz12LDD;
	Thu, 13 Nov 2025 16:17:05 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id D8C1A180494;
	Thu, 13 Nov 2025 16:18:36 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 13 Nov
 2025 16:18:36 +0800
Message-ID: <05ba04d8-4c96-4497-9c81-ae72de139b1b@hisilicon.com>
Date: Thu, 13 Nov 2025 16:18:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] cpufreq: CPPC: Update FIE arch_freq_scale in ticks for
 non-PCC regs
To: Beata Michalska <beata.michalska@arm.com>
CC: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhenglifeng1@huawei.com>, <prime.zeng@hisilicon.com>,
	<jonathan.cameron@huawei.com>
References: <20251104065039.1675549-1-zhanjie9@hisilicon.com>
 <aRIXlSOPzAy1nXUQ@arm.com>
 <e439d370-48a3-40c3-ae54-67d2f844bae5@hisilicon.com>
 <aRWRGvQg1u9bPg5V@arm.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <aRWRGvQg1u9bPg5V@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_001847_668235_947C93CA 
X-CRM114-Status: GOOD (  15.82  )
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



On 11/13/2025 4:04 PM, Beata Michalska wrote:
> On Tue, Nov 11, 2025 at 07:30:09PM +0800, Jie Zhan wrote:
>>
>>
>> On 11/11/2025 12:49 AM, Beata Michalska wrote:
>>> Hi Jie,
>>> On Tue, Nov 04, 2025 at 02:50:39PM +0800, Jie Zhan wrote:
>>>> Currently, the CPPC Frequency Invariance Engine (FIE) is invoked from the
>>>> scheduler tick but defers the update of arch_freq_scale to a separate
>>>> thread because cppc_get_perf_ctrs() would sleep if the CPC regs are in PCC.
>>>>
>>>> However, this deferred update mechanism is unnecessary and introduces extra
>>>> overhead for non-PCC register spaces (e.g. System Memory or FFH), where
>>>> accessing the regs won't sleep and can be safely performed from the tick
>>>> context.
>>>>
>>>> Furthermore, with the CPPC FIE registered, it throws repeated warnings of
>>>> "cppc_scale_freq_workfn: failed to read perf counters" on our platform with
>>>> the CPC regs in System Memory and a power-down idle state enabled.  That's
>>>> because the remote CPU can be in a power-down idle state, and reading its
>>>> perf counters returns 0.  Moving the FIE handling back to the scheduler
>>>> tick process makes the CPU handle its own perf counters, so it won't be
>>>> idle and the issue would be inherently solved.
>>>>
>>>> To address the above issues, update arch_freq_scale directly in ticks for
>>>> non-PCC regs and keep the deferred update mechanism for PCC regs.
>>> Something about it just didn’t sit right with me, and apparently, it needed some
>>> time to settle down - thus the delay.
>>>
>>> It all looks sensible though it might be worth to considered applying
>>> the change on a per-CPU basis, as, in theory at least, different address
>>> spaces are allowed for different registers (at least according to the ACPI
>>> spec, if I read it right).
>>> So I was thinking about smth along the lines of:
>> Beata,
>>
>> Right, I see what you want to do.
>> Some comments inline.
>>
>> Would you like to make it a full patch so I can include it in the next
>> version? or some other way?
> What I have shared was just to ilustrate the idea, so if that's ok with you,
> you might carry on with that as well ?
> 
> ---
> BR
> Beata
Sure, I will try to incorporate this and update.

...

