Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157DEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19jDBZF6rNyIk4iwZQDSSyLigfmGruZ32AJudcB1SJo=; b=3arDJKnFduaOnToKp6Vwrt6H5P
	YjFbzGD4pTwyBm61dJRwnUn+vL5Sv5nkCFgSaqsAGFyYq8sTR+o9ZD+kY6GRtkdGDgrJ9AZozYunq
	3ca9zTotXCF9CqwWSwMEquvKilHR59y59I28lHLnuDYvSoseZ3G903QnCUeNihDjsEVHxv2o7Yign
	c6GHqU7m6yqjJ76NYss/kOySIZpjxI3Bx3YuQhsik6Y8oLvfHOEaehDUCJI9Tx2ZlPj3WPKJhdSPK
	m/ideBfuF+rYFCncqJTs5irRHl3npZgv+FuIUDgliGqXkbnj2oHmS+mVfoQ1v+yp9+MFrWOsyq3ph
	YFG0cJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHhN-00000002DzI-3Hro;
	Fri, 08 Aug 2025 07:39:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHP2-00000002BD8-3wQk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:20:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2171122EA;
	Fri,  8 Aug 2025 00:20:28 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F9B33F673;
	Fri,  8 Aug 2025 00:20:31 -0700 (PDT)
Message-ID: <99531c99-0430-4248-960a-a55fcdba79da@arm.com>
Date: Fri, 8 Aug 2025 08:20:28 +0100
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
 <46e49e66-1da3-433c-bdad-9468133c78a2@arm.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <46e49e66-1da3-433c-bdad-9468133c78a2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_002037_018030_86649B21 
X-CRM114-Status: GOOD (  10.59  )
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

On 28/07/2025 09:56, Ben Horgan wrote:
> On 7/11/25 19:36, James Morse wrote:
>> Expand the probing support with the control and monitor types
>> we can use with resctrl.

>> diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/
>> mpam_internal.h
>> index 42a454d5f914..ae6fd1f62cc4 100644
>> --- a/drivers/platform/arm64/mpam/mpam_internal.h
>> +++ b/drivers/platform/arm64/mpam/mpam_internal.h
>> @@ -136,6 +136,55 @@ static inline void mpam_mon_sel_lock_held(struct mpam_msc *msc)
>>           lockdep_assert_preemption_enabled();
>>   }
>>   +/*
>> + * When we compact the supported features, we don't care what they are.
>> + * Storing them as a bitmap makes life easy.
>> + */
>> +typedef u16 mpam_features_t;
>> +
>> +/* Bits for mpam_features_t */
>> +enum mpam_device_features {
>> +    mpam_feat_ccap_part = 0,
>> +    mpam_feat_cpor_part,
>> +    mpam_feat_mbw_part,
>> +    mpam_feat_mbw_min,
>> +    mpam_feat_mbw_max,
>> +    mpam_feat_mbw_prop,
>> +    mpam_feat_msmon,
>> +    mpam_feat_msmon_csu,
>> +    mpam_feat_msmon_csu_capture,
>> +    mpam_feat_msmon_csu_hw_nrdy,
>> +    mpam_feat_msmon_mbwu,
>> +    mpam_feat_msmon_mbwu_capture,
>> +    mpam_feat_msmon_mbwu_rwbw,
>> +    mpam_feat_msmon_mbwu_hw_nrdy,
>> +    mpam_feat_msmon_capt,
>> +    MPAM_FEATURE_LAST,
>> +};
>> +#define MPAM_ALL_FEATURES      ((1 << MPAM_FEATURE_LAST) - 1)
> 
> Consider a static assert to check the type is big enough.
> 
> static_assert(BITS_PER_TYPE(mpam_features_t) >= MPAM_FEATURE_LAST);

Fancy.
There used to be an uglier one - not sure what happened to it!



Thanks,

James

