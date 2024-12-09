Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9A7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VexgucUkKC3dW+9+1fSj/F49YE0/r3u0mmMQ3poEJac=; b=Swp6dpemLTxQ6YZrsrjlzqnd2o
	NjLoD25jnNtlx7SDPsAvrMI46N+SSFAmAuYrs9vqWVOn/Iy96tbL37wNEWWkkkHfiAOJB6F+tAWjy
	J0ETwlqOpTKJYW9I04ctiEi4PVW9FxCfurN29ggzKqSHVewV2bmuhoRGhDs/Ne2w2VzavdNWLuBkO
	701+IBrgjGSJNgUAaOAemI6s3MbqsjfV6bM6CO0ZDOAcYJ8lNG3iLyQ0l8f/o6oTRPx/ORlNVHqgI
	Wm0P6wwHwzga0N/P92MSK2Fa9o6gi015mG8DfHddGVx9jaQgzsxEBPG5KPxzqXFP3F+162+IZJpiZ
	IIp9d56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdZQ-00000007uRA-2fkw;
	Mon, 09 Dec 2024 13:13:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdKE-00000007p9k-0LN5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:57:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6A21113E;
	Mon,  9 Dec 2024 04:57:47 -0800 (PST)
Received: from [10.57.68.240] (unknown [10.57.68.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A3DF3F720;
	Mon,  9 Dec 2024 04:57:12 -0800 (PST)
Message-ID: <8fc285a3-92af-47e1-a405-0adf573c57aa@arm.com>
Date: Mon, 9 Dec 2024 13:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] pkeys-based page table hardening
To: Jann Horn <jannh@google.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 aruna.ramakrishna@oracle.com, broonie@kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, jeffxu@chromium.org, joey.gouly@arm.com,
 kees@kernel.org, maz@kernel.org, pierre.langlois@arm.com,
 qperret@google.com, ryan.roberts@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <CAG48ez1b8BBquEB1BJEg+KsPdPyZLPuD7uToUH3ZdN8F0r+U9w@mail.gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <CAG48ez1b8BBquEB1BJEg+KsPdPyZLPuD7uToUH3ZdN8F0r+U9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_045722_209464_C457BE90 
X-CRM114-Status: GOOD (  20.00  )
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

On 06/12/2024 20:14, Jann Horn wrote:
> On Fri, Dec 6, 2024 at 11:13 AM Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>> [...]
>>
>> Page tables were chosen as they are a popular (and critical) target for
>> attacks, but there are of course many others - this is only a starting
>> point (see section "Further use-cases"). It has become more and more
>> common for accesses to such target data to be mediated by a hypervisor
>> in vendor kernels; the hope is that kpkeys can provide much of that
>> protection in a simpler manner. No benchmarking has been performed at
>> this stage, but the runtime overhead should also be lower (though likely
>> not negligible).
> Yeah, it isn't great that vendor kernels contain such invasive changes...
>
> I guess one difference between this approach and a hypervisor-based
> approach is that a hypervisor that uses a second layer of page tables
> can also prevent access through aliasing mappings, while pkeys only
> prevent access through a specific mapping? (Like if an attacker
> managed to add a page that is mapped into userspace to a page
> allocator freelist, allocate this page as a page table, and use the
> userspace mapping to write into this page table. But I guess whether
> that is an issue depends on the threat model.)

Yes, that's correct. If an attacker is able to modify page tables then
kpkeys are easily defeated. (kpkeys_hardened_pgtables does mitigate
precisely that, though.) On the topic of aliases, it's worth noting that
this isn't an issue with page table pages (only the linear mapping is
used), but if we wanted to assigning a pkey to vmalloc areas we'd also
have to amend the linear mapping.

>> [...]
>>
>> # Threat model
>>
>> The proposed scheme aims at mitigating data-only attacks (e.g.
>> use-after-free/cross-cache attacks). In other words, it is assumed that
>> control flow is not corrupted, and that the attacker does not achieve
>> arbitrary code execution. Nothing prevents the pkey register from being
>> set to its most permissive state - the assumption is that the register
>> is only modified on legitimate code paths.
> Is the threat model that the attacker has already achieved full
> read/write access to unprotected kernel data and should be stopped
> from gaining write access to protected data? Or is the threat model
> that the attacker has achieved some limited corruption, and this
> series is intended to make it harder to either gain write access to
> protected data or achieve full read/write access to unprotected data?

The assumption is that the attacker has acquired a write primitive that
could potentially allow corrupting any kernel data. The objective is to
make it harder to exploit that primitive by making critical data immune
to it. Nothing stops the attacker to turn to another (unprotected)
target, but this is no different from hypervisor-based protection - the
hope is that removing the low-hanging fruits makes it too difficult to
build a complete exploit chain.

- Kevin

