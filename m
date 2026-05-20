Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6690CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 02:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1LF0kWq5WSxg3nge1a/ZkWXY/l82Ad7UOG/NwgiypM=; b=HnnzToNzQKv92/k+gD8WCBYdYP
	SywqBNTqYQPW7+cwmuWbD1o9RAV44vt+gZ82yvzGxtD+t+Y484YRAIODjZdrIx+Vc+TC8qBHSi6fB
	sGnPSuij2Bgq9J4G8gii2QdxIvvRr6prr0UEaXBKGmEKaUru/KcEqK/4a2JeP6UMyv+e7CA6ZziCh
	Rpt2Nmmi1ohSFDaH8znEO5+ODfz3zZoyMsOVFfyrDlgONc6JQb/vZbw0jNhwQYHi6hEmjW/FdAiym
	6QYpDElu2uBqxpHhkYxlJkS0MmqwZ7Je9OAUT392eA6KYcEqYh/1kIaGfawIuBlf4ov+tE0+TQ1vg
	rewSYbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWMn-00000003HNp-2cvR;
	Wed, 20 May 2026 02:09:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWMl-00000003HN5-1hug
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 02:09:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73129355D;
	Tue, 19 May 2026 19:08:50 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63B9C3F7B4;
	Tue, 19 May 2026 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779242935; bh=t/zcxRnmWow/5jiKAHWJPO/z52Ho0PtKFjig7sSxFyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fCQnfIwcTX0WscYmYVgcPeWcYVVdX9wlLPvNH72MeszU1VayFwTUD2vFsJ6PYR8Si
	 SYKjKQx1RjR3VrZs5CR+egCRla1umReo9RHvaigqPs18mXW1O4foKIltE/GDDULh6I
	 LqPVZT7yDFT5BQ6d7MCuTPvtXW/9KzI6D1i/sf+g=
Message-ID: <2f60361d-43b9-4f7f-b786-7852d081f4a1@arm.com>
Date: Wed, 20 May 2026 07:38:50 +0530
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
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <34c31f7a-e3e5-47c1-9e41-e6e9a90e89d3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_190859_574543_97C604D2 
X-CRM114-Status: GOOD (  11.01  )
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



On 19/05/26 4:32 PM, David Hildenbrand (Arm) wrote:
> On 5/19/26 12:44, Will Deacon wrote:
>> On Thu, Apr 30, 2026 at 09:51:46AM +0200, Mike Rapoport wrote:
>>> Hi Anshuman,
>>>
>>> On Thu, Apr 30, 2026 at 04:49:33AM +0100, Anshuman Khandual wrote:
>>>> ptdesc_t sounds very similar to the core MM struct ptdesc which is actually
>>>> the memory descriptor for page table allocations. Hence rename this typedef
>>>> element as pxxval_t instead for better clarity and separation.
>>>
>>> Maybe we should keep the "pt" prefix and make it "ptval_t"?
>>
>> Yeah, the 'pxx' prefix really hurts my eyes. Please use something else!
> 
> Fine with me as long as we don't call it something with "pte" in it.
> 

Seems like there are two choices here

(A) pxdval_t
(B) ptval_t which Mike had suggested earlier

Unless there is a preference will probably go with pxdval_t

