Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE96CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFGkAVZALpfzlTaJiuGHcbxjtCb3qQNBWBukbUqUzxg=; b=Q0t1VSC3JijHDsMSgfR0y94U9/
	5FQpIa4mCucJp8CWzORCvamxiH4Je+D5x9LABjjqi2AvQd+bcr9mtmkfiQc9ub5ztH2IDqvaiGp1A
	lRk15MPbKLA9fw1ASGsS1zIKG8SI3m7pZpfowvjGzXVS8OD99lkPTEOIzx5kUNj2cJwOXNspIc4Ns
	nWsNRiv8DUfoHLf/n5ArdWP1XQ1sJz3hxZQJKjneWmb/mtj2L8ueXfPR4/mm1G+zzO03FQ394Vb3e
	p2H7A9YuQ1i5IVY52OnwG1NMIE4OHqlozzI6ENfCHdyrln1roxoxsHcT6t4g451juB4QrwoOpyECb
	sh6Q3AHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCel8-0000000Bpxg-28K6;
	Fri, 02 Oct 2026 15:01:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCel6-0000000Bpwq-2uvz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:01:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65F4A497;
	Fri,  2 Oct 2026 08:01:06 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABF393F86F;
	Fri,  2 Oct 2026 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953269; bh=2Uec7YMLA3YtX9l/GqLdQY9WQiK6dogPMfFk1LOU2Xg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m9ldiA8dmOka54o0DFRxxQZE8JFkOcuXOfyF4BykbrsiuJQiNrpI2xso66KWIPef+
	 HOiX/wkaMjY8waAGXcqEjc9YU2mhPVkfTpuSkRabqjqWfEF+6x2C42amSlQgWLk6ND
	 Ol2Dp/TipodWyE4VKoSS93Mp9RRuLuRkrwClrNu0=
Message-ID: <d54c7220-e47a-4ea0-b494-6efdfb47f61e@arm.com>
Date: Fri, 2 Oct 2026 16:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-4-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-4-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080112_790159_B2411351 
X-CRM114-Status: GOOD (  14.94  )
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

On 17/09/2026 15:56, Ben Horgan wrote:
> When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE
> field of 31 bits. If additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then
> MSMON_MBWU_L is also present and has a VALUE field of 44 or 63 bits as
> indicated by MPAMF_MBWUMON_IDR.LWD. Hence, if there are memory bandwidth
> counters then there are always 31 bit counters irrespective of whether
> there also long counters.
> 
> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
> counters.

Yes, that bitmap is supposed to be what is present, not what the driver is choosing
to use.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 32bde94dfbc3..e349db525882 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  						mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
>  					else
>  						mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
> -				} else {
> -					mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>  				}
> +
> +				mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>  			}
>  		}
>  	}


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

