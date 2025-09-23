Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE98CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 22:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/wNTZlN6qLp4sqdyo6QTG1IaiR5Ni0PqLyc9Tnrd6w0=; b=BzDtM98FKLc/WK
	9Q5u5oXp1ZHHTcg0H4aE6kBBqjbXwBFZos70qov89JEObj16wmmRAFOSYqvnP3ymPpGW3mHNoB+sk
	eSZnUWcW6xWDUtk9EQK+ArpHC5rXf/98HtfmRb1pc9jwQVIHUPQOP+qtL7n1faDoUXVB/OEcDrMVy
	M96NpNa5WAjWrbMOu/dFmEvEgArUHWPopDZvJEHKvGOKYPbcehh7GfMm9CsSE2rBtPtpxyNtJpvjZ
	dSamPQP6AhUCS1hLTvZl+fzOhBUkz32sQUYCDgpwQJs8/O1ztL46hi2V2dM7pQxupTnqBXdco3mAu
	bzMs1ObyzqNPC8oYGxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1BtW-0000000F73F-2bm7;
	Tue, 23 Sep 2025 22:53:58 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1BtT-0000000F72K-1lj6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 22:53:56 +0000
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-4257a99466eso58988725ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 15:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758668034; x=1759272834;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wNTZlN6qLp4sqdyo6QTG1IaiR5Ni0PqLyc9Tnrd6w0=;
        b=v/uSvQmXS/A+3xANPX0OyqGs0zyAFl9Wu5eITvY+WHBM3AgPColfzcn4qjoZiYE90h
         ZxJ/pnTYQ8dZOE6mmiaxmxveMyuawjMe1sh2d4pDQ0yE9O3avlz5RF+JiiiltdAhfpKm
         JbrDH7DKa7OiuCU5mOPgp+AK+NDkHiqs3gg2wFPOigmHifEPROhmUrMxBEKT8DCofgQ/
         lbyFAT+siCbiiZ+7Kj+cQ5fELxhZPkMsovGQc1jtIrowahFtDzN4FQ7Q2SrEoOsJvWkM
         y3N98KBD/DmL4X1gSIDpLFDAtHwkzNXBXYbU5pOvQcEeEILI/C39cvtQ9OBXgYJv7FMc
         SE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrsCh0QtR2xxYC+8k+lcs35fJHSeIiJBxzQiMldl43vI41VR51XOTo0camrwIhHcdXcSvoWJMd5O0tQVETwTkc@lists.infradead.org
X-Gm-Message-State: AOJu0YzdhgmdlA7YToaAeqTEl41aWP59VnEZo6jviPpqnwQHMhla9kah
	ENOW25CJ8VBRmcNuRczkYNxwywkIqBFEM170mBb2bFpiM9Qq7BJ+Vsw2jcg5iN1QlW7/d2lce4h
	oAWy+St3TxEttsxH64BcoOLLkDD6rEjvvSloFopirTggvkCkykxnnQWBY3bs=
X-Google-Smtp-Source: AGHT+IGM2aCp+eZxlq2lYE2sv5q3yAtCF346ZsErV/J6qoFUIgD7WjAxOqZ9UCXOlxf3mNdh2dP0thvuweiArcx6FLx35qJXyTJ2
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2b:b0:425:7ae2:b8c1 with SMTP id
 e9e14a558f8ab-42581e10bfamr72471655ab.13.1758668033945; Tue, 23 Sep 2025
 15:53:53 -0700 (PDT)
Date: Tue, 23 Sep 2025 15:53:53 -0700
In-Reply-To: <20250923133104.926672-1-yintirui@huawei.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d32501.a70a0220.4f78.0011.GAE@google.com>
Subject: [syzbot ci] Re: mm: add huge pfnmap support for remap_pfn_range()
From: syzbot ci <syzbot+ciae73d4d89faf898f@syzkaller.appspotmail.com>
To: abrestic@rivosinc.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anshuman.khandual@arm.com, aou@eecs.berkeley.edu, apopple@nvidia.com, 
	ardb@kernel.org, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	catalin.marinas@arm.com, chenjun102@huawei.com, david@redhat.com, 
	dev.jain@arm.com, liam.howlett@oracle.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, luxu.kernel@bytedance.com, mhocko@suse.com, 
	npache@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	rppt@kernel.org, ryan.roberts@arm.com, samuel.holland@sifive.com, 
	surenb@google.com, vbabka@suse.cz, wangkefeng.wang@huawei.com, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yintirui@huawei.com, yongxuan.wang@sifive.com, ziy@nvidia.com
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_155355_463903_9EBB8361 
X-CRM114-Status: UNSURE (   8.84  )
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

syzbot ci has tested the following series

[v1] mm: add huge pfnmap support for remap_pfn_range()
https://lore.kernel.org/all/20250923133104.926672-1-yintirui@huawei.com
* [PATCH RFC 1/2] pgtable: add pte_clrhuge() implementation for arm64 and riscv
* [PATCH RFC 2/2] mm: add PMD-level huge page support for remap_pfn_range()

and found the following issues:
* BUG: non-zero pgtables_bytes on freeing mm: NUM
* stack segment fault in pgtable_trans_huge_withdraw

Full report is available here:
https://ci.syzbot.org/series/633cbff7-ef54-4f3a-9133-71cc271396ee

***

BUG: non-zero pgtables_bytes on freeing mm: NUM

