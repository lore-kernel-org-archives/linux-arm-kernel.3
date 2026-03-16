Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EADF506D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cn366Va24bwveg07+2tctE+IpJBqolPG9L9A57CTujc=; b=WJUDZmK8qS86R2vi1eWBdltBWN
	TBhpJ/AGPNDG1RmyvidyWJxuLpcOarqo3JETtl1ABcmHFhx8q5g2GKFmvs/05HcI06q12rmWV0fbS
	ru1Gv6HRz8RQq6q344GbKy5j3CyWVUWocaiJOC8qZ7UVpCoEO4/OtwGfZo27Fr+nLK5FcN7tyYI0G
	XpeEsumXisqLXXE7xHOMYasu6O4WVs4gfe2xgIduKSV3dKOFAaS/oWwAjLMylKZUPJ1fDDjyVjaby
	XSFlI5NSnB7kWM+6mzKt9eAhac+pxxHjQhHvj9XjbeFR+ix0NcybD472qEK7ANx+5mLJ2tMBZ1AKK
	+I2Wyyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wd-00000004BIs-1Tdt;
	Mon, 16 Mar 2026 14:29:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wa-00000004BIL-3Qa6;
	Mon, 16 Mar 2026 14:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Cn366Va24bwveg07+2tctE+IpJBqolPG9L9A57CTujc=; b=BWaFlM+93//vqgHYhH3CvzAUK8
	lK42u92QvaY5ni7tecI2r2Womiig/L9YDTTADSKDCU2FXl0U1/hnIqoF/8MQ46AEIJusi4VbdnYrr
	KPYqhpOfPT8l3aRpspqECvUiiVF4l4AAZ2g4flMUqMtpYdJuGufX2fwhyC0BufRM0Cs54z66DqRNS
	1y8qq/o+0oh4W1as2pnByG7pEL5YJVtKY1aNEpzpXzOuK4HbeIfa23SzLjonA2QV0khdjb5Q9Q+9v
	ZiZxgUvTeDlu2vcWYfSA2JA4xsEgH2g9qCdf3n0gyNDqdI/bSawQ6nYV7M84Jpn2rMLtpwFnqPWz5
	GvkR/s4A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wX-00000006x6i-1ssV;
	Mon, 16 Mar 2026 14:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4EBE42DCF;
	Mon, 16 Mar 2026 14:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901EFC19421;
	Mon, 16 Mar 2026 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671355;
	bh=PFUSnO/9ILgelOXbwjEIMdn/Aab1PlCJ0qMrqAnbvw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNArTqce345KwAkB2/OySCnh6EME1XoJwR/oAl0lWq7Ylt9gkTfk6stvl4mVK9/3F
	 KwYOcm79Ed4P16v4AgfrWxgeQ5kXFytmq8JtvKgeAJBHJni4gvkqoXRwSRojWkzMXW
	 KjdJCy/qJzif6rc5Ha23V7TyHyiPTJueX/dmlebfwa3TllC3B8dzFJIvh09GNdM5hA
	 U109OB4NNCj4y6zxKWnPMdODpWkf+W9tJkoIot699UjVOMo5rbg+oOW+XblrH75bPT
	 2K9hfeg+fCNBKA/MiRSMUpOgDleW7qa6JeZtPbHw5YSqiNeQgyfmSpebEkCOjXVHFZ
	 N7HDaEOyJ+00A==
Date: Mon, 16 Mar 2026 14:29:04 +0000
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
Message-ID: <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_142917_877672_27A38976 
X-CRM114-Status: GOOD (  42.15  )
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

