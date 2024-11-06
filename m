Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48884D44D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+z6a7MMcQZtbFKBYAUv1zKEi9fXON3uYimVaAWMw+g=; b=SpqGK6lPu6K1hVlsuq1584aamv
	laXukbRpxrIkpD3sNZYbVqb/X6UmWGazuCjw7LjWQWnYDHAeij4Ciqixhd0pSvody23BafgLezSBU
	FWuzRC1TKbaeDstAQW7c69xiNhyy5ZRNuyX96oDE4efLbTtMELhqXOR8TG/SuaDXa5jcFlJPqYvba
	Ejv1UitCRoF/ruBBPH/486Zl8gucxJcbGP23ZJ9ucIxFWzp9q+VLpHg1mC43nN2mBoJoXdAQuCFFg
	t0Dnx9CEK3RHbKKtq36vWO6gIgwE07M5NvCKDPtuKILF1YYCqI5fN0vWsxinqP7tdCQXJovJfz3mO
	zrwj88lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fAl-00000003CIZ-0EWD;
	Wed, 06 Nov 2024 12:30:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eMi-00000002wnY-2SDe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:38:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11BCD1063;
	Wed,  6 Nov 2024 03:38:52 -0800 (PST)
Received: from [10.57.88.115] (unknown [10.57.88.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8423F6A8;
	Wed,  6 Nov 2024 03:38:19 -0800 (PST)
Message-ID: <083d9e98-b6b8-4702-a700-24aea95cef9e@arm.com>
Date: Wed, 6 Nov 2024 11:37:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <ZyPxhF34JjT3Ky9K@arm.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZyPxhF34JjT3Ky9K@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_033824_756600_0814969D 
X-CRM114-Status: GOOD (  35.74  )
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

On 31/10/2024 21:07, Catalin Marinas wrote:
> Hi Ryan,
> 
> On Mon, Oct 14, 2024 at 11:55:11AM +0100, Ryan Roberts wrote:
>> This RFC series implements support for boot-time page size selection within the
>> arm64 kernel. arm64 supports 3 base page sizes (4K, 16K, 64K), but to date, page
>> size has been selected at compile-time, meaning the size is baked into a given
>> kernel image. As use of larger-than-4K page sizes become more prevalent this
>> starts to present a problem for distributions. Boot-time page size selection
>> enables the creation of a single kernel image, which can be told which page size
>> to use on the kernel command line.
> 
> That's great work, something I wasn't expecting to even build, let alone
> run ;). 

Cheers!

> I only looked briefly through the patches, there's probably room
> for optimisation of micro-benchmarks like fork(), maybe using something
> like runtime constants. 

Yes I suspect there is room for some optimization. Although note I already tried
using alternatives patching but for the fork() microbenchmark this performed
worse than the approach I ended up taking of just loading a global variable. I
think this was likely due to code layout changes due to all the extra
branches/nops - fork has been very sensitive to code layout changes in the past.

> The advantage for deployment and easy testing of
> different configurations is pretty clear (distros mainly, not sure how
> relevant it is for Android if apps can't move beyond 4K pages).
> 
> However, as a maintainer, my main concern is having to chase build
> failures in obscure drivers that have not been tested/developed on
> arm64. If people primarily test on x86, they wouldn't notice that
> PAGE_SIZE/PAGE_SHIFT are no longer constants. Not looking forward to
> trying to sort out allmodconfig builds every kernel release, especially
> if they turn up in subsystems I have no clue about (like most stuff
> outside arch/arm64).

Yes, I understand that concern.

> 
> So, first of all, I'd like to understand the overall maintainability
> impact better. I assume you tested mostly defconfig. If you run an
> allmodconfig build with make -k, how many build failures do you get with
> this patchset? Similarly for some distro configs.

I've roughly done:

    make alldefconfig &&
        ./scripts/config --enable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE &&
	make -s -j`nproc` -k &> allmodconfig.log

Then parsed the log for issues. Unfortunately the errors are very chatty and it
is difficult to perfectly extract stats.

If I search for r'(\S+\.[ch]):.*error:', that is optimistic because PAGE_SIZE
being non-const gets the ultimate blame for most things, but I'm interested in
the call sites. Number of affected files using this approach: 111.

If I just blindly search for all files, r'(\S+\.[ch]):', that is pessimistic
because when the issue is in a header, the full include chain is spat out.
Number of affected files using this approach: 1807.

If I just search for C files, r'(\S+\.[c]):', (all issues in headers terminate
in a C file) that is also pessimistic because the same single header issue is
reported for every C file it is included in. Number of affected files using this
approach: 1369.

In the end, I decided to go for r'(\S+\.[ch]):.*(error|note):', which is any
files described as having an error or being the callsite of the thing with the
error. I think this is likely most accurate from eyeballing the log:

|            |     C&H files | percentage of |
| directory  |      w/ error | all C&H files |
|------------|---------------|---------------|
| arch/arm64 |             7 |          1.3% |
| drivers    |           127 |          0.4% |
| fs         |            25 |          1.1% |
| include    |            27 |          0.4% |
| init       |             1 |          8.3% |
| kernel     |             7 |          1.3% |
| lib        |             1 |          0.2% |
| mm         |             6 |          3.2% |
| net        |             7 |          0.4% |
| security   |             2 |          0.8% |
| sound      |            21 |          0.8% |
|------------|---------------|---------------|
| TOTAL      |           231 |          0.4% |
|------------|---------------|---------------|

I'm not sure how best to evaluate if this is a large or small number though! For
comparison, the RFC modified 172 files.

> 
> Do we have any better way to detect this other than actual compilation
> on arm64? Can we hack something around COMPILE_TEST like redefine
> PAGE_SIZE (for modules only) to a variable so that we have a better
> chance of detecting build failures when modules are only tested on other
> architectures?

I can certainly look into this. But if the concern is that drivers are not being
compiled against arm64, what is the likelyhood of them being compiled against
COMPILE_TEST?

> 
> At the moment, I'm not entirely convinced of the benefits vs. long term
> maintainability. Even if we don't end up merging the dynamic PAGE_SIZE
> support, parts of this series are needed for supporting 128-bit ptes on
> arm64, hopefully dynamically as well.

Agreed.

Thanks,
Ryan

> 
> Thanks.
> 


