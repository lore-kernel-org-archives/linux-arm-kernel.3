Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A73D767F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5LAa9fS+KuS2ew6QeqgzaMQsbCS4TeuFggDVKYI+sY=; b=euWSrZnlY6tyngqY1Ru50Ivqfz
	8UCuuvILGQkugWnltdv1tQ/0XUc+GG5gqPTaaHYPyZILECaw0x24oOjtR204WPu4l5ObGtyFFA4WQ
	69JQ+C1vL/5wsXvPnpH0u7hiToOi6Ksq2TpyYvt7yGLJExkrSr185oOaXBiFezmfqr8bZpfdWihcU
	GXY2oAAaoVuVQ4u51FQL9z/SfJ85WrHss1ejcw6yL0EHkeaKEbHFy4XDcHsLoPvFyk8hxun6ctb6B
	HTRiobtLOg7UT2r2ktu6k65vbMfLBZagMmf/wfADiDL+/LOubAmNYn/Vb+x9pveksT6DZ4Gz6oVzR
	eeLR/yDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZG7-0000000AFwu-2T0T;
	Fri, 19 Dec 2025 12:06:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZG5-0000000AFwa-19e5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:06:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8795FEC;
	Fri, 19 Dec 2025 04:06:48 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA7173F5CA;
	Fri, 19 Dec 2025 04:06:52 -0800 (PST)
Message-ID: <c2bee23a-517e-4d53-af26-eb0bb5795788@arm.com>
Date: Fri, 19 Dec 2025 12:06:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 18/38] arm_mpam: resctrl: Add support for csu counters
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Gavin Shan <gshan@redhat.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-19-james.morse@arm.com>
 <20251218132059.00001a0d@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251218132059.00001a0d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_040657_362222_BA405B1D 
X-CRM114-Status: GOOD (  20.42  )
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

On 12/18/25 13:20, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 21:58:41 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> resctrl exposes a counter via a file named llc_occupancy. This isn't really
>> a counter as its value goes up and down, this is a snapshot of the cache
>> storage usage monitor.
>>
>> Add some picking code to find a cache as close as possible to the L3 that
>> supports the CSU monitor.
>>
>> If there is an L3, but it doesn't have any controls, force the L3 resource
>> to exist. The existing topology_matches_l3() and
>> mpam_resctrl_domain_hdr_init() code will ensure this looks like the L3,
>> even if the class belongs to a later cache.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
> 
> More triviality from me.  I'll take a separate look at whether this actually
> works for all the systems we care about.  It feels like maybe a top level
> MPAM to resctl mapping document might be useful as people are going to fall
> into traps around these various heuristics, particularly as more exciting
> topologies arrive in the future.

Seems sensible, this is one of the tricky things.

> 
> 
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index fe830524639e..fc1f054f187e 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
>>  /*
>>   * Calculate the worst-case percentage change from each implemented step
>>   * in the control.
>> @@ -499,6 +531,64 @@ static void mpam_resctrl_pick_mba(void)
>>  	}
>>  }
>>  
>> +static void counter_update_class(enum resctrl_event_id evt_id,
>> +				 struct mpam_class *class)
>> +{
>> +	struct mpam_class *existing_class = mpam_resctrl_counters[evt_id].class;
>> +
>> +	if (existing_class) {
>> +		if (class->level == 3) {
>> +			pr_debug("Existing class is L3 - L3 wins\n");
>> +			return;
> 
> As returned the else isn't adding anything much.
> 
>> +		} else if (existing_class->level < class->level) {
>> +			pr_debug("Existing class is closer to L3, %u versus %u - closer is better\n",
>> +				 existing_class->level, class->level);
>> +			return;
>> +		}
>> +	}
>> +
>> +	mpam_resctrl_counters[evt_id].class = class;
>> +	exposed_mon_capable = true;
>> +}
> 
> 

Thanks,

Ben


