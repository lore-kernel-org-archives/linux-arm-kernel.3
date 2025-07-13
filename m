Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8EEC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 01:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5KYu7kvPbnFBl2H27Mp1FgBe7+XHwEpS35yIEIH8+q0=; b=Sn97Zc0fB91VvEiuJBYkkcZjmx
	khY2hRFwfjkl/f3bHN1euMlit2dVPQxamJ0psoAMBadKIZ8GUl1fbgtdD8/TOH5pVTO/n6BdN4Ca5
	WApfCJTl2abF6QDz5JMQhBS6+p6bYd66LlxlHd6dBzmJryqSt4RqSDq4r62mKdTvVaBwwNK4xB43M
	Kp+kBNX8QLYJzMvAKp+YK9SqMWkYmj41wtThqFPoJoq5Un095MueOTAzm4yQ9XEP68QD+HNGf8+HX
	7554RXKnyKVPzaXMz375e5raSRndRgFAV+Deu1ogmNbLwsVSwZ6Psfq5S8i9H0tHHaZBizj4GwpyM
	wocy20Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ualow-0000000HFe8-2dgw;
	Sun, 13 Jul 2025 01:48:02 +0000
Received: from mail-io1-f78.google.com ([209.85.166.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ualmX-0000000HFZd-1YfL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 01:45:34 +0000
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-876a8bb06b0so605728039f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 18:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752371131; x=1752975931;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KYu7kvPbnFBl2H27Mp1FgBe7+XHwEpS35yIEIH8+q0=;
        b=mRVpF0oBCK/9qbV7VqINZjjlgd5w4XZOLLEi9qTXAPPrw5Mpj2S1JThIDHFAP6wyI3
         +VKqCAOqVBRzz3HJQuwLtk4KZTRpG+xDNucV9rX/w1MpaVxsWBhslb3V/aQz1QVPApFB
         9TuRVV+nCBXp6BilSgfFp5TIyZMCXGmXxYMaYVMVb/itC7aIJCTF7uyTRvtpSRYv+jb8
         xJhllN0CqVNamrwuAeZMhciJFA5yekUzQRVHLFli8TRuurU/3iYSpNdwe3Bohpk/f8ZC
         BP8Bxsbk5PD5hVX9JAp7UxGkI3wKfcxFqIpcV1uVHZZmP8VZQAbWTB5+ESiosyaMFvN+
         Ev4w==
X-Forwarded-Encrypted: i=1; AJvYcCUbZH8p90krbXlNMBw/JNReBHtUbdEiEWkUSAprd6Lx5+/Q5W8MhHCsf4jA30IjwKRe8p7ebjdPAkS1QUyLQk4A@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJFDaElJUc9ljAdzaZWxR4ssNaiXdij1WqQToLcTG4k6g+p+5
	PGrvgxd2Ac6HGujTnNZL/WvOKtS4hYCbp+IWvl/2Z0EryJU87W0TAkE1mro+L5NBkph7LleIXuj
	Z17HA8tL+ZHzax9FOQ4+RJ/qRDxxQWelKkj6gVyWqikeOSgSuHYlFGkvtcAg=
X-Google-Smtp-Source: AGHT+IG9ACa4nl2F7Dncd1ZLo1PjOlBkrioceOUwRFcDhYkili36jGeqjT/qkPP9NY3LonOExrSipKOwt0a6NWSajCh84qctgzbw
MIME-Version: 1.0
X-Received: by 2002:a05:6602:15c6:b0:875:d450:9297 with SMTP id
 ca18e2360f4ac-87977f735e1mr991684039f.5.1752371131633; Sat, 12 Jul 2025
 18:45:31 -0700 (PDT)
Date: Sat, 12 Jul 2025 18:45:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68730fbb.a70a0220.3b380f.001a.GAE@google.com>
Subject: [syzbot] [kvmarm?] WARNING in pend_sync_exception
From: syzbot <syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_184533_413831_45A41D4A 
X-CRM114-Status: UNSURE (   7.66  )
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

HEAD commit:    15724a984643 Merge branch 'kvm-arm64/doublefault2' into kv..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=13e26a8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=82bd3cd421993314
dashboard link: https://syzkaller.appspot.com/bug?extid=4e09b1432de3774b86ae
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17137582580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e26a8c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-15724a98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ec0f03d375a1/vmlinux-15724a98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a36232f8c6dd/Image-15724a98.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 3595 at arch/arm64/kvm/inject_fault.c:63 pend_sync_exception+0x198/0x5ac arch/arm64/kvm/inject_fault.c:63
Modules linked in:
CPU: 0 UID: 0 PID: 3595 Comm: syz.2.16 Not tainted 6.16.0-rc3-syzkaller-g15724a984643 #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 81402009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : pend_sync_exception+0x198/0x5ac arch/arm64/kvm/inject_fault.c:63
lr : pend_sync_exception+0x198/0x5ac arch/arm64/kvm/inject_fault.c:63
sp : ffff80008e7378c0
x29: ffff80008e7378c0 x28: 0000000000000063 x27: 63f000001d7702a8
x26: 0000000000000063 x25: 0000000000000000 x24: 0000000000000000
x23: 0000000000000000 x22: 0000000000000063 x21: 63f000001d770e81
x20: 0000000000000007 x19: efff800000000000 x18: 0000000000000000
x17: 0000000000000041 x16: ffff800080011d9c x15: 00000000200000c0
x14: ffffffffffffffff x13: 0000000000000028 x12: 00000000000000cc
x11: ccf000001d756de4 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ccf000001d755880 x7 : ffff800080b08704 x6 : ffff80008e737a88
x5 : ffff80008e737a88 x4 : 0000000000000001 x3 : ffff8000801a2e80
x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
Call trace:
 pend_sync_exception+0x198/0x5ac arch/arm64/kvm/inject_fault.c:63 (P)
 inject_abt64 arch/arm64/kvm/inject_fault.c:115 [inline]
 __kvm_inject_sea+0x268/0x96c arch/arm64/kvm/inject_fault.c:207
 kvm_inject_sea+0x98/0x72c arch/arm64/kvm/inject_fault.c:229
 kvm_inject_sea_dabt arch/arm64/include/asm/kvm_emulate.h:54 [inline]
 __kvm_arm_vcpu_set_events+0x134/0x238 arch/arm64/kvm/guest.c:847
 kvm_arm_vcpu_set_events arch/arm64/kvm/arm.c:1698 [inline]
 kvm_arch_vcpu_ioctl+0xed8/0x16b0 arch/arm64/kvm/arm.c:1810
 kvm_vcpu_ioctl+0x5c4/0xc2c virt/kvm/kvm_main.c:4632
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x18c/0x244 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x160 arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 2626
hardirqs last  enabled at (2625): [<ffff80008653cb88>] __raw_read_unlock_irqrestore include/linux/rwlock_api_smp.h:241 [inline]
hardirqs last  enabled at (2625): [<ffff80008653cb88>] _raw_read_unlock_irqrestore+0x44/0xbc kernel/locking/spinlock.c:268
hardirqs last disabled at (2626): [<ffff800086517e08>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (2576): [<ffff8000800c988c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (2574): [<ffff8000800c9858>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---


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

