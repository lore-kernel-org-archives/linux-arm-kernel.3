Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4193FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+jk/Pz3GNBTlG0OqfoGn9yftgjAvXNK+qEiidxpvuA=; b=LSedpqPIddEShv1g0VJAljzgfz
	2kykKhraDgNeT9P00wb09gDKywHgzKxocF65V2FkCTdXTyjqzWgIESqNpqiTDmq9axGE75hnEc5vL
	tkxJNFJXAsu7x5Pt7mqYYQHsbmk0+DW2vV4WXSaEym/aNd+nVg5/Pve1AChn/k75+5m/0pYAuVZEp
	Q2p4PWjk1BKX7hbIr4M0o+S//QulWsWW6c3gEbEPrbIRCEqlM42VTNfH+EP0ddQ4BAVRnX5uSp2L7
	dX5UjaEiEbiimU/SMMYThgAadpLpVAc0S5mXtJQQ0ZWL4UQbLG5y/iuAi0pYEHSLosut/OZTHkFS4
	nyHyfTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQWm-0000000GIIg-128A;
	Wed, 10 Sep 2025 19:30:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQWj-0000000GIGh-3Upn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:30:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07F2831DB;
	Wed, 10 Sep 2025 12:30:37 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DE2E3F694;
	Wed, 10 Sep 2025 12:30:39 -0700 (PDT)
Message-ID: <80fab62a-9043-4490-8eb9-f7ab760ef9ac@arm.com>
Date: Wed, 10 Sep 2025 20:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/33] arm_mpam: Probe for long/lwd mbwu counters
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-30-james.morse@arm.com>
 <75cdcd36-4bd5-4ad7-a37e-9c2a195c71e5@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <75cdcd36-4bd5-4ad7-a37e-9c2a195c71e5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123046_002121_93CB74DA 
X-CRM114-Status: GOOD (  15.88  )
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

On 28/08/2025 17:14, Ben Horgan wrote:
> On 8/22/25 16:30, James Morse wrote:
>> From: Rohit Mathew <rohit.mathew@arm.com>
>>
>> mpam v0.1 and versions above v1.0 support optional long counter for
>> memory bandwidth monitoring. The MPAMF_MBWUMON_IDR register have fields
>> indicating support for long counters. As of now, a 44 bit counter
>> represented by HAS_LONG field (bit 30) and a 63 bit counter represented
>> by LWD (bit 29) can be optionally integrated. Probe for these counters
>> and set corresponding feature bits if any of these counters are present.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 11be34b54643..2ab7f127baaa 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -870,7 +870,7 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>  				pr_err_once("Counters are not usable because not-ready timeout was not provided by firmware.");
>>  		}
>>  		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
>> -			bool hw_managed;
>> +			bool has_long, hw_managed;
>>  			u32 mbwumonidr = mpam_read_partsel_reg(msc, MBWUMON_IDR);

> nit: the variable name would be more readable with an underscore,
> mwumon_idr.

Sure,


>>  
>>  			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumonidr);

>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 9a50a5432f4a..9f627b5f72a1 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -178,7 +178,15 @@ enum mpam_device_features {
>>  	mpam_feat_msmon_csu,
>>  	mpam_feat_msmon_csu_capture,
>>  	mpam_feat_msmon_csu_hw_nrdy,
>> +
>> +	/*
>> +	 * Having mpam_feat_msmon_mbwu set doesn't mean the regular 31 bit MBWU
>> +	 * counter would be used. The exact counter used is decided based on the
>> +	 * status of mpam_feat_msmon_mbwu_l/mpam_feat_msmon_mbwu_lwd as well.

> mpam_feat_msmon_mbwu_44counter/mpam_feat_msmon_mbwu_63counter

That's my fault - I hate the names for these things!


>> +	 */
>>  	mpam_feat_msmon_mbwu,
>> +	mpam_feat_msmon_mbwu_44counter,
>> +	mpam_feat_msmon_mbwu_63counter,
>>  	mpam_feat_msmon_mbwu_capture,
>>  	mpam_feat_msmon_mbwu_rwbw,
>>  	mpam_feat_msmon_mbwu_hw_nrdy,
> 
> Other than the two nits, the change looks good to me.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!

James

