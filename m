Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A71C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DvK3Ab/8+LuuSjDN971YdQrSlGtoyca9dE8WfAGVhNY=; b=5ANeGX3nhyH/8hN0JLpdM41X+t
	al1iRlisNxt50RqRas+pOAAQq8d3+OOwDxdlvCI4bn8YqDUpNyoA3KoScEn+fKc2X0TMwQRjTmxCL
	x693oKCN5WjKnd7rMHv8IEwFeDnQxhNRJiJm4WfaWdXjdpRedTxnK4shXhchyrpFwUXUGH9D1DjrR
	SyJIh7/piuu4vrhK0M08ZOC8ji5YpmH8PgES96Yl+8RNUoUqxETZUFWM/B5Q0H6/YHZHTuqwLsn+v
	UakjrpcJ4SKpDPYoiS5zjM7XFMX9tMl+r7HiK2rccX4KlHCnMWBxGUjvQot+2sfLjttQeNuqDF23n
	km7zGBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thX9j-00000000d4o-2RE8;
	Mon, 10 Feb 2025 17:01:11 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWzB-00000000adj-1vLP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:50:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54505c79649so1914856e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 08:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1739206215; x=1739811015; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DvK3Ab/8+LuuSjDN971YdQrSlGtoyca9dE8WfAGVhNY=;
        b=L92IyO5eTgWv14KBNM/IFHQOADlc9Kv2+iyfpkd+6f2t6FAV2883jpz0FEE3Ql/qLM
         uKKDiv97oFsA9LzZvACrTcTI1acNaPZDA+yg2WxcY27wFss27Mw6SZdgHQS96C1Od6nj
         M+3rTU4WeF256fOemhneTl1WU8X6Eka3rh59j+HYT9Ddfp/qvaJEkDTLmbsemahiGfV1
         lX7jZNLhnnI3sk3Nte+E0xy3XlfnnTujmhU7Zfygqc0q7yHbvttygY4/lyKqWgM7HXmZ
         rNN/+qVtto2iXkIWalu/xo54D51RC3l6JlOCymk3ZfJak/Ieb4n0EmaoQTWI7il7yCRi
         nDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206215; x=1739811015;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DvK3Ab/8+LuuSjDN971YdQrSlGtoyca9dE8WfAGVhNY=;
        b=KOVlMbCuMN1W55BJMrvvxHgoM1JvH0RGR971g+klFzGdtybtLPXim9lGxxgPmHwYwH
         4ciPWzjp0f/giw3jfU8WKb9iPMoj+RfGY2aprJ3MsQOCJT7ukIz7uFkR83ZFtLr07fO0
         3AAHBAQspXlxccsQyQjLrGLB3at9KK9g2NG+PaingkPjcrHlt0LU3Y7mARs2Ldi9iweE
         tD+q3PbYAFS6ONDprBxrk/N0VItoDgGTdQgXLQDOXB4Fw/FGqhstj4jhlMMum8gmf3Fe
         OgrUNQjRjkqdVMBmMhnPEDSUCvn/qNEYBNlhYMaYHNDRc4IQRymc4Viu7Yc+X7UDIxPD
         h+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCnTCpzbCKonudptMB3zdaoNC7DxGqdzsUh4+Q5PaIQebFIjE8FiR0fApO3cxeiazihETnqYYP0ySYnCRbqNBG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7CygJ22U/3dTixp9mI/Y/w6fO6q6LGBdS8nQ069vmqDIUCOr/
	cvwlemmjndKAIvQqmXy6sW/vf2sBZPJWqPMkhmewjk6WQeVsov19WubZmTNhTWozeErgrngDwOP
	G05TwbAL7PqerDkYJEJzFM52W0rWWbbL+P/lhUQ==
X-Gm-Gg: ASbGnctX2d+OXFn/ylevi8i/xgaIbCXq+u51mFl/YplcyHhh2J6cbPQVdZtINtcKdMZ
	y1swXYUiHo6hvxI1uklZlRyQMZ7zONI+A9CLUvRDFEVzJVtq+SQhNfYs7kFi5fxuJfVxqT8J17x
	qZ4haHgUY8frudYQfrtSeVmA3epTI=
X-Google-Smtp-Source: AGHT+IGcfR7yLtrcyRf+GjKm5U5zp1iZIeUDWIGtFdDNhWueAhqwDAPJKbaYVRCePTVr8ZahAn66rGG+bkXAFPm7roo=
X-Received: by 2002:a05:6512:3b10:b0:544:10c7:2458 with SMTP id
 2adb3069b0e04-54414ae5d57mr4279090e87.44.1739206213838; Mon, 10 Feb 2025
 08:50:13 -0800 (PST)
