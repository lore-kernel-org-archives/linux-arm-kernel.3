Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D410C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAnhm0Wz21UltR5SqeUz3yaC93tOi3ncUGw0CiSukn8=; b=XTfHXR01JIVgr/1J8YIoj9xQf+
	N9qRU3Nz1faBWrGWmg4dNSBjKPghFSpKgW+gIQp9FLEmS6CLOcKgK7wIWa2VD7FYmSD0i6PuSRVtx
	5JJgJ6lZFSeUMdxNfgndj6iEglfYrcjCkhNUEblcR0Bndo2yIliEKkbgm8jZ1Ncinol3RTrys2ny2
	owuawhcsst5X9XSaKxIWDlaCpTM/7uiq0wKD4/mefD1eoyUdUOk/nfehYCgYsWPidYfv9KKvpBkAM
	5IWHYKoXbZ0JdIBgV0tjdTixLQO9hADu4glCGo1OBEZ3BUs0iaqV5+Yspa/S+60bDVhbmqO+jZjlo
	mF5JSdRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUkN-000000007hR-2LxJ;
	Mon, 10 Feb 2025 14:26:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUhd-000000007BX-3pZ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:24:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 320551477;
	Mon, 10 Feb 2025 06:24:20 -0800 (PST)
Received: from [10.57.95.206] (unknown [10.57.95.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D55AD3F5A1;
	Mon, 10 Feb 2025 06:23:53 -0800 (PST)
Message-ID: <fd101c51-d3fc-4a4f-afcc-364b8d3c4a0b@arm.com>
Date: Mon, 10 Feb 2025 15:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/15] pkeys-based page table hardening
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <202502061422.517A57F8@keescook>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <202502061422.517A57F8@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_062402_043666_2440FC29 
X-CRM114-Status: GOOD (  40.09  )
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

On 06/02/2025 23:41, Kees Cook wrote:
> On Mon, Feb 03, 2025 at 10:18:24AM +0000, Kevin Brodsky wrote:
>> This is a proposal to leverage protection keys (pkeys) to harden
>> critical kernel data, by making it mostly read-only. The series includes
>> a simple framework called "kpkeys" to manipulate pkeys for in-kernel use,
>> as well as a page table hardening feature based on that framework
>> (kpkeys_hardened_pgtables). Both are implemented on arm64 as a proof of
>> concept, but they are designed to be compatible with any architecture
>> implementing pkeys.
> Does QEMU support POE? The only mention I could find is here:
> https://mail.gnu.org/archive/html/qemu-arm/2024-03/msg00486.html
> where the answer is, "no and it looks difficult". :P

Unfortunately it looks like the answer hasn't changed since last year. I
am testing this series on an Arm Fast Models platform (FVP) [1], which
does support POE. I've included instructions to get you started at the end.

>> # Threat model
>>
>> The proposed scheme aims at mitigating data-only attacks (e.g.
>> use-after-free/cross-cache attacks). In other words, it is assumed that
>> control flow is not corrupted, and that the attacker does not achieve
>> arbitrary code execution. Nothing prevents the pkey register from being
>> set to its most permissive state - the assumption is that the register
>> is only modified on legitimate code paths.
> Do you have any tests that could be added to drivers/misc/lkdtm that
> explicitly exercise the protection? That is where many hardware security
> features get tested. (i.e. a successful test will generally trigger a
> BUG_ON or similar.)

I could certainly add some tests there, but I wonder if such crash tests
provide much benefit compared to the KUnit tests (that rely on
copy_to_kernel_nofault()) in patch 15? Not crashing the kernel does mean
that many of those tests can be run in a row :)

>> The arm64 implementation should be considered a proof of concept only.
>> The enablement of POE for in-kernel use is incomplete; in particular
>> POR_EL1 (pkey register) should be reset on exception entry and restored
>> on exception return.
> As in, make sure the loaded pkey isn't leaked into an exception handler?

I wouldn't say "leaking" is the issue here, but yes conceptually
exception handlers should run with a fixed pkey configuration, not that
of the interrupted context. As Dave Hansen pointed out [2], what is even
more important is to context-switch the pkey register. A thread may be
interrupted and scheduled out while executing at a higher kpkeys level;
we want to ensure that this thread resumes execution at the same kpkeys
level, and that in the meantime we return to the standard level.

