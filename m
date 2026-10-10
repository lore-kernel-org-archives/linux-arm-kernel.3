Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6710CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4y04JzxldO260/+1JjQhaM7OPWp1qTRLmXAqMl3EHU=; b=PJI5c5HZeX1PpoylhqaPE6DWMb
	OY0TEB4dnpHYe+NfCF5XUijI8rqHnH4zfEGtR27H9MSTvxugEZefg7url7mxhRQ4yVmgBwbZE2eLM
	GP9Njbt6x5KCEve68QxTApCWHh/8j2cRfusf47PUKoyejeKQD5IXw296NzHAefRI23EiTokM0NScs
	IE1gyE6mfDmXTFeadIQF3wp98B2yn6G32RNlnsexOsIFO1PQfYskgJq2zvIWFav7aLaQ40hOXTkWn
	XTjqEV004iMjNHibkqTPLSnmtOJF1W4lTxIJOI3iT0yFu3doSjqr7Tk5z2SynjGGRr5Uxo9L755q1
	gKlRUQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTyU-00000007osd-2mGK;
	Sat, 10 Oct 2026 10:06:42 +0000
Received: from [117.135.210.9] (helo=m16.mail.126.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTyQ-00000007os1-0t7Y;
	Sat, 10 Oct 2026 10:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:To:
	Content-Type; bh=A4y04JzxldO260/+1JjQhaM7OPWp1qTRLmXAqMl3EHU=;
	b=d48qZgmD7kERcBnmME6e5d/+8X02i3aRnMPZ51by6aY+s0Mvxn6UmORGNrc14P
	GAs5qG3Cxdpp6rmfM/ardD0xQCs5jKmZ0tHvp4pcDtdiSY6HGwsdQxO5Q6OoPBVc
	qqu8kyMskMLqVaioNR3Z/WkUbk96NKBcA0a25t7oXN4SY=
Message-ID: <e550befe-8399-4349-8b67-6a01367db165@126.com>
Date: Sat, 10 Oct 2026 18:04:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Song Chen <chensong_2000@126.com>
Subject: Re: [RFC PATCH v2 0/3] btrfs: add error injection support for
 checksum verification
To: dsterba@suse.cz
Cc: arnd@arndb.de, kees@kernel.org, clm@fb.com, dsterba@suse.com,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 guoren@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, gor@linux.ibm.com,
 borntraeger@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260724021229.47302-1-chensong_2000@126.com>
 <20260907161330.GX9053@suse.cz>
Content-Language: en-US
In-Reply-To: <20260907161330.GX9053@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PikvCgDnz_jADcpqUfIkBQ--.28557S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw47Cw4xCFWkWw15Kr1kAFb_yoW8trW5pr
	W8C3s3WrWrJrWxArsaya4Fv34Fkrs5W34UJFnrG34Ik3s3Za4kta1kK348u3W7ur48Gw17
	Z3WDKr4kWr1UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDvtAUUUUU=
X-CM-SenderInfo: xfkh02prqjsjqqqqqiyswou0bp/xtbBsgLAQGrKDcJ3nQAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_030639_386329_B16DF63A 
X-CRM114-Status: GOOD (  17.89  )
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

Hi David,

If no maintainer else sees it and comments, i'm going to send a new 
patch, only keep btrfs part and withdraw rest, and take care of sashiko 
comments as well.

Please still find it, many thanks.

Best regards,

Song



在 2026/9/8 00:13, David Sterba 写道:
> On Fri, Jul 24, 2026 at 10:12:26AM +0800, Song Chen wrote:
>> This patchset adds fault injection support for btrfs_data_csum_ok,
>> enabling controlled simulation of checksum mismatches to test btrfs
>> silent data corruption detection and reporting paths.
>>
>> The first patch extends the error injection framework with a new type,
>> EI_ETYPE_FALSE, which allows bool-returning functions to be overridden
>> with a false return value directly.
>>
>> The second patch marks btrfs_data_csum_ok with ALLOW_ERROR_INJECTION
>> using this new type.
>>
>> The third patch adds a parent field to fei_attr to allow fault injection
>> on a function only when called from a specific parent function.
>>
>> Song Chen (3):
>>    error-injection: Introduce EI_ETYPE_FALSE for fail_function
>>    btrfs: Allow error injection on btrfs_data_csum_ok
>>    error-injection: Introduce parent in fei_attr
> 
> I'm going through my mailbox and found this. No objections to add the
> injection point to btrfs, but the rest is generic fault injection code
> so I can't take it via btrfs tree without acks.
> 
> There are some sashiko comments (as replies in the thread [1]) and there
> have been some changes to btrfs code too so the patchset needs a
> refresh.
> 
> I see maintainers in CC, if somebody could please let us know how to
> proceed.
> 
> [1] https://lore.kernel.org/all/20260724021229.47302-1-chensong_2000@126.com/
> 
>>   arch/arm/lib/error-inject.c           |  6 ++
>>   arch/arm64/lib/error-inject.c         |  6 ++
>>   arch/csky/lib/error-inject.c          |  6 ++
>>   arch/loongarch/lib/error-inject.c     |  6 ++
>>   arch/powerpc/lib/error-inject.c       |  6 ++
>>   arch/riscv/lib/error-inject.c         |  6 ++
>>   arch/s390/lib/error-inject.c          |  6 ++
>>   arch/x86/lib/error-inject.c           |  6 ++
>>   fs/btrfs/inode.c                      |  1 +
>>   include/asm-generic/error-injection.h |  6 ++
>>   kernel/fail_function.c                | 98 ++++++++++++++++++++++++++-
>>   11 files changed, 152 insertions(+), 1 deletion(-)
> 



