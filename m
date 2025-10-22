Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1237CCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVhtjpnr0/Y2GnibzRRB6VUMWWpK6uqoS6H7zMi7GUY=; b=Vd2a2tRysW3/pXdyJtNt4xUbi0
	2cRdV+aJmt8ouOoeXPnuJsVd/bonjwMTASOJ/JXMlD+aYKTTZ84dyUI8dmjWFIRTxOij7IeXwifHL
	xcsYXT2geGy6zNkHQhVwmhQ563+Xu6WOYkSoOsONYOWnTNtDbLfkcsvNeFR+ifBaGEgI18MZfroNt
	L+lQKcUF9xv5jnld1BOgoqRel8A+0pO36x3W7PLBZgDBQeRplU9vqxRYT+FxKTD3RrnPcmOO7Y+DQ
	AX1E29mlBTit67/pLaSv8YCTUG/xymErKPfzrrIEuwV5YQNre9EULZChs0RDIi/oHhpi2gFZZ8OQq
	7HOz79Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWwd-00000002dui-33YO;
	Wed, 22 Oct 2025 11:23:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWwb-00000002dtq-0ISr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:23:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E740A1063;
	Wed, 22 Oct 2025 04:23:42 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B05A3F59E;
	Wed, 22 Oct 2025 04:23:46 -0700 (PDT)
Message-ID: <c33c16dc-a955-41f9-9fb2-1397f056cb00@arm.com>
Date: Wed, 22 Oct 2025 12:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/29] arm_mpam: Probe for long/lwd mbwu counters
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-26-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251017185645.26604-26-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_042353_851962_2ADD4B83 
X-CRM114-Status: GOOD (  20.37  )
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

Hi James,

On 10/17/25 19:56, James Morse wrote:
> From: Rohit Mathew <rohit.mathew@arm.com>
> 
> mpam v0.1 and versions above v1.0 support optional long counter for
> memory bandwidth monitoring. The MPAMF_MBWUMON_IDR register has fields
> indicating support for long counters.
> 
> Probe these feature bits.
> 
> The mpam_feat_msmon_mbwu feature is used to indicate that bandwidth
> monitors are supported, instead of muddling this with which size of
> bandwidth monitors, add an explicit 31 bit counter feature.
> 
> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
> [ morse: Added 31bit counter feature to simplify later logic ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since v2:
>  * Added 31 bit counter type feature.
>  * Altered commit message.
> ---
>  drivers/resctrl/mpam_devices.c  | 13 +++++++++++--
>  drivers/resctrl/mpam_internal.h |  3 +++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index deb1dcc6f6b1..f4d07234ce10 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -777,16 +777,25 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  				dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
>  		}
>  		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
> -			bool hw_managed;
> +			bool has_long, hw_managed;
>  			u32 mbwumon_idr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
>  
>  			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
> -			if (props->num_mbwu_mon)
> +			if (props->num_mbwu_mon) {
>  				mpam_set_feature(mpam_feat_msmon_mbwu, props);
> +				mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
> +			}
>  
>  			if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
>  				mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
>  
> +			has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumon_idr);
> +			if (props->num_mbwu_mon && has_long) {
> +				mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
> +				if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumon_idr))
> +					mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
> +			}
> +

I think it's clearer to set each mpam_feat_msmon_mbwu_XXcounter for just
the size of counter the hardware supports rather than all XX up to that
size.

>  			/* Is NRDY hardware managed? */
>  			hw_managed = mpam_ris_hw_probe_hw_nrdy(ris, MBWU);
>  			if (hw_managed)
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 28c475d18d86..ff38b4bbfc2b 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -158,6 +158,9 @@ enum mpam_device_features {
>  	mpam_feat_msmon_csu_xcl,
>  	mpam_feat_msmon_csu_hw_nrdy,
>  	mpam_feat_msmon_mbwu,
> +	mpam_feat_msmon_mbwu_31counter,
> +	mpam_feat_msmon_mbwu_44counter,
> +	mpam_feat_msmon_mbwu_63counter,
>  	mpam_feat_msmon_mbwu_capture,
>  	mpam_feat_msmon_mbwu_rwbw,
>  	mpam_feat_msmon_mbwu_hw_nrdy,

-- 
Thanks,

Ben


