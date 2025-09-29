Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DDECCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FiK8r9l7lehOrNGYTUxkvhAmoNgpLT/tBU+bW8P2tU=; b=OXVTnbRDBKa5KshluoAiUq4sMG
	runXwU+7/anAswKnzN0T4kUqYP/PxlvbTQyqV5eKMmDXzM7CDALx0NJ+8rAm8zOzpT6YfSSlTkRD0
	UfYD+Dc83SNVMLDIHMARK5wTFLYkdHOd4A0jjvyVhLCzUt+WgvCnhsxYTPZ50jGI0lr+GSynlQrSi
	NQJk32mpTnWQ9tX6tG6//l4GccXRTatFQ5VsmQCFlbOTvgYsCpFZd/3v3Xah9T0f17xfVHhoEG1XT
	AM6lOCUGxxc/cqvNbkznNd6qhjqnhPxjCG1HLzmTxggiYFprHuHEWuGtVZe5Wnj0kAfi8wtJm6NS7
	k5aC9jTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HwV-00000003AR9-0NaB;
	Mon, 29 Sep 2025 17:45:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hvw-00000003A68-0h9D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:45:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EBC91BCB;
	Mon, 29 Sep 2025 10:44:59 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B27D33F59E;
	Mon, 29 Sep 2025 10:45:02 -0700 (PDT)
Message-ID: <fea6066e-b94d-4ac1-9a33-3e42a8923de6@arm.com>
Date: Mon, 29 Sep 2025 18:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/29] arm_mpam: Probe the hardware features resctrl
 supports
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
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-14-james.morse@arm.com>
 <20250911162956.00005157@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250911162956.00005157@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104508_353286_2A86B95E 
X-CRM114-Status: GOOD (  15.17  )
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

On 11/09/2025 16:29, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:53 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Expand the probing support with the control and monitor types
>> we can use with resctrl.
>>
>> CC: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
> 
> A few trivial things inline.
> LGTM
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> @@ -592,6 +736,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>  	mutex_lock(&msc->part_sel_lock);
>>  	idr = mpam_msc_read_idr(msc);
>>  	mutex_unlock(&msc->part_sel_lock);
>> +
> Stray change  - push it to earlier patch.

Fixed,


>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 4cc44d4e21c4..5ae5d4eee8ec 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -112,6 +112,55 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>>  	raw_spin_lock_init(&msc->_mon_sel_lock);
>>  }
>>  
>> +/*
>> + * When we compact the supported features, we don't care what they are.
>> + * Storing them as a bitmap makes life easy.
>> + */
>> +typedef u16 mpam_features_t;
> 
> Maybe use a bitmap type and avoid the need to be careful on sizing etc?

That would be unsigned long at a minimum, which is four times larger than needed.
As there is a build-time check, I'm not worried about this ever being wrong...


>> +
>> +/* Bits for mpam_features_t */
>> +enum mpam_device_features {
>> +	mpam_feat_ccap_part = 0,
>> +	mpam_feat_cpor_part,
>> +	mpam_feat_mbw_part,
>> +	mpam_feat_mbw_min,
>> +	mpam_feat_mbw_max,
>> +	mpam_feat_mbw_prop,
>> +	mpam_feat_msmon,
>> +	mpam_feat_msmon_csu,
>> +	mpam_feat_msmon_csu_capture,
>> +	mpam_feat_msmon_csu_hw_nrdy,
>> +	mpam_feat_msmon_mbwu,
>> +	mpam_feat_msmon_mbwu_capture,
>> +	mpam_feat_msmon_mbwu_rwbw,
>> +	mpam_feat_msmon_mbwu_hw_nrdy,
>> +	mpam_feat_msmon_capt,
>> +	MPAM_FEATURE_LAST,
> 
> If it's always meant to be LAST, I'd drop the trailing comma.

Sure. Full-stops for enums!


Thanks,

James

