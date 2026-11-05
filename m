Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+gWZw8v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=P/GlmUjHdK49hN7w1Asyw8OwEiiwg391G3XQYJFs6CI=; b=L+gWZw8vZavaWiaI1miE5GwEmC
	uRvdLfSao12qEmM03noqNf6soZh94w87/KSQ6XlK844N0LRHVLN1AasqmZOqANuK13GfcoDashfKC
	xti9VcDfXP1pPHbXYpACbdEM+zh9eK6pYTDsvNdv4N28gvoijbQQggUiIligb3Ro4OInj1cvXDsPZ
	AoGUvWyRf4eAIFSAhNuE67+NYvW24K6el/JYQM3RAaMFT1vD1s7kcIGNxphPsSVhaFIXbFCLwtaay
	rSIjI9H4c9aOIFaDjjsVcZchp32sWHBfDLAUEB955nhDYTI5c407BkC+SFF+4hS+zzMPgm1GOf2Gm
	zEPDCONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwG8-00000008puA-1EkK;
	Thu, 05 Nov 2026 12:08:00 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwG4-00000008psj-3Red
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:07:58 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b335eeb340so2304547b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880473; x=1794485273;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/GlmUjHdK49hN7w1Asyw8OwEiiwg391G3XQYJFs6CI=;
        b=HNiwky9b2eMtDcULWU5rcKFZYlbe8KRNLEdOP1yq7PPA4mwSn3Xpy6kt9v2Qd24jmn
         Au7TdxvXhHWXNwL1oVf5SmrBgFRCSGIwQFzgkek23elr2nEJXuaNNA8p9+Fi5oZfxS7s
         Z+SBRS2WpqOBp/qahK4hHZXWsHYQQU2Dv25WwM0YPKXH5ZLPSpWWGRhnmerg1sGGyxn+
         7b6V0894HN2jxz3P0U20M+jU61tBv0vhSs++uv2Gu9bU84D2dyBlW7Cn94txE+KRJBAE
         yptISGutxjx39QTpLIu2QfvR6YBDJqV72s+VaexzUzlgdeB+fDZvq7/G8Qp9/1O44WLH
         5YiA==
X-Forwarded-Encrypted: i=1; AKwUvBz17KTWK1yCJmCQKujw4j+OSl3lOBjP7EypZQ13RpDmGvDkp1j6NkLkQz6IjuKSUicvIw86hvE8BLngeriH8Wlh@lists.infradead.org
X-Gm-Message-State: APuU4Z/tRiPNnnLgw6SUsgVx8KJGn3npzxFFc8CKmmt5u/fivsY//GFi
	ilu0T0lduXwl5PRwFYu7CNuWem6u3xXACjJvSkL0EZEChAoqIJkKCJfv
X-Gm-Gg: AYBFou3YVaG3rQNXe1zWs79DZdcQaVHa8985yfnrqZggOMD2ASWP16ByW9Xz7laSEfI
	xKdrwWFnl77v7RuPVRfIbGEmZ3CQIvgj/SkUWwHc9iLfnAZ50YY6JeLrNpXnv4Lm2eDHTcBo/0c
	ZU8SidJCvs0u8Npx8/01tdWElzrkMScASl+x82yh2g2q70RuwkJJ81BL6D4xsKXZ0QCbb9zil0b
	SiNbSA78sZXLMOPrVmGiu4kY8bS4L4Zka4WTQ41st/Zgva0t1vhMR63pJkQN3m5vbgLRL6gWToB
	wF0Uqx74FIt/k/0oX46A7GtTntLxPsycfq+/7EdHa3eLegJgCeIPkv3B+AoZ1gnZogrd5WeMU2d
	Ptc63J9F+KcgDTCslFNrDoyyhNAf2Kw+HScJ9GYbTkG37eRdb+q5z30u3bfZdDSvnPapl/JX+34
	05NX984irRWNiNpxc4NafW9t+rlCZRxnEswZrOzNxeKFxFQhLKN/0UamUTBtO+RpPAVljcU4lYV
	FhIuMgR9WIy0962TLoCWqq6x2/brTKjme2NcI9sVTRCshhmxbjtgBwCEUvgb0LC5j5RSwPl39nw
	HhscwutWryThOKfT/bM=
X-Received: by 2002:a05:690e:1385:b0:67b:f101:ff2c with SMTP id 956f58d0204a3-67bf102166amr2388495d50.96.1793880471605;
        Thu, 05 Nov 2026 04:07:51 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:8::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bedf232ccsm3306902d50.3.2026.11.05.04.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:07:51 -0800 (PST)
Date: Thu, 5 Nov 2026 04:07:49 -0800
From: Breno Leitao <leitao@debian.org>
To: linux-btrfs@vger.kernel.org
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Qu Wenruo <wqu@suse.com>, Filipe Manana <fdmanana@kernel.org>, Boris Burkov <boris@bur.io>, 
	Atish Patra <atish.patra@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, leitao@debian.org
Subject: bug: btrfs: direct IO fallback racing with in-flight direct IO fails
 fsync
