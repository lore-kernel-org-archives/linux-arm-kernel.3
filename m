Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8F8606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZ2PxAzd;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mqJycM2d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ropK3m1T6/3AAvbHU3cjiTXYKF8W9vyhn7j6GYWwVws=; b=iZ2PxAzdonI0T83L3Pgx6rb0S+
	BmQM7T6u53RnIiSVFcFQWRBghjscvYqKhoLXCeiK+xkQfM2mD5P0Qppf4vNv535jdNS6m9Vd6mq8Y
	SafCJh/7suuLgNNZZMNoUjDQ9vMo2ModZouFC1KIH+8cA/dCccs8LhI8ReWwqtPLDGCzr19o/9HU5
	aCiFlfey14YpbyCDGxJlvdJ4p1fGyeB8ElvI7HVgkRLTwJ/hB+wTTaJiRIFSv6GRmBrSzQG5Pe3aX
	GUzm4caetxQhPCvrhljH0ScueIZ/4s/4yA9E7/NPjq/DBeAilhjnyNzkM0AlHL5/XOHDQXrOAlaRG
	IpWygO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJy-00000008Zm7-1xEn;
	Thu, 05 Nov 2026 11:07:54 +0000
Received: from out-25.mta1.migadu.com ([95.215.58.25] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJQ-00000008ZQ3-04xb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mxFi/NyYTfA8yYXfuMYDhLBMuAD3UI4RsO03kk+Phpo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793876838; v=1; x=1794481638;
 b=mqJycM2d7x+TT4Z9ipzQSivA4zBC5yIxN5NOyj87yleVnwRjYBEvXJEOYjyaALzzFfhfc2uM
 TENtAG/CEnCSSLKV1+Jn4oKu3Eyb6BCIBu7Qb3Kx7i8+P+or52COIk0srwBlJ60mwSMF0MSgFTz
 YWk5yVzZnwrB1W83D1ArBjTM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3f0d8706474a17cf;
	Thu, 05 Nov 2026 11:07:17 +0000
X-Mizu-Trace-ID: 3f0d8706474a17cf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so6148e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:07:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxRdNp3MarTbVt0SZANA/jpJ2y5UfghosssG7XLxli56FGlkihUyX+ivwTuYmO1ttwqNhadHraFAu1GMjSpIQQ6@lists.infradead.org
X-Gm-Message-State: APuU4Z+DUOBb5bDQpXQom+7ZEUxUTwEJj0pkQcP3yd5PSACbyP1uoGvM
	EMbEPsf4QIExnj+fMR0Z1VkvKaQXK2YEUDHNJQ5OsPm005gSbB36ERsUMMrF5WU21qIAr3GBV5u
	32lGPrLfR2/UiINU9ZKJ56KOTVUiXIcqxkx0ftUTJ
X-Received: by 2002:a05:6512:3095:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5bffa4dbd87mr143654e87.5.1793876833801; Thu, 05 Nov 2026
 03:07:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-3-fuad.tabba@linux.dev> <auxQMCboC9bhfW7h@google.com>
In-Reply-To: <auxQMCboC9bhfW7h@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 11:06:37 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzGijxFgv8Wr2DEGB82UUbA6HqK2n-JgNh2b-7jNHn1hQ@mail.gmail.com>
X-Gm-Features: AclHuK83MrhWtqS0VanllDqm6DgNhbZ5WWUV6AmGa7VFC3MdfNbrKHk581c5qiE
Message-ID: <CA+EHjTzGijxFgv8Wr2DEGB82UUbA6HqK2n-JgNh2b-7jNHn1hQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the
 next mapping
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030732_611477_5C89E7C6 
X-CRM114-Status: GOOD (  14.46  )
X-Spam-Score: -2.8 (--)
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

On Thu, 5 Nov 2026 at 09:45, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> > -     return addr + size;
> > +     /* Mappings left by a failed release are still in the tree, so look past the range. */
>
> Hum, not sure I understand that comment. Which release are we talking about? The
> _reclaim or _unshare? If yes, we don't propagate the error and WARN if any of
> them fails. So we don't expect any failure here and I'd say there's nothing
> special to do?
>
> Additionally, in any case, iter_first(addr + size) seems like the right thing to
> do and is self-explanatory.

Yes, a leftover mapping would be returned again from addr. But since
that already WARNs, I'll drop the comment.

> > +     mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr + size, U64_MAX);
> > +
> > +     return mapping ? gfn_to_gpa(mapping->gfn) : U64_MAX;
> >  }
> >
> >  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> > --
> > 2.47.3
> >
>
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Thanks!
/fuad

