Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426DAE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=y3A8RlaKJD15/a+kfFGaspTfrEe6hXXSG8+izJ+pp+M=; b=XHFg4pB6XsfTBQ
	tyH5DhWM0VESJ9tnoYPucQUne7Bvm7E42XoGvvhKS4bsU1BxarOOyiF0uk5BgXb0AhU0P1scrRMTq
	vkJuRfKJuli4jM5ACX6LoGRRVPRd6jfZeAb7+hxWGSB8ITeRVXMW7EdPcbjFf5DuG7LVX0uS9+xVA
	yp9lLuLUNHvr8r0KwdZ/6X7C3+Ixk50qZenC4dz243ZhThQZAC+6B5F+s48tARH/kdyYWSom/wLzw
	jGyScfIsmVpu42yDletMXPprAuWlgynFSLkbx39hYfEcxtb25JB0UU5rICap9BeYA3Lq3E1vC5W+i
	X5nWKD45jthXg5Mj+iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4pR-00000003iJk-140M;
	Fri, 13 Dec 2024 12:31:33 +0000
Received: from mail-il1-f207.google.com ([209.85.166.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4oN-00000003iDt-0eLi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 12:30:28 +0000
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a7e39b48a2so36398025ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 04:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093025; x=1734697825;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3A8RlaKJD15/a+kfFGaspTfrEe6hXXSG8+izJ+pp+M=;
        b=aVzWAYA1oAT/sViVxadE+9ubsrkq4cbeL8RWx9ZaoxkHfUim7qjdCuZRyOqaMu9lO0
         ApRKFt8w/uo4gqclwh1HpS29ZBayxFrc/1KHws2OesZDLJALrBZyOzfJCSuiHEvAtrX2
         iirLqtuJnhKbcCD+ufu3jc8gqT62avZnitYf7Lt3BadlNVwO0qn6amNT55Hp2+xL/8G2
         KuEFv48prCAtPnsIpn0JKB8Mox7Bdvq/YgiO0aaihxsN8SScBOxBDqnl0yDv06mv4WAm
         DtJp4tGwGAEddpVNY6Ptkyk6KeNAVbQ/XFTx23RRzDl+HvgBfx0u5JrrtJ3zRc+5Ww8x
         lgMw==
X-Forwarded-Encrypted: i=1; AJvYcCVRdZdtlwnkBxOOtgZThdx7lrvTTOb+S7NUkfQJXYnupcHPdP75Ycv8VvHygJlLoTLEg73hzHgQ/Gshm8Gy98sY@lists.infradead.org
X-Gm-Message-State: AOJu0YzqioIiZYPXUhtAtd3l/8nRkHt5+L0VVCbd8Ch34L/csr09BWav
	++DORPmdHEqWbHffSK+vlZw1rCchkpGC2BbXXIirOZokqWwA9HLAVqQhbJCw1ahVC70F2TephxR
	NIrkL9rGlEgyn3GY8D4yWriPJOcqH4b7wZ9VnV0iX7iTmK0IvuPYP8CI=
X-Google-Smtp-Source: AGHT+IE3ezJ4xa0Tql3aWVMl89qDDJ5xCqdkWR6wS8RdjtuKn9kSAsEvJabCRtqRaguCmRn0+gYpDm8klOi5Is6k3/8fyV/P7pR7
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a84:b0:3a7:e147:812f with SMTP id
 e9e14a558f8ab-3afee3c5b42mr31468565ab.12.1734093025013; Fri, 13 Dec 2024
 04:30:25 -0800 (PST)
Date: Fri, 13 Dec 2024 04:30:24 -0800
In-Reply-To: <00000000000046efb605fec3def0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675c28e0.050a0220.17d782.000d.GAE@google.com>
Subject: Re: [syzbot] [arm?] WARNING in delayed_work_timer_fn
From: syzbot <syzbot+e13e654d315d4da1277c@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_043027_196299_558E3F99 
X-CRM114-Status: UNSURE (   6.25  )
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    2e7aff49b5da Merge branches 'for-next/core' and 'for-next/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11ed5be8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=696fb014d05da3a3
dashboard link: https://syzkaller.appspot.com/bug?extid=e13e654d315d4da1277c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10192d44580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ef408f67fde3/disk-2e7aff49.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/414ac17a20dc/vmlinux-2e7aff49.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a93415d2a7e7/Image-2e7aff49.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e13e654d315d4da1277c@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 6023 at kernel/workqueue.c:2257 current_wq_worker kernel/workqueue_internal.h:69 [inline]
WARNING: CPU: 1 PID: 6023 at kernel/workqueue.c:2257 is_chained_work kernel/workqueue.c:2199 [inline]
WARNING: CPU: 1 PID: 6023 at kernel/workqueue.c:2257 __queue_work+0xe50/0x1308 kernel/workqueue.c:2256
Modules linked in:
CPU: 1 UID: 0 PID: 6023 Comm: klogd Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
pstate: 404000c5 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __queue_work+0xe50/0x1308 kernel/workqueue_internal.h:69
lr : current_wq_worker kernel/workqueue_internal.h:69 [inline]
lr : is_chained_work kernel/workqueue.c:2199 [inline]
lr : __queue_work+0xe50/0x1308 kernel/workqueue.c:2256
sp : ffff800080017b40
x29: ffff800080017b90 x28: dfff800000000000 x27: ffff700010002f88
x26: dfff800000000000 x25: ffff0000d1c63800 x24: 0000000000000008
x23: 1fffe0001b14d791 x22: ffff0000d1c639c0 x21: 0000000000000100
x20: ffff0000d8a6bc80 x19: ffff0000da2f0930 x18: 1fffe000366c5e7e
x17: ffff800123d64000 x16: ffff80008326d65c x15: 0000000000000002
x14: 1ffff00011f300ca x13: dfff800000000000 x12: 00000000b1aebe1c
x11: 00000000beaa9035 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000d8a6bc80 x7 : ffff8000805819c0 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001 x3 : ffff80008df6a320
x2 : ffff0000da2f0930 x1 : 0000000000000100 x0 : 0000000000000000
Call trace:
 current_wq_worker kernel/workqueue_internal.h:69 [inline] (P)
 is_chained_work kernel/workqueue.c:2199 [inline] (P)
 __queue_work+0xe50/0x1308 kernel/workqueue.c:2256 (P)
 current_wq_worker kernel/workqueue_internal.h:69 [inline] (L)
 is_chained_work kernel/workqueue.c:2199 [inline] (L)
 __queue_work+0xe50/0x1308 kernel/workqueue.c:2256 (L)
 delayed_work_timer_fn+0x74/0x90 kernel/workqueue.c:2485
 call_timer_fn+0x1b4/0x8b8 kernel/time/timer.c:1793
 expire_timers kernel/time/timer.c:1839 [inline]
 __run_timers kernel/time/timer.c:2418 [inline]
 __run_timer_base+0x59c/0x7b4 kernel/time/timer.c:2430
 run_timer_base kernel/time/timer.c:2439 [inline]
 run_timer_softirq+0xcc/0x194 kernel/time/timer.c:2449
 handle_softirqs+0x320/0xd34 kernel/softirq.c:554
 __do_softirq+0x14/0x20 kernel/softirq.c:588
 ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
 call_on_irq_stack+0x24/0x4c arch/arm64/kernel/entry.S:891
 do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:86
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0x1d8/0x544 kernel/softirq.c:655
 irq_exit_rcu+0x14/0x84 kernel/softirq.c:671
 __el1_irq arch/arm64/kernel/entry-common.c:561 [inline]
 el1_interrupt+0x38/0x68 arch/arm64/kernel/entry-common.c:575
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:580
 el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
 __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
 arch_local_irq_enable arch/arm64/include/asm/irqflags.h:48 [inline] (P)
 raw_spin_rq_unlock_irq kernel/sched/sched.h:1526 [inline] (P)
 finish_lock_switch+0xc0/0x1e4 kernel/sched/core.c:5123 (P)
 raw_spin_rq_unlock_irq kernel/sched/sched.h:1526 [inline] (L)
 finish_lock_switch+0xbc/0x1e4 kernel/sched/core.c:5123 (L)
 finish_task_switch+0x120/0x608 kernel/sched/core.c:5241
 context_switch kernel/sched/core.c:5372 [inline]
 __schedule+0x1748/0x27f0 kernel/sched/core.c:6756
 preempt_schedule_irq+0x80/0x188 kernel/sched/core.c:7078
 arm64_preempt_schedule_irq arch/arm64/kernel/entry-common.c:301 [inline]
 __el1_irq arch/arm64/kernel/entry-common.c:563 [inline]
 el1_interrupt+0x4c/0x68 arch/arm64/kernel/entry-common.c:575
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:580
 el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:596
 __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
 arch_local_irq_enable arch/arm64/include/asm/irqflags.h:48 [inline] (P)
 do_notify_resume+0x5c/0x1f4 arch/arm64/kernel/entry-common.c:133 (P)
 do_notify_resume+0x58/0x1f4 arch/arm64/kernel/entry-common.c:133 (L)
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
 el0_interrupt+0xc8/0x248 arch/arm64/kernel/entry-common.c:832
 __el0_irq_handler_common+0x18/0x24 arch/arm64/kernel/entry-common.c:837
 el0t_64_irq_handler+0x10/0x1c arch/arm64/kernel/entry-common.c:842
 el0t_64_irq+0x198/0x19c arch/arm64/kernel/entry.S:601
irq event stamp: 35689
hardirqs last  enabled at (35688): [<ffff80008b687f2c>] __exit_to_kernel_mode arch/arm64/kernel/entry-common.c:85 [inline]
hardirqs last  enabled at (35688): [<ffff80008b687f2c>] exit_to_kernel_mode+0xdc/0x10c arch/arm64/kernel/entry-common.c:95
hardirqs last disabled at (35689): [<ffff80008b6a9b44>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
hardirqs last disabled at (35689): [<ffff80008b6a9b44>] _raw_spin_lock_irq+0x28/0x70 kernel/locking/spinlock.c:170
softirqs last  enabled at (34558): [<ffff800080129934>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (35685): [<ffff800080020db4>] __do_softirq+0x14/0x20 kernel/softirq.c:588
---[ end trace 0000000000000000 ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

