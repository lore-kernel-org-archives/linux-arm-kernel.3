Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CF5C9EC7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImdPB4wdifhG8v41csPVSmJFFuClIe8Nddj8dKpX4Pc=; b=v/Agz1pRReyFZP3RNo+3SIAHbn
	mf17FR2OLEvCVXdI4gxMPp0l7kFgh+RkzxG7Z9wAOfC2jBz4ps0joL16ziX4LlfcKHcUUBAz8YtjJ
	38TQH67B+XZ4qyaHcqkSH902AKgs1H/uAtCTbdUe6m1cmx1c0TbofKQV4YOdLjyzNZu5xGe3SlYzS
	wdvXCmoDMbj0L+tw3S5lpeY1t5Euo+wjdw9iQrlyBv9CoIbWe65zn/tn9wU6rF74AYBS+ZRHQw7TS
	RuAFsfAqtZsn62lB2cq6f2fVZGB0d36z4yqIuOAkavV6V3LmgzLSUDvJ2n0g8fJXejB5XijT+1rjd
	mjvQ8+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGas-00000005ITt-1vvM;
	Mon, 12 Jan 2026 12:00:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGaq-00000005ITD-0Q8s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:00:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1001497;
	Mon, 12 Jan 2026 04:00:12 -0800 (PST)
Received: from [10.57.95.123] (unknown [10.57.95.123])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A18983F59E;
	Mon, 12 Jan 2026 04:00:17 -0800 (PST)
Message-ID: <dc9dec5c-f50d-4283-8a4b-609927f8a2bb@arm.com>
Date: Mon, 12 Jan 2026 12:00:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/13] arm64: mm: More flags for __flush_tlb_range()
Content-Language: en-GB
To: Linu Cherian <linu.cherian@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-12-ryan.roberts@arm.com>
 <aV3RMohRCvzWnuwI@a079125.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aV3RMohRCvzWnuwI@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_040020_180556_C77FFD0B 
X-CRM114-Status: GOOD (  12.93  )
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

On 07/01/2026 03:21, Linu Cherian wrote:
> Ryan,
> 
> On Tue, Dec 16, 2025 at 02:45:56PM +0000, Ryan Roberts wrote:
>> Refactor function variants with "_nosync", "_local" and "_nonotify" into
>> a single __always_inline implementation that takes flags and rely on
>> constant folding to select the parts that are actually needed at any
>> given callsite, based on the provided flags.
>>
>> Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
>> to provide the strongest semantics (i.e. evict from walk cache,
>> broadcast, synchronise and notify). Each flag reduces the strength in
>> some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
>> complement the existing TLBF_NOWALKCACHE.
> 
> It would be nice to have some notes added on the below for better clarity 
> * What a walk cache is and why we bother about them ?
> * Why and how should we invalidate the walk caches ?

There is a large comment block already in tlbflush.h which talks about which
operations affect the walk-cache and which don't. Although it never defines the
walk-cache; I'll add something vague there, although I don't want to be too
specific as it's a uarch thing really.

Thanks,
Ryan

> 
> --
> Linu Cherian.


