Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A4BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfjTiG0jHFf9ywEZeS6UslnAQPABLC5dbG0q1WV0izI=; b=mr0RcK81XO7F6IwsUkfRm7FEHM
	Ds7ZYZRjOKVbOnxRSykAqul1rccCsP1h5XO4vcVe3xSaksKDxbDYIlHdwqtuaocTZ5dhHprnLPvx3
	6UERnnEJ2EFUY6y3epqujScoSpx6rRM1hQMIau0RZP+/8dZFtZilrECeDA+1S7GS1itxK4ujU2K+e
	pmbQKhdktQRFq0j/6s8QGZnIpqGDZLVKZTzO8/ORG7aqpzjsmeUwLrrOnZGVrbftKsOazDGIzsHQu
	2UcGX257HCqpheoyZQqchJ7bTO/12Lzu7/VQq/CJu1gyzRaXlcNICLc1xDrksjlm9AAVjllryfXup
	oPEl9jow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUXz-0000000GMuo-1f8d;
	Tue, 30 Jun 2026 09:14:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUXx-0000000GMtq-2TIh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:14:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B1DF2C1C;
	Tue, 30 Jun 2026 02:14:20 -0700 (PDT)
Received: from [10.57.81.132] (unknown [10.57.81.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16E913FAFB;
	Tue, 30 Jun 2026 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782810864; bh=gWU2+q57VLQEQbWXLkaWbWHCxJakIwq33zdaa5p1Eu8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XjRXYR504D+Vxscp6Uvahb1H/yAoW0+cH56gS/Gc1aRNw2VZXb9jFW5zgD3p2d2gO
	 3E/MVCbHlFCImB7zkUo3wn4AUZVbYzG1ySzXEwb8GqLYQwL+DiAWM4MRJgJUnn/nTl
	 k7YNttTCKDuukMPf3Ch7PvgZk+8uZgczy5xupOUA=
Message-ID: <0ac4e410-c73a-4fe7-a248-4c0ff735e73f@arm.com>
Date: Tue, 30 Jun 2026 11:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v8 02/24] set_memory: Introduce set_memory_pkey() stub
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-hardening@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
 <20260526-kpkeys-v8-2-eaaacdacc67c@arm.com>
 <e026ab6b-aee2-48e7-9bb5-1735d7a23859@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <e026ab6b-aee2-48e7-9bb5-1735d7a23859@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_021425_724519_329729B7 
X-CRM114-Status: GOOD (  15.81  )
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

On 16/06/2026 17:41, David Hildenbrand (Arm) wrote:
> On 5/26/26 13:15, Kevin Brodsky wrote:
>> Introduce a new function, set_memory_pkey(), which sets the
>> protection key (pkey) of pages in the specified linear mapping
>> range. Architectures implementing kernel pkeys (kpkeys) must
>> provide a suitable implementation; an empty stub is added as
>> fallback.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  include/linux/set_memory.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
>> index 3030d9245f5a..7b3a8bfde3c6 100644
>> --- a/include/linux/set_memory.h
>> +++ b/include/linux/set_memory.h
>> @@ -84,4 +84,11 @@ static inline int set_memory_decrypted(unsigned long addr, int numpages)
>>  }
>>  #endif /* CONFIG_ARCH_HAS_MEM_ENCRYPT */
>>  
>> +#ifndef CONFIG_ARCH_HAS_KPKEYS
>> +static inline int set_memory_pkey(unsigned long addr, int numpages, int pkey)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +
>>  #endif /* _LINUX_SET_MEMORY_H_ */
>>
> This patch looks rather odd, given that this is just a stub that won't be used
> before patch #20.
>
> And there, it's only used from arm64 code? So why do we need the common-code stub?

It is primarily used in patch 12, the generic kpkeys page table
allocator, so we do need a stub.

The ordering might be a little confusing indeed, but I tried to follow
the following order: 1. kpkeys/generic, 2. kpkeys/arm64, 3.
kpkeys_hardened_pgtables/generic, 4. kpkeys_hardened_pgtables/arm64.
Happy to reorder if you have other preferences.

- Kevin

