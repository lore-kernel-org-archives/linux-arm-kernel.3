Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8813E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaVSkWKpP5B4CziKH+iVS73s8XWZ5XSk/s+7bHULCNw=; b=PUHeKBBlak5Zik3wAWR8eRP9uv
	kiKiZnYS5HMs7a5nEb0loYFewRD7aq9BBCYvjXU2tMO/flJodRiATct1SBsPEuCbArMkFK4/8GpvW
	25bI6cif7MgLEbiLXNRjk4b9aL/FBKAexE4PauF7WH7mLInt9zVd7k0jUu7KKpVtfa+2vpbOvpbiA
	4Zzc/1MAFSQWDogErKRVtkOX/7eQQq1IPohEswR8F/1RQY0cxFeXJdfAuBnj9NCHSnfN/Zh4gMvP2
	7gzoJvKinhRitQaj0e5E6KE1RHkQRHz4ZMw31scEry4uKifOorTUepwXzrITZQhmXQxHxcdxqsLWc
	p4zM8f7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOCK-0000000DauN-3jn3;
	Wed, 25 Dec 2024 10:01:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOB8-0000000DamW-0jLL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 09:59:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3hkUh031265;
	Wed, 25 Dec 2024 09:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaVSkWKpP5B4CziKH+iVS73s8XWZ5XSk/s+7bHULCNw=; b=TDQ4jjiGxWTigkXf
	e03BKSacyQGnfRErQ5RmWdTkNdys9nml+jgJT689SvjU/udeR9zbZx4225kRw9DY
	1NEQ9FN71L4DubhiMJ/DApvH05+hyE7+U8hiwcbgG1j9QYAMJZ/2pOKaqNrYTIxC
	kPVMdCOgzZbiKqLRV+gl10Ylw0q9PdaYh6MEGX560rbaFr5yGGl00HvoV0q1ms1c
	biFhES/P4Qb/gSACjrHgWGtYdSMEU1Q98xGvcEktyrzo9LtwGjQ9nD/+znLPzyK1
	3a/SZf1NC87+v7JIs5lc8FbtgZuxCBEfJfacRske6VF1o6DvRdo8sAS6RwVnUBAm
	gzWUfQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rad81jrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 09:59:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BP9xUCP024401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 09:59:30 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 01:59:27 -0800
Message-ID: <04de1444-b28b-4c16-aafa-2b04f0a59304@quicinc.com>
Date: Wed, 25 Dec 2024 17:59:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com> <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
 <Z2rAr9APkgpkwOl8@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <Z2rAr9APkgpkwOl8@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3_1_jcqzwtTTdVsDy7yyv22gtFZOm1mn
X-Proofpoint-ORIG-GUID: 3_1_jcqzwtTTdVsDy7yyv22gtFZOm1mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412250087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_015946_344318_0654BCBE 
X-CRM114-Status: GOOD (  28.76  )
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



On 2024/12/24 22:09, Catalin Marinas wrote:
> On Tue, Dec 24, 2024 at 05:32:06PM +0800, Zhenhua Huang wrote:
>> Thanks Catalin for review!
>> Merry Christmas.
> 
> Merry Christmas to you too!
> 
>> On 2024/12/21 2:30, Catalin Marinas wrote:
>>> On Mon, Dec 09, 2024 at 05:42:26PM +0800, Zhenhua Huang wrote:
>>>> Fixes: c1cc1552616d ("arm64: MMU initialisation")
>>>
>>> I wouldn't add a fix for the first commit adding arm64 support, we did
>>> not even have memory hotplug at the time (added later in 5.7 by commit
>>> bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this hasn't
>>> been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
>>> sub-section hotplug"). That commit broke some arm64 assumptions.
>>
>> Shall we add ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>> because it broke arm64 assumptions ?
> 
> Yes, I think that would be better. And a cc stable to 5.4 (the above
> commit appeared in 5.3).

Got it, Thanks.

> 
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index e2739b69e11b..fd59ee44960e 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>>    {
>>>>    	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>>> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
>>>> +	!IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
>>>> +	!IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
>>>>    		return vmemmap_populate_basepages(start, end, node, altmap);
>>>>    	else
>>>>    		return vmemmap_populate_hugepages(start, end, node, altmap);
>>>
>>> An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
>>> nuking the whole vmemmap pmd section if it's not empty. Not sure how
>>> easy that is, whether we have the necessary information (I haven't
>>> looked in detail).
>>>
>>> A potential issue - can we hotplug 128MB of RAM and only unplug 2MB? If
>>> that's possible, the problem isn't solved by this patch.
>>
>> Indeed, seems there is no guarantee that plug size must be equal to unplug
>> size...
>>
>> I have two ideas:
>> 1. Completely disable this PMD mapping optimization since there is no
>> guarantee we must align 128M memory for hotplug ..
> 
> I'd be in favour of this, at least if CONFIG_MEMORY_HOTPLUG is enabled.
> I think the only advantage here is that we don't allocate a full 2MB
> block for vmemmap when only plugging in a sub-section.

Yeah..
In my opinion, w/o subsection hotplugging support, it is definitely 
beneficial. However, w/ subsection hotplugging support, it may lead to 
memory overhead and necessitate special logic in codes since we always 
use a full 2MB block..

> 
>> 2. If we want to take this optimization.
>> I propose adding one argument to vmemmap_free to indicate if the entire
>> section is freed(based on subsection map). Vmemmap_free is a common function
>> and might affect other architectures... The process would be:
>> vmemmap_free
>> 	unmap_hotplug_range //In unmap_hotplug_pmd_range() as you mentioned：if
>> whole section is freed, proceed as usual. Otherwise, *just clear out struct
>> page content but do not free*.
>> 	free_empty_tables // will be called only if entire section is freed
>>
>> On the populate side,
>> else if (vmemmap_check_pmd(pmd, node, addr, next)) //implement this function
>> 	continue;	//Buffer still exists, just abort..
>>
>> Could you please comment further whether #2 is feasible ?
> 
> vmemmap_free() already gets start/end, so it could at least check the
> alignment and avoid freeing if it's not unplugging a full section. It
> does leave a 2MB vmemmap block in place when freeing the last subsection
> but it's safer than freeing valid struct page entries. In addition, it
> could query the memory hotplug state with something like
> find_memory_block() and figure out whether the section is empty.
> 

Do you mean that we need not clear struct page entries of subsection 
until the entire section fully unplugged ? That seems feasible.

BTW, You're right, I went through codes again, only export 
is_subsection_map_empty() for query is another option..
	page_to_pfn() to get pfn
	__nr_to_section() to get mem_section
	last call is_subsection_map_empty() we can get subsection hotplug 
status per section
w/ this approach, we need not to do changes for func vmemmap_free

> Anyway, I'll be off until the new year, maybe I get other ideas by then.
> 

Sure, Happy Holiday! I will prepare both of patches and wait for your 
further comments :


