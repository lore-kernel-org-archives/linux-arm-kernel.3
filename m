Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64029C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e79DEBw39ni0myLiGMqi2od8L0GXfqigIyanB8qli9w=; b=LDG6t6b/GUN7XVhLrwfiWpwXhs
	NP+fFpO2E85xttf8sMXGAdJRAetHWaaKgdWw23SAD66LHfAXv5LgAnsMf1pRV3QksnH8GO8DtbPmU
	RxO8WZpAUW4YA0pVrJxoaJN1Yd4lyiEhsBFTB8xr0ja3fHyIpir7EFboixqViguK2NqEoI/N6wDGv
	xDdII/WP8OXU+gdaSzSs4I+i9bO8DlDOyjxSrtZaQ5zAGva1kz21GLQwjwNWINC4burCeg9pNxns7
	FD+cLCh8bqvyOADslLwQcTDmVxYLlgzH9qlIPqAJsnzmqZKCV3qzj3tFYT1ZgyJN2o07DOHWTDkTq
	B4ls4uiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWnd-0000000ABg8-0ngO;
	Mon, 12 May 2025 17:18:45 +0000
Received: from mail-il1-f207.google.com ([209.85.166.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWIL-0000000A6eV-3p6a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:46:27 +0000
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3da6f284ca5so98958405ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 09:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068384; x=1747673184;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e79DEBw39ni0myLiGMqi2od8L0GXfqigIyanB8qli9w=;
        b=W2U5a82Cl27GsX6z3n/6SealCJVe5hc6Qdv8TI7vgXC3tItLR5aBIh1DMnBjwAhSRn
         pg8s5730tF51s1He3Inn6WHSVBcUH9X3yIWMqystMq7C4CDmDFRIcBxV5sqFwbR+M5V4
         foyqfz/A8JxdZy/mfCgzizf+3pOfktYfdnSJFoZwWs9s0IbJ6Mumoz8pFsU9V29DUfIk
         vkEe6Zx6vUgOfFU/q7NESmHPOVmaR8QJJP2COom4w4sKJuFsx1oZN8IYZL7iZrxkcKbs
         6YD/OE2phXNLHi8BXxSYWeRreHx9mMFJXQ8kQVcxh10vtYeVwpCG/U65ZsZCJ5N8RtGD
         G5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVbrY/XmjdY/5o+7/shV2nY0k3fZ7lHCRv2PLZiFFYC5J/7Q2OYcUl6uhT4CAaSPW3V0dKWCHWVLvE/S+CJ6WX6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpi0Mk61+vXTagPT4WdCgRp/jljeCsLLEXz+QGG2JEO8FxOKso
	Ak6jpWoNeYfB/1XFAVFKQS45V2NeL4S4sKJeF4eZpFwenKBTUz0mXCdZLdiLnbrhrwbgWurUBi7
	G834uMtTSZTEB8CZLv8pdpDYZ+r5x2eD1aaOn7mGxlO53+dJ5ATor/s0=
X-Google-Smtp-Source: AGHT+IFXNBCoJpWUIqc40y4go3YSzmW9SL0u3Q96FgkKvHitoh8WNiTMksarST9yKwP7q5T4iCwsN4hbe1ibq60vt4FXo0QMpcSz
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154e:b0:3d8:2187:5cea with SMTP id
 e9e14a558f8ab-3da7e1e6257mr169782655ab.1.1747068384389; Mon, 12 May 2025
 09:46:24 -0700 (PDT)
Date: Mon, 12 May 2025 09:46:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682225e0.050a0220.f2294.0075.GAE@google.com>
Subject: [syzbot] [kvmarm?] KASAN: invalid-access Read in kvm_vgic_set_owner
From: syzbot <syzbot+9993ad918a0b1c0af91c@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_094625_958501_364E397D 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Hello,

syzbot found the following issue on:

HEAD commit:    c4e91ea0cc7e Merge branch kvm-arm64/misc-6.16 into kvmarm-..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=10f27768580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f705363127f7638
dashboard link: https://syzkaller.appspot.com/bug?extid=9993ad918a0b1c0af91c
compiler:       Debian clang version 20.1.3 (++20250415083350+2131242240f7-1~exp1~20250415203523.103), Debian LLD 20.1.3
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-c4e91ea0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7ecf29c15547/vmlinux-c4e91ea0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/59a7b6f25d98/Image-c4e91ea0.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9993ad918a0b1c0af91c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: invalid-access in __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
BUG: KASAN: invalid-access in _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:162
Read of size 1 at addr 00000000000013c8 by task syz.0.1041/7144

CPU: 0 UID: 0 PID: 7144 Comm: syz.0.1041 Not tainted 6.15.0-rc4-syzkaller-gc4e91ea0cc7e #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_report+0x5c/0xa0 mm/kasan/report.c:524
 kasan_report+0xb0/0x110 mm/kasan/report.c:634
 __kasan_check_byte+0x3c/0x54 mm/kasan/common.c:557
 kasan_check_byte include/linux/kasan.h:399 [inline]
 lock_acquire+0xb0/0x2e0 kernel/locking/lockdep.c:5840
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:162
 kvm_vgic_set_owner+0x18c/0x294 arch/arm64/kvm/vgic/vgic.c:611
 timer_irqs_are_valid arch/arm64/kvm/arch_timer.c:1573 [inline]
 kvm_timer_enable+0x1c4/0x794 arch/arm64/kvm/arch_timer.c:1631
 kvm_arch_vcpu_run_pid_change+0x1f0/0x458 arch/arm64/kvm/arm.c:857
 kvm_vcpu_ioctl+0xae8/0xc24 virt/kvm/kvm_main.c:4381
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __arm64_sys_ioctl+0x18c/0x244 fs/ioctl.c:892
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x134 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
==================================================================
Unable to handle kernel paging request at virtual address ffef80000000013b
KASAN: maybe wild-memory-access in range [0xff000000000013b0-0xff000000000013bf]
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ffef80000000013b] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 7144 Comm: syz.0.1041 Tainted: G    B               6.15.0-rc4-syzkaller-gc4e91ea0cc7e #0 PREEMPT 
Tainted: [B]=BAD_PAGE
Hardware name: linux,dummy-virt (DT)
pstate: 604020c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : debug_spin_lock_before kernel/locking/spinlock_debug.c:86 [inline]
pc : do_raw_spin_lock+0x4c/0x2b4 kernel/locking/spinlock_debug.c:115
lr : __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:111 [inline]
lr : _raw_spin_lock_irqsave+0x64/0x7c kernel/locking/spinlock.c:162
sp : ffff8000a8ef7930
x29: ffff8000a8ef7940 x28: ddf00000139057c0 x27: ddf0000013906c30
x26: 0000000000000001 x25: ddf0000013906e10 x24: 0000000000000010
x23: a3ff8000a91ee000 x22: ddf00000139057c0 x21: ffff8000801fd8a4
x20: 00000000000013b0 x19: efff800000000000 x18: 00000000000000ff
x17: 000000000000001f x16: 00000000000000fe x15: 0000000000000000
x14: 0000000000000000 x13: 00000000ffffffff x12: 0000000000000002
x11: 0000000000000001 x10: 0ff000000000013b x9 : 0000000000000000
x8 : 00000000000013b4 x7 : ffff8000870a9afd x6 : ffff800086582ed8
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000802a42dc
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00000000000013b0
Call trace:
 debug_spin_lock_before kernel/locking/spinlock_debug.c:86 [inline] (P)
 do_raw_spin_lock+0x4c/0x2b4 kernel/locking/spinlock_debug.c:115 (P)
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:111 [inline]
 _raw_spin_lock_irqsave+0x64/0x7c kernel/locking/spinlock.c:162
 kvm_vgic_set_owner+0x18c/0x294 arch/arm64/kvm/vgic/vgic.c:611
 timer_irqs_are_valid arch/arm64/kvm/arch_timer.c:1573 [inline]
 kvm_timer_enable+0x1c4/0x794 arch/arm64/kvm/arch_timer.c:1631
 kvm_arch_vcpu_run_pid_change+0x1f0/0x458 arch/arm64/kvm/arm.c:857
 kvm_vcpu_ioctl+0xae8/0xc24 virt/kvm/kvm_main.c:4381
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __arm64_sys_ioctl+0x18c/0x244 fs/ioctl.c:892
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x134 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: d344fd4a aa0003f4 f90007e9 d378fd09 (386a6a6a) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d344fd4a 	lsr	x10, x10, #4
   4:	aa0003f4 	mov	x20, x0
   8:	f90007e9 	str	x9, [sp, #8]
   c:	d378fd09 	lsr	x9, x8, #56
* 10:	386a6a6a 	ldrb	w10, [x19, x10] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

