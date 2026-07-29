Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48228C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 18:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs50z9cTs+x1OJuj2lAGciOuTjo0+2COWF0rtAbVPvk=; b=l+0RzeYD9pPjHm91Eyk56yxhfN
	T2nvXyc33aUafIG/Nq5dkZxHpUHv17sHbNclH5F6YNyixMaiNXUDAeHUdRMhPYzXCdUKLHGWZkEnp
	Gb3inrFg/3mphROr+TVtrEUjizCAKbhXdBOrDwMC+ZFOU41e0RDG6tdZlfwE67xbmltQA4IGGhdPt
	wR6pzb8CxMfSHO45XiptW56LS+7sgeKqioNawbfWuuiJdWcB/feK74rxo7qNIJT0AWfcb5DT2JTd/
	vr+zlwADTTAbl4+mGCdYgI0v4yGNE/jbWtEvuyG9xiNT/mLOoGQN+fAxcWnhcRgaalRZCipKelRIx
	EejRkfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Br-00000008pgK-3tc5;
	Wed, 29 Jul 2026 18:39:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9Bp-00000008pfp-1d9X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:39:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61F0F1684;
	Wed, 29 Jul 2026 11:39:31 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E1AA3F66F;
	Wed, 29 Jul 2026 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785350375; bh=wxnN+qGhBe6IuV78Od6T4NuLPnJ1LTmDsaJiSs76zMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fOo2fY/cWfI27/+AvUJ66KuJYjF/ObPU337QH3V5fQbTqvlk25zdbKlL6r3Cc88IV
	 At/XWAxihpM1XI9CyrbJhAawzmigGsmDBUkTzQtkiF+gJXq+iq4AMTEipERAVqE6mP
	 QMDJRcQqctvKIUho9u9BeglC6hTHPnfqBDa+HqLw=
Message-ID: <25ddc6ec-3a8a-4ae5-8f33-e6c71ff354b5@arm.com>
Date: Wed, 29 Jul 2026 19:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] perf/arm-cmn: Rename filter variables for clarity
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 ilkka@os.amperecomputing.com, leo.yan@arm.com
References: <cover.1785252273.git.robin.murphy@arm.com>
 <ae87ea9530b3c2073874035a244f34baf7915def.1785252273.git.robin.murphy@arm.com>
 <20260729102014.000019ea@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260729102014.000019ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_113937_508989_BD8759EB 
X-CRM114-Status: GOOD (  18.50  )
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

On 29/07/2026 6:20 pm, Jonathan Cameron wrote:
> On Tue, 28 Jul 2026 16:59:21 +0100
> Robin Murphy <robin.murphy@arm.com> wrote:
> 
>> CMN has already grown many more event-specific filters than the original
>> Occupancy ID, but since they are all independent of each other we've
>> just overloaded them onto the same name. Before we add yet more, and
>> they begin to overlap, rename all our "occupid" variables to "filter" so
>> that things can be a bit clearer and more consistent (but leaving the
>> format attribute itself, to avoid UAPI concerns).
> Hi Robin,
> 
> Drive by review... I'm a bit confused.
> The print out change isn't a ABI change?  I'd at least mention what changes
> around that in the commit message.
> 
> Jonathan
> 
>>
>> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>
>> v2: No change
>>
>>   drivers/perf/arm-cmn.c | 53 ++++++++++++++++++++++--------------------
>>   1 file changed, 28 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
>> index 50402bc4a21d..2a8a67da72c3 100644
>> --- a/drivers/perf/arm-cmn.c
>> +++ b/drivers/perf/arm-cmn.c
> ...
> 
>> @@ -709,8 +709,8 @@ static ssize_t arm_cmn_event_show(struct device *dev,
>>   				  eattr->type, eattr->eventid);
>>   
>>   	if (eattr->fsel > SEL_NONE)
>> -		return sysfs_emit(buf, "type=0x%x,eventid=0x%x,occupid=0x%x\n",
>> -				  eattr->type, eattr->eventid, eattr->occupid);
>> +		return sysfs_emit(buf, "type=0x%x,eventid=0x%x,filter=0x%x\n",
>> +				  eattr->type, eattr->eventid, eattr->filter);
> 
> Changing the format of this smells like ABI change to me.

This is not a change per the event alias ABI itself[1], since that 
contract is only that these aliases may contain *some* symbolic terms 
which are to be dynamically resolved from the corresponding "format" 
attributes. Both the "occupid" and "filter" format names yield the same 
result, so tools simply parsing the sysfs aliases from scratch as 
intended are entirely unaffected.

The potential UAPI concern alluded to is between *those* tools and any 
higher-level scripts driving them - if those scripts contain 
already-copied or manually-generated event specifiers using an 
"occupid=" term then they would start failing if perf tool (or 
equivalent) could no longer resolve the "occupid" format. Thus although 
we're free to stop referring to it from our own event aliases, we can't 
just remove the old format name altogether. Because unfortunately, such 
scripts definitely do exist[2].

Anyone who was reading the sysfs event attributes expecting to see 
something they already know would have missed the point of the whole 
mechanism so hard I wouldn't even know what to say...

Thanks,
Robin.

[1] i.e. Documentation/ABI/testing/sysfs-bus-event_source-devices-events
[2] 
https://gitlab.arm.com/telemetry-solution/telemetry-solution/-/blob/main/tools/topdown_tool/topdown_tool/cmn_probe/common.py?ref_type=heads#L311

> 
>>   
>>   	return sysfs_emit(buf, "type=0x%x,eventid=0x%x\n", eattr->type,
>>   			  eattr->eventid);


