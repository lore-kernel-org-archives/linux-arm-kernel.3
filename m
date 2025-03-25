Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE3AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mL3bac11gJdmSQ9jSxEhzOMHHT6cgkydJIwgZXReIJo=; b=3ThKepR7BI5YyTOgwSJ22iOC6X
	lgaqT11Q6MKTV3kFjRJKGqayUxTJXgqjrrfLiUjuFK8UQ5mkSvaNnS0Tp0dpTFrn3TU8FwpgWDb2z
	Ug607H45wYW8HYPsbrPBJaM7EB/HJWT0zPsNhV1Q/P89w14xCt4LWYXSYlPus0lz1TYjhSbk3yFTu
	4i5uNYUugrwfzBZ7sEfhOId4144D/hzmk5APAU4xOC0zcPMBeiL9S0nAg4d3+4ejZMd2f4JMeaoyN
	lZYF3Ba9n6go7/LNU86eOT7/4REgyt7s99splDIr0wARqtolv8eDC1q/SPpknOS8WDMK0khvW6bFp
	P+W9Fu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7q6-00000006aSX-2nwL;
	Tue, 25 Mar 2025 17:13:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7oN-00000006aJE-01jZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 17:11:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93CEE1756;
	Tue, 25 Mar 2025 10:11:37 -0700 (PDT)
