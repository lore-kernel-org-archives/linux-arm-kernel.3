Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B624AF506D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvKy2dMNaQPzLOE8UHjQ/zzSy+ml1N0sLn4idz9hLhk=; b=XH5AgCqXLtaGXJM1oDrodc9C9M
	siVZmURcuvseRxQT8kriBX9UcRtdGJVywD0DaPmH6LTlMi+jdN7BzIS2n6DRMC9aqiT3yWplWpf0v
	4jE91LDUqErzAFqpKr49pQhfKHRTVd8lZLd7B1sMf2w1wGub4zNA0D15xOnDzgasfvMLzslSeYuiH
	apFcsYWqPAVQWJd6f/Rf4hv8wDqSEpSLpKGbRByGoJxd8bKFoNp4r+N2yP54SbvnEMsTgkvbh31I2
	X9wCDbuRsJYrJhfYRY4UgqZtidIIcqLhM7z2A+OHaW09ZE3ZXPx116jwstMdu9VrT0ndPJf5sK/1j
	Cr4fnrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28yg-00000004BiP-29N9;
	Mon, 16 Mar 2026 14:31:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28yf-00000004Bi6-2Ht4;
	Mon, 16 Mar 2026 14:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8023760018;
	Mon, 16 Mar 2026 14:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC85CC19421;
	Mon, 16 Mar 2026 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671488;
	bh=wmwRlESgrnvepPbb1PirkwNJB9yCJFViHuseAPzZgTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1MvHmFeTMXLS17UDbf4qKWdxfdfl1nIIM1Znjt/hB9Jrz7XpIjRGeKs/GgD5HbmT
	 GJnoLBvTQBD3mLyiQNYu/uMaiNpDmAFyJZxaGwL4kth9NMa+7N8pWmipLI9MOUnNIm
	 XZuQWf4hbnuJkGt5El0XdUQ+XGEEEj/ffydaRt0U7/71pqXpi7xrliHkFxDB3ruYpx
	 nd8CvutsY0NcvbrtfRvTcx8uB1G0uZ0HoUdnCcCHmTSa8GQRX3yC4bOT9X7R/YGAmG
	 CL3fSgSn9uu67vMXPRuf0GENu4YKm6u93U51R6SiQiRnK+y3zr8woWQTM2An6cXIJn
	 BxJKdQaXB4REg==
Date: Mon, 16 Mar 2026 14:31:17 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>, 
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
Subject: Re: [PATCH 03/15] mm: document vm_operations_struct->open the same
 as close()
Message-ID: <fdc193c6-483e-4e8e-8813-fa71d984bfb1@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
 <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
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

On Sun, Mar 15, 2026 at 05:43:41PM -0700, Suren Baghdasaryan wrote:
> On Thu, Mar 12, 2026 at 1:27 PM Lorenzo Stoakes (Oracle) <ljs@kernel.org> wrote:
> >
> > Describe when the operation is invoked and the context in which it is
> > invoked, matching the description already added for vm_op->close().
> >
> > While we're here, update all outdated references to an 'area' field for
> > VMAs to the more consistent 'vma'.
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > ---
> >  include/linux/mm.h | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index cc5960a84382..12a0b4c63736 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -748,15 +748,20 @@ struct vm_uffd_ops;
> >   * to the functions called when a no-page or a wp-page exception occurs.
> >   */
> >  struct vm_operations_struct {
> > -       void (*open)(struct vm_area_struct * area);
> > +       /**
> > +        * @open: Called when a VMA is remapped or split. Not called upon first
> > +        * mapping a VMA.
>
> It's also called from dup_mmap() which is part of forking.

Ah yup :) will update thanks!

>
> > +        * Context: User context.  May sleep.  Caller holds mmap_lock.
> > +        */
> > +       void (*open)(struct vm_area_struct *vma);
> >         /**
> >          * @close: Called when the VMA is being removed from the MM.
> >          * Context: User context.  May sleep.  Caller holds mmap_lock.
> >          */
> > -       void (*close)(struct vm_area_struct * area);
> > +       void (*close)(struct vm_area_struct *vma);
> >         /* Called any time before splitting to check if it's allowed */
> > -       int (*may_split)(struct vm_area_struct *area, unsigned long addr);
> > -       int (*mremap)(struct vm_area_struct *area);
> > +       int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
> > +       int (*mremap)(struct vm_area_struct *vma);
> >         /*
> >          * Called by mprotect() to make driver-specific permission
> >          * checks before mprotect() is finalised.   The VMA must not
> > @@ -768,7 +773,7 @@ struct vm_operations_struct {
> >         vm_fault_t (*huge_fault)(struct vm_fault *vmf, unsigned int order);
> >         vm_fault_t (*map_pages)(struct vm_fault *vmf,
> >                         pgoff_t start_pgoff, pgoff_t end_pgoff);
> > -       unsigned long (*pagesize)(struct vm_area_struct * area);
> > +       unsigned long (*pagesize)(struct vm_area_struct *vma);
> >
> >         /* notification that a previously read-only page is about to become
> >          * writable, if an error is returned it will cause a SIGBUS */
> > --
> > 2.53.0
> >

Cheers, Lorenzo

