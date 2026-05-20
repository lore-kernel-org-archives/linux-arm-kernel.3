Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DE0CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 05:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qmf78RbkQo5uJ2gT+pYoQue+sGRwbO57TaSMRM12xU=; b=LIlohi/rL3nWK2/V6QJZOVdrS3
	rosgcy3m5nU0xkD0FTC9JdQK/3ozor3N6FKr8WlXew8agXIg+F/adSUJqg1hjhEQjNdYMFnoN9GRb
	EXwdgphDBHcVzi07UVe9ViOjfJV3ZX8DHJJc/r1Dr8EHvizinzXYotqC5tjdwakkTqcHnV+MNh02X
	xatBKv7R9XtyybmzzaNreqYt6meHwuY1fYU9RIh85n3GT4LNDOaHPjvoMiZtesn2gMg6dSrFI3dfh
	hZkP0t3xEFlYOh9wNBOjF66MN97uaRvJbAHOyUrhrPiwNj9OfhziR5JFLnyJmolytIWDngLhUXWD1
	cm/XOfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZdK-00000003Zvq-00OR;
	Wed, 20 May 2026 05:38:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZdG-00000003Zv8-1rVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 05:38:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 197B13590;
	Tue, 19 May 2026 22:38:04 -0700 (PDT)
Received: from [10.164.146.0] (J09HK2D2RT.blr.arm.com [10.164.146.0])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D0763F632;
	Tue, 19 May 2026 22:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779255489; bh=mVh8HT1+IbJA3i4RRUc8uxMLBmgDbM4OmSRaoPb2cVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ObLlAjYh3RLvu2xxlUUllZ73g66wjGL3BE/wJSa/k0qYxle1w9UZZHqfi+BJpjMD3
	 Fp+I7tkB2Aw1/fo2Lo9uaE1hJWcT79a3scyxkSZjWCciqNEvUO4VdDH4A/gu5QHpQD
	 sapvug2KQMu0JHmUCgnQGpQ6MGVzKdeCHoH+eYSo=
Message-ID: <a63aadf6-703a-4a67-a86a-fc6da3de117c@arm.com>
Date: Wed, 20 May 2026 11:08:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Rename ptdesc_t
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260430034933.541634-1-anshuman.khandual@arm.com>
 <afMKEgJGWZpZjZub@kernel.org> <agw_Ih69WYh7NDWZ@willie-the-truck>
 <34c31f7a-e3e5-47c1-9e41-e6e9a90e89d3@kernel.org>
 <2f60361d-43b9-4f7f-b786-7852d081f4a1@arm.com>
 <66031835-d9f9-4fcf-a720-baba1aaf45a1@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <66031835-d9f9-4fcf-a720-baba1aaf45a1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_223814_806514_C5841F0D 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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



On 20/05/26 10:56 AM, David Hildenbrand (Arm) wrote:
> On 5/20/26 04:08, Anshuman Khandual wrote:
>>
>>
>> On 19/05/26 4:32 PM, David Hildenbrand (Arm) wrote:
>>> On 5/19/26 12:44, Will Deacon wrote:
>>>>
>>>> Yeah, the 'pxx' prefix really hurts my eyes. Please use something else!
>>>
>>> Fine with me as long as we don't call it something with "pte" in it.
>>>
>>
>> Seems like there are two choices here
>>
>> (A) pxdval_t
>> (B) ptval_t which Mike had suggested earlier
>>
>> Unless there is a preference will probably go with pxdval_t
> 
> given it is ptdesc_t, ptval_t sounds better to me.
> 

Sure - ptval_t it is.


