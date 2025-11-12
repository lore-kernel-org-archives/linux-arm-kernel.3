Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1B2CD4842
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 20:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9o8NRvJdzTieC05I6sj+VphdIDRCWgXCmaEd+EQUzE=; b=2JtoafG+v9wrDGGcYEElTblzbC
	Bk82XbAOnLQQoChCwM869A3NLXgRA4TUcU48n8bQ+ycQOe45oJhBrUuFMt0wz1DgVgx0mwqX2fOXP
	6vKQ6sevvGUPAkBUQR5CW5vhc+KzKJqEomykeSz7ACTjWB90berKSnjsfkykCLfyEppwpJkFpCgcr
	I9utBPKF8jYzT/42hMNDry8LN/1Yr25Y9z9E7KZAqk2lK4JnZJaSFhDScTu8CyIunZurtyQ/Z6m7M
	HULEeufzwQJuamIBfdy+ykR1P+DrGRXLxtTcBX4K4ZwB3NHazL3ev3avRf5tbbj9buaKoM79/LoCj
	KFgHwkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHa0-00000009UTR-0nBs;
	Wed, 12 Nov 2025 20:36:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHZz-00000009UTI-0qOp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Nov 2025 20:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s9o8NRvJdzTieC05I6sj+VphdIDRCWgXCmaEd+EQUzE=; b=kp57rjurHJAHd7F+xCvQZd2no/
	zldsm/PODHXAoZPRO03KjAvh+i6TFvDrouKIddaHozeoKX6h2p6XnR40qvkW2IfcfJjSqtjOOASHE
	pcLUkbSjzs9jrpSZ1b8HCTaxH2HZB+iIqy3JOelzm0XwDoUm+rsEL547/n1nbkk1Zdvdon9bDW7m/
	fbDrR+VT28Mw+bAffi2/e9rYJYquUsYKCdFL34XhsCio+W3x5wyTN9hfghxd3d7PyPKLuC/rsdqJN
	omr01SQUfqZXqu1vGLmq3jMm7SSbX5suEPyADu3Kw4ySsNlAUtR/0apBO+uhzbLc6bklHuhuBZo+/
	5LaH1Fjg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHZx-00000006TTz-1U22;
	Wed, 12 Nov 2025 20:36:33 +0000
Date: Wed, 12 Nov 2025 20:36:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev,
	workflows@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/27] mm/ksw: Introduce KStackWatch debugging tool
Message-ID: <aRTv0eHfX0j8vJOW@casper.infradead.org>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
 <aRIh4pBs7KCDhQOp@casper.infradead.org>
 <aRLmGxKVvfl5N792@ndev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRLmGxKVvfl5N792@ndev>
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

[dropping all the individual email addresses; leaving only the
mailing lists]

On Wed, Nov 12, 2025 at 10:14:29AM +0800, Jinchao Wang wrote:
> On Mon, Nov 10, 2025 at 05:33:22PM +0000, Matthew Wilcox wrote:
> > On Tue, Nov 11, 2025 at 12:35:55AM +0800, Jinchao Wang wrote:
> > > Earlier this year, I debugged a stack corruption panic that revealed the
> > > limitations of existing debugging tools. The bug persisted for 739 days
> > > before being fixed (CVE-2025-22036), and my reproduction scenario
> > > differed from the CVE report—highlighting how unpredictably these bugs
> > > manifest.
> > 
> > Well, this demonstrates the dangers of keeping this problem siloed
> > within your own exfat group.  The fix made in 1bb7ff4204b6 is wrong!
> > It was fixed properly in 7375f22495e7 which lists its Fixes: as
> > Linux-2.6.12-rc2, but that's simply the beginning of git history.
> > It's actually been there since v2.4.6.4 where it's documented as simply:
> > 
> >       - some subtle fs/buffer.c race conditions (Andrew Morton, me)
> > 
> > As far as I can tell the changes made in 1bb7ff4204b6 should be
> > reverted.
> 
> Thank you for the correction and the detailed history. I wasn't aware this
> dated back to v2.4.6.4. I'm not part of the exfat group; I simply
> encountered a bug that 1bb7ff4204b6 happened to resolve in my scenario.
> The timeline actually illustrates the exact problem KStackWatch addresses:
> a bug introduced in 2001, partially addressed in 2025, then properly fixed
> months later. The 24-year gap suggests these silent stack corruptions are
> extremely difficult to locate.

I think that's a misdiagnosis caused by not understanding the limited
circumstances in which the problem occurs.  To hit this problem, you
have to have a buffer_head allocated on the stack.  That doesn't happen
in many places:

fs/buffer.c:    struct buffer_head tmp = {
fs/direct-io.c: struct buffer_head map_bh = { 0, };
fs/ext2/super.c:        struct buffer_head tmp_bh;
fs/ext2/super.c:        struct buffer_head tmp_bh;
fs/ext4/mballoc-test.c: struct buffer_head bitmap_bh;
fs/ext4/mballoc-test.c: struct buffer_head gd_bh;
fs/gfs2/bmap.c: struct buffer_head bh;
fs/gfs2/bmap.c: struct buffer_head bh;
fs/isofs/inode.c:       struct buffer_head dummy;
fs/jfs/super.c: struct buffer_head tmp_bh;
fs/jfs/super.c: struct buffer_head tmp_bh;
fs/mpage.c:     struct buffer_head map_bh;
fs/mpage.c:     struct buffer_head map_bh;

It's far more common for buffer_heads to be allocated from slab and
attached to folios.  The other necessary condition to hit this problem
is that get_block() has to actually read the data from disk.  That's
not normal either!  Most filesystems just fill in the metadata about
the block and defer the actual read to when the data is wanted.  That's
the high-performance way to do it.

So our opportunity to catch this bug was highly limited by the fact that
we just don't run the codepaths that would allow it to trigger.

> > > Initially, I enabled KASAN, but the bug did not reproduce. Reviewing the
> > > code in __blk_flush_plug(), I found it difficult to trace all logic
> > > paths due to indirect function calls through function pointers.
> > 
> > So why is the solution here not simply to fix KASAN instead of this
> > giant patch series?
> 
> KASAN caught 7375f22495e7 because put_bh() accessed bh->b_count after
> wait_on_buffer() of another thread returned—the stack was invalid.
> In 1bb7ff4204b6 and my case, corruption occurred before the victim
> function of another thread returned. The stack remained valid to KASAN,
> so no warning triggered. This is timing-dependent, not a KASAN deficiency.

I agree that it's a narrow race window, but nevertheless KASAN did catch
it with ntfs and not with exfat.  The KASAN documentation states that
it can catch this kind of bug:

Generic KASAN supports finding bugs in all of slab, page_alloc, vmap, vmalloc,
stack, and global memory.

Software Tag-Based KASAN supports slab, page_alloc, vmalloc, and stack memory.

Hardware Tag-Based KASAN supports slab, page_alloc, and non-executable vmalloc
memory.

(hm, were you using hwkasan instead of swkasan, and that's why you
couldn't see it?)


