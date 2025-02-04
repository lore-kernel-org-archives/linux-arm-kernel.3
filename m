Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E86BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRjueJWYfJiDD8c03kzhgj8zaUZ3G8sHaPwtqLw82Ao=; b=scCOvlbIzCrF1p0q2zUSBq9MVH
	eZwTtiReobcPR1DvDi0CyiZXwnBshGZD14JTHToenMQVkhBvx8Kv9o7fpUEd+i1UvBAuckbELt/AP
	fBSFvND29tBBuzHyZsod6zx0naOUvE6mwGj5/AP/5J+l3UGS3IxCZZOO0jAzjO/j1C4iGDYpoMBxe
	YreUEVgLuQdTrYmnGZzkq5SWaUbFzoEjqYPmQY2RgF6oKEODeeWW2NEZ9MgeurVdnl3i5lO/Cciax
	M6PA5K+C6VnN6AeVojIrAPHrZC/N03Yb8KMsgalTiFXrvmk02DIF1c2T24VIZf6brVgTIDOqTyXtv
	wZzrsxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKIG-00000000idY-3kUr;
	Tue, 04 Feb 2025 14:52:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKFd-00000000iEr-0R8B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 339C65C6967;
	Tue,  4 Feb 2025 14:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726C7C4CEDF;
	Tue,  4 Feb 2025 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738680607;
	bh=6oUouKp7uR/JpMO1k+/4EobZmOrqM2qkaM9b819xH9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fQrmBLtVaRu1YyNdrLfWKt47C2vhv7/FM52dr6hjnB2AAYXUvsL0A2OuTL3xcb7QG
	 uyKXrNPDNRjnNQjdu2KznYONWo7qQWBcRGM4VqJwEo8CaP/StdUcSvI4Y7IRWr1bbK
	 gRFzaZjzM3vEplbEAfolwp2WzgidqeF1Q5vxpsxsQcvOSZk2VCW5gtDLXIifJ04TXt
	 3AT4EFJHyZasnzb/tf9YyE0AgNMwDiUxrxzusuQuJTlwVIuVsoEZQFqu5lTnXcLOiY
	 EwaWYdHnPZ5A4iFRfDKTCkv2TCO9DZmF0ig3F9OzrwURTZKTmGCU6MaH4+siqFJGiy
	 Lpb0JOt7U/pQA==
From: Puranjay Mohan <puranjay@kernel.org>
To: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat
 <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, Will
 Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org, Weinan Liu <wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
References: <20250127213310.2496133-1-wnliu@google.com>
Date: Tue, 04 Feb 2025 14:49:49 +0000
Message-ID: <mb61pzfj169yq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065009_230977_7CB18A57 
X-CRM114-Status: GOOD (  22.23  )
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

--=-=-=
Content-Type: text/plain

Weinan Liu <wnliu@google.com> writes:

> This patchset implements a generic kernel sframe-based [1] unwinder.
> The main goal is to support reliable stacktraces on arm64.
>
> On x86 orc unwinder provides reliable stacktraces. But arm64 misses the
> required support from objtool: it cannot generate orc unwind tables for
> arm64.
>
> Currently, there's already a sframe unwinder proposed for userspace: [2].
> Since the sframe unwind table algorithm is similar, these two proposal
> could integrate common functionality in the future.
>
> There are some incomplete features or challenges:
>   - The unwinder doesn't yet work with kernel modules. The `start_addr` of
>     FRE from kernel modules doesn't appear correct, preventing us from
>     unwinding functions from kernel modules.
>   - Currently, only GCC supports sframe.
>
> Ref:
> [1]: https://sourceware.org/binutils/docs/sframe-spec.html
> [2]: https://lore.kernel.org/lkml/cover.1730150953.git.jpoimboe@kernel.org/
>

Hi Weinan,
Thanks for working on this.

I tested this set on my setup and faced some issues, here are the
details:

Here is my setup [on AWS c6gd.16xlarge instance]:
-------------------------------------------------

[root@ip-172-31-32-86 linux-upstream]# uname -a
Linux ip-172-31-32-86.ec2.internal 6.14.0-rc1+ #1 SMP Tue Feb  4 14:15:55 UTC 2025 aarch64 aarch64 aarch64 GNU/Linux

