Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE8CE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k7Ohw9FdZun9tCxVR+V58AxTTwpDnpaw4I4rebrkACs=; b=DE4gxtrwh5s9M7sNKhGrnmXkKK
	3qY77BRJ64iSdvm1z0hleFR715YTjAZH9iNnoUdNtrVKLWm7suc/x2cLr4c725AL4yKHlbDl/+nJN
	SDbo5bupjNPw3VnyxbkJRExnO/kaRKFd7fLajvOzJaNTJuo73e7XjmHOAGRRns26UcM4G4LE/8hXS
	Wvv8Oi/ZVXyL6HOQ6l8RJZ/JF6JqAUdM9YfZr9vaET6Y6Xhx+nCEHzJxfxE7r/xfML/k6MZ8FSr84
	l6Giv5pxz+Fwq2lDYK0EgtOSiNt7eyVIyPvO/K5D7p48jlg/Eh5OQwhdN222HiFO/2tFmGmWObca5
	yoOUbVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUUv-0000000D3ib-1aVq;
	Tue, 17 Dec 2024 10:08:13 +0000
Received: from mail-il1-f207.google.com ([209.85.166.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUBm-0000000CzJP-1yRi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:48:27 +0000
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a819a4e83dso56115665ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428904; x=1735033704;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7Ohw9FdZun9tCxVR+V58AxTTwpDnpaw4I4rebrkACs=;
        b=w7SvTWPyNyhpm+64uIW1ytBhOXE0huKYa5d8hRY66TT7aJHiUaNqFUKOGzXrIdelIZ
         yQnNcrbjkdHTSXTwFfzO6JBvtC/TwUQOyGQ325hYQFcJRGNAESnsdFMtJqcU4nB169q/
         06p+tfcWF9yiVldjz+eKR/ysggZqhEDj4gzTBF9dABH26jqHg//ryjv13y98rGkV1iW9
         tbnQEzy+NuWsaxUvlzjxeSf17K35YyfACAOqWh9dPaMS0U0R2m58q+uKcdytzoMvEyUo
         9evXmngrv9wyDo1BEy2VDCD4T7cL+is1Pgx9GQ0YUQqs542crSFxRbeGB/DChvEVtXbb
         k2gA==
X-Forwarded-Encrypted: i=1; AJvYcCUINEHl6wIXxNKA4ukE7mbEJp7wbowDyZHzvaGjN3RN7BgSit4RB7XdRCyVIVu6OJHM/jZEsnT/xJ5iiM+TSH2Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxjKMkPXTRYFZ2y8Lgqf2Zt8VtrbUA/g7NcMz/OO+ehIyv7H58R
	leKZ3ipFyPmpV9iMl7k+huiwliuGbJLD7rg9OXq6xWOe6PBl1922QIeQT5auE4sb6o3z4pI8vPR
	j3B5TgV8BPKd6eL0qG+W48jzwvT6XSOiEKUQBMwki/Pmvb2MAEzyyASs=
X-Google-Smtp-Source: AGHT+IHI9tYk8oBynelfPrOkch9cOquRNVuGZrHan+16Hk0hGAubvsg8DCIGxrVhoM/XYZRyY38tAlmP5tjN4bfiN2UpHZ89frcW
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1905:b0:3a0:c820:c5f0 with SMTP id
 e9e14a558f8ab-3aff9256d09mr175850255ab.24.1734428904148; Tue, 17 Dec 2024
 01:48:24 -0800 (PST)
Date: Tue, 17 Dec 2024 01:48:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676148e8.050a0220.37aaf.0158.GAE@google.com>
Subject: [syzbot] [kvmarm?] BUG: unable to handle kernel paging request in vgic_its_set_attr
From: syzbot <syzbot+62e8b837d5ec5953c8e2@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_014826_508248_592F9E39 
X-CRM114-Status: UNSURE (   7.88  )
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

HEAD commit:    5db899a34f75 Merge remote-tracking branch 'kernel/kvmarm/n..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fuzzme
console output: https://syzkaller.appspot.com/x/log.txt?x=148b6a0f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fde68ab6d6c8c8ab
dashboard link: https://syzkaller.appspot.com/bug?extid=62e8b837d5ec5953c8e2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-5db899a3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4938b757ff4a/vmlinux-5db899a3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/936938b47987/Image-5db899a3.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62e8b837d5ec5953c8e2@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address efff800000000001
KASAN: null-ptr-deref in range [0x0000000000000010-0x000000000000001f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
swapper pgtable: 4k pages, 52-bit VAs, pgdp=0000000044a53000
[efff800000000001] pgd=1000000049992003, p4d=1000000049993003, pud=0000000000000000
Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 UID: 0 PID: 5975 Comm: syz.1.647 Not tainted 6.12.0-rc7-syzkaller-g5db899a34f75 #0
Hardware name: linux,dummy-virt (DT)
pstate: 60402009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __hwasan_check_x0_67043362+0x4/0x30
lr : vgic_its_save_ite arch/arm64/kvm/vgic/vgic-its.c:2101 [inline]
lr : vgic_its_save_itt arch/arm64/kvm/vgic/vgic-its.c:2204 [inline]
lr : vgic_its_save_device_tables arch/arm64/kvm/vgic/vgic-its.c:2353 [inline]
lr : vgic_its_save_tables_v0+0x258/0x634 arch/arm64/kvm/vgic/vgic-its.c:2573
sp : ffff80008bd17be0
x29: ffff80008bd17c30 x28: 6cf0000019180180 x27: 5bf000001952a880
x26: 0000000000000008 x25: 0000000000000000 x24: 0000000000000000
x23: 07f000001952a8c0 x22: 07f000001952a8d0 x21: 00000000c0030000
x20: 07f000001952a8d0 x19: efff800000000000 x18: 00000000000000e8
x17: 0000000000000000 x16: 0000000000000001 x15: 0000000000000000
x14: 000000000002061b x13: 0000000000000000 x12: 0000000001fbb6cb
x11: 0000000000000000 x10: 0000000000002000 x9 : efff800000000000
x8 : 0000000020000000 x7 : ffff8000800fc528 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 8df00000195be2f0 x3 : 0000000000000008
x2 : ffff8000800fc5a4 x1 : 0000000000000000 x0 : 0000000000000010
Call trace:
 __hwasan_check_x0_67043362+0x4/0x30
 vgic_its_set_attr+0x394/0x508 arch/arm64/kvm/vgic/vgic-its.c:2736
 kvm_device_ioctl_attr+0x150/0x18c virt/kvm/kvm_main.c:4721
 kvm_device_ioctl+0x154/0x1b0
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x108/0x184 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x78/0x1b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x1b0 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x40/0x50 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x14c arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
Code: a90efbfd d2800401 143a3edf 9344dc10 (38706930) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	a90efbfd 	stp	x29, x30, [sp, #232]
   4:	d2800401 	mov	x1, #0x20                  	// #32
   8:	143a3edf 	b	0xe8fb84
   c:	9344dc10 	sbfx	x16, x0, #4, #52
* 10:	38706930 	ldrb	w16, [x9, x16] <-- trapping instruction


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