>> # Open questions
>>
>> A few aspects in this RFC that are debatable and/or worth discussing:
>>
>> - There is currently no restriction on how kpkeys levels map to pkeys
>>   permissions. A typical approach is to allocate one pkey per level and
>>   make it writable at that level only. As the number of levels
>>   increases, we may however run out of pkeys, especially on arm64 (just
>>   8 pkeys with POE). Depending on the use-cases, it may be acceptable to
>>   use the same pkey for the data associated to multiple levels.
>>
>>   Another potential concern is that a given piece of code may require
>>   write access to multiple privileged pkeys. This could be addressed by
>>   introducing a notion of hierarchy in trust levels, where Tn is able to
>>   write to memory owned by Tm if n >= m, for instance.
>>
>> - kpkeys_set_level() and kpkeys_restore_pkey_reg() are not symmetric:
>>   the former takes a kpkeys level and returns a pkey register value, to
>>   be consumed by the latter. It would be more intuitive to manipulate
>>   kpkeys levels only. However this assumes that there is a 1:1 mapping
>>   between kpkeys levels and pkey register values, while in principle
>>   the mapping is 1:n (certain pkeys may be used outside the kpkeys
>>   framework).
> Is the "levels" nature of this related to how POE behaves? It sounds
> like there can only be 1 pkey active at a time (a role), rather than
> each pkey representing access to a specific set of pages (a key in a
> keyring), where many pkeys could be active at the same time. Am I
> understanding that correctly?

Only one key is used (besides the default key) in this initial RFC.
However, the idea behind the level abstraction is indeed that (RW)
access to multiple keys may be required at the same time. In the
follow-up RFC protecting credentials, this is illustrated by the
"unrestricted" level that grants RW access to all keys. I believe this
approach is the most flexible, in that any permission mapping can be
defined for each level.

>> Any comment or feedback will be highly appreciated, be it on the
>> high-level approach or implementation choices!
> As hinted earlier with my QEMU question... what's the best way I can I
> test this myself? :)

As mentioned above I tested this series on Arm FVP. By far the easiest
way to run some custom kernel/rootfs on FVP is to use the Shrinkwrap
tool [3]. First install it following the quick start guide [4] (I would
recommend using the Docker backend if possible). Then build the firmware
stack using:

$ shrinkwrap build -o arch/v9.0.yaml ns-edk2.yaml

To make things easy, the runtime configuration can be stored in a file.
Create ~/.shrinkwrap/config/poe.yaml with the following contents:

----8<----

%YAML 1.2
---
layers:
  - arch/v9.0.yaml

run:
  rtvars:
    CMDLINE:
      type: string
      # nr_cpus=1 can be added to speed up the boot
      value: console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda rw
  params:
    -C cluster0.has_permission_overlay_s1: 1
    -C cluster1.has_permission_overlay_s1: 1

----8<----

Finally start FVP using:

$ shrinkwrap run -o poe.yaml ns-edk2.yaml -r
KERNEL=<out>/arch/arm64/boot/Image -r ROOTFS=<rootfs.img>

(Use Ctrl-] to terminate the model if needed.)

<rootfs.img> is a file containing the root filesystem (in raw format,
e.g. ext4). The kernel itself is built as usual (defconfig works just
fine), just make sure to select CONFIG_KPKEYS_HARDENED_PGTABLES to
enable the feature. You can also select
CONFIG_KPKEYS_HARDENED_PGTABLES_TEST to run the tests in patch 15.

> Thanks for working on this! Data-only attacks have been on the rise for
> a while now, and I'm excited to see some viable mitigations appearing.
> Yay!

Thank you for your interest and support, very appreciated!

- Kevin
[1]
https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/Arm%20Architecture%20FVPs
[2]
https://lore.kernel.org/linux-hardening/dcc1800c-cf0a-4d88-bc88-982f0709b382@intel.com/
[3] https://shrinkwrap.docs.arm.com/
[4] https://shrinkwrap.docs.arm.com/en/latest/userguide/quickstart.html

