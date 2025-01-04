Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6338EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZU2BjFxRBUYF+LUDGVGsB7CSJF35vD0XK/l1+cd+/8=; b=aRS7c5lvF5cp7QjItRLZ74+VxA
	xfh8++FT6PKm4P3aAC1+mP1wxwf5CBNol59qK778Ho1SkmNmwvK5Y4ZWxuA1WivRwaFX/jqzu2r5M
	ut+dCoaw18TkB/wPH/bsju4CNedCEVjXZC9Pc8Koa+W7XtZlx0ieR5QM1f1hu/WSfhZSvxf0JBt7+
	tyBs3a4a+pYqMhkLVVindjj0KgTSrayqMSMD/iPYtuL38PlroABG4tF9ozx+iJkcuidB8n1h+Zvju
	io8a9v/jvpdgfk8+P9ubW4VKepZXuDvVe2XuBznPX6zL7/MUKfJ0cohW0KQ8jSrnY4qRbwHCo4aeM
	y9gEVxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0Gn-0000000Elui-3gr8;
	Sat, 04 Jan 2025 09:16:33 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0Fc-0000000ElnZ-2Ena
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 09:15:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YQF7t0vlyz1V4NW;
	Sat,  4 Jan 2025 17:12:10 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id E8F281A0188;
	Sat,  4 Jan 2025 17:15:06 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 4 Jan 2025 17:15:06 +0800
Message-ID: <108fa543-a086-2143-47bd-d525a58513c1@huawei.com>
Date: Sat, 4 Jan 2025 17:15:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 2/5] arm_mpam: Read
 monitor value with new closid/rmid pair
Content-Language: en-US
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-3-zengheng4@huawei.com>
 <Z1sMxKM9o6lAiZGr@e133380.arm.com>
 <8fa84731-1ae6-e40f-3594-3241b1ee8bb4@huawei.com>
 <Z3gC25189W5UYENX@e133380.arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Z3gC25189W5UYENX@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_011520_892646_77393370 
X-CRM114-Status: GOOD (  33.69  )
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



On 2025/1/3 23:31, Dave Martin wrote:
> On Fri, Jan 03, 2025 at 02:55:17PM +0800, Zeng Heng wrote:
>>
>>
>> On 2024/12/13 0:18, Dave Martin wrote:
>>> Hi,
>>>
>>> On Sat, Dec 07, 2024 at 05:21:33PM +0800, Zeng Heng wrote:
> 
> [...]
> 
>>>> Based on the example provided, the conversion relationship between
>>>> closid/rmid and (req)PARTID/PMG is:
>>>>
>>>>       (req)PARTID = (rmid.req_idx * n) + closid,
>>>>       PMG = rmid.pmg.
>>>
>>> It seemed more natural to me for the PARTIDs assigned to a particular
>>> CLOSID to be consecutively numbered (see [1]), though it works either
>>> way.
>>>
>>> Otherwise, the approach makes sense.
>>>
>>
>>
>> After attempting to change the mapping method in practice, I found that
>> there are some following advantages of the current method which keeps
>> intPARTIDs are mapped to the first n IDs:
> 
> Thanks for having a go.
> 
>> 1. Because closid is exactly equal to intPARTID, and the conversion
>> relationship between closid and intPARTID remains unchanged under the
>> current method (still only call the resctrl_get_config_index() for
>> conversion), maintaining the original semantics during the MPAM
>> configuration updating;
> 
> You are right about this, but I think this is just moving complexity
> around rather than eliminating it?
> 
> I've tried various approaches, and there there always seems to be one
> ugly step somewhere; either something in mpam_devices.c that feels like
> it should be in mpam_resctrl.c, or something in mpam_resctrl.c that
> feels like it should be in mpam_devices.c.
> 
>> 2. Since there is no need to create a new transformation (like
>> closid2intpartid()) between closid and intPARTID, this can reduce the
>> work of function adaptations, such as in resctrl_arch_update_one(),
>> resctrl_arch_get_config(), and so on, which doesn't need any extra
>> adaptions and keeps things as simple as possible.
>>
>> Looking forward to your comments.
>>
>>
>> Greeting for new year,
>> Zeng Heng
>>
> 
> Happy New Year to you too!
> 
> What you say is true, but I think the runtime cost of the conversions
> is going to be trivial compared with the cost of the actual MSC
> programming.
> 
> For context: I'm hoping to factor the code so that the conversion is as
> cleanly separated out as possible, so that it would be straightforward
> to move to an arbitrary mapping in the future if it is possible to
> agree changes in the core resctrl interface so that the PARTID/PMG
> allocations can be dynamic.  If we do that, the conversion would
> probably become a simple table lookup.
> 
> This factoring seems more important than which precise mapping we
> choose right now.
> 
> But in the interests of improving PARTID Narrowing support sooner,
> I think that going straight to dynamic allocation is not the best
> approach -- so my idea is to prepare for that on the MPAM driver side,
> but not prioritise developing a dynamic approach until after the
> resctrlfs refactoring and the MPAM driver are merged upstream.
> 
> Does that make sense?
> 

One of the main reasons for only being able to use static allocation is
the constraint of the alloc_rmid(). Unless we switch to using another
interface (such as resctrl_arch_alloc_rmid()) for rmid allocation, doing
so would definitely break the existing public interface of resctrl.

Consequently, this would increase the difficulty of merging the MPAM
driver into the mainline. (Of course, even after merging into the
upstream, expectations for MPAM to change the common interface still
remain cautious.)

But for how to support dynamic allocation in the future, I have the
following preliminary views and possible directions for evolution:

1. The mapping between closid and intpartid will continue to be
maintained as it is, supporting the NP feature, which should not lead to
changes in the definition of closid, because essentially NP is just an
enhanced feature for monitoring;

2. rmid will no longer only contain pmg information. rmid would be
composed of rmid.req_idx (or directly rmid.reqpartid) and rmid.pmg.

Once the mapping between closid/rmid is determined, the allocation
method will also be determined, and the dynamic allocation process can
be like table lookup.

Currently, I am prioritizing updating the issues you discussed
previously on the basis of v3 and releasing it as v4 for further review.

Both v3 and v4 include the above ideas, and we can continue discussions 
in any direction based on v4.

Thank you in advance.


Best regards,
Zeng Heng


