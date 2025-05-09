Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ADAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKYKV/yff+j42RTk2qZcwb9+n6iBZSUwVqOYZn/7YK0=; b=VHeHEH4fmvZT+leYF2ZsyeYA0z
	QxEV8RshujJN+HSv+tNhsPA2qqqy0LgU6TX6I3ecmev0UoCwcQFpvK6h7R4MFxShSz+vUqtzPMGTJ
	4a9/ZL22dexrBq+8DemTJ7Km6z19a7vnIaIRBszq2EQLVvpu0gI1umstG2SrVERRtrHdYDc3Awpgt
	O395O/79BVCDIxkcnSEGjfMI9XJ2hu3io+pIJ5nZgYO3utiA4GI1LM2wuGH1CGsPw8KrXPzSKL5nG
	Y94RYkrVNEtvH32dZfkY52ELc5atIsj43I0nUhWtlLtPS47Cwof3EOWY1VFpXG0LTpG7uLCZgX6Ql
	mQh+qkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDO4o-00000003pT7-1kmw;
	Fri, 09 May 2025 13:47:46 +0000
Received: from mail-il1-f207.google.com ([209.85.166.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNCK-00000003e2Y-13pV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:51:31 +0000
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3da75d30a36so23788205ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 05:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746795086; x=1747399886;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKYKV/yff+j42RTk2qZcwb9+n6iBZSUwVqOYZn/7YK0=;
        b=f9McA0qBTbdS8HRkshu1E5z2booyotO9fbk+Zp/IrSrXUtp5rMJJ1xTKKMRfwfbJ8k
         Yyefho/tJpKYK9k70MCp5QA/ZvYxIs+dGn1L7XAf/3eSIuBOItYMAsMy/II7WPDFyknj
         sWWlpAjRceih+HvLu3gjTnCJUs3lVEpeXPv53dwe3xlgdQcwOlLQ/0AwRHIyBgDCCvfz
         gPLYd46MweX+Z8NDyvCc1m3+0ykaJhNi5s4afC98RzxvqduNhQu2NKqar7vBNCGV9xST
         RaAVgKwd1YVpv0gBmrf5HfWcfvsjawUiJOVN5rtcKLzyAdOdINTA0nMIHQv1nxtPIAnc
         GifA==
X-Forwarded-Encrypted: i=1; AJvYcCXexmN533Gl4Q7fUjF2sYyi3YeqYFXS3Q6g4kgZ18VzWpM5C7ie24pbJPGfTtquF6I2kbTMkhCcz28nDJxnisaT@lists.infradead.org
X-Gm-Message-State: AOJu0YwYAglA1W9IBZP0rFIROjWV46Bby383PcZ/rYlcucpsj9YeEPaN
	q3s8a/CZSumYLo7tD1x4XPnt+/m0duLRfvgGl6a/KwJQIc3Ok9ckyzuDwrdgFd3MSm3cd8QwKlr
	bl2hgdLLOype0vBD4ILYCTRX7gxkunVvAoaKpD3HiGaEFdLlbvd1GZok=
X-Google-Smtp-Source: AGHT+IFYT54CJFYDlmecRr9rSz4DarOdIA1mhDXTAdmBbLSjqE4WZorAtiD9t1T3wFZDmZRYb+cqJgK6Nkj+sDyZYG5aBS9iVnlj
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2509:b0:3d4:6ff4:261e with SMTP id
 e9e14a558f8ab-3da7e1645b1mr40251325ab.0.1746795086663; Fri, 09 May 2025
 05:51:26 -0700 (PDT)
Date: Fri, 09 May 2025 05:51:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681dfa4e.050a0220.a19a9.0131.GAE@google.com>
Subject: [syzbot] [kvm?] [kvmarm?] BUG: unable to handle kernel paging request
 in vgic_its_save_tables_v0
From: syzbot <syzbot+4ebd710a879482a93f8f@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_055128_291397_1B5B9788 
X-CRM114-Status: UNSURE (   8.05  )
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
console output: https://syzkaller.appspot.com/x/log.txt?x=11d634f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f705363127f7638
dashboard link: https://syzkaller.appspot.com/bug?extid=4ebd710a879482a93f8f
compiler:       Debian clang version 20.1.3 (++20250415083350+2131242240f7-1~exp1~20250415203523.103), Debian LLD 20.1.3
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1437c4d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f84768580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-c4e91ea0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7ecf29c15547/vmlinux-c4e91ea0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/59a7b6f25d98/Image-c4e91ea0.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4ebd710a879482a93f8f@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address ffef800000000001
KASAN: maybe wild-memory-access in range [0xff00000000000010-0xff0000000000001f]
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
[ffef800000000001] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 3370 Comm: syz-executor338 Not tainted 6.15.0-rc4-syzkaller-gc4e91ea0cc7e #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 61402009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : vgic_its_save_ite arch/arm64/kvm/vgic/vgic-its.c:2145 [inline]
pc : vgic_its_save_itt arch/arm64/kvm/vgic/vgic-its.c:2248 [inline]
pc : vgic_its_save_device_tables arch/arm64/kvm/vgic/vgic-its.c:2394 [inline]
pc : vgic_its_save_tables_v0+0x3e0/0xe38 arch/arm64/kvm/vgic/vgic-its.c:2614
lr : compute_next_eventid_offset arch/arm64/kvm/vgic/vgic-its.c:2061 [inline]
lr : vgic_its_save_ite arch/arm64/kvm/vgic/vgic-its.c:2142 [inline]
lr : vgic_its_save_itt arch/arm64/kvm/vgic/vgic-its.c:2248 [inline]
lr : vgic_its_save_device_tables arch/arm64/kvm/vgic/vgic-its.c:2394 [inline]
lr : vgic_its_save_tables_v0+0x37c/0xe38 arch/arm64/kvm/vgic/vgic-its.c:2614
sp : ffff80008ecd7bf0
x29: ffff80008ecd7c70 x28: 66f00000123bb4f0 x27: 0000000000000000
x26: 000000000000002e x25: 00000000fffffdfd x24: ccf0000013a2ac40
x23: 66f00000123bb438 x22: edf0000013a2a4d0 x21: edf0000013a2a4d0
x20: cdf0000012236600 x19: efff800000000000 x18: 0000000000000000
x17: 0000000000000032 x16: ffff800080011d9c x15: 0000000020000300
x14: 0000000000000000 x13: fff0000015703b08 x12: 0ff0000000000001
x11: 0000000000000010 x10: 0000000000002000 x9 : 0000000000000000
x8 : 0000000000000000 x7 : ffff80008021fbf4 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff800080158ffc
x2 : ffff80008021fc70 x1 : edf0000013a2a4d0 x0 : 0000000000000000
Call trace:
 vgic_its_save_ite arch/arm64/kvm/vgic/vgic-its.c:2145 [inline] (P)
 vgic_its_save_itt arch/arm64/kvm/vgic/vgic-its.c:2248 [inline] (P)
 vgic_its_save_device_tables arch/arm64/kvm/vgic/vgic-its.c:2394 [inline] (P)
 vgic_its_save_tables_v0+0x3e0/0xe38 arch/arm64/kvm/vgic/vgic-its.c:2614 (P)
 vgic_its_ctrl arch/arm64/kvm/vgic/vgic-its.c:-1 [inline]
 vgic_its_set_attr+0x544/0x828 arch/arm64/kvm/vgic/vgic-its.c:2777
 kvm_device_ioctl_attr virt/kvm/kvm_main.c:4639 [inline]
 kvm_device_ioctl+0x354/0x418 virt/kvm/kvm_main.c:-1
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
Code: 9100412b b2481d69 d344fd2c d378fd69 (386c6a6c) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	9100412b 	add	x11, x9, #0x10
   4:	b2481d69 	orr	x9, x11, #0xff00000000000000
   8:	d344fd2c 	lsr	x12, x9, #4
   c:	d378fd69 	lsr	x9, x11, #56
* 10:	386c6a6c 	ldrb	w12, [x19, x12] <-- trapping instruction


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