[root@ip-172-31-32-86 linux-upstream]# git log --oneline
e9a702365 (HEAD -> master) arm64: Enable livepatch for ARM64
5dedc956e arm64: Define TIF_PATCH_PENDING for livepatch
ba563b31a unwind: arm64: add reliable stacktrace support for arm64
d807d392d unwind: arm64: Add sframe unwinder on arm64
7872f050b unwind: Implement generic sframe unwinder library
03d2ad003 unwind: add sframe v2 header
5e95cc051 arm64: entry: add unwind info for various kernel entries
faff6cbc3 unwind: build kernel with sframe info
0de63bb7d (origin/master, origin/HEAD) Merge tag 'pull-fix' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs
902e09c8a fix braino in "9p: fix ->rename_sem exclusion"
f286757b6 Merge tag 'timers-urgent-2025-02-03' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
a360f3ffd (grafted) Merge tag 'irq-urgent-2025-02-03' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
bb2784d9a (grafted) jiffies: Cast to unsigned long in secs_to_jiffies() conversion
30d61efe1 (grafted) 9p: fix ->rename_sem exclusion

[root@ip-172-31-32-86 linux-upstream]# grep SFRAME .config
CONFIG_AS_HAS_SFRAME_SUPPORT=y
CONFIG_SFRAME_UNWIND_TABLE=y
CONFIG_SFRAME_UNWINDER=y
[root@ip-172-31-32-86 linux-upstream]# grep LIVEPATCH .config
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
CONFIG_SAMPLE_LIVEPATCH=m

[root@ip-172-31-32-86 linux-upstream]# as --version
GNU assembler version 2.41-50.al2023.0.2
Copyright (C) 2023 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or later.
This program has absolutely no warranty.
This assembler was configured for a target of `aarch64-amazon-linux'.

[root@ip-172-31-32-86 linux-upstream]# gcc --version
gcc (GCC) 11.4.1 20230605 (Red Hat 11.4.1-2)
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Loading the livepatch-sameple module:
-------------------------------------

[root@ip-172-31-32-86 linux-upstream]# kpatch load /lib/modules/6.14.0-rc1+/kernel/samples/livepatch/livepatch-sample.ko
loading patch module: /lib/modules/6.14.0-rc1+/kernel/samples/livepatch/livepatch-sample.ko
waiting (up to 15 seconds) for patch transition to complete...
patch transition has stalled!
<4>kpatch: Livepatch process signaling is performed automatically on your system.
<4>kpatch: Skipping manual process signaling.
waiting (up to 60 seconds) for patch transition to complete...

Stalled processes:
340 kdevtmpfs
stack:
[<0>] devtmpfs_work_loop+0x2cc/0x2d8
[<0>] devtmpfsd+0x4c/0x58
[<0>] kthread+0xf0/0x100
[<0>] ret_from_fork+0x10/0x20
module livepatch_sample did not complete its transition, unloading...
disabling patch module: livepatch_sample
waiting (up to 15 seconds) for patch transition to complete...
transition complete (3 seconds)
unloading patch module: livepatch_sample
<4>kpatch: error: failed to load module livepatch_sample (transition stalled)

Useful messages from kernel log [pr_debug enabled]:
---------------------------------------------------

 livepatch: enabling patch 'livepatch_sample'
 livepatch: 'livepatch_sample': initializing patching transition
 livepatch: 'livepatch_sample': starting patching transition
 livepatch: klp_try_switch_task: kdevtmpfs:340 has an unreliable stack
 livepatch: klp_try_switch_task: insmod:9226 has an unreliable stack
 livepatch: klp_try_switch_task: swapper/63:0 is running
 [......SNIP.......]
 livepatch: klp_try_switch_task: kdevtmpfs:340 has an unreliable stack
 [......SNIP.......]
 livepatch: signaling remaining tasks
 livepatch: klp_try_switch_task: kdevtmpfs:340 has an unreliable stack
 livepatch: 'livepatch_sample': reversing transition from patching to unpatching
 livepatch: 'livepatch_sample': starting unpatching transition
 livepatch: klp_try_switch_task: swapper/45:0 is running
 livepatch: 'livepatch_sample': completing unpatching transition
 livepatch: 'livepatch_sample': unpatching complete

Please let me know if you are aware of this already or if this is
expected behaviour with this version. I will try to debug this from my
side as well. Also let me know if you need more details for debugging
this.

P.S. - I also saw multiple build warning like:
ld: warning: orphan section `.eh_frame' from `arch/arm64/kernel/entry.o' being placed in section `.eh_frame'
ld: warning: orphan section `.init.sframe' from `arch/arm64/kernel/pi/lib-fdt.pi.o' being placed in section `.init.sframe'


Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ6IpDhQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2ncTKAPwMyQYhH9SeQE1efMJ3svM0mOSDNKQP
sdWn5z6J5QcjHQD7BOPVMZoBRetNo0/gEu1kDe6zVoV+uma42/iOhGGvRgA=
=oCKP
-----END PGP SIGNATURE-----
--=-=-=--

