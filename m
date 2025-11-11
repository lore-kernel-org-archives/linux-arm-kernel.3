Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A8CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YeiK6wVtHdFLXOPmedgDaTg9DtHJ+8FpvdkWSGY5tQ=; b=UekSCzfGpqQddm4yLqu59M88Hr
	mTCiB3lQsxn52LpuZ/IFxmrpYY0VfQ+lHSyoT7Ye3/qDVWxpymjE22TXo6DZ3jBDtgW//+Niuk09o
	O14DtmJsYQb3PxfrL5wcSTD3/XH8nhTlWt4e26vBPiBwfjKmYh5Ly/6uMkqltnRHoTyAReTiuP9zA
	UJUzLBy6Jfp6XFFwZnbgLxgxUmDxD72JTqDKuiC4lIxy4ByEPG/QrCOTykWYg6zW12fENuws882Bg
	trpmxQihjYe0+jzxVFW1LVjBHWRcc8LlQIJ7rPbur4xhK/kKQpPcgH7j5yKsNdRXYMaAo3fT1gk0Z
	vR+fWH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkuH-00000006rhS-2FPG;
	Tue, 11 Nov 2025 09:43:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkuF-00000006rgy-0cQF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:43:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25F4B2F;
	Tue, 11 Nov 2025 01:43:09 -0800 (PST)
Received: from [10.57.72.204] (unknown [10.57.72.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC5CA3F66E;
	Tue, 11 Nov 2025 01:43:14 -0800 (PST)
Message-ID: <a5ca5a65-8d5c-48b3-83f2-82d13c0b930d@arm.com>
Date: Tue, 11 Nov 2025 09:43:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] coresight: etm4x: Add flag to control
 single-shot restart
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
 <20251103-arm_coresight_power_management_fix-v5-9-f803c19aa153@arm.com>
 <ac108275-0b12-4cc1-b8db-d864175f9059@arm.com>
 <20251111092403.GB281971@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251111092403.GB281971@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_014319_230488_F2C7D203 
X-CRM114-Status: GOOD (  17.63  )
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

On 11/11/2025 09:24, Leo Yan wrote:
> On Mon, Nov 10, 2025 at 11:37:52AM +0000, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>> -static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>>> +static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
>>
>> While this looks to work, I wonder if we could manage this all in the config
>> ? i.e.,
>>
>> Use an extra field, say config->retain_single_shot_status, which defaults to
>> 0 and is always cleared once we pass through enable_hw.
> 
> This is fine for me in general.  I agree that adding an argument in
> etm4_enable_hw() is not scalable, though we can take a bit advantage
> of stack push and pop so no need cleanup.
> 
> Before proceed, I would check another idea.  Can we do this with
> is_idle_task()?
> 
>    if (!is_idle_task(current)) {
>        if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
>            config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>    }

What happens when we do a system wide session and a CPU is running an
idle task ?

Suzuki

> 
> As a result, we can avoid new flag and extra operatoins (set/clear) for
> the added flag.
> 
> Note, this does not only impact CPU idle flow, this also applies on CPU
> hotplug flow (as CPU hotplug callback also runs in idle thread).  I
> think this would be fine, no matter CPU idle or hotplug, we keep the
> single-shot state after the CPU resume back.


> 
> Thoughts?
> 
> Thanks,
> Leo


