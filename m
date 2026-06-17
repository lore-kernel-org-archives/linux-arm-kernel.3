Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C6CCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajrU9nkUmPHhfUiRvSV5Q/ZkE7bhDDPvX3VB5Rj0PQQ=; b=e2E29not78guVc
	73t06Ks4z6LvYXfdqG09IplhwqBGw+gVN0iBL9/4exl78T9lrmEg5VxErMyxLZ7KP7mllLi3tQqXg
	0RuMrtPp2M535ebehEVMJ7WVy0fgUEDCXB43HoE3306zV2Dixox9tDOhlMh50vtG0766dc2uyR+lO
	cApHDpnes24jO6lm5Wyzbc+iv9pRek6amzPwzZh0zu8zY4wduTjn+5lw7W14sWcFUjjyrvalX6hma
	5pupkOiT0wN0Y6bC727sulbctkhOhhiXQMIkel0XMPpzYoKqYqOekV9aJCjcdgsLIXfQpz4eOJMvJ
	O+iYIkjvRFcytnSq3Clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZt6m-000000002zj-01NE;
	Wed, 17 Jun 2026 16:27:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZt6j-000000002z6-0lIJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 16:27:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BF292F7D;
	Wed, 17 Jun 2026 09:27:08 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BAE43F905;
	Wed, 17 Jun 2026 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781713633; bh=p4UAsXwHo9mOUblbz0uEvgWXwkwq2hl5qXUDiEiSsKM=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=d8NesNgjJHUqGb/u/+5qa63gy1FRu/VvOCI2PCo+I9ll8Y1pxSvehEgKBQfE/LD+z
	 ouzrNfBzgmXtNtKnruh41zKkkCOFx6LUe/x5gBXmxp9D4S6mXLVtvroQMPt2dOvs0e
	 UURs3lcC0GZXD3vzgXHlWAObV9/W7GcjVcRS6aVI=
