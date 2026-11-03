Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC829606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FK7SgGIe;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e5Td77DV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hWrA8NhtxzstAUEu/T8XI9QJuMJO8OlRPrMrAUmaBE0=; b=FK7SgGIeLTRK2KFyKpsEeX0a2C
	UVp75XmM83BJhbI+bdG+gof/SmNImLUOS2jbX4JbZFbsJem5a5vUNtjIcXR3y5WVG6nOYVK4ETfVh
	AFz+T7oQFlvCkdpHfgOKmqJR6nUJ+IP9nzcDGp7T2VN9XbNF/7dtI2bcM4gLeWIIz94HvQl0KvJGd
	Ex3JPNribEb5Z9cL8PBYfD5MMorq5+2tPfa5RMLZ4sDllKkvezwhssXd6cuYexdqFwRHyPqAeFpE2
	iqah0kmBCJ74IysWl0PzmBMnn9+p4W3b7yZQGNdcP2dolQpHbk7Bp5yWIMeVbLCw8tuQgmWJR18KJ
	A6UOblqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHFL-0000000364P-29IP;
	Tue, 03 Nov 2026 16:20:27 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHFJ-0000000363d-0jTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:20:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5E02A5wHBmpYnX5KdvdmDO0B3Uy/0sGJV6ZUwMIlvIE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793722823; v=1; x=1794327623;
 b=e5Td77DVkqmMvBqXKsgX4DIN4I+CNT7Ta/R9qOHAyKdgJ6Amu4LDRw6Az1ZutcXkdX30iGqn
 k11PZXjcLBqGf1K7qnZMSDcF7srNlHe2LHWUAIzh7FviXurgCk09mLb549AMtMeQtcevH1+A3wQ
 2DrplhOf3J1dWv5dFQAZH/0s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2a50c3a0ba10eb6f;
	Tue, 03 Nov 2026 16:20:20 +0000
X-Mizu-Trace-ID: 2a50c3a0ba10eb6f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be58ad9600so9578e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:20:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByt2Gp64TR1mbdmqCc4o+oLkKuSjh0ApyO+sbi8pwz9ug20jL+trLjZcKxHMP86148UTXSoo28LsGAtoa0C2xZQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/9A1LWS6e8lAgK/RG72Rua9Rs6sijI2cO/u+QzWub0B6UO3u7L
	YMYQ0jFaXWqd8i0XyPFw4QMvw765Xkk1ynUDcWAPST734zght9SCBSKA2i+kybyVvEbHemtaMJV
	Ham79ZXjtLf8yZgW8pnzqmqthghL2xahmN4p4i7o7
X-Received: by 2002:a05:6512:1087:b0:5bf:c0d0:8fff with SMTP id
 2adb3069b0e04-5bff0efda80mr116496e87.11.1793722814476; Tue, 03 Nov 2026
 08:20:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-3-fuad.tabba@linux.dev> <9841ba98-7f07-4d5d-8397-a07e22ba7f51@arm.com>
In-Reply-To: <9841ba98-7f07-4d5d-8397-a07e22ba7f51@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:19:38 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxWA2o7RkZw_17QMfYjXYN2dW-X6Rmj95YN1iYBvBzrCg@mail.gmail.com>
X-Gm-Features: AclHuK-ekQu6wnuQHHw6haPOsqIeceQhl_GCt9dfFhk4lQ1KKTD7xUnwcbQL5cQ
Message-ID: <CA+EHjTxWA2o7RkZw_17QMfYjXYN2dW-X6Rmj95YN1iYBvBzrCg@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Skip empty IPA ranges when destroying
 stage-2 page-tables
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_082025_351846_E1C5033E 
X-CRM114-Status: GOOD (  18.65  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Suzuki,

On Tue, 03 Nov 2026 10:27:54 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > After destroying each chunk, look up the entry at its start and, if it
> > is empty and larger than a chunk, skip its whole range. The lookup reads
>
> Could we not lookup first before we destroy, that way we can avoid
> destroy walks ?

I'd rather keep it after the walk. Looking first relies on no empty
table being left linked above KVM_PGTABLE_MIN_BLOCK_LEVEL: the lookup
would return one of its empty entries, and the loop would skip past
the table without freeing it.

I don't think anything leaves such a table behind today, but looking
after the walk doesn't depend on that, since the walk frees every
empty table it passes through. That's one extra walk per empty region.
I'll add to the comment why the lookup comes after the walk.

[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1010,9 +1010,20 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
[...]
> >                   next = stage2_range_addr_end(addr, end);
> > -                KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> > -                                                             next - addr);
> > +                kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);
>
> minor nit: Given the kvm_pgtable_stage2_destroy_range() is the only
> called from here, and this caller would benefit from the walk
> information, would it make sense to return a hint back ? Not sure how
> much of that is possible. We do this in the RMM, always return a hint
> of the next possible address. Of course this is not that expensive
> as the CCA case and could be dealt in a separate series.

kvm_pgtable_stage2_destroy_range() is also called by
kvm_pgtable_stage2_destroy(), which EL2 uses to free a pKVM guest's
stage-2, so I'd rather not change it in a fix.

Cheers,
/fuad