MIME-Version: 1.0
From: Ezra Buehler <ezra@easyb.ch>
Date: Mon, 10 Feb 2025 17:49:38 +0100
X-Gm-Features: AWEUYZkTH687CcK2BeY-rH9Dg4Imvd1OaOGb-wqG9VqcNu-fv5gXSch8IBHthiU
Message-ID: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
Subject: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during compaction
To: linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_085017_654839_E5321DA7 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: linux-arm-kernel@lists.infradead.org, Peter Xu <peterx@redhat.com>, Matthew Wilcox <willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, David Hildenbrand <david@redhat.com>, open list <linux-kernel@vger.kernel.org>, Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Qi Zheng <zhengqi.arch@bytedance.com>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Vlastimil Babka <vbabka@suse.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport \(Microsoft\)" <rppt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When running vanilla Linux 6.13 or newer (6.14-rc2) on the
AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
dereference resulting in a kernel panic. The culprit seems to be commit
fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
Reverting the commit apparently fixes the issue.

Any ideas what the root cause might be? Or any hints where to dig
deeper are highly appreciated.

After the system being up for several minutes, we get the following:

[  490.632656] Unable to handle kernel NULL pointer dereference at
virtual address 00000030 when read
[  490.641557] [00000030] *pgd=00000000
[  490.645101] Internal error: Oops - BUG: 17 [#1] ARM
[  490.649939] Modules linked in: nft_compat rtl8xxxu mac80211 libarc4
cfg80211 firmware_class
[  490.658358] CPU: 0 UID: 0 PID: 17 Comm: kcompactd0 Not tainted
6.14.0-rc2-r0.0.16-yocto-tiny #1
[  490.667010] Hardware name: Atmel AT91SAM9
[  490.670986] PC is at update_mmu_cache_range+0x1e0/0x278
[  490.676204] LR is at pte_offset_map_rw_nolock+0x18/0x2c
[  490.681422] pc : [<c010faf4>]    lr : [<c0205d38>]    psr: a0000093
[  490.687641] sp : c0d8bbf0  ip : 20000000  fp : 00000000
[  490.692824] r10: 00000000  r9 : c201677c  r8 : b61df000
[  490.698009] r7 : 00000000  r6 : 00025c0d  r5 : c14c3480  r4 : c14c3600
[  490.704488] r3 : c207b77c  r2 : 0000077c  r1 : 002d877c  r0 : c207b77c
[  490.710970] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment user
[  490.718147] Control: 0005317f  Table: 22080000  DAC: 00000055
[  490.723843] Register r0 information: non-slab/vmalloc memory
[  490.729467] Register r1 information: non-paged memory
[  490.734478] Register r2 information: non-paged memory
[  490.739490] Register r3 information: non-slab/vmalloc memory
[  490.745114] Register r4 information: slab vm_area_struct start
c14c3600 pointer offset 0 size 64
[  490.753936] Register r5 information: slab vm_area_struct start
c14c3480 pointer offset 0 size 64
[  490.762748] Register r6 information: non-paged memory
[  490.767759] Register r7 information: NULL pointer
[  490.772425] Register r8 information: non-paged memory
[  490.777435] Register r9 information: non-slab/vmalloc memory
[  490.783052] Register r10 information: NULL pointer
[  490.787804] Register r11 information: NULL pointer
[  490.792556] Register r12 information: non-paged memory
[  490.797654] Process kcompactd0 (pid: 17, stack limit = 0x29a0a8ac)
[  490.803790] Stack: (0xc0d8bbf0 to 0xc0d8c000)
[  490.808126] bbe0:                                     c0d8bc0c
c021c680 c14d7250 b65df000
[  490.816259] bc00: c1655c40 c2082d80 c14c3480 c1655c6c 2207b831
4fde8caf c7faa1d4 c7faa1d4
[  490.824389] bc20: c14c3480 c7faa1d4 c0abf87c 38e38e39 c0a076e4
00000001 c0d8bccc c021a500
[  490.832516] bc40: 00000001 c021aaa0 00000000 25c0d18d 00022711
00000001 00000000 c14c3480
[  490.840648] bc60: b65df000 c2082d90 c201677c c1655c6c 00000003
4fde8caf 00000001 c14c3480
[  490.848777] bc80: c0d8bcd4 c7faa1d4 c12309a8 00000000 00000000
00000000 b65df000 c0206348
[  490.856906] bca0: c021a264 c7faa1d4 00000000 c0d8bdec 00000001
00000000 00000000 00000000
[  490.865037] bcc0: 00000000 c021b0e0 c101c080 c7f32e64 00000000
c0d8bccc 00000000 c021a264
[  490.873168] bce0: 00000000 00000000 00000000 4fde8caf 00000000
c7f32e64 c7faa1d4 c021b924
[  490.881301] bd00: c0d8bdbc c0a0add0 c0a0a980 00000000 00000001
c7faa948 c7f32e40 c0d8be9c
[  490.889430] bd20: c0d8bd54 c12309a8 c01f2b68 c0d8bdcc 00000000
00000000 c7f32e68 c12309a8
[  490.897561] bd40: c01f2e34 c0c5a580 c0f7ab40 c7f32e68 c7f2fc10
c7faa94c c7fad01c 4fde8caf
[  490.905691] bd60: c0c3c010 c0d8bef4 c7f34fe0 c0d8bdcc 00000000
c0d8bdbc c0d8bdc4 c7f2c000
[  490.913820] bd80: c01f2e34 c021bdc8 00000000 00000000 c0d8bdcc
c0d8bdc4 c0d8bdec 00000003
[  490.921951] bda0: c0d8be9c c01f2b68 c0d8be9c c0d8be68 c0c13cd0
c0d8bdb4 c0d8bdb4 c0d8bdbc
[  490.930079] bdc0: c0d8bdbc c0d8bdc4 c0d8bdc4 c0d8bdcc c0d8bdcc
00000000 00000000 00000000
[  490.938209] bde0: 00000000 00000000 00000000 000000d2 00000000
00000000 00000000 00000000
[  490.946340] be00: 00000000 4fde8caf c7f245a8 c0d8be9c 00000000
00022400 00022800 00000000
[  490.954472] be20: c0d8bef4 c7f2c000 000003ff c01f4a10 00000001
00000000 c0d8be68 0010f3cf
[  490.962598] be40: 00000000 00000000 00020000 00000000 00000001
0000000c c0a0a980 000000f1
[  490.970732] be60: 00000041 00000000 00000020 4fde8caf c23cab48
c0a8ede4 00000001 c0a8f25c
[  490.978861] be80: 00002001 c0a8f2dc 00000000 00000000 00000000
c01f4e88 c0f7ac00 c7fad040
[  490.986993] bea0: c7fad040 c7fad184 c7fb2d7c c7fbf454 c7fb2b84
c7fbfde4 c7fae6e4 c0d8bebc
[  490.995124] bec0: c0d8bebc c0d8bec4 c0d8bec4 c0d8becc c0d8becc
c0d8bed4 c0d8bed4 c0d8bedc
[  491.003254] bee0: c0d8bedc c0d8bee4 c0d8bee4 c0d8beec c0d8beec
c7f2fbec c7f2c4f0 00000135
[  491.011382] bf00: 00000135 00025ff5 00022800 00000000 c0a8ede4
00002800 000021f6 00000000
[  491.019511] bf20: 00000cc0 ffffffff 00000000 00000000 00000000
00000001 00000001 01000101
[  491.027643] bf40: 00000000 4fde8caf c0a8ede4 0000005c c0a0345c
c01f53d8 00000000 c0c5a580
[  491.035774] bf60: c014081c c0d8bf64 c0d8bf64 4fde8caf c0d8bf84
c0cdc680 c0ce4120 c0c5a580
[  491.043903] bf80: c0ce4120 c01f5204 c0a8ede4 c0131ae0 c0cdc680
c01319c0 00000000 00000000
[  491.052032] bfa0: 00000000 00000000 00000000 c01000fc 00000000
00000000 00000000 00000000
[  491.060160] bfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[  491.068291] bfe0: 00000000 00000000 00000000 00000000 00000013
00000000 00000000 00000000
[  491.076390] Call trace:
[  491.076431]  update_mmu_cache_range from remove_migration_pte+0x29c/0x2ec
[  491.085774]  remove_migration_pte from rmap_walk_file+0xcc/0x130
[  491.091814]  rmap_walk_file from remove_migration_ptes+0x90/0xa4
[  491.097843]  remove_migration_ptes from migrate_pages_batch+0x6d4/0x858
[  491.104470]  migrate_pages_batch from migrate_pages+0x188/0x488
[  491.110405]  migrate_pages from compact_zone+0x56c/0x954
[  491.115737]  compact_zone from compact_node+0x90/0xf0
[  491.120799]  compact_node from kcompactd+0x1d4/0x204
[  491.125767]  kcompactd from kthread+0x120/0x12c
[  491.130322]  kthread from ret_from_fork+0x14/0x38
[  491.135031] Exception stack(0xc0d8bfb0 to 0xc0d8bff8)
[  491.140056] bfa0:                                     00000000
00000000 00000000 00000000
[  491.148185] bfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[  491.156310] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  491.162888] Code: e58d1014 eb03d88c e2503000 0affffee (e59a0030)
[  491.168919] ---[ end trace 0000000000000000 ]---
[  491.173500] Kernel panic - not syncing: Fatal exception
[  491.178701] ---[ end Kernel panic - not syncing: Fatal exception ]---

Cheers,
Ezra.

