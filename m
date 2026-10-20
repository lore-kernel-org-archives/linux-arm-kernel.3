Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80178606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TjW1ALOE;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H0KgaTdo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SUtRRL7fFOVx3xS2Q3jVLLMRlhIGOOjpBbDS0FruaY=; b=TjW1ALOE9oQVrVZAmAloL218QF
	mvVqFdtybp8KQVMpVawurz5peCIqSvqTqxCLBLjZMDopRqqfwhJ5XXXvsdE2qWVcMB5Zfbs/tzA00
	YZ5iMEE8fE4xSP2gNOp7URjNqo9KeeWCkNJyWWbiYsvVv3UTUBCb4coDZ8Tz6AyONHyfp5tgBg3u/
	n9CuJlVepz6mTXgXaY1J7OM4J+hvxrqgwfjyC61AwTFU4oDAd7pShRDHGKYEvElmEk3YYE9Sp8l11
	ZnlJvw1Np7T3cgQscU0PJ5pCEweGd1ysSYBr5GkKJVwp59DJpgzOhEuXFzl9t0rat13U//r8Tw3/+
	U5FNQS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9dG-00000009kni-0TqO;
	Tue, 20 Oct 2026 13:11:58 +0000
Received: from out-134.mta1.migadu.com ([2001:41d0:203:375::86] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9d9-00000009klR-40Rh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:11:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8VOtYkZ2466K3qFYYyJvUToJ0S8DZXQ+CH6HzzvGHMU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792501909; v=1; x=1793106709;
 b=H0KgaTdouydMMubHOwQkjMH4ttNbEc95v2qT8WuFYAddMJK1aFeT34qk89ht7BLrAGm5HGQ2
 WB/xpNUBWzlq2q8qIglV/tYgw82yFqgrNieb/AIfhbi1q42y6Fz7xn1RciwgMa8fdUlhczW9sSG
 T2ePtUXKetXpwL74WaCaIVHk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 411d2cc9c4737a64;
	Tue, 20 Oct 2026 13:11:49 +0000
X-Mizu-Trace-ID: 411d2cc9c4737a64
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8522e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:11:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBgpXWDX77UqiPwfTLxuoLLXocp824aVIZPIstOv/lirW8kplmL9C3oGlqKyOMYt2oiVCgtH3RYNXwowtGhHCD@lists.infradead.org
X-Gm-Message-State: AFq9FYJw2eWGr5bTjUOBxpsP9Z5hfZ+h+HDagiNfIncFrnuk5J6TZbAy
	dydN8fevn0ClEIrAKmVBVo3wVF+6JzG/55xtbUw9JdtSajOKzwZC8g/ddq406Hwh55Rs84KrHjb
	BQNZwzUcXGJ3bW24qwY9Xya1mY1xSSiIQH0548gre
X-Received: by 2002:a05:6512:32d5:b0:5bf:6c49:434c with SMTP id
 2adb3069b0e04-5bf6c4946d8mr42776e87.10.1792501908190; Tue, 20 Oct 2026
 06:11:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-3-fuad.tabba@linux.dev> <atdWIpk9Qh8ngs-Y@gremlin>
In-Reply-To: <atdWIpk9Qh8ngs-Y@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:11:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwb9V+12siUswmUX0-jr=sidKdAJ+vht+HyqS0KgA6v6g@mail.gmail.com>
X-Gm-Features: AclHuK_VB8b2JJ7L3ieaAtlIC-DnIJuANGGUM1BoyrOPOd60UgfcMApklQSkE2I
Message-ID: <CA+EHjTwb9V+12siUswmUX0-jr=sidKdAJ+vht+HyqS0KgA6v6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Price <steven.price@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_061152_144738_17AF0325 
X-CRM114-Status: GOOD (  12.29  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Tue, 20 Oct 2026 12:58:13 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
[...]
> > @@ -1042,12 +1043,14 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
[...]
> > -                        if (folio_test_hugetlb(folio))
> > -                                folio_try_hugetlb_mte_tagging(folio);
> > -                        else
> > +                        if (!folio_test_hugetlb(folio))
> >                                  try_page_mte_tagging(page);
> > +                        else if (folio_try_hugetlb_mte_tagging(folio))
>
> Slightly awkward logic, testing a negative then the negative of the negative
> (i.e. else) plus folio_try_hugetlb_mte_tagging(), makes it a little harder to
> understand.
>
> With mte_clear_folio_tags() you can make life simpler:
>
>         if (folio_test_hugetlb(folio)) {
>                 if (folio_try_hugetlb_mte_tagging(folio))
>                         mte_clear_folio_tags(folio);
>         } else {
>                 try_page_mte_tagging(page);
>         }

Without the helper, the extra level of nesting takes the loop body
past 100 columns, so I'll switch to your version in the separate patch
that adds mte_clear_folio_tags() (see 1/3).

Thanks,
/fuad

