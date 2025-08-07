Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39CAC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAz6l3UDWgCMtX4e8sjD43OL0nn2wGHOg4tFeouhaa4=; b=zpayMPjo38aE2qSp4P49WwoGJF
	oBBpuh2Xz/649H+z+XppU+kKQ28wMGgGbPLF6H6hYrhO0wQJmJJG+/6dbDjPosVcMLI24gazUJYuE
	0t/HMgANF+0Ui9fpfbFDt272vPMdz4ythbkIrb47Wxlfp1xCUmNI/zEoABo3Vwx5Hi95YcJm8ebg0
	0YHhJvKVjjQIJlB4TdgP0uuULJLPKV7j47Ahucs5ua1dms27jDeL7HNE8hrEiBfZj7VImiEQ2zx5b
	w9MnPFj9yKMAuiQVNWIwvxIxIfqGNrDIDm7qzISAeer3U/DfCYiJMA4hWJkrk+AJhogOzmn9Y4Zh6
	5WRREotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5NG-00000001Kmk-1bAc;
	Thu, 07 Aug 2025 18:29:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5Kd-00000001KdL-3lDl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 18:27:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D51561756;
	Thu,  7 Aug 2025 11:27:04 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACF743F5A1;
	Thu,  7 Aug 2025 11:27:04 -0700 (PDT)
Message-ID: <48556d36-947b-4e07-aa7e-602bb9fe052d@arm.com>
Date: Thu, 7 Aug 2025 19:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 20/36] arm_mpam: Probe the hardware features resctrl
 supports
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-21-james.morse@arm.com>
 <eb8a395c-ca21-43d2-a1f9-739dbdc26dc4@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <eb8a395c-ca21-43d2-a1f9-739dbdc26dc4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_112716_018136_0C65AA68 
X-CRM114-Status: GOOD (  14.73  )
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

Hi Ben,

On 24/07/2025 16:08, Ben Horgan wrote:
> On 7/11/25 19:36, James Morse wrote:
>> Expand the probing support with the control and monitor types
>> we can use with resctrl.

>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index 8646fb85ad09..61911831ab39 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c

>> @@ -645,6 +659,137 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc
>> *msc,
>>       return found;
>>   }
>>   +/*
>> + * IHI009A.a has this nugget: "If a monitor does not support automatic behaviour
>> + * of NRDY, software can use this bit for any purpose" - so hardware might not
>> + * implement this - but it isn't RES0.
>> + *
>> + * Try and see what values stick in this bit. If we can write either value,
>> + * its probably not implemented by hardware.
>> + */
>> +#define mpam_ris_hw_probe_hw_nrdy(_ris, _mon_reg, _result)            \
>> +do {                                        \
>> +    u32 now;                                \
>> +    u64 mon_sel;                                \
>> +    bool can_set, can_clear;                        \
>> +    struct mpam_msc *_msc = _ris->vmsc->msc;                \
>> +                                        \
>> +    if (WARN_ON_ONCE(!mpam_mon_sel_inner_lock(_msc))) {            \
>> +        _result = false;                        \
>> +        break;                                \
>> +    }                                    \
>> +    mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, 0) |            \
>> +          FIELD_PREP(MSMON_CFG_MON_SEL_RIS, _ris->ris_idx);        \
>> +    mpam_write_monsel_reg(_msc, CFG_MON_SEL, mon_sel);            \
>> +                                        \
>> +    mpam_write_monsel_reg(_msc, _mon_reg, MSMON___NRDY);            \
>> +    now = mpam_read_monsel_reg(_msc, _mon_reg);                \
>> +    can_set = now & MSMON___NRDY;                        \
>> +                                        \
>> +    mpam_write_monsel_reg(_msc, _mon_reg, 0);                \
>> +    now = mpam_read_monsel_reg(_msc, _mon_reg);                \
>> +    can_clear = !(now & MSMON___NRDY);                    \
>> +    mpam_mon_sel_inner_unlock(_msc);                    \
>> +                                        \
>> +    _result = (!can_set || !can_clear);                    \
>> +} while (0)

> It is a bit surprising that something that looks like a function modifies a boolean passed
> by value.

> Consider continuing the pattern you have above:
> #define mpam_ris_hw_probe_hw_nrdy(_ris, _mon_reg, _result)
> _mpam_ris_hw_probe_hw_nrdy(_ris, MSMON##_mon_reg, _result)
> 
> with signature:
> void _mpam_ris_hw_probe_hw_nrdy(struct mpam_msc *msc, u16 reg, bool *hw_managed);
> 
> and using the _mpam functions from the new _mpam_ris_hw_probe_hw_nrdy().

With that, it may as well return the result.
Done.


Thanks,

James

