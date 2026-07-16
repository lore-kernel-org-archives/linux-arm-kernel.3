Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B4EC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+cczMLpY88mG8MFjd1DeZWToo+wsNi4SiXf/VGUzcU=; b=WsPDK6tacKvIWh6Px5CGB15xjl
	0m/C3O2z+sLbKA1nUqF0yXu+D7BI2LjGCarSesCdZmiZMt/p1bpWvrzMfDbR5DfquAtDrOl+KRi97
	qRnq09gpsIdPr2U+mY0Z8E4LNZMMzngG0v85vaOyiPKIl4oE//KIQK+9bnfCPv/EciWhLo71SNXU0
	f6yjk9IwE76ZvBZsVMg+Nc3502hawv4z4BXw2rG2ulN6djyWsoLmcxgj800bzXfV/5S+Ok2i8lqCp
	X0AAvgoiVuDA23L8MdzvbHLjwYH6PQAj7w+iARyecjmX5vyRFcVf2nvMTaBS34Qs3pvOJRK5FfDdk
	AmHulJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIMF-0000000GrCt-3If1;
	Thu, 16 Jul 2026 09:26:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIMD-0000000GrCU-43SP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:26:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B66F2F;
	Thu, 16 Jul 2026 02:26:12 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A7ED3F905;
	Thu, 16 Jul 2026 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784193976; bh=ZtPnSwo7MEweEjCJFRSjXBLUgg5EG2tGwDYYo5xzWrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XgEgcsddapIx7BHBU8Tuo1eHy/AGRxAkL+kQTAZPe+BFZsrwxMQgXhsMbeDI2wzdv
	 esSqC1MLtWzAYwCbbT51ohi2jQSns577+iZVhsLTNfpCHMRCnnG+Znqyoo/nB4woMw
	 DMaedLLAU3yptAwMcVt0idWCMPqInplom8e+FnQ0=
Message-ID: <45d93047-9f11-468a-bee9-777089fd4bb8@arm.com>
Date: Thu, 16 Jul 2026 10:26:13 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 03/11] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: Gavin Shan <gshan@redhat.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-4-ben.horgan@arm.com>
 <c1779945-2ad1-48c7-9b13-1eea8afed687@redhat.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <c1779945-2ad1-48c7-9b13-1eea8afed687@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_022618_046301_5448F8A6 
X-CRM114-Status: GOOD (  17.19  )
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

Hi Gavin,

On 7/16/26 05:18, Gavin Shan wrote:
> On 7/10/26 9:55 PM, Ben Horgan wrote:
>> If there are memory bandwidth counters then there are 31 bit counters even
>> if there are also 44 bit counters or 63 bit counters.
>>
>> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
>> counters.
>>
>> Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> It might be worthwhile to put some context in the commit log helping readers
> to correlate to the specification. What I found is something like below in
> section 8.2.1.2 Long MBWU counter and capture of ARM IHI 0099A.a:
> 
> In MSMON_MBWU, the VALUE field is always 31 bits. If MSMON_MBWU_L is implemented,
> the length of the VALUE field is either 63 or 44 bits as set by MPAMF_MBWUMON_IDR.LWD.

How about?

When MPAMF_MSMON_IDR.MSMON_MBWU is 1, MSMON_MBWU is present and has a VALUE field of 31 bits. If
additionally, MPAMF_MBWUMON_IDR.HAS_LONG is 1, then MSMON_MBWU_L is also present and has a VALUE
field of 44 or 63 bits as indicated by MPAMF_MBWUMON_IDR.LWD.

Thanks,

Ben

> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index acfa9a4dc2fc..11b10c3bc334 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>>                           mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
>>                       else
>>                           mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
>> -                } else {
>> -                    mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>>                   }
>> +
>> +                mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>>               }
>>           }
>>       }
> 
> Thanks,
> Gavin
> 


