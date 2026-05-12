Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9380CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 02:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/QGtzwCmqqwnunbQCdRaERUuzrE1eH9OvmwOqFeo0C4=; b=ByNSjXDYFaWpQ0aVcmLwaZ3jyf
	A7p6JvHm0VP/JumyRNDAEv0noH/yUAKiUgwLNDpcUsPqn/ifjP8eoYUUFgxzGRY9w89dpJdsP9BM/
	fVaiW0O46UOO3MfGBU89wGDUfyfynOgWInN+JigLBY8n84qAhIGUoHfDcsPr82fTsX9BNjUqxEzRU
	kO8baoBFC5IKt2rL+vSvVNuDIp6ZzK+ppJhGJqZOjhFlq1fD2k8/5OgVx+4/qr96AnjXiGODIEaZO
	4KXoFcZ63F5VO79szd2l/VZ+HL9zah3/JRfs4taNH0jgZn+RJby8uil0bf7HuBCWnrlHamDI0T+U7
	Cv4DMmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdFS-0000000FJ8T-0CRO;
	Tue, 12 May 2026 02:53:30 +0000
Received: from mail-ot1-f77.google.com ([209.85.210.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdFP-0000000FJ7w-3CD2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 02:53:29 +0000
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7dbbb806e10so10664315a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 19:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778554405; x=1779159205;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QGtzwCmqqwnunbQCdRaERUuzrE1eH9OvmwOqFeo0C4=;
        b=P8fugksBlJAledXjIfRVM6nRJ4kD0Prg/mP7IK3iWDqfbQkt5ijSmpLiWUmUoColHa
         flhbf8rk9x7F35x9CwzjzgSuMDB0wazDnI75qHteua3HOOq3VNhXAvpBYmKPAF8f55OE
         ZNd5KQ4OiE7Nl6g8MtaBLylIR14rhNmK9wD0T8obqFDLYL78ijK20POvvx8i5KEU/Jc4
         l9Sg/r488PM++HVBqdLH055KDmDdTvpxY94/jwdP5mTdFrzkJpkSASc/WJmW3kyjTfiW
         TM/A1TQN8cr52iKGjSDXJ6tWInffUuQ1c81gPZqe1/AEOZ3UmZOM/fdu8o0EblU3pgUi
         JsuA==
X-Forwarded-Encrypted: i=1; AFNElJ8fDR+ScA2kq3B+wqf2cpnAfE2f8+vnntnnlMPROVRyZ4uvfd7d+e+dg3qh80aOd1xlIS/VTdmtAg+v2UMPiitk@lists.infradead.org
X-Gm-Message-State: AOJu0YwY8Ex2xthRWlVoA4ZBClPYF/ESDW4puZRRu236vBG4kPd9oPro
	YlpF1Nfc0A2EvgGdZk3jI5lCCr+Y4VCjLezvYor3dracD4E/793E2N5pCmLe3kzGuyu+ZxErin3
	KCsx3TNG6WGCkDQ4QO2PDa1p2rjKmQ+kmZ4md+c+DouHSXGCuRvx5J2S6pHM=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c2c7:20b0:69b:5f97:de75 with SMTP id
 006d021491bc7-69b5f97def0mr1875587eaf.21.1778554405604; Mon, 11 May 2026
 19:53:25 -0700 (PDT)
Date: Mon, 11 May 2026 19:53:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a029625.050a0220.14e4b1.0004.GAE@google.com>
Subject: [syzbot] [arm?] WARNING in delayed_work_timer_fn (2)
From: syzbot <syzbot+48fc5b35b350240fd465@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_195327_817758_0185E7B6 
X-CRM114-Status: UNSURE (   7.58  )
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

HEAD commit:    5cbb61bf4168 arm64/fpsimd: ptrace: zero target's fpsimd_st..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10e45a73980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a834c6344141a58b
dashboard link: https://syzkaller.appspot.com/bug?extid=48fc5b35b350240fd465
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/04156ec16593/disk-5cbb61bf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6bfa041e2c79/vmlinux-5cbb61bf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a92d82d8a79e/Image-5cbb61bf.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48fc5b35b350240fd465@syzkaller.appspotmail.com

------------[ cut here ]------------
workqueue: cannot queue hci_cmd_timeout on wq hci4
WARNING: kernel/workqueue.c:2298 at __queue_work+0xf6c/0x12f8 kernel/workqueue.c:2296, CPU#1: syz.3.1091/10273
Modules linked in:
CPU: 1 UID: 0 PID: 10273 Comm: syz.3.1091 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __queue_work+0xf6c/0x12f8 kernel/workqueue.c:2296
lr : __queue_work+0xf6c/0x12f8 kernel/workqueue.c:2296
sp : ffff80008e8e7b10
x29: ffff80008e8e7b50 x28: dfff800000000000 x27: ffff700011d1cf84
x26: ffff0000c9d69800 x25: 0000000000000008 x24: ffff0000c9d699c0
x23: dfff800000000000 x22: ffff0000db3fba08 x21: 0000000000000100
x20: ffff800089f06000 x19: ffff0000d915ca70 x18: 1fffe00035c25820
x17: ffff8001258ac000 x16: ffff80008e8e0000 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000001f53 x10: 0000000000ff0100 x9 : 48aa0a8f34ab2700
x8 : 48aa0a8f34ab2700 x7 : ffff8000804886d0 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff8000802f13b0
x2 : 0000000000000101 x1 : ffff0000db3fba00 x0 : 0000000000000000
Call trace:
 __queue_work+0xf6c/0x12f8 kernel/workqueue.c:2296 (P)
 delayed_work_timer_fn+0x74/0x90 kernel/workqueue.c:2527
 call_timer_fn+0x19c/0xa4c kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1794 [inline]
 __run_timers kernel/time/timer.c:2374 [inline]
 __run_timer_base+0x554/0x74c kernel/time/timer.c:2386
 run_timer_base+0x84/0x1b8 kernel/time/timer.c:2395
 run_timer_softirq+0x20/0x48 kernel/time/timer.c:2405
 handle_softirqs+0x2e4/0xd34 kernel/softirq.c:622
 __do_softirq+0x14/0x20 kernel/softirq.c:656
 ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:68
 call_on_irq_stack+0x30/0x48 arch/arm64/kernel/entry.S:889
 do_softirq_own_stack+0x20/0x2c arch/arm64/kernel/irq.c:73
 invoke_softirq kernel/softirq.c:503 [inline]
 __irq_exit_rcu+0x1ac/0x428 kernel/softirq.c:735
 irq_exit_rcu+0x14/0x84 kernel/softirq.c:752
 __el1_irq arch/arm64/kernel/entry-common.c:497 [inline]
 el1_interrupt+0x40/0x60 arch/arm64/kernel/entry-common.c:509
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:514
 el1h_64_irq+0x6c/0x70 arch/arm64/kernel/entry.S:590
 __daif_local_irq_restore arch/arm64/include/asm/irqflags.h:175 [inline] (P)
 arch_local_irq_restore arch/arm64/include/asm/irqflags.h:195 [inline] (P)
 __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:178 [inline] (P)
 _raw_spin_unlock_irqrestore+0x44/0x98 kernel/locking/spinlock.c:198 (P)
 spin_unlock_irqrestore include/linux/spinlock.h:408 [inline]
 __wake_up_common_lock+0x5c/0x78 kernel/sched/wait.c:127
 __wake_up_sync_key+0x20/0x2c kernel/sched/wait.c:192
 __unix_dgram_recvmsg+0x2bc/0x898 net/unix/af_unix.c:2612
 unix_dgram_recvmsg+0xcc/0xe4 net/unix/af_unix.c:2686
 sock_recvmsg_nosec+0x90/0xe8 net/socket.c:1137
 ____sys_recvmsg+0x4f8/0x604 net/socket.c:2916
 ___sys_recvmsg+0x16c/0x1f4 net/socket.c:2960
 do_recvmmsg+0x2a8/0x7e8 net/socket.c:3055
 __sys_recvmmsg+0x1e0/0x270 net/socket.c:3129
 __do_sys_recvmmsg net/socket.c:3152 [inline]
 __se_sys_recvmmsg net/socket.c:3145 [inline]
 __arm64_sys_recvmmsg+0xd0/0xf8 net/socket.c:3145
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
irq event stamp: 1293
hardirqs last  enabled at (1292): [<ffff80008030866c>] handle_softirqs+0x1cc/0xd34 kernel/softirq.c:606
hardirqs last disabled at (1293): [<ffff800086743ef0>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:140 [inline]
hardirqs last disabled at (1293): [<ffff800086743ef0>] _raw_spin_lock_irq+0x28/0x70 kernel/locking/spinlock.c:174
softirqs last  enabled at (24): [<ffff800080139e6c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (1291): [<ffff8000800204b0>] __do_softirq+0x14/0x20 kernel/softirq.c:656
---[ end trace 0000000000000000 ]---
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available
IPVS: lc: UDP 224.0.0.2:0 - no destination available


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