On Sun, Mar 15, 2026 at 07:32:54PM -0700, Suren Baghdasaryan wrote:
> On Fri, Mar 13, 2026 at 5:00 AM Lorenzo Stoakes (Oracle) <ljs@kernel.org> wrote:
> >
> > On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> > > On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
> > >
> > > > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to
> > > > .mmap_prepare()") updated AFS to use the mmap_prepare callback in favour of
> > > > the deprecated mmap callback.
> > > >
> > > > However, it did not account for the fact that mmap_prepare can fail to map
> > > > due to an out of memory error, and thus should not be incrementing a
> > > > reference count on mmap_prepare.
>
> This is a bit confusing. I see the current implementation does
> afs_add_open_mmap() and then if generic_file_mmap_prepare() fails it
> does afs_drop_open_mmap(), therefore refcounting seems to be balanced.
> Is there really a problem?

Firstly, mmap_prepare is invoked before we try to merge, so the VMA could in
theory get merged and then the refcounting will be wrong.

Secondly, mmap_prepare occurs at such at time where it is _possible_ that
allocation failures as described below could happen.

I'll update the commit message to reflect the merge aspect actually.

>
> > > >
> > > > With the newly added vm_ops->mapped callback available, we can simply defer
> > > > this operation to that callback which is only invoked once the mapping is
> > > > successfully in place (but not yet visible to userspace as the mmap and VMA
> > > > write locks are held).
> > > >
> > > > Therefore add afs_mapped() to implement this callback for AFS.
> > > >
> > > > In practice the mapping allocations are 'too small to fail' so this is
> > > > something that realistically should never happen in practice (or would do
> > > > so in a case where the process is about to die anyway), but we should still
> > > > handle this.
>
> nit: I would drop the above paragraph. If it's impossible why are you
> handling it? If it's unlikely, then handling it is even more
> important.

Sure I can drop it, but it's an ongoing thing with these small allocations.

I wish we could just move to a scenario where we can simpy assume allocations
will always succeed :)

Vlasta - thoughts?

Cheers, Lorenzo

>
> > > >
> > > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > > ---
> > > >  fs/afs/file.c | 20 ++++++++++++++++----
> > > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > > > index f609366fd2ac..69ef86f5e274 100644
> > > > --- a/fs/afs/file.c
> > > > +++ b/fs/afs/file.c
> > > > @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
> > > >  static void afs_vm_open(struct vm_area_struct *area);
> > > >  static void afs_vm_close(struct vm_area_struct *area);
> > > >  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pgoff_t end_pgoff);
> > > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> > > > +                 const struct file *file, void **vm_private_data);
> > > >
> > > >  const struct file_operations afs_file_operations = {
> > > >     .open           = afs_open,
> > > > @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_aops = {
> > > >  };
> > > >
> > > >  static const struct vm_operations_struct afs_vm_ops = {
> > > > +   .mapped         = afs_mapped,
> > > >     .open           = afs_vm_open,
> > > >     .close          = afs_vm_close,
> > > >     .fault          = filemap_fault,
> > > > @@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_area_desc *desc)
> > > >     afs_add_open_mmap(vnode);
> > >
> > > Is the above afs_add_open_mmap an additional one, which could cause a reference
> > > leak? Does the above one need to be removed and only the one in afs_mapped()
> > > needs to be kept?
> >
> > Ah yeah good spot, will fix thanks!
> >
> > >
> > > >
> > > >     ret = generic_file_mmap_prepare(desc);
> > > > -   if (ret == 0)
> > > > -           desc->vm_ops = &afs_vm_ops;
> > > > -   else
> > > > -           afs_drop_open_mmap(vnode);
> > > > +   if (ret)
> > > > +           return ret;
> > > > +
> > > > +   desc->vm_ops = &afs_vm_ops;
> > > >     return ret;
> > > >  }
> > > >
> > > > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> > > > +                 const struct file *file, void **vm_private_data)
> > > > +{
> > > > +   struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
> > > > +
> > > > +   afs_add_open_mmap(vnode);
> > > > +   return 0;
> > > > +}
> > > > +
> > > >  static void afs_vm_open(struct vm_area_struct *vma)
> > > >  {
> > > >     afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> > > > --
> > > > 2.53.0
> > > >
> > > >
> >
> > Cheers, Lorenzo