Received: from [10.57.41.156] (unknown [10.57.41.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 940363F58B;
	Tue, 25 Mar 2025 10:11:26 -0700 (PDT)
Message-ID: <bcaa98c0-4218-470d-981d-9ab0894d3b1b@arm.com>
Date: Tue, 25 Mar 2025 18:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/15] pkeys-based page table hardening
To: Maxwell Bland <mbland@motorola.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <a32cjyekuecoowzbitc2xykilvpu6l3jjtityp7x5hw7xbiysp@5l2lptwmqiug>
 <802963a0-32bd-49e8-82b1-34443acdd5ae@arm.com>
 <epnxrdkidbrjyjzapms7dfsvjcc7ewewjue7khbuxhresy5x5n@hyhokacdi2yg>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <epnxrdkidbrjyjzapms7dfsvjcc7ewewjue7khbuxhresy5x5n@hyhokacdi2yg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_101135_142130_5BF65A78 
X-CRM114-Status: GOOD (  46.18  )
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

On 19/03/2025 22:54, Maxwell Bland wrote:
> [...]
>
> Onto the solution. In a pure-immutability approach, I ended up creating
> some definitions regarding what an "expected" virtual-to-physical
> mapping of kernel memory or change in page permissions is (my solution
> was to treat init_mm as a ground truth structure which is only RW under
> a more refined set of constraints on mapping updates and permission set
> updates), for example,
>
> if (get_tag(cur_pte & EL1_PADDR_MASK) == SECCOMP_PAGE) {
> // run BPF re-verifier to avoid the Qualys 2021 CVE PoC magic
>
> or forcing PXN for everything always unless some other check says we
> absolutely have to make this PX:
>
> if (!cur_pte && new_pte) {
>   if (!(new_pte & pxn_bit)) {
>     new_pte |= pxn_bit; 
>
> And then a bunch of additional infrastructure to define what a "safe
> mapping of physical memory looks like", which introduces its own set of
> problems for defining how/where vmalloc allocates from, physical address
> layout randomization, ...
>
> Such an explication of the expected possible modifications to PTEs may
> be needed? I don't understand whether just adding guard() around set_pte
> helps this case.

If I understood correctly the case you're referring to, the simple
answer is that it doesn't. If some driver explicitly updates page
tables, and then some exploit hijacks those pgtable updates, then kpkeys
won't help at all. I see two separate problems here: ensuring that the
appropriate interface is used to write to pgtables (or other objects),
and then constraining which pgtables exactly a certain context can
manipulate via this interface. kpkeys addresses the first problem, which
you could say is a low-hanging fruit. The second problem clearly needs
addressing for a strong protection of page tables, but I don't think
kpkeys can directly help with that.

> [...]
>
>>> Where overwriting f_op is a "classic" bypass of protection systems like
>>> this one.
>> Indeed, this has been pointed out to me on a few occasions. On that note
>> I should reference the follow-up series that aims at protecting struct
>> cred [1].
>>
>> Using kpkeys to ensure that the task->cred pointer itself is mostly
>> read-only is not straightforward, because there is just too much
>> existing code that directly writes to other fields in task_struct -
>> meaning we can't simply make the whole task_struct mostly read-only.
>> What could be done is to split out the cred fields in a separate
>> kpkeys-protected page, and link that page from task_struct. There is a
>> clear overhead associated with this approach though, and maybe more
>> importantly we have just displaced the issue as the pointer to that
>> protected page remains writeable... I'm not sure how much a page-based
>> technique like pkeys can help here.
> __randomize_layout accomplished some of what is necessary here, while
> accommodating contemporary hardware limitations, albeit to a finer
> granularity and lesser degree. I am also not sure how well it works on
> production systems (yet! It is on my TODO list in the short term), or
> how much protection it really implies for an adversary with a "read
> gadget" that can determine where to write (either from associated asm or
> from the struct itself).
>
> But...
>
> (1) After thinking about this for a few hours, __randomize_layout implies
> something valuable: under circumstances where this is supported, because
> we assume the struct's layout itself is modifable, it becomes possible
> to introduce a canary value _not_ for the modifiable portions, but just
> for the non-modifiable portions, store this canary value in a strictly
> read-only region of memory that also tracks pointers to the structure,
> and ensure uses of the non-modifiable fields must always leverage the
> canary value stored in this secondary region.

I don't think this can be enforced with pkeys, since the overall struct
would have to remain RW. But I'm not sure I completely understand how
that scheme would work overall, or how __randomize_layout is a
prerequisite for it.

> [...]
>
> It may be possible to write a plugin modification to
>
> https://github.com/gcc-mirror/gcc/blob/12b2c414b6d0e0d1b3d328b58d654c19c30bee8c/gcc/config/arm/aarch-bti-insert.cc
>
> To also inject the POE/register set instructions conditioned upon the an
> expected privilege (kpkeys) level of the executing function.
>
> Instead of adding code to set the privilege state via a specialized
> callgate function, having this function's call explicitly tied into the
> GCC CFI instrumentation pass. Determination of the specific "key level",
> i.e. KPKEYS_LVL_PGTABLES, could likely be determined by the file
> name/path via the compiler, or many other clever mechanisms, potentially
> with support for exceptions via function attribute tags.

Right I'm with you now. This is actually something we considered, but
I'm not sure it really helps all that much. Adding a guard object to a
function is basically the same amount of churn as marking that function
with an attribute, except it doesn't require compiler support. It would
get more useful if you wanted all functions in a file to switch kpkeys
level (using a compiler flag), but for the purpose of making certain
data mostly read-only, I doubt you actually want that - the granularity
is just too coarse.

A different angle would be use an attribute to mark struct members,
rather than functions. That would instruct the compiler to switch kpkeys
level whenever that member is written (and only then). You would
probably want to forbid taking the address of the member too, as the
compiler can't easily track that. That said this doesn't solve the
bigger issue of existing code expecting to be able to write to other
members in the struct. It most likely works only if the kpkeys switch is
done when writing to any member of the struct (which may get very
expensive).

> [...]
> Noticed as well, just now, the reliance on the static_key for branch
> unlikely ... the following data structure (at the end of this email) may
> be of interest as an FYI ... it can be used to track whether the kernel
> self patching API is only being used to patch expected locations.
>
> I use this right now with additional checks that the instruction being
> written for the indirect branch matches the expected offset.

Are there exploits out there corrupting the address of a static branch?
This seems difficult to me in practice because the __jump_table section
where the addresses of instructions to be patched are stored is marked
__ro_after_init.

- Kevin