Message-ID: <ec181396-e398-4ce2-8cb8-10d7bdfeed61@arm.com>
Date: Wed, 17 Jun 2026 17:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/11] arm64: entry: Convert to Generic Entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_092717_395960_82B469F7 
X-CRM114-Status: GOOD (  18.08  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jinjie,

On 11/05/2026 10:20, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> maintainers' work easier and codes more elegant. arm64 has already
> successfully switched to the Generic IRQ Entry in commit
> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> time to completely convert arm64 to Generic Entry.
>
> [...]
>
> It was tested ok with following test cases on QEMU virt platform:
>   - Stress-ng CPU stress test.
>   - Hackbench stress test.
>   - "sud" selftest testcase.
>   - get_set_sud, get_syscall_info, set_syscall_info, peeksiginfo
>     in tools/testing/selftests/ptrace.
>   - breakpoint_test_arm64 in selftests/breakpoints.
>   - syscall-abi and ptrace in tools/testing/selftests/arm64/abi
>   - fp-ptrace, sve-ptrace, za-ptrace in selftests/arm64/fp.
>   - vdso_test_getrandom in tools/testing/selftests/vDSO
>   - Strace tests.
>
> The test QEMU configuration is as follows:
>
> 	qemu-system-aarch64 \
> 		-M virt \
> 		-enable-kvm \
> 		-cpu host \
> 		-kernel Image \
> 		-smp 8 \
> 		-m 512m \
> 		-nographic \
> 		-no-reboot \
> 		-device virtio-rng-pci \
> 		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
> 			earlycon irqchip.gicv3_pseudo_nmi=1" \
> 		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
> 		-device virtio-blk-device,drive=hd0 \

Thanks for the series and the extensive test coverage !

I did some additional testing on my side with the series rebased
on -rc5, to get the latest fixes from Mark Rutland, focusing on stability
rather than performance, with the following configurations :

- Systems
   - M1SDP (4 CPU, 16 GiB RAM, GICv3)
   - QEMU/KVM on M1SDP (4 CPU, 4 GiB RAM, GICv3)
     - Host running upstream
     - Host running this series
   - AMD Seattle (4 CPU, 8 GiB RAM, GICv2)
- Kernel configurations (+ debug options[1])
   - defconfig
   - pseudo-NMI (except on Seattle)
   - PREEMPT_RT
   - PREEMPT_RT + pseudo-NMI (except on Seattle)
- Tests
   - stress-ng
     - CPU stress test
     - Interrupt stress tests
     - Virtual Memory stress tests
     - Syscall validation tests
   - Hackbench
   - pseudo-NMI load tests via perf
   - debug exception entry load tests
   - memcached stress test via mc-crusher
   - The above plus high system load/low available memory
   - Suspend test via /sys/power/pm_test
   - Hibernate (QEMU only)


All tests were able to complete without major issues !


However, when combining pseudo-NMIs with PREEMPT_RT under heavy pNMI load,
I was able to trigger a new warning compared to upstream :

     BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!

Specifically, this was when running `stress-ng --all 100 --class vm -t 
300` with
`perf top -a -e 'cycles'` in another shell.

This does not feel like a major issue : from my understanding it only 
happens
when running the full suite for some time and with many stressors (I was not
able to reproduce it by running individual tests), and flooding the 
system with
pseudo-NMIs.

Given that this only happen with PREEMPT_RT, my guess is that it interacts
with generic entry in a way that can lead to more nesting than before,
leading to an easier exhaustion of the limit on lockdep.
As the system was still able to recover and did not lock up, I think it 
can be OK
as-is, or simply bumped a bit ? Happy for more opinions on that.


Otherwise, this is
Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

As this is an important change, any other testing, especially on real 
workloads
as well as on very large systems (which we haven't covered), would be 
very welcome !


I will take some time soon to review this latest version, now that I am 
able to.

Thanks again,
Kind regards
Ada

[0] BUG dump

    BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
    turning off the locking correctness validator.
    CPU: 0 UID: 0 PID: 77252 Comm: stress-ng-shm-s Tainted: G        W           7.1.0-rc5-pnmi-rt-00011-g856fda168b7e #477 PREEMPT_RT
    Tainted: [W]=WARN
    Hardware name: ARM LTD Morello System Development Platform, BIOS EDK II Mar  7 2024
    Call trace:
      show_stack+0x20/0x38 (C)
      dump_stack_lvl+0xf8/0x1b8
      dump_stack+0x18/0x28
      __lock_acquire+0x1a50/0x1f78
      lock_acquire+0x260/0x448
      _raw_spin_lock+0x50/0x70
      rcu_note_context_switch+0x11c/0x608
      __schedule+0x100/0x1280
      preempt_schedule_irq+0x58/0x158
      raw_irqentry_exit_cond_resched+0x4c/0x78
      arm64_exit_to_kernel_mode+0xa8/0x158
      el1_interrupt+0x58/0xb0
      el1h_64_irq_handler+0x18/0x28
      el1h_64_irq+0x80/0x88
      lock_acquire+0x3b0/0x448 (P)
      rt_spin_lock+0x11c/0x218
      new_inode+0x38/0x78
      __shmem_get_inode+0xa8/0x408
      __shmem_file_setup+0x16c/0x1b0
      shmem_kernel_file_setup+0x38/0x50
      newseg+0x100/0x3d8
      ipcget+0x464/0x5f0
      __arm64_sys_shmget+0x64/0xa0
      invoke_syscall.constprop.0+0x58/0x118
      do_el0_svc+0x64/0x3d8
      el0_svc+0x54/0x310
      el0t_64_sync_handler+0xa0/0xe8
      el0t_64_sync+0x1ac/0x1b0


[1] Debug options defconfig :

CONFIG_ARM64_DEBUG_PRIORITY_MASKING=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_KPROBES=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_SHIRQ=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_PROVE_LOCKING=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_RCU_EQS_DEBUG=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FPROBE=y
CONFIG_USER_EVENTS=y


