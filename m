Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5827BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMSofC78iK/Bz9vFIKN7CA46VZYxTitOzeEwB6se/1c=; b=CYuTHYB4DBY0X1Mn3nZqhUW62i
	fJrPwZzqD/sB+lV414XjHpF96r/DK2D205E9hV9AAN+oJoVF7GDo/yhk6vbBF1ZmUUCYqj764J9aT
	L4UxkY1MOpZIMRQ7NxJzMe6akIeIffFaFGk7NZEK7sgAbUUSDZ+bn9Dpuv2nchQIavnos/0+IIjh3
	A4ZmmVDr1N9fSlFUqVhMcP5pe2/EG/ADWsMuR6o03mcZgF0V2NhDTJgSpcXSMwxdUqaBEzSFNBJaL
	LPJkeEFJvLWNF7gVzB3HUwMviETgHyg675/PMXMQsrJM/qsoVRjOSJKBx+B/FMDayeRZtST37eYA9
	6M1CqnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ul5-00000006q8q-1SiO;
	Thu, 09 Oct 2025 17:48:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ul2-00000006q8K-2RfC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 17:48:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B21C91762;
	Thu,  9 Oct 2025 10:48:40 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 256843F66E;
	Thu,  9 Oct 2025 10:48:43 -0700 (PDT)
Message-ID: <a3462502-5732-4eae-b0b3-04fc7f040372@arm.com>
Date: Thu, 9 Oct 2025 18:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/29] arm_mpam: Probe for long/lwd mbwu counters
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-26-james.morse@arm.com>
 <20250912142724.000026a7@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912142724.000026a7@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_104852_753153_0244B903 
X-CRM114-Status: GOOD (  19.82  )
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

Hi Jonathan,

On 12/09/2025 14:27, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:05 +0000
> James Morse <james.morse@arm.com> wrote:
>> From: Rohit Mathew <rohit.mathew@arm.com>
>>
>> mpam v0.1 and versions above v1.0 support optional long counter for
>> memory bandwidth monitoring. The MPAMF_MBWUMON_IDR register have fields
>> indicating support for long counters. As of now, a 44 bit counter
>> represented by HAS_LONG field (bit 30) and a 63 bit counter represented
>> by LWD (bit 29) can be optionally integrated. Probe for these counters
>> and set corresponding feature bits if any of these counters are present.

> I'd like a little more justification of the 'front facing' use for the first
> feature bit.  To me that seems confusing but I may well be missing why
> we can't have 3 exclusive features.
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index eeb62ed94520..bae9fa9441dc 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -795,7 +795,7 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>  				dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
>>  		}
>>  		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
>> -			bool hw_managed;
>> +			bool has_long, hw_managed;
>>  			u32 mbwumon_idr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
>>  
>>  			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
>> @@ -805,6 +805,27 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>  			if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
>>  				mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
>>  
>> +			/*
>> +			 * Treat long counter and its extension, lwd as mutually
>> +			 * exclusive feature bits. Though these are dependent
>> +			 * fields at the implementation level, there would never
>> +			 * be a need for mpam_feat_msmon_mbwu_44counter (long
>> +			 * counter) and mpam_feat_msmon_mbwu_63counter (lwd)
>> +			 * bits to be set together.
>> +			 *
>> +			 * mpam_feat_msmon_mbwu isn't treated as an exclusive
>> +			 * bit as this feature bit would be used as the "front
>> +			 * facing feature bit" for any checks related to mbwu
>> +			 * monitors.

> Why do we need such a 'front facing' bit?  Why isn't it sufficient just to
> add a little helper or macro to find out if mbwu is turned on?

(I read Rohit's front-facing as top-level).

I think Rohit thought it would be simpler - there is one feature enum that gets passed in
from the resctrl glue code saying "I want to read a bandwidth counter", because there
is only one, and it doesn't care what size. I think Rohit didn't want to touch that code!

As that is really a separate concept, I think its worth handling explicitly:
mpam_feat_msmon_mbwu means there are counters, and mpam_feat_msmon_mbwu_{31,44,63}counter
say which ones are supported.

The helper you suggest an then pick which one is best.


Thanks,

James

