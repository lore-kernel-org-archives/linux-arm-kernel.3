Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D78CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Vi8P1TS2Ynjge+umvIGVgtajiUURacZtN0BcVRDn4bw=; b=HYN8FzfRLKhtQY
	4kdUIYj/VJYEdbWeIoYvcbbwjI+cS9HIQk9rjjzdz9U8o0GNF956fFZx/+2ckooN8KAP1Nk1uIoi1
	jC3iaCrNTt/bIHIz7GaWVCcs7h6SSshj5GbCbLDQiPAvkr7s4IEh3z9vRvuy40kgYMdfovlCa6DId
	ETcTcfNjhj1YtgRNe7ZHLGT9mUDUnIZeR1FUWOKXFaOEkaxq/pUAY8V/ovMEKP4zYDjZiA2WH9ER7
	ZHKOEwPwyCayw6FUhXHMBqLAzky0Df05RUGuXlq1/tP5uHIpnTy44DQtzBTOwgL7H4yWfwEeCG9N8
	ZF+y9aCb7K2ji2V8/86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6Fy-0000000AVN2-1iII;
	Tue, 09 Sep 2025 21:52:06 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6Fw-0000000AVLl-1IqE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:52:05 +0000
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-889b4271f6dso321726039f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757454723; x=1758059523;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi8P1TS2Ynjge+umvIGVgtajiUURacZtN0BcVRDn4bw=;
        b=IzNc1I5wVxVgnVbn4AI8onSZwD7tWA+m8VTLNv9Shxb1yYJ0u0IXuyvvcPmJFs4hIR
         CbgsLq11s6G7SdF3alySz1lea2+YEBe59FxpPaT4AqqYHiMbrPJRdyV2LA5vgTDb+Tm8
         UfLiRpFCmK2QkAAlmD/MXYUDimhTL9m2qU+FBu7D/ZDqpgkIeB4WfGLIfL7tohOUq8tn
         J0xgpSg/T7NQBfAhgdgiSWYkniPxVrjI1c8DbOfE37AKQqAcPrH7EzVz5zORbjK1n1R/
         h4hyw0H+KE5OvQhnoETgVPEW21zQVpkm56npOy+XDZoQYzrcKSVXzY4LubocqVTk9SN0
         UCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTs6+dMkN5h5a+CLSEpaINdiREV/Mgg5+GU8zT7W132WKhnNyKrx/453mqRnCk6cKMzNGZhYE1SYIe27sW+qeI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy/PjYUwmFdbcmCVrDgJz3ZAM7BQ3bPNft82V59PiZXi2/Mj/2
	7VxuCv+FijMmtcmZWYvq2z8r5mo7b8YbxoVy1Asrr9KOGdx72njnHFtcYXK54+9meglDSaUroVe
	k3laFP9mVd64aHphJy1dgiWpOoCwRbN1/thytiALxrG4P60aUsQH9ezdXS/k=
X-Google-Smtp-Source: AGHT+IFXhUfwBgzOgjvRLI1Zl8rHtjLLfyTQ/RQcAwkLXAYWLhRa9IKYEjD/7YhyjehBc09jkchZNISGDCiy4EOVAqzjhhpcxsDC
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2198:b0:405:b792:32f0 with SMTP id
 e9e14a558f8ab-405b79234cemr140795505ab.32.1757454722899; Tue, 09 Sep 2025
 14:52:02 -0700 (PDT)
Date: Tue, 09 Sep 2025 14:52:02 -0700
In-Reply-To: <aMCaeA5qKzPbKwLt@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c0a182.050a0220.2ff435.0005.GAE@google.com>
Subject: Re: [syzbot] [kvmarm?] KASAN: invalid-access Read in __kvm_pgtable_walk
From: syzbot <syzbot+31156cb24a340d8e2c05@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_145204_609289_2B76FBE7 
X-CRM114-Status: UNSURE (   6.50  )
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

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: invalid-access Read in __kvm_pgtable_walk

==================================================================
BUG: KASAN: invalid-access in __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:161 [inline]
BUG: KASAN: invalid-access in __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
Read at addr f0f0000007d02000 by task syz.2.17/4041
Pointer tag: [f0], memory tag: [fe]

