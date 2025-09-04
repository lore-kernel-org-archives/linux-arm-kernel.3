Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D342CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2LNIdr0IxFyRQU+JgR1Du2sRS2O22SqJsiSsupwl7U=; b=rnmkwtRgeDjiM0jVyGVG88nJd2
	B2/7nUWTNECFIK8OziTmyzocSj1Dz23FOU3wBzWrIE7KfPlRxmzmC8AV8dv9a3D1Vt1OgnVg8GG+h
	us64Ykfz3/WUewNe6Z6m7Zb4vLh8Tlw/q8Am/+TdHL5ZzA5QlNVaXCVL+cBNu1cvKLi5+VHujMF/I
	R2FB9Zgely1rgsUBtXK1u5SIhmyN9rkx7yYtYqSXSWhV08R+SVPdbBCXT68lT2O64uRlyVZpzsJhv
	mw2DBHl7IjuzVOcGMM28lTwIblb+2eOeiWHux2FDqKWt1ogprJrK9GQT+vLJ/7SqIAkCj0nvJ6ARY
	g9a1go0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCl3-0000000CqKr-39mN;
	Thu, 04 Sep 2025 16:24:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7o3-0000000B6Mm-36JA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 11:07:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6A4D1756;
	Thu,  4 Sep 2025 04:06:58 -0700 (PDT)
Received: from [10.1.37.179] (XHFQ2J9959.cambridge.arm.com [10.1.37.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754B23F6A8;
	Thu,  4 Sep 2025 04:07:05 -0700 (PDT)
Message-ID: <a2ab7671-093d-4b7d-b0a2-2a6f73bb80e4@arm.com>
Date: Thu, 4 Sep 2025 12:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] arm64: cpufeature: add AmpereOne to BBML2 allow
 list
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dev Jain <dev.jain@arm.com>,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-3-ryan.roberts@arm.com>
 <b3f4e006-6101-496f-a4a5-13474470109d@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <b3f4e006-6101-496f-a4a5-13474470109d@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040707_816410_7C215EF1 
X-CRM114-Status: GOOD (  12.20  )
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

On 29/08/2025 23:08, Yang Shi wrote:
> 
> 
> On 8/29/25 4:52 AM, Ryan Roberts wrote:
>> From: Yang Shi <yang@os.amperecomputing.com>
>>
>> AmpereOne supports BBML2 without conflict abort, add to the allow list.
>>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> I saw Catalin gave Reviewed-by to v6 of this patch, I think we can keep it.

Sorry I missed that. I see Catalin and Rb'ed again.

> 
> Yang
> 
>> ---
>>   arch/arm64/kernel/cpufeature.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 9ad065f15f1d..b93f4ee57176 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2234,6 +2234,8 @@ static bool has_bbml2_noabort(const struct
>> arm64_cpu_capabilities *caps, int sco
>>       static const struct midr_range supports_bbml2_noabort_list[] = {
>>           MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>>           MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
>> +        MIDR_ALL_VERSIONS(MIDR_AMPERE1),
>> +        MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
>>           {}
>>       };
>>   
> 