Message-ID: <auxv7Tg0xSq5yHmb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040756_927972_0DE21ADD 
X-CRM114-Status: GOOD (  24.46  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Atish reported that arm64 production hosts (64K pages, 4K blocks) that
keep VM disk images as NOCOW files on btrfs, opened with O_DIRECT, on
7.x based kernels, and it still reproduces in linux-next as of
next-20261104:

  Page cache invalidation failure on direct I/O.  Possible data corruption due to collision with buffered I/O!

Besides the message, dio_warn_stale_pagecache() records -EIO in the
mapping, so the next fsync() on the image fails. The message blames the
application for mixing buffered and direct IO, but every write here is
O_DIRECT: the buffered writes come from btrfs itself, when it falls back
for writes that are not 4K aligned.

It does not look like a regression, since the fallback never waited for
in-flight direct IO. 64K pages make it easy to hit, as a folio then holds
16 blocks. Since e9b7b9d9e78e5b ("btrfs: use IOMAP_DIO_BOUNCE flag
instead of falling back to buffered IO"), COW files are exposed too.

I was able to come up with a reproducer that hits the issue within
seconds with 64K pages. With XFS on a loop device backed by such a file,
standing in for the VM, XFS shuts down on "log I/O error -5":

        https://github.com/leitao/btrfs-dio-fallback

My robot identified this as the root cause:

1. Task A has an async O_DIRECT write in flight to one 4K block of a 64K
   folio. iomap invalidated the page cache before submitting it, and the
   inode lock was dropped.
2. Task B issues an O_DIRECT write whose offset, length or buffer is not
   4K aligned. btrfs_direct_write() falls back to btrfs_buffered_write(),
   which does not wait for in-flight direct IO, and dirties another block
   of the same folio.
3. Task A's write completes. kiocb_invalidate_post_direct_write() finds
   the folio dirty, so invalidate_inode_pages2_range() fails with -EBUSY
   and dio_warn_stale_pagecache() records -EIO. The next fsync() fails.

ext4 fixed the same race in 15cdefd0c052 ("ext4: drain in-flight DIO
before buffered write fallback"), and ext2, ntfs and exfat are getting
the same fix. Doing the same in btrfs_buffered_write() for the fallback
case makes the reproducer clean, and I can send that patch if it looks
like the right direction.

This patch is a copy of the fixes above (from other FS) and make the
reproducer happy.

commit 16cd17d1e8205f9f86b8da0a9b1ccefdb2665764
Author: Breno Leitao <leitao@debian.org>
Date:   Thu Nov 5 02:59:39 2026 -0800

    btrfs: drain in-flight direct IO before buffered write fallback
    
    When btrfs_direct_write() cannot do a write as direct IO, because the
    offset, the length or the user buffer is not aligned to the sectorsize,
    or the range has compressed extents or page cache, it falls back to
    btrfs_buffered_write(). That dirties the page cache without waiting for
    direct IO still in flight from other tasks:
    
    1) Task A submits an async direct write to block 1 of a folio. iomap
       invalidates the page cache in the range and submits the bio, and the
       inode lock is dropped.
    2) Task B issues a 512 byte O_DIRECT write to block 0 of the same folio.
       btrfs_direct_write() falls back to btrfs_buffered_write(), which
       dirties the folio.
    3) Task A's write completes. kiocb_invalidate_post_direct_write() finds
       the folio dirty, invalidate_inode_pages2_range() fails with -EBUSY,
       and dio_warn_stale_pagecache() logs:
    
       [    2.048568] Page cache invalidation failure on direct I/O.  Possible data corruption due to collision with buffered I/O!
       [    2.048574] File: /tmp/diorepro.JTCKpJ/block.img PID: 260 Comm: kworker/11:1
    
       It also records -EIO in the mapping, so the next fsync() fails.
    
    The two writes do not touch the same bytes, they only share a folio.
    With 4K blocks on 64K pages a folio holds 16 blocks, so this is easy to
    hit there. Meta's arm64 hosts with 64K pages hit it with VM disk images
    that are NOCOW files on btrfs, opened with O_DIRECT. In a test, XFS on a
    loop device with direct IO on such a file gets EIO on a log write and
    shuts down within seconds.
    
    Wait for in-flight direct IO before the fallback dirties the page cache,
    as ext4 does since commit 15cdefd0c052 ("ext4: drain in-flight DIO
    before buffered write fallback"). btrfs_buffered_write() holds the inode
    lock exclusively there, so no new direct IO can start until the write is
    done. NOWAIT writes never get there, as btrfs_direct_write() returns
    -EAGAIN for them before falling back.
    
    A reproducer that keeps 4K libaio O_DIRECT writes in flight while other
    threads issue 512 byte O_DIRECT writes to the same folios of a NOCOW
    file got 1123 fdatasync() EIOs in 10 seconds on a 64K page VM, and none
    with this patch.
    
    Fixes: f85781fb505e ("btrfs: switch to iomap for direct IO")
    Reported-by: Atish Patra <atish.patra@linux.dev>
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index f978c6524aa03f..2017a96814d857 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1334,6 +1334,14 @@ ssize_t btrfs_buffered_write(struct kiocb *iocb, struct iov_iter *iter)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * A direct write that fell back to buffered IO must not dirty folios
+	 * while direct IO is in flight: its completion fails to invalidate
+	 * them and records -EIO in the mapping.
+	 */
+	if (iocb->ki_flags & IOCB_DIRECT)
+		inode_dio_wait(inode);
+
 	/*
 	 * We can only trust the isize with inode lock held, or it can race with
 	 * other buffered writes and cause incorrect call of