CPU: 1 UID: 0 PID: 4041 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x78/0x90 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x108/0x61c mm/kasan/report.c:482
 kasan_report+0x88/0xac mm/kasan/report.c:595
 report_tag_fault arch/arm64/mm/fault.c:326 [inline]
 do_tag_recovery arch/arm64/mm/fault.c:338 [inline]
 __do_kernel_fault+0x170/0x1c8 arch/arm64/mm/fault.c:380
 do_bad_area+0x68/0x78 arch/arm64/mm/fault.c:480
 do_tag_check_fault+0x34/0x44 arch/arm64/mm/fault.c:853
 do_mem_abort+0x44/0x94 arch/arm64/mm/fault.c:929
 el1_abort+0x40/0x60 arch/arm64/kernel/entry-common.c:481
 el1h_64_sync_handler+0x50/0xac arch/arm64/kernel/entry-common.c:597
 el1h_64_sync+0x6c/0x70 arch/arm64/kernel/entry.S:591
 __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:161 [inline] (P)
 __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237 (P)
 _kvm_pgtable_walk arch/arm64/kvm/hyp/pgtable.c:260 [inline]
 kvm_pgtable_walk+0xd0/0x164 arch/arm64/kvm/hyp/pgtable.c:283
 kvm_pgtable_stage2_destroy_range+0x3c/0x70 arch/arm64/kvm/hyp/pgtable.c:1584
 stage2_destroy_range arch/arm64/kvm/mmu.c:924 [inline]
 kvm_stage2_destroy+0x74/0xd0 arch/arm64/kvm/mmu.c:935
 kvm_free_stage2_pgd+0x5c/0xc0 arch/arm64/kvm/mmu.c:1116
 kvm_uninit_stage2_mmu+0x1c/0x34 arch/arm64/kvm/mmu.c:1023
 kvm_arch_flush_shadow_all+0x6c/0x84 arch/arm64/kvm/nested.c:1113
 kvm_flush_shadow_all virt/kvm/kvm_main.c:343 [inline]
 kvm_mmu_notifier_release+0x30/0x84 virt/kvm/kvm_main.c:884
 mmu_notifier_unregister+0x5c/0x11c mm/mmu_notifier.c:815
 kvm_destroy_vm+0x148/0x2b0 virt/kvm/kvm_main.c:1287
 kvm_put_kvm virt/kvm/kvm_main.c:1344 [inline]
 kvm_vm_release+0x80/0xb0 virt/kvm/kvm_main.c:1367
 __fput+0xcc/0x2dc fs/file_table.c:468
 ____fput+0x14/0x20 fs/file_table.c:496
 task_work_run+0x78/0xd4 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 do_notify_resume+0x13c/0x16c arch/arm64/kernel/entry-common.c:155
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:173 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:182 [inline]
 el0_svc+0x108/0x10c arch/arm64/kernel/entry-common.c:880
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:898
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:596

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xfaf0000007d026c0 pfn:0x47d02
flags: 0x1fffc0000000000(node=0|zone=0|lastcpupid=0x7ff|kasantag=0xf)
raw: 01fffc0000000000 ffffc1ffc0375788 ffffc1ffc0374788 0000000000000000
raw: faf0000007d026c0 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 fff0000007d01e00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 fa fa
 fff0000007d01f00: fa fa fa fa fa fc fc fc fc fc fc fc fe fe fe fe
>fff0000007d02000: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
                   ^
 fff0000007d02100: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
 fff0000007d02200: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
==================================================================
Unable to handle kernel paging request at virtual address fff6011cc11c0000
Mem abort info:
  ESR = 0x000000009600002b
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x2b: level -1 translation fault
Data abort info:
  ISV = 0, ISS = 0x0000002b, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
