Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A57C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sYY6++1ySUMgsK/ZU6SsCCt9ZpMn10vqWNb0TK9wOA=; b=UIPFqVnFqEuWPZ5zQ49nkXAW4W
	FSJZPbN4guYfRiSn/gGg2KcyXiVz6XBGg4lZbg5+oxJPxRL/T9LwZD3gUY6wCYVJbq3fJhEeFG+wv
	auU01oABoomT7ns8Ccy0QtdsMiGLLaQs0vd6CQRK2z/dNcJhJN3gDuGuzHs9fPz19nCUe3n7cyNJI
	NjX6lDsvaZJRVRPfqcHyWbYRkzcm3TG9uLuGzYhEbXmbDUiODgetH+8nUBbNrGyZwNBpW2RL0wKlC
	wAKhOB962KPcPtwhpYOxcxAFyL18tLw6p2J8LNn4YBp5Xwb8H+od9BV/e0/KhOLOwSASkIgtcnbjH
	9Tcrk3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWjJ-0000000DQLc-24Mb;
	Mon, 24 Feb 2025 11:34:33 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWVJ-0000000DKE6-2BVi;
	Mon, 24 Feb 2025 11:20:06 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1dPS72wNz9sSn;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIiDK1YPjhuf; Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1dPS5txxz9sSm;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B3BD38B765;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tnzzpVojmwHn; Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63CE98B763;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Message-ID: <43937a0a-679e-47e8-a4c5-d20759ef53c8@csgroup.eu>
Date: Mon, 24 Feb 2025 12:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
 <e7f80acd-623b-4fda-9292-6f8344d0f185@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <e7f80acd-623b-4fda-9292-6f8344d0f185@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032005_723534_553ED0B7 
X-CRM114-Status: GOOD (  18.36  )
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



Le 14/02/2025 à 08:17, Anshuman Khandual a écrit :
> On 2/13/25 13:08, Christophe Leroy wrote:
>>
>>
>> Le 13/02/2025 à 05:09, Anshuman Khandual a écrit :
>>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>>> is confusing as they sound very similar and does not differentiate between
>>> platform's feature subscription and feature enablement for ptdump. Rename
>>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>>> readability.
>>
>> For me GENERIC_PTDUMP is more explicit and similar to GENERIC_IOMAP or GENERIC_IOREMAP or GENERIC_GETTIMEOFDAY: The arch provides the necessary helpers to use the generic implementation.
> 
> I do realize that GENERIC_ is another method for achieving shared
> feature across multiple platforms via providing necessary helpers.
> But I guess there might be a difference - it might not have other
> similar but separate dependent configs ?
> 
>>
>> For me ARCH_HAS_PTDUMP just mean't that an architecture implements PTDUMP, it doesn't mean it does it by using the generic infrastructure.
> 
> ARCH_HAS_XXX indicates that an architecture subscribes to a generic
> feature XXX, by implementing all necessary helpers. But the feature
> in itself is a generic and a shared one.

I'm not sure about your interpretation.

For instance CONFIG_ARCH_HAS_ILOG2_U32 means that a plateform provides 
its own implementation. When this is _NOT_ defined, then the generic 
implementation is used instead.

> 
> If the platform were to implement a feature on its own without any
> generic component, it could do that via a separate platform specific
> config without requiring ARCH_HAS_XXX based subscription indication.

Not sure. Usually when a plateform needs something generic it subscribes 
to something like CONFIG_ARCH_WANT_GENERAL_HUGETLB


> 
>>
>> For instance, arm32 implements PTDUMP but without using the generic one so I would say that arm32 has PTDUMP and expect it to select ARCH_HAS_PTDUMP
> 
> Actually it does not need to select ARCH_HAS_PTDUMP, as it does not
> subscribe into generic PTDUMP. Let's see PTDUMP configs on arm (32)
> 
> ARM_PTDUMP_CORE
> ARM_PTDUMP_DEBUGFS	--> select ARM_PTDUMP_CORE
> ARM_DEBUG_WX 		--> select ARM_PTDUMP_CORE
> 
> The platform has a self contained PTDUMP implementation which does
> not depend on generic PTDUMP at all. Hence all these ptdump configs
> are marked as ARM_ etc as they are platform specific.

That's the reason why I believe the wording CONFIG_ARCH_HAS_SOMETHING is 
not appropriate.

Christophe

