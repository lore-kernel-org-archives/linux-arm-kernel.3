Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A15F3381F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6555lE8Eqz4VdrShTAZB8tLmpI5/NfoZfhGSGsRo30Y=; b=f3S1MiSg8AZDeev0iRJ+DBsAD0
	1YvrTrRkXzmDbENC0urA2hGLa+gXSOccdefp3wQjFEh5dZXfztq+2VDMuzW5jHZ2gsLAOS5j07od7
	vE7N/rtcE8yUbfsKNNZTyhhmAkZI62htZMK1NwWR4SgZ9PlzhbSxz0noQl8l/sK7kt1Ru6HXbFViW
	JRzzTz7UzjmD195+MT3kY11Q8C5L9Lo3IpafV0gNCeZczK0lMn6+NCj27NO5ecqIspECl17aegyof
	HRupw9HGshMgWwLBqzYsvmLX5TkYBXnyQAogb214kEptLrWuUUY2DY2HZjx4MJsqjA4EcqDVvKNed
	RuQAcKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QFm-00000005mPe-1cHG;
	Tue, 17 Mar 2026 08:58:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QFj-00000005mNz-2rcB;
	Tue, 17 Mar 2026 08:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4329D40C49;
	Tue, 17 Mar 2026 08:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0D5C2BCB6;
	Tue, 17 Mar 2026 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737894;
	bh=6555lE8Eqz4VdrShTAZB8tLmpI5/NfoZfhGSGsRo30Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jK3J4jIDbHMCKrxQ+OjUgrUordb9Xw/krWi+plO21PkM4j44mP8jyUr0+L6Gs8K54
	 3+hgkwVbgGjfrOruLgVyuttzaOPX/kP+WAWxiOzWMmNRwEJfgcT1aOb+x9THjCaONq
	 W9tloCz+rbEOI7JtI6nvRrRf2D+/xm5SN0ksYzj8cK9AxVC7/LC8vX5ZIQjB8gYlTe
	 Ws0eHBg1CWeRLxy89UpcLRszfQD6r867MrcFbjb+4b6l6NGjIPmb/YlGHORmMA2O/9
	 FjMkQioxd3ZmUvzvbV0gDNR0yAshhPSjBnl+NHW2jaZPx63xqVGFwCmPgqjWPZC4k5
	 khapcITUoXimg==
Date: Tue, 17 Mar 2026 08:58:02 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Usama Arif <usama.arif@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Clemens Ladisch <clemens@ladisch.de>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 05/15] fs: afs: correctly drop reference count on mapping
 failure
Message-ID: <679f8190-752a-4b0c-ab5e-635938169cab@lucifer.local>
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
 <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
 <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_015815_760260_E06B5218 
X-CRM114-Status: GOOD (  36.79  )
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

On Mon, Mar 16, 2026 at 08:41:48PM -0700, Suren Baghdasaryan wrote:
> On Mon, Mar 16, 2026 at 7:29 AM Lorenzo Stoakes (Oracle) <ljs@kernel.org> wrote:
> >
> > On Sun, Mar 15, 2026 at 07:32:54PM -0700, Suren Baghdasaryan wrote:
> > > On Fri, Mar 13, 2026 at 5:00 AM Lorenzo Stoakes (Oracle) <ljs@kernel.org> wrote:
> > > >
> > > > On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> > > > > On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
> > > > >
> > > > > > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to
> > > > > > .mmap_prepare()") updated AFS to use the mmap_prepare callback in favour of
> > > > > > the deprecated mmap callback.
> > > > > >
> > > > > > However, it did not account for the fact that mmap_prepare can fail to map
> > > > > > due to an out of memory error, and thus should not be incrementing a
> > > > > > reference count on mmap_prepare.
> > >
> > > This is a bit confusing. I see the current implementation does
> > > afs_add_open_mmap() and then if generic_file_mmap_prepare() fails it
> > > does afs_drop_open_mmap(), therefore refcounting seems to be balanced.
> > > Is there really a problem?
> >
> > Firstly, mmap_prepare is invoked before we try to merge, so the VMA could in
> > theory get merged and then the refcounting will be wrong.
>
> I see now. Ok, makes sense.
>
> >
> > Secondly, mmap_prepare occurs at such at time where it is _possible_ that
> > allocation failures as described below could happen.
>
> Right, but in that case afs_file_mmap_prepare() would drop its
> refcount and return an error, so refcounting is still good, no?

Nope, in __mmap_region():

call_mmap_prepare()
-> __mmap_new_vma()
vm_area_alloc() -> can fail
vma_iter_prealloc() -> can fail
__mmap_new_file_vma() / shmem_zero_setup() -> can fail

If any of those fail the VMA is not even set up, so no close() will be called
because there's no VMA to call close on.

This is what makes mmap_prepare very different from mmap which passes in (a
partially established) VMA.

That and of course a potential merge would mean any refcount increment would be
wrong.

>
> >
> > I'll update the commit message to reflect the merge aspect actually.
>
> Thanks!

You're welcome, and done in v2 :)

>
> >
> > >
> > > > > >
> > > > > > With the newly added vm_ops->mapped callback available, we can simply defer
> > > > > > this operation to that callback which is only invoked once the mapping is
> > > > > > successfully in place (but not yet visible to userspace as the mmap and VMA
> > > > > > write locks are held).
> > > > > >
> > > > > > Therefore add afs_mapped() to implement this callback for AFS.
> > > > > >
> > > > > > In practice the mapping allocations are 'too small to fail' so this is
> > > > > > something that realistically should never happen in practice (or would do
> > > > > > so in a case where the process is about to die anyway), but we should still
> > > > > > handle this.
> > >
> > > nit: I would drop the above paragraph. If it's impossible why are you
> > > handling it? If it's unlikely, then handling it is even more
> > > important.
> >
> > Sure I can drop it, but it's an ongoing thing with these small allocations.
> >
> > I wish we could just move to a scenario where we can simpy assume allocations
> > will always succeed :)
>
> That would be really nice but unfortunately the world is not that
> perfect. I just don't want to be chasing some rarely reproducible bug
> because of the assumption that an allocation is too small to fail.

I mean I agree, we should handle all error paths.

Cheers, Lorenzo

