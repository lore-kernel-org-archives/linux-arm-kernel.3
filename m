Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD45CEB2F7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hh84L/w/M4L5E9rl0NqJcCUd9TshzOxlJPaXwCeAvmw=; b=ICepaFOv9VYzV4oBBZ217jiA/x
	4Tmp6G4jKnSO2ng9gDWXU5FM2HoXZiRcqaP2aUzRJ1Vjk8l/Y/6xWIp4NcmMVJgXUuKUqdsfOu20m
	eoDjrpSGrQWYnaLEb0WVSRq9+4inyXf7pTpJ04T7u0a27ojkeBFzJGf+HfncrQRQ0JhqdLeneBrRW
	RgFLrWIod5sVAVGlrqJLtKcq0s8a2luyplpvmIXn10wkcftUlLjkEVbWw5NElJiD/ZGYJdFpYM/Nt
	hoMnWhEP38+41A3zyI867y6WcnXwLAofjQMYC+s8n/lBzRFRHIiu7LSgE0eXBRrt0/QZJoER8+Kn4
	zHjO9HLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKLUa-0000000E09U-3Oju;
	Sat, 15 Nov 2025 18:59:24 +0000
Received: from mail-il1-f208.google.com ([209.85.166.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKLUX-0000000E096-30dB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 18:59:22 +0000
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-43376637642so33327425ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 10:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763233160; x=1763837960;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hh84L/w/M4L5E9rl0NqJcCUd9TshzOxlJPaXwCeAvmw=;
        b=upJzkAGJhmtHfBao7+h4HobyltOzSJmxAJdbGOLTFOs6zPjYX2jmthG+W1qpG6eJJ7
         MgYZXlD0hq/FLjysCHWUM7KZBe6qv/35TM3dgY2ZKPHkUiziPcJfDGEioGUjU6bvidKo
         n78/W76m6S+KnaR30VWY7Ym2qM+T9yQtQ3hEiozo7ftGcSFjr7goMa1EkBSp/1+LFmjR
         0TN2U9LfzSm3r8XZmQlHNqMxHnL212vmTfEDTAC5HbqBi42uVIwh+Tdnk6DpmzSuV0ON
         Ijg3kqJ9xzHisDIi22bCdPkO3KrsHyhQac63GEGoIQvUK5EfmhcsWDAyRMIja2BCjGXx
         1EiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr18wbGe6t6ewExCrJsS7H7KAN3BNByuA/YE/cpmjJ5gny9c51rrb99zRO7QnZUVlIR3BSOeo8NDQ4S3+5M+wD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/9/iJfsuvY7yLEfsiUrAtK4b+ThUFyJOXeahLNsfPJ3eG0iLx
	XLXx7RSWUGfjb80OboDynh0+6HQb9u1JLa+OpPNSGEDxWE+hQA59DSowXzHwqVFqxn7lLLRcwNb
	KsKaiyiYeIt5Y9dT4eYkph+4AxyMbZ2QNjxPJfQOJf+/Au4H7zUD3IgJisZQ=
X-Google-Smtp-Source: AGHT+IGAjUvEoAFE5aGheWc9M4XVW88LXL6etrr+P8QM9EJ8eCbbKXLDOA9ojzUpcKBx8dfM+EIEwdm7N+3dwWg4mQ1Ob7M0Ai2M
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188f:b0:432:f3b:a809 with SMTP id
 e9e14a558f8ab-4348c94e420mr103669645ab.26.1763233160174; Sat, 15 Nov 2025
 10:59:20 -0800 (PST)
Date: Sat, 15 Nov 2025 10:59:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6918cd88.050a0220.1c914e.0044.GAE@google.com>
Subject: [syzbot] [kvmarm?] WARNING in kvm_set_vm_id_reg
From: syzbot <syzbot+c4aef6558d0cd90fe378@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, oupton@kernel.org, 
	suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_105921_764589_56287753 
X-CRM114-Status: UNSURE (   8.26  )
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

HEAD commit:    7a0892d2836e Merge tag 'pci-v6.18-fixes-5' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12c56884580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bbf220ce32df0361
dashboard link: https://syzkaller.appspot.com/bug?extid=c4aef6558d0cd90fe378
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=139c77cd980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d6a914580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-7a0892d2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e83411b74df6/vmlinux-7a0892d2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/135caed64c95/Image-7a0892d2.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c4aef6558d0cd90fe378@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 3583 at arch/arm64/kvm/sys_regs.c:2353 kvm_set_vm_id_reg+0x60/0xf4 arch/arm64/kvm/sys_regs.c:2348
Modules linked in:
CPU: 1 UID: 0 PID: 3583 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: a1402009 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : kvm_set_vm_id_reg+0x60/0xf4 arch/arm64/kvm/sys_regs.c:2353
lr : kvm_finalize_sys_regs+0x88/0x244 arch/arm64/kvm/sys_regs.c:5616
sp : ffff800089543ab0
x29: ffff800089543ab0 x28: f6f00000121c12c0 x27: 0000000000000000
x26: 0000000000000000 x25: f1f00000085d8000 x24: 0000000000000000
x23: f1f00000085d8048 x22: 0000000000000000 x21: f9ff800083e0dbd0
x20: f9ff800083e0d000 x19: f1f00000085d8000 x18: 00000000ffffffff
x17: 0000000000000000 x16: 0000000000000000 x15: ffff800089543a90
x14: ffff800089543d98 x13: ffff800089543d5a x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000078
x8 : ffff800089543da8 x7 : f0f0000004469ffc x6 : 0000000000000077
x5 : f6f00000121c12c0 x4 : 0000000000000001 x3 : f9ff800083e0dd18
x2 : 1101001020110222 x1 : 0000000000000000 x0 : f9ff800083e0d000
Call trace:
 kvm_set_vm_id_reg+0x60/0xf4 arch/arm64/kvm/sys_regs.c:2348 (P)
 kvm_finalize_sys_regs+0x88/0x244 arch/arm64/kvm/sys_regs.c:5616
 kvm_arch_vcpu_run_pid_change+0x8c/0x36c arch/arm64/kvm/arm.c:857
 kvm_vcpu_ioctl+0x7f8/0x878 virt/kvm/kvm_main.c:4464
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __arm64_sys_ioctl+0xac/0x104 fs/ioctl.c:583
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x48/0x110 arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x1c/0x28 arch/arm64/kernel/syscall.c:151
 el0_svc+0x34/0x10c arch/arm64/kernel/entry-common.c:746
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:765
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:596
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

