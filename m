Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VUyCknun;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UhZ7VjwA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TgSyY4/ng5nLiDGto5Kq5ST6lqpDa6TrnCUDb5pZH64=; b=VUyCknun8RYUj7GRVeZkY1xmgb
	BZlHcHNZGoumUcPwNM3wVoCYEsIMDg89cb1snh66vexCBqOT6WrFAIxqigL/AmNnvCGOVIVOZbFz9
	DxpMEjp8TQSc+eQK0MvcICM2IfXd+8d4Oxy0b7rSkwYp1x+Fuv5ccxRTL/f9ArnMsxpZ+HnT48F00
	aZ6LUDfpiUqCpkXZnsgqOhnU/c8hqr2DKuV6F+Krc8JIAGvHHAk5OaEQ/Ew65/LePL8IzMqbaWWEx
	D852KFheHNtt/lvLTYmHTpMjdbZJK3Cjo1Jiz5lkYLcSVrEGxG9dau27HGjnnE769lonD9LeH2Ke5
	bZ4+lgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhg4-0000000B4hw-3qbI;
	Fri, 30 Oct 2026 08:09:32 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhg1-0000000B4h5-0XIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:09:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cPlhkNYw3K0eeAGK/JciXdzV5PYFFrSx544N7IS3wzs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793347766; v=1; x=1793952566;
 b=UhZ7VjwADh6zdEe+wsHjAQDyVyThTnrl4ughAf42AGpf5z2hkF9Dyyp2cFJtm9P4OAgcwGQA
 kfW+Ep/mMyxZAk7UqM+bsKhutn9jhY2uDCAF+5gsIUdROWkxKjgounqDJUKjGzV7oA8Xyo6jtfM
 xQOZd3nSKc8r0dTXY+NTeBQ4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7aeac4a5e32e7734;
	Fri, 30 Oct 2026 08:09:26 +0000
X-Mizu-Trace-ID: 7aeac4a5e32e7734
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6119e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 01:09:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnUnwTc1fRZ1Mg676zPqTinzpLOajFInzJLwl2qrNpUJt8/rI6TQpmvdBA66x7SoZgOPEFgozGdywaxN1+QDAS@lists.infradead.org
X-Gm-Message-State: AFq9FYJyj/Btt06xkmczzWfCrHRZYz0SFQ/3KsuV7Xsbta+2pBPnHc4O
	b0E1Zz++w/ao+P+Hdj8UW3sTBgYyMK9i8zAXNv+9N+/hwYgIWe+IBSQNs072pWwpX0TJJTGVsQ/
	HFBR2SAdklvT0khLTs0mVbi6I33Jo4awvfRKUkHvz
X-Received: by 2002:a05:6512:3501:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5bfd18169ffmr245950e87.7.1793347758933; Fri, 30 Oct 2026
 01:09:18 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021110700.493315-1-fuad.tabba@linux.dev> <20261021110700.493315-3-fuad.tabba@linux.dev>
 <auPCV6VdMEz4uZkK@arm.com>
In-Reply-To: <auPCV6VdMEz4uZkK@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 30 Oct 2026 08:08:42 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxKeTG26Oqt=jdUqnCrzTNTW49xggCWJRJQz_XdV6prhw@mail.gmail.com>
X-Gm-Features: AclHuK8pOIsgHYiMxZhDJpGYznE2BIP_eKzJt7aDibtxQihZUGQcXEve-pG0JDA
Message-ID: <CA+EHjTxKeTG26Oqt=jdUqnCrzTNTW49xggCWJRJQz_XdV6prhw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Price <steven.price@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_010929_366565_DD499D2A 
X-CRM114-Status: GOOD (  18.67  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 22:02, Catalin Marinas <catalin.marinas@arm.com> wrote:
[...]
> > +                      * tags. A hugetlb folio is marked tagged as a whole,
> > +                      * so its first tagging clears every page.
> >                        */
> > -                     if (folio_test_hugetlb(folio))
> > -                             folio_try_hugetlb_mte_tagging(folio);
> > -                     else
> > +                     if (!folio_test_hugetlb(folio))
> >                               try_page_mte_tagging(page);
> > +                     else if (folio_try_hugetlb_mte_tagging(folio))
> > +                             for (i = 0; i < folio_nr_pages(folio); i++)
> > +                                     mte_clear_page_tags(page_address(folio_page(folio, i)));
>
> I guess we could have skipped the actual page we are going to copy into
> but not worth it.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> >                       num_tags = mte_copy_tags_from_user(maddr, tags,
> >                                                       MTE_GRANULES_PER_PAGE);
>
> Something Claude spotted and unrelated to your patch. A malicious VMM
> using memfd (not guest_memfd) and MAP_SHARED could construct some
> mapping so that the VM slot is !PROT_MTE while the same page is mapped
> in the VMM with PROT_MTE. try_page_mte_tagging() (or the folio one)
> above set PG_mte_lock but a subsequent fault on the uaccess to VMM
> memory will attempt to zero the tags and wait (forever) on the page
> lock. Not tested to prove it.
>
> If you get bored and want to fix it, I guess a copy_from_user() into a
> local buffer and then setting the page tags.

Thanks Catalin. I'll look into this and send a fix.

Cheers,
/fuad