swapper pgtable: 4k pages, 52-bit VAs, pgdp=0000000042978000
[fff6011cc11c0000] pgd=0000000000000000
Internal error: Oops: 000000009600002b [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 4041 Comm: syz.2.17 Tainted: G    B               syzkaller #0 PREEMPT 
Tainted: [B]=BAD_PAGE
Hardware name: linux,dummy-virt (DT)
pstate: 21402009 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:163 [inline]
pc : __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
lr : __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:207 [inline]
lr : __kvm_pgtable_walk+0xb4/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
sp : ffff8000897ab910
x29: ffff8000897ab910 x28: f9f0000012c1dc80 x27: 0000000000000000
x26: 0000000000000003 x25: 0000000000000004 x24: fffffffffffff000
x23: 0000000000001000 x22: ffff80008292e9c8 x21: fff6011cc11c1000
x20: ffff8000897abbd8 x19: fff6011cc11c0000 x18: 00000000ffffffff
x17: 0000000000000000 x16: 0000000000000000 x15: ffff800081b63cd0
x14: fbf0000003145d00 x13: 0000000000000001 x12: 0000000000000001
x11: 00000042f216d964 x10: fbf0000003145d00 x9 : 0000000000000005
x8 : 0000000000000070 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000004e80000000 x4 : fff6011cc11c0008 x3 : 0000004ec0000000
x2 : ffff8000897abc10 x1 : 0000004e80800000 x0 : 000000000000000c
Call trace:
 __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:161 [inline] (P)
 __kvm_pgtable_walk+0x110/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237 (P)
 __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:207 [inline]
 __kvm_pgtable_walk+0xb4/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
 __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:207 [inline]
 __kvm_pgtable_walk+0xb4/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
 __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:207 [inline]
 __kvm_pgtable_walk+0xb4/0x2d0 arch/arm64/kvm/hyp/pgtable.c:237
 _kvm_pgtable_walk arch/arm64/kvm/hyp/pgtable.c:260 [inline]
 kvm_pgtable_walk+0xd0/0x164 arch/arm64/kvm/hyp/pgtable.c:283
 kvm_pgtable_stage2_destroy_range+0x3c/0x70 arch/arm64/kvm/hyp/pgtable.c:1584
 stage2_destroy_range arch/arm64/kvm/mmu.c:924 [inline]
 kvm_stage2_destroy+0x74/0xd0 arch/arm64/kvm/mmu.c:935
 kvm_free_stage2_pgd+0x5c/0xc0 arch/arm64/kvm/mmu.c:1116
 kvm_uninit_stage2_mmu+0x1c/0x34 arch/arm64/kvm/mmu.c:1023
 kvm_arch_flush_shadow_all+0x6c/0x84 arch/arm64/kvm/nested.c:1113
 kvm_flush_shadow_all virt/kvm/kvm_main.c:343 [inline]
 kvm_mmu_notifier_release+0x30/0x84 virt/kvm/kvm_main.c:884
 mmu_notifier_unregister+0x5c/0x11c mm/mmu_notifier.c:815
 kvm_destroy_vm+0x148/0x2b0 virt/kvm/kvm_main.c:1287
 kvm_put_kvm virt/kvm/kvm_main.c:1344 [inline]
 kvm_vm_release+0x80/0xb0 virt/kvm/kvm_main.c:1367
 __fput+0xcc/0x2dc fs/file_table.c:468
 ____fput+0x14/0x20 fs/file_table.c:496
 task_work_run+0x78/0xd4 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 do_notify_resume+0x13c/0x16c arch/arm64/kernel/entry-common.c:155
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:173 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:182 [inline]
 el0_svc+0x108/0x10c arch/arm64/kernel/entry-common.c:880
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:898
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:596
Code: f9400e83 eb01007f 54000789 a9401682 (f9400260) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f9400e83 	ldr	x3, [x20, #24]
   4:	eb01007f 	cmp	x3, x1
   8:	54000789 	b.ls	0xf8  // b.plast
   c:	a9401682 	ldp	x2, x5, [x20]
* 10:	f9400260 	ldr	x0, [x19] <-- trapping instruction


Tested on:

commit:         2d047827 KVM: arm64: vgic: fix incorrect spinlock API ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=12a4b562580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58f92aa8be80d71
dashboard link: https://syzkaller.appspot.com/bug?extid=31156cb24a340d8e2c05
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Note: no patches were applied.