tree:      torvalds
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
base:      07e27ad16399afcd693be20211b0dfae63e0615f
arch:      amd64
compiler:  Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
config:    https://ci.syzbot.org/builds/72b4b6cf-5400-40d6-94b6-1cfc0e85050d/config
C repro:   https://ci.syzbot.org/findings/3450ef75-3540-4c00-8b33-5625d4aa40ef/c_repro
syz repro: https://ci.syzbot.org/findings/3450ef75-3540-4c00-8b33-5625d4aa40ef/syz_repro

BUG: non-zero pgtables_bytes on freeing mm: 4096


***

stack segment fault in pgtable_trans_huge_withdraw

tree:      torvalds
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
base:      07e27ad16399afcd693be20211b0dfae63e0615f
arch:      amd64
compiler:  Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
config:    https://ci.syzbot.org/builds/72b4b6cf-5400-40d6-94b6-1cfc0e85050d/config
C repro:   https://ci.syzbot.org/findings/dcfb72b5-c263-48da-830a-7f51aaa927db/c_repro
syz repro: https://ci.syzbot.org/findings/dcfb72b5-c263-48da-830a-7f51aaa927db/syz_repro

Oops: stack segment: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 6000 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:pgtable_trans_huge_withdraw+0x115/0x310 mm/pgtable-generic.c:188
Code: c3 10 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 5d 38 13 00 48 8b 03 48 89 04 24 4c 8d 78 08 4c 89 fd 48 c1 ed 03 <42> 80 7c 2d 00 00 74 08 4c 89 ff e8 3b 38 13 00 49 8b 07 48 8d 48
RSP: 0018:ffffc90002d5f300 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffffea0000fb3dd0 RCX: ffff888107769cc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffff888022b90843 R09: 1ffff11004572108
R10: dffffc0000000000 R11: ffffed1004572109 R12: ffff88803ecf7000
R13: dffffc0000000000 R14: ffff88803ecf7000 R15: 0000000000000008
FS:  0000555576e7a500(0000) GS:ffff8880b8612000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000107d74000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 zap_deposited_table mm/huge_memory.c:2177 [inline]
 zap_huge_pmd+0xa25/0xf50 mm/huge_memory.c:2205
 zap_pmd_range mm/memory.c:1798 [inline]
 zap_pud_range mm/memory.c:1847 [inline]
 zap_p4d_range mm/memory.c:1868 [inline]
 unmap_page_range+0x9fe/0x4370 mm/memory.c:1889
 unmap_single_vma mm/memory.c:1932 [inline]
 unmap_vmas+0x399/0x580 mm/memory.c:1976
 exit_mmap+0x248/0xb50 mm/mmap.c:1280
 __mmput+0x118/0x430 kernel/fork.c:1129
 copy_process+0x2910/0x3c00 kernel/fork.c:2454
 kernel_clone+0x21e/0x840 kernel/fork.c:2605
 __do_sys_clone kernel/fork.c:2748 [inline]
 __se_sys_clone kernel/fork.c:2732 [inline]
 __x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2732
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f96b638ec29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc07e618c8 EFLAGS: 00000206 ORIG_RAX: 0000000000000038
RAX: ffffffffffffffda RBX: 00007f96b65d5fa0 RCX: 00007f96b638ec29
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000002001000
RBP: 00007f96b6411e41 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 00007f96b65d5fa0 R14: 00007f96b65d5fa0 R15: 0000000000000006
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:pgtable_trans_huge_withdraw+0x115/0x310 mm/pgtable-generic.c:188
Code: c3 10 48 89 d8 48 c1 e8 03 42 80 3c 28 00 74 08 48 89 df e8 5d 38 13 00 48 8b 03 48 89 04 24 4c 8d 78 08 4c 89 fd 48 c1 ed 03 <42> 80 7c 2d 00 00 74 08 4c 89 ff e8 3b 38 13 00 49 8b 07 48 8d 48
RSP: 0018:ffffc90002d5f300 EFLAGS: 00010202
RAX: 0000000000000000 RBX: ffffea0000fb3dd0 RCX: ffff888107769cc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffff888022b90843 R09: 1ffff11004572108
R10: dffffc0000000000 R11: ffffed1004572109 R12: ffff88803ecf7000
R13: dffffc0000000000 R14: ffff88803ecf7000 R15: 0000000000000008
FS:  0000555576e7a500(0000) GS:ffff8880b8612000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000107d74000 CR4: 00000000000006f0
----------------
Code disassembly (best guess):
   0:	c3                   	ret
   1:	10 48 89             	adc    %cl,-0x77(%rax)
   4:	d8 48 c1             	fmuls  -0x3f(%rax)
   7:	e8 03 42 80 3c       	call   0x3c80420f
   c:	28 00                	sub    %al,(%rax)
   e:	74 08                	je     0x18
  10:	48 89 df             	mov    %rbx,%rdi
  13:	e8 5d 38 13 00       	call   0x133875
  18:	48 8b 03             	mov    (%rbx),%rax
  1b:	48 89 04 24          	mov    %rax,(%rsp)
  1f:	4c 8d 78 08          	lea    0x8(%rax),%r15
  23:	4c 89 fd             	mov    %r15,%rbp
  26:	48 c1 ed 03          	shr    $0x3,%rbp
* 2a:	42 80 7c 2d 00 00    	cmpb   $0x0,0x0(%rbp,%r13,1) <-- trapping instruction
  30:	74 08                	je     0x3a
  32:	4c 89 ff             	mov    %r15,%rdi
  35:	e8 3b 38 13 00       	call   0x133875
  3a:	49 8b 07             	mov    (%r15),%rax
  3d:	48                   	rex.W
  3e:	8d                   	.byte 0x8d
  3f:	48                   	rex.W


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

