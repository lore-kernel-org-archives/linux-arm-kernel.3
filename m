Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0850BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4yop/Ie7iYB5rFGJKRKE3zG3WgIT61/wxGmdAZS5684=; b=0D0AXZ4U1vWuv9ewcibBkAMcRb
	5LXshU0DEQGH+vtcr+CsiwdSWvHNchMTM9wXYseJFt5tcpgcxmfUXtxgL84SYCny4EJrggBvxAk28
	T6JdvyKRQva+wC5pyzzwFf+4QjWMG9GeT28e+874uBhJH+3NLozazXtvyJi/bwuZBSCVRwA0Zp20V
	nfRKFH5uNiDhuWP4ZTTJFiwh2E5Qi/9m2VCTbKeTv+3C9lh8Wtim8K7s6COeMRyDuA9M+14KuEX12
	P9Q+WDaJ9tGvPCwwwDhjbcECNBXIncg5rjqP4uws+RO5CoJJwfzyx+2lW6jrjnu0KinIW1i3EdJhx
	v2pwMr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2WA-00000009FU7-08s7;
	Tue, 09 Sep 2025 17:52:34 +0000
Received: from mail-il1-f205.google.com ([209.85.166.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2W7-00000009FTc-0yhr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 17:52:32 +0000
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3f6665a4754so159190485ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 10:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440348; x=1758045148;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yop/Ie7iYB5rFGJKRKE3zG3WgIT61/wxGmdAZS5684=;
        b=INJp8H10hCLUYGi+gunhsdLCACAy+7JA1J6wD9kTe10KuwMFdPQPI/1K9+2mzsoK5k
         kuNKfry8CeU5G2QZXxo6FoC/u9iGiDL2bnOw4X3SzG2lHv0ztxAkaNWeU2fzJRrjRdl3
         j3ihqCtfePYnY2FNg25bImCUeCmfH4JVwuT952aCY3DPWU9XtMy7WSAecQW8koIX3Z3U
         B/ZujipHgWcWX3IaeSGYUtWJx+C0tHgxdfyk1GMexyHSIf5dQKhwISKasVaYlLvg9YYA
         Z3pribXjmVlATGqs8gpYQlx4xWTT3WiV7f8G0DLVtu9JXpcUxTTK9uf/LWpVxYAOkG9l
         lEGg==
X-Forwarded-Encrypted: i=1; AJvYcCUQTQ0hvZi3ZGGpZ94ZYDK5+b0c356+3znGKeRDHJA0Z8cKmKdGxlujncbCF8PXnkA+l5xoMmFgejW9drUvTXAT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3NCZ6t0oz88z6DeCk/dkY1Yw4qThBTLQYqUSUAAjz8cbYChg/
	qdffh+7YFbEJOdjwIPKycrFf6xwlF3qI7wW9bnvRIi7kZMXSfsxwUqjnhKfCNq0VBtzId+PN7cm
	lkUWxrQJQw4y1ZiCL2wvjauegp74zUIvgE5EDBQi7EAhvgqheeb0vTZyq/Lw=
X-Google-Smtp-Source: AGHT+IFvXHqKNQah4y1TVgBGYO9tYJrc8Qy3XK6VELpcVL9ML9nBTrhBUeqD5BPj7hlVD3oXEYj96feDobHyPAq04SDgzgbbSaWA
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4414:10b0:403:e0f2:8f23 with SMTP id
 e9e14a558f8ab-403e0f2910dmr107554235ab.19.1757440348213; Tue, 09 Sep 2025
 10:52:28 -0700 (PDT)
Date: Tue, 09 Sep 2025 10:52:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c0695c.050a0220.2ff435.0004.GAE@google.com>
Subject: [syzbot] [kvmarm?] kernel panic: Unhandled exception
From: syzbot <syzbot+d173b3985bd6b9487fa1@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_105231_284305_6F942826 
X-CRM114-Status: UNSURE (   8.39  )
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

HEAD commit:    9c642e6226e3 Merge branch kvm-arm64/ffa-1.2 into kvmarm-ma..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=14f13562580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b1bafe30fc85201
dashboard link: https://syzkaller.appspot.com/bug?extid=d173b3985bd6b9487fa1
compiler:       Debian clang version 20.1.8 (++20250708123704+0de59a293f7a-1~exp1~20250708003721.134), Debian LLD 20.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f13562580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15104b12580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-9c642e62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b5f8363adcc8/vmlinux-9c642e62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/95eedfb6cbc9/Image-9c642e62.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d173b3985bd6b9487fa1@syzkaller.appspotmail.com

x8 : 59f000001fc3bb00 x7 : ffff800080aba4c0 x6 : 0000000000000000
x5 : 0000000000000001 x4 : ffff80008e7e7ac0 x3 : 0000000000000004
x2 : 0000000000021d74 x1 : 0000000000000000 x0 : 00000000c600001b
Kernel panic - not syncing: Unhandled exception
CPU: 0 UID: 0 PID: 3618 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0x30/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 vpanic+0x22c/0x59c kernel/panic.c:430
 vpanic+0x0/0x59c kernel/panic.c:566
 el1t_64_irq_handler+0x0/0x1c arch/arm64/kernel/entry-common.c:336
 el1_abort+0x0/0x5c arch/arm64/kernel/entry-common.c:635
 el1h_64_sync+0x6c/0x70 arch/arm64/kernel/entry.S:591
 pkvm_init_host_vm+0xb8/0x160 arch/arm64/kvm/pkvm.c:234 (P)
 kvm_arch_init_vm+0x150/0x288 arch/arm64/kvm/arm.c:187
 kvm_create_vm virt/kvm/kvm_main.c:1184 [inline]
 kvm_dev_ioctl_create_vm virt/kvm/kvm_main.c:5480 [inline]
 kvm_dev_ioctl+0x838/0x105c virt/kvm/kvm_main.c:5522
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __arm64_sys_ioctl+0x18c/0x244 fs/ioctl.c:584
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x164 arch/arm64/kernel/entry-common.c:879
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:898
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
Kernel Offset: disabled
CPU features: 0x00000,000068c0,17de33e1,057ffe1f
Memory Limit: none

================================
WARNING: inconsistent lock state
syzkaller #0 Not tainted
--------------------------------
inconsistent {INITIAL USE} -> {IN-NMI} usage.
syz.2.17/3618 [HC1[1]:SC0[0]:HE0:SE1] takes:
f4f000000d3ed6e8 (&k->list_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:351 [inline]
f4f000000d3ed6e8 (&k->list_lock){+.+.}-{3:3}, at: bus_to_subsys drivers/base/bus.c:68 [inline]
f4f000000d3ed6e8 (&k->list_lock){+.+.}-{3:3}, at: bus_for_each_dev+0x60/0x2a4 drivers/base/bus.c:359
{INITIAL USE} state was registered at:
  lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5868
  __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
  _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:154
  spin_lock include/linux/spinlock.h:351 [inline]
  kobj_kset_join lib/kobject.c:180 [inline]
  kobject_add_internal+0x46c/0xee4 lib/kobject.c:231
  kobject_add_varg lib/kobject.c:374 [inline]
  kobject_add+0x10c/0x1d0 lib/kobject.c:426
  device_add+0x494/0xd78 drivers/base/core.c:3627
  device_register+0x28/0x38 drivers/base/core.c:3771
  faux_bus_init+0x1c/0x88 drivers/base/faux.c:238
  driver_init+0x30/0x58 drivers/base/init.c:35
  do_basic_setup+0x1c/0xa8 init/main.c:1363
  kernel_init_freeable+0x244/0x330 init/main.c:1579
  kernel_init+0x24/0x1d0 init/main.c:1469
  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:844
irq event stamp: 1602
hardirqs last  enabled at (1601): [<ffff80008658e000>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (1601): [<ffff80008658e000>] _raw_spin_unlock_irqrestore+0x44/0xbc kernel/locking/spinlock.c:194
hardirqs last disabled at (1602): [<ffff800086567f28>] __panic_unhandled+0x24/0x68 arch/arm64/kernel/entry-common.c:327
softirqs last  enabled at (1368): [<ffff8000800c8bec>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (1366): [<ffff8000800c8bb8>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&k->list_lock);
  <Interrupt>
    lock(&k->list_lock);

 *** DEADLOCK ***

no locks held by syz.2.17/3618.

stack backtrace:
CPU: 0 UID: 0 PID: 3618 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0x30/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_usage_bug+0x2f4/0x32c kernel/locking/lockdep.c:4042
 verify_lock_unused+0x78/0x88 kernel/locking/lockdep.c:5792
 lock_acquire+0x22c/0x2e0 kernel/locking/lockdep.c:5859
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:351 [inline]
 bus_to_subsys drivers/base/bus.c:68 [inline]
 bus_for_each_dev+0x60/0x2a4 drivers/base/bus.c:359
 coresight_panic_cb+0x2c/0x3c drivers/hwtracing/coresight/coresight-core.c:1586
 notifier_call_chain+0x1e8/0x65c kernel/notifier.c:85
 atomic_notifier_call_chain+0xd0/0x180 kernel/notifier.c:223
 vpanic+0x2c4/0x59c kernel/panic.c:459
 vpanic+0x0/0x59c kernel/panic.c:566
 el1t_64_irq_handler+0x0/0x1c arch/arm64/kernel/entry-common.c:336
 el1_abort+0x0/0x5c arch/arm64/kernel/entry-common.c:635
 el1h_64_sync+0x6c/0x70 arch/arm64/kernel/entry.S:591
 pkvm_init_host_vm+0xb8/0x160 arch/arm64/kvm/pkvm.c:234 (P)
 kvm_arch_init_vm+0x150/0x288 arch/arm64/kvm/arm.c:187
 kvm_create_vm virt/kvm/kvm_main.c:1184 [inline]
 kvm_dev_ioctl_create_vm virt/kvm/kvm_main.c:5480 [inline]
 kvm_dev_ioctl+0x838/0x105c virt/kvm/kvm_main.c:5522
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl fs/ioctl.c:584 [inline]
 __arm64_sys_ioctl+0x18c/0x244 fs/ioctl.c:584
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x164 arch/arm64/kernel/entry-common.c:879
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:898
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

