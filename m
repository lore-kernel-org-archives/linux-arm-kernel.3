Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1B9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4GbzlWauoCPLt/KdIunfCOqOx+l+jd7WNBw7s5fAcc=; b=OXCjlbJ+RnI7ybVvsOPf3ASCBd
	mhnzWVbWK3zbpAv2hlGcIQd+P895wF93uLOZmi+uafTDgQsmiQFS8+21G9NIDjI/t9/qQQ6NXa0Mj
	bJ3i1NhOMsKQruH22kZ5xZiADrqTXrp1tY9SOKkI4A8m2aMU236l+nv9U+qWBQgYlzGRscxh66hGr
	tW6nmpKO9e31F5ogJcttdUkgElbuq23noxAqTVeucDWRG+0r0jNHFX6IV/m3y+VRReGY8M3U0wd0U
	MLtPEOQvePxsfua+jMkbTvVNMfpK4HDa/lxCjar2YcwQIPqS/ygc0cWmEE4Q/dO+q5BeQPy4I69zx
	UNfnYgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbya-000000036bw-3nbh;
	Fri, 19 Sep 2025 14:20:40 +0000
Received: from mail-il1-f205.google.com ([209.85.166.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbyY-000000036am-0xl4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:20:39 +0000
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-42486b1d287so10268785ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 07:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291636; x=1758896436;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4GbzlWauoCPLt/KdIunfCOqOx+l+jd7WNBw7s5fAcc=;
        b=NieDNB+KxG8LZPFM+BHxcnzyaEJ8BiE/dVFki2GtPZsKfcGZCewEUaocEFAlTwQsYh
         3ROLSEKBcXyGFvk+e3cUWxiNNt6RV7h/wwEiOV86xaZxqZpt8fLNZAfhGvXL158AgHJS
         w6mdYCqFrUE+rNd2Ao34yow1nyel4g3GfJxA5QOPS61sYgs4A6MdLySQOVJ33pCDeSpo
         L9AB5id4FHWh1z/03fdU4dWpbnwKi6cHdrxCr2yw44YocgK+WfEBXma8ZiTqYeIH/xq7
         Q3yEG+4RL7inpPwoWd7PfhiYREdI9Ua/gE87ZlWBSs9tQaTe7qTbq6VvD+hTA854uxn5
         PgUg==
X-Forwarded-Encrypted: i=1; AJvYcCXwJrD5iT/1P2GWOD4IBsZ2MtGV/BXAHs7zs+0etv2K0wSK63c3jPb39PzSJf0VS0RzfCmew02UNJiIgzuyyhwg@lists.infradead.org
X-Gm-Message-State: AOJu0YxQJiCBjw8H1SdVho683f8mXdK0BFx6ZkIcZpMF+s9jRXyj+EC4
	s3azq5afAM+YCbErmiXlGKK5Co+c6C3R+5P2bZJpX/q7NzgsmIUc5TBSiQt8D1fdI1xI49zuPO9
	lFBlmEEw0x5UNTgYjpnmwCqNMAQQW/Dk1HC7Y79RfcCyY3k0khiY9ZvD+JIU=
X-Google-Smtp-Source: AGHT+IHptP33yYtPA/hPB7VlA/qo5/m+4BnaVJm9r2lCaoHLdmJGLCxFZ8S8jen0SfTFLsgSyaGtWr7jx6EIxmUqo3jsnUIzS0p6
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2185:b0:40d:e50a:35b0 with SMTP id
 e9e14a558f8ab-4248199ec8fmr53120515ab.32.1758291632840; Fri, 19 Sep 2025
 07:20:32 -0700 (PDT)
Date: Fri, 19 Sep 2025 07:20:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68cd66b0.050a0220.139b6.000f.GAE@google.com>
Subject: [syzbot] [kvmarm?] kernel BUG in kvm_s2_put_page
From: syzbot <syzbot+c41f3ddb8299a30a98b5@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_072038_274962_61C24A81 
X-CRM114-Status: UNSURE (   8.20  )
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

HEAD commit:    62e68218ab58 Merge branch kvm-arm64/nv-debug into kvmarm-m..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=1551cf62580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b1bafe30fc85201
dashboard link: https://syzkaller.appspot.com/bug?extid=c41f3ddb8299a30a98b5
compiler:       Debian clang version 20.1.8 (++20250708123704+0de59a293f7a-1~exp1~20250708003721.134), Debian LLD 20.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-62e68218.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/99c4e665c20d/vmlinux-62e68218.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4204d63db4b5/Image-62e68218.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c41f3ddb8299a30a98b5@syzkaller.appspotmail.com

raw: 01ffea8000000000 ffffc1ffc0807c48 ffffc1ffc080a888 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) == 0)
------------[ cut here ]------------
kernel BUG at ./include/linux/mm.h:1036!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4079 Comm: syz.1.200 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 60402009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : put_page_testzero include/linux/mm.h:1036 [inline]
pc : folio_put_testzero include/linux/mm.h:1042 [inline]
pc : folio_put include/linux/mm.h:1359 [inline]
pc : put_page include/linux/mm.h:1429 [inline]
pc : kvm_s2_put_page+0x374/0x3a0 arch/arm64/kvm/mmu.c:264
lr : put_page_testzero include/linux/mm.h:1036 [inline]
lr : folio_put_testzero include/linux/mm.h:1042 [inline]
lr : folio_put include/linux/mm.h:1359 [inline]
lr : put_page include/linux/mm.h:1429 [inline]
lr : kvm_s2_put_page+0x374/0x3a0 arch/arm64/kvm/mmu.c:264
sp : ffff80008edd7570
x29: ffff80008edd7570 x28: a4f00000202a2000 x27: a4f00000202a2000
x26: 00000000000000ff x25: ffff80008734e000 x24: ffffc1ffc0000000
x23: ffffc1ffc0806908 x22: 0000000000000000 x21: ffffc1ffc0806934
x20: 0000000000000000 x19: ffffc1ffc0806900 x18: 000000004afc0585
x17: 0000000004687c8c x16: 000000004af050f5 x15: 0000000089957307
x14: ffffffffffffffff x13: fff0000012103b08 x12: 0000000000000001
x11: 0000000000080000 x10: 0000000000031ed7 x9 : c866620449182600
x8 : c866620449182600 x7 : ffff80008039fbc8 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001 x3 : ffff800080390dd0
x2 : 0000000000000002 x1 : 0000000100000000 x0 : 000000000000003e
Call trace:
 put_page_testzero include/linux/mm.h:1036 [inline] (P)
 folio_put_testzero include/linux/mm.h:1042 [inline] (P)
 folio_put include/linux/mm.h:1359 [inline] (P)
 put_page include/linux/mm.h:1429 [inline] (P)
 kvm_s2_put_page+0x374/0x3a0 arch/arm64/kvm/mmu.c:264 (P)
 stage2_free_walker+0x1b0/0x264 arch/arm64/kvm/hyp/pgtable.c:1549
 kvm_pgtable_visitor_cb arch/arm64/kvm/hyp/pgtable.c:130 [inline]
 __kvm_pgtable_visit arch/arm64/kvm/hyp/pgtable.c:212 [inline]
 __kvm_pgtable_walk+0x7d8/0xa68 arch/arm64/kvm/hyp/pgtable.c:237
 _kvm_pgtable_walk arch/arm64/kvm/hyp/pgtable.c:260 [inline]
 kvm_pgtable_walk+0x294/0x468 arch/arm64/kvm/hyp/pgtable.c:283
 kvm_pgtable_stage2_destroy_range+0x60/0xb4 arch/arm64/kvm/hyp/pgtable.c:1563
 stage2_destroy_range arch/arm64/kvm/mmu.c:924 [inline]
 kvm_stage2_destroy arch/arm64/kvm/mmu.c:935 [inline]
 kvm_free_stage2_pgd+0x198/0x28c arch/arm64/kvm/mmu.c:1112
 kvm_uninit_stage2_mmu+0x20/0x38 arch/arm64/kvm/mmu.c:1023
 kvm_arch_flush_shadow_all+0x1a8/0x1e0 arch/arm64/kvm/nested.c:1113
 kvm_flush_shadow_all virt/kvm/kvm_main.c:343 [inline]
 kvm_mmu_notifier_release+0x48/0xa8 virt/kvm/kvm_main.c:884
 mmu_notifier_unregister+0x128/0x42c mm/mmu_notifier.c:815
 kvm_destroy_vm virt/kvm/kvm_main.c:1295 [inline]
 kvm_put_kvm+0x6a0/0xfa8 virt/kvm/kvm_main.c:1353
 kvm_vcpu_release+0x70/0x9c virt/kvm/kvm_main.c:4100
 __fput+0x4ac/0x980 fs/file_table.c:468
 ____fput+0x20/0x58 fs/file_table.c:496
 task_work_run+0x1bc/0x254 kernel/task_work.c:227
 get_signal+0x13ec/0x1554 kernel/signal.c:2807
 do_signal+0x23c/0x4dd0 arch/arm64/kernel/signal.c:1618
 do_notify_resume+0xb0/0x270 arch/arm64/kernel/entry-common.c:152
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:173 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:182 [inline]
 el0_svc+0xb8/0x164 arch/arm64/kernel/entry-common.c:880
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:898
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
Code: f00375a1 9112fc21 aa1303e0 97f9c9f2 (d4210000) 
---[ end trace 0000000000000000 ]---


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

