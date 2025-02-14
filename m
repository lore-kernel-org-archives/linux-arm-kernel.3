Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5liOe1ZfB0Q57IX2e/O41rSLKkELnsqj5ECCxID4SXY=; b=pkAiv5mWzO2NWYrXRHAvWxoW2E
	dBor+symRf0JbRvmQVn9LzWvkNRNcwla4nrlwSbsIuhm+7u8FB9MxL1BKEtDoMQBkqF7QJyUfQxsP
	qWkzUrpFhe20+kJ5Yk0QCDG+A+WGGALcIzQBv0k3ObXqWD8CRS6VTO8rjmHX6AZSLYnuX0cEHZyJH
	MpQMNJ4mhLhkJUqCiMuyjH0Wji5n5t+N3AhrcZKOSlrvikU6I8EnQHgsRctEWzhJuQgNw0P3i8f1e
	nlm42n5p9HNJIkNimvV7a7qC3QPWziVNTLZ92+Mbixt532WxIlYWIA3/mnTxz7SvB2nvTCJWX7Ma/
	tRIx6eMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipyk-0000000DwDu-3k9h;
	Fri, 14 Feb 2025 07:19:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipxI-0000000DvwY-3F4X;
	Fri, 14 Feb 2025 07:17:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D429D113E;
	Thu, 13 Feb 2025 23:18:03 -0800 (PST)
Received: from [10.163.37.128] (unknown [10.163.37.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8453F58B;
	Thu, 13 Feb 2025 23:17:34 -0800 (PST)
Message-ID: <e7f80acd-623b-4fda-9292-6f8344d0f185@arm.com>
Date: Fri, 14 Feb 2025 12:47:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
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
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_231744_849445_F94360EF 
X-CRM114-Status: GOOD (  11.69  )
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

On 2/13/25 13:08, Christophe Leroy wrote:
> 
> 
> Le 13/02/2025 à 05:09, Anshuman Khandual a écrit :
>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>> is confusing as they sound very similar and does not differentiate between
>> platform's feature subscription and feature enablement for ptdump. Rename
>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>> readability.
> 
> For me GENERIC_PTDUMP is more explicit and similar to GENERIC_IOMAP or GENERIC_IOREMAP or GENERIC_GETTIMEOFDAY: The arch provides the necessary helpers to use the generic implementation.

I do realize that GENERIC_ is another method for achieving shared
feature across multiple platforms via providing necessary helpers.
But I guess there might be a difference - it might not have other
similar but separate dependent configs ?

> 
> For me ARCH_HAS_PTDUMP just mean't that an architecture implements PTDUMP, it doesn't mean it does it by using the generic infrastructure.

ARCH_HAS_XXX indicates that an architecture subscribes to a generic
feature XXX, by implementing all necessary helpers. But the feature
in itself is a generic and a shared one.

If the platform were to implement a feature on its own without any
generic component, it could do that via a separate platform specific
config without requiring ARCH_HAS_XXX based subscription indication.

> 
> For instance, arm32 implements PTDUMP but without using the generic one so I would say that arm32 has PTDUMP and expect it to select ARCH_HAS_PTDUMP

Actually it does not need to select ARCH_HAS_PTDUMP, as it does not
subscribe into generic PTDUMP. Let's see PTDUMP configs on arm (32)

ARM_PTDUMP_CORE
ARM_PTDUMP_DEBUGFS	--> select ARM_PTDUMP_CORE
ARM_DEBUG_WX 		--> select ARM_PTDUMP_CORE

The platform has a self contained PTDUMP implementation which does
not depend on generic PTDUMP at all. Hence all these ptdump configs
are marked as ARM_ etc as they are platform specific.

