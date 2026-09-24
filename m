Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0A2C982FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 04:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRQ0VxqpuNoSza6zOLG1gwykGEw7zwH/fbhRzlWY/Lc=; b=ttR2Hvx/DY3NOw
	SkS2ZRlmHxK1uZuze5g+N483uioEzg4Oy4fYdfwm7ab0c0tGV3KUmX9jc1qM2W8u92aaDc0N1qLYz
	sW4yQn6WLj4oxpwq6dC+sTrQa8Zja37eel8Pp9eky3Jj20JA1mx5nj9nLHo4rFTwjSmakiLqW/Ie0
	W/g59bUrCkW4GbyorOts+RS9xUuBERhnBj/eQk76Y4zECmX/p59T5rAVOtKOyiDUqKS+ZbbG/kgca
	cyZyeVtyvpCToCHSz1Qq1ri/YaWJBqp44e1kSMiL/1PvnKR2mqt2io5t8yxTaCYzGxeWzQhYPjpmg
	4BnsMjCnGgXq+cZi5R8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aoR-00000009zS0-0msZ;
	Thu, 24 Sep 2026 04:11:59 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aoM-00000009zQV-41bb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 04:11:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZRQ0VxqpuNoSza6zOLG1gwykGEw7zwH/fbhRzlWY/Lc=;
	b=OzxKUUwZYTuTrykXXNDe9n63OFnXxUP++ZLONoERb3YuLUzDD9i/1X+acua3ZB0ygehiv+eB4
	Ca2QoSb4sbF6lfkJvaGgSUJp0QiJV+KR8CD9CGAMtq4xueFC11/v+HxiBlPz6WHm5vSky1Ra14s
	EL3oup3ikADUirUxoh+Z2pw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hr0TC39yJz12LFc;
	Thu, 24 Sep 2026 11:59:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 238AB40561;
	Thu, 24 Sep 2026 12:11:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 24 Sep 2026 12:11:31 +0800
Message-ID: <bbd65e4d-8096-4939-8308-f0f54c5cb3bc@huawei.com>
Date: Thu, 24 Sep 2026 12:11:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ptrace: Add PTRACE_SYSEMU_SINGLESTEP
 syscall-exit-stop test
To: Kees Cook <kees@kernel.org>
References: <20260922195719.i.211-kees@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260922195719.i.211-kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_211155_622803_6900314B 
X-CRM114-Status: GOOD (  24.42  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org, will@kernel.org, Shuah Khan <shuah@kernel.org>, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/23 3:57, Kees Cook 写道:
> ptrace(2) states that no syscall-exit-stop occurs when a tracee is
> continued with PTRACE_SYSEMU or PTRACE_SYSEMU_SINGLESTEP. arm64 gated
> its syscall-exit report on
> 
> 	flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP)

Hi Kees,

The original fix description is a bit off: on arm64 there is no extra
syscall-exit-stop; instead, there's an additional pseudo single-step
injection.

As sashiko pointed out, as commit ac2081cdc4d9 ("arm64: ptrace:
Consistently use pseudo-singlestep exceptions") described, for
PTRACE_SYSEMU_SINGLESTEP, arm64 still needs the pseudo single-step
because its hardware single-step state machine is fast-forwarded over
the SVC instruction.

static void report_syscall_exit(struct pt_regs *regs)
{
   ...
   if (test_thread_flag(TIF_SINGLESTEP)) {
       /*
        * Signal a pseudo-step exception since we are stepping but
        * tracer modifications to the registers may have rewound the
        * state machine.
        */
       ptrace_report_syscall_exit(regs, 1);
          -> user_single_step_report(regs);
    }
}

https://sashiko.dev/#/patchset/20260922035510.1090299-1-ruanjinjie%40huawei.com

> 
> and ptrace_resume() clears SYSCALL_TRACE for both SYSEMU requests while
> PTRACE_SYSEMU_SINGLESTEP additionally sets TIF_SINGLESTEP, so the
> single-step bit alone produced a stop that must not exist. Nothing in
> tools/testing/selftests covered this.
> 
> Detecting the extra stop is less direct than it looks. The report is
> emitted with step=1, so ptrace_report_syscall_exit() dispatches to
> user_single_step_report() rather than ptrace_report_syscall(), and it
> arrives as a plain SIGTRAP indistinguishable by signal from the
> legitimate single-step trap: neither PTRACE_O_TRACESYSGOOD nor
> PTRACE_GET_SYSCALL_INFO separates the two. What does separate them is
> the PC. The redundant report fires before the tracee has moved past the
> syscall instruction, so it lands on the PC of the syscall-entry stop:
> 
> 	[0] sig=133 SYSCALL-STOP  pc=0x41ec28
> 	[1] sig=5   trap          pc=0x41ec28   <-- must not exist
> 	[2] sig=5   trap          pc=0x41ec2c
> 
> A fixed kernel reports pc=0x41ec2c already at stop [1]. The test
> therefore asserts that the first stop after the syscall-entry stop is at
> a different PC, which tests the consequence rather than the mechanism
> and does not depend on how many pseudo-step traps follow.
> 
> PTRACE_SYSEMU is used to reach the syscall-entry stop, as single-
> stepping there costs one stop per instruction and takes roughly 200000
> stops. Architectures without a PC accessor here, or without SYSEMU
> support, skip rather than fail.
> 
> Build tested ARCH=arm64 with GCC aarch64-linux-gnu 16.1.0, ARCH=arm
> with GCC arm-linux-gnueabihf 16.1.0, and ARCH=x86_64 with GCC 16.2.0.
> 
> Tests passing on ARCH=arm64 under qemu-system-aarch64, and the same
> test fails as expected on v7.3-rc2 without the fix[1]:
> 
> 	# entry stop pc=0x41ec28, next stop sig=5 pc=0x41ec28
> 	# Expected next_pc (4320296) != entry_pc (4320296)
> 	not ok 1 sysemu.no_syscall_exit_stop
> 
> An AArch32 build of the same test on an arm64 kernel reproduces the
> failure identically, covering the is_compat_task() path. It also passes
> on x86_64, which already uses generic entry, so the test does not report
> a false positive against a correct implementation.
> 
> Link: https://lore.kernel.org/all/20260922035510.1090299-2-ruanjinjie@huawei.com/ [1]
> Assisted-by: LLM
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  tools/testing/selftests/ptrace/Makefile       |   3 +-
>  .../selftests/ptrace/sysemu_singlestep.c      | 176 ++++++++++++++++++
>  tools/testing/selftests/ptrace/.gitignore     |   1 +
>  3 files changed, 179 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/ptrace/sysemu_singlestep.c

[...]

> +TEST_HARNESS_MAIN
> diff --git a/tools/testing/selftests/ptrace/.gitignore b/tools/testing/selftests/ptrace/.gitignore
> index f6be8efd57ea..792c81f804c0 100644
> --- a/tools/testing/selftests/ptrace/.gitignore
> +++ b/tools/testing/selftests/ptrace/.gitignore
> @@ -4,3 +4,4 @@ get_set_sud
>  peeksiginfo
>  vmaccess
>  set_syscall_info
> +sysemu_singlestep

-- 
Best regards,
Jinjie


