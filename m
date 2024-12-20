Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76664E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q31UMTHR9PDQ1NUMxdCqReseA9A5kpr04JzW778A4Ks=; b=tdg2oWiBO4KCKAqEvQl7E0GZlw
	W4R0Vdi/xb351s4vshDnnDi30x6gDLKox2goCBje/MtA1X73egsW0lVGb3Sj9XomFPpXmahUOlxF2
	8PSvTSYb1A7re7sgI4OSLbEgrx1gTmG7nhUBUsfnAxXI6UJ4oLPhbeX+DPR8g7AdjhimGLJZcrnFw
	eXTUpCzoJan0zMs0Moz4o98f1vI1aV2VjhxB+CxEwY13pnlZpV93xd74Mg3IUffHxuoYWX0Z5Dqf5
	OP/YUtm7Z7dJTlZf6UE2YHZZQGT3dWixd8MgWi8xW1ibRrbKKu44dREbZl3Vt+1CxGgtKx4Pv1edo
	uOXO3t/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaxq-00000004io6-3Hpm;
	Fri, 20 Dec 2024 11:14:38 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOajP-00000004ei2-0q9Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:59:45 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YF49g2CT8z2KXtn;
	Fri, 20 Dec 2024 18:56:55 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AA191401E0;
	Fri, 20 Dec 2024 18:59:32 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Dec 2024 18:59:31 +0800
Message-ID: <acf5c82f-1d33-4cd4-ff50-5f7c37f49a1e@huawei.com>
Date: Fri, 20 Dec 2024 18:59:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 0/5] arm_mpam:
 Introduce the Narrow-PARTID feature for MPAM driver
Content-Language: en-US
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <Z1sMtF9bvw5NZOC6@e133380.arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Z1sMtF9bvw5NZOC6@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_025943_543902_1083959D 
X-CRM114-Status: GOOD (  37.14  )
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



On 2024/12/13 0:17, Dave Martin wrote:
> Hi,
> 
> On Sat, Dec 07, 2024 at 05:21:31PM +0800, Zeng Heng wrote:
>> The patch set is applied for mpam/snapshot/v6.12-rc1 branch of
>> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
>> repository.
>>
>> The narrow-partid feature in MPAM allows for a more efficient use of
>> PARTIDs by enabling a many-to-one mapping of reqpartids (requested PARTIDs)
>> to intpartids (internal PARTIDs). This mapping reduces the number of unique
>> PARTIDs needed, thus allowing more tasks or processes to be monitored and
>> managed with the available resources.
>>
>> For a mixture of MSCs system, for MSCs that do not support narrow-partid,
>> we use the PARTIDs exceeding the number of closids as reqPARTIDs for
>> expanding the monitoring groups.
> 
> Mixed systems still seem not to be handled completely by this series?
> 
> You do cope with the scenario where some MSCs support Narrowing and
> some do not, but there is still the problem of incompatible controls.
> 
> If a non-Narrowing MSC has controls that are not of the "partition
> bitmap" type, then splitting a resctrl control group across multiple
> PARTIDs is going to change the hardware regulation behaviour.  There
> does not seem to be any way to work around this be programming
> different control values (for example).  So, there may be over- or
> under-allocation of resources compared with what the user requests in
> resctrlfs.
> 
> So, I think there is still a need to check which controls are present,
> and either disable the use of non-identity intPARTID<->reqPARTID
> mappings if incompatible controls are present (or don't expose those
> controls to resctrl).
> 
> (If you were not trying to address this issue yet then that is not a
> problem for an RFC, but it is best to be clear about the
> limitations...)
> 

In the v3, the limitation you mentioned has not yet been handled.
V3 has not yet determined how to define this limitation well. 
Additionally, for v3, I was still uncertain whether a large-scale
refactoring was still necessary at that time.

In fact, I take this limitation very seriously, and I will try to define
the limitation in next version, explaining it separately as a distinct
patch.


>> In order to keep the existing resctrl API interface, the rmid contains both
>> req_idx and PMG information instead of PMG only under the MPAM driver. The
>> req_idx represents the req_idx-th sub-monitoring group under the control
>> group. The new rmid would be like:
>>
>>      rmid = (req_idx << shift | pmg).
>>
>> The new conversion relationship between closid/rmid and (req)PARTID/PMG is:
>>
>>      (req)PARTID = (rmid.req_idx * n) + closid,
>>      PMG = rmid.pmg.
>>
>> Each intPARTID has m reqPARTIDs, which are used to expand the number of
>> monitoring groups under the control group. Therefore, the number of
>> monitoring groups is no longer limited by the range of MPAM PMG, which
>> enhances the extensibility of the system's monitoring capabilities.
>>
>> ---
>> Compared with v1:
>>    - Rebase this patch set on latest MPAM driver of the v6.12-rc1 branch.
>>
>> Compared with v2:
>>    - Refactor closid/rmid pair translation
>>    - Simplify the logic of synchronize configuration
>>    - Remove reqPARTID pool
>> ---
> 
> This approach looks reasonable overall, and in this version the changes
> do seem to be better localised in the mpam_resctrl.c glue code now.
> 
> I had also been working on a similar approach, so I have posted it for
> comparison [1] -- though the two approaches are doing pretty much the
> same thing, some details differ.
> 
> (Note, I have not addressed PARTID Narrowing at all yet; however,
> I think more thought is needed for that.)
> 

Yes, localize the narrow-partid feature within mpam_resctrl.c file is
the biggest restructuring improvement in this version. Of course, thanks
for your meticulous review and insightful comments.

In the meanwhile, I have roughly read through the patch set you sent
out, especially patch 4 (arm_mpam: Introduce flexible CLOSID/RMID
translation). If I have any comments worth discussing, I will try to
share them.

> 
> Note: Are there bisection issues with some of the patches in the
> series?  It looks like not all of the ID conversions are applied in the
> same patch, so I'm wondering whether strange behaviour may be seen at
> the intermediate commits.
> 

The original intention of splitting the patch set was to facilitate 
review. I will merge the part of patch 5 into patch 2 and consider
making the patch set be friendly for bisection issues.


Best regards,
Zeng Heng


