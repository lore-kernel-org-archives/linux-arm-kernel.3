Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C111F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2QcnvdrB;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DSN079il
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7ITq9pil1sbNEwosA9cYsWu7rSF7A5UE/dNpVgRrvCc=; b=2QcnvdrBAdD8gT5YzFI1VTY8vf
	UlAPDzyxYb2A49jiiUpnjwpjyVyxgOty0m4bgQPVHBU6UT4XW6+4/QsNpQ1x9ynfPVA0LXvwTXXDQ
	5ZrstxPekV7d6SjazxHgnxSbWHnA+uswNaTir82/rphbyQXnJpE/Xp02OPda8KUM+f0b16ZbrsmQx
	wZ38IA8Ic5U1k5Iw0mTwYtN3EY7FGMuqQIKp5C4Zz+SpM61ERtHiFM+DtrQ+UZ9L/HPQY8LEcVY7W
	xJrDMpa8bwQ/GHILk8MoymFvDUCLRLILoKEC8go9deO8Fui8GQ/Ea9jHVSy+Wvdhx5tv0o2a6FkhP
	l0DUhhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2jY-0000000AHYe-0MrK;
	Thu, 05 Nov 2026 19:02:50 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2jH-0000000AHTw-1K7A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:02:42 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2e94f72fb9fso21566545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793905349; x=1794510149; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ITq9pil1sbNEwosA9cYsWu7rSF7A5UE/dNpVgRrvCc=;
        b=DSN079iltvpSOeEQHE9UI0cwqlywNrLDKmqq16GZzEPeNiex8NDUabfnApcUq7Os14
         FMt+V2EqUEm/9YN+r5FGnozUZrNSq2MCzOMU6TxBvhRyck/bQBspQIDa+xhCpdouCTaE
         nB0SaacXlH2PjLMINRgA/yIFU7/rvS7hiv+x8I8J+fJuDj+fTWioHpdDJp/r93qFc1qD
         qJZ7mbAMhHnzEBASo+zPJkCbrJbZSNUk6nkxLd+wii85l6I3puXkFjFtLqsLV75ZeyXz
         fTMvm/q9XwlSd31FcXzWlaTaYTxkSImgC+JNPeu+YoVanVXmziVuHG8kVKiVcmc27A/A
         ji6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905349; x=1794510149;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ITq9pil1sbNEwosA9cYsWu7rSF7A5UE/dNpVgRrvCc=;
        b=SLJ3nBFt05o/3k9k070WrXAxgQvPE6kyz2x9HyWDZQgXz6tC9x1m5DgTqZEdC99AMw
         vEPhodiSvoillQbkh7WqGk9+8tHhXZdrgSxKD02J4iZ2ovnrV6VQcR32v2xq2pTmanmY
         keT/SdH0qWJ/LW7uSUtwMnUUefvJbGcvVaqSkCEnOYjLpFzkyrxbYnmSSnkbWio5Jpxq
         mT2kkTzEm6olyCuA9PhNM5NgNCajTP2u0ew8xj9c7JVFNAIgYZF7xG6XE5KUhiEKvyHQ
         ymUyWnimrtgior7LxjTakNgoDHbX8/ppSGEap0Ggy1b/VMy4nRXatYct2TlF7M/vxdXI
         tSdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhQIWVrxrW0Q2JD+IidXFPo0hzM0NvI9QwTVoTqlwMlzIYpvgPSg4PkimP288hOYT9/lN6oWfe4XREwpAjyeMz@lists.infradead.org
X-Gm-Message-State: APuU4Z8pl+r/+nG6cIBESvkGdhSbXZI/l5DqRVNpi5JGymH/VNT2TaoS
	fHoZBoSXNzIDOvv/N/MKSfSbeET7lVM0nmMGKL/QLbEb0ZyFWC893csYmGPve0kRXqUHZ1jhqgm
	kNaePDw==
X-Received: from plbky11.prod.google.com ([2002:a17:902:f98b:b0:2eb:809:b8ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f68f:b0:2e5:334f:f47e
 with SMTP id d9443c01a7336-2ed40aad5c0mr6016315ad.21.1793905349286; Thu, 05
 Nov 2026 11:02:29 -0800 (PST)
Date: Thu, 5 Nov 2026 11:02:28 -0800
In-Reply-To: <autwsR83Ii-tRrqF@gremlin>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20260714160411.302386-1-alexandru.elisei@arm.com>
 <amPCdAswlk24Xilf@google.com> <anxAGkdyPYXBlS00@raptor> <autwsR83Ii-tRrqF@gremlin>
Message-ID: <auzSxEsGAcm3MYtN@google.com>
Subject: Re: [PATCH v2] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, david@kernel.org, mark.rutland@arm.com, 
	ackerleytng@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_110231_567148_15ABCBDC 
X-CRM114-Status: GOOD (  30.16  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026, Lorenzo Stoakes (ARM) wrote:
> [updated David's email address to @kernel.org]
> 
> On Wed, Aug 12, 2026 at 10:42:50AM +0100, Alexandru Elisei wrote:
> [ ... ]
> > On Fri, Jul 24, 2026 at 12:52:20PM -0700, Sean Christopherson wrote:
> > > It'll probably take me a few weeks to circle back to this, as I finally crawled
> > > out from underneath a pile of urgent and am just now getting back into review
> > > mode, but this is fairly high on my todo list, so with luck we might still squeeze
> > > this into 7.3.
> 
> Hey Sean,
> 
> I wondered whether you'd had a chance to look at this?
> 
> After discussing this with Marc and Alex it is clear that this is really a
> blocker for Alex's SPE series, as we need a sensible means of ensuring
> that stage-2 mappings stay in place.
> 
> So ideally would prefer to get something like this in in the next cycle,
> if you don't have any objections to it? :)
> 
> If it'd be easier, I think a smaller version of the same patch would also
> give us what we need? I.e. your snippet from June with the page ageing part
> dropped, as below.

The GPC invalidation fix landed, so we can go straight to the super simple v1.
Compile tested only at this point, I'll formally post this (hopefully today),
assuming nothing explodes in testing.

--
From: Alexandru Elisei <alexandru.elisei@arm.com>
Date: Mon, 15 Jun 2026 16:52:44 +0100
Subject: [PATCH] KVM: Skip gfn-based MMU notifier invalidations for
 guest_memfd-only memslots

Don't invalidate gmem-only memslots when responding to MMU notifier
invalidations, as the entire point of gmem-only memslots is so that KVM
doesn't need a VMA to install mappings into KVM's MMU.  Specificially,
page faults are resolved by going straight to guest_memfd, using the gfn
and the associated memslot's gmem.file.  I.e. whether or not userspace
happens to have valid mappings to the same gmem instance is irrelevant,
as are any invalidations for those mappings.

Note!  The exception is KVM's gfn_to_pfn_cache implementation which isn't
yet wired up to pull pfns directly from guest_memfd, i.e. still relies on
userspace mappings/VMAs and thus need to be invalidated, e.g. to ensure KVM
doesn't retain a kernel mapping+pointer to PRIVATE memory.  However, as of
commit da260bcb56fe ("KVM: pfncache: use a dedicated invalidation sequence
for cache refresh"), GPC invalidation no longer relies on memslot lookups,
because GPCs also support HVA-based mappings.  I.e. KVM *must* be able to
detect and handle relevant MMU notifier invalidations even if there is *no*
memslot whatsoever.

In addition to the obvious performance benefits, avoiding unnecessary and
spurious SPTE zaps and TLB flushes will allow KVM to support features like
ARM's Statistical Profiling Extension (SPE)[1] and x86's Secure AVIC[2],
both of which rely on the pages *never* being unmapped from the stage-2
page tables.

Link: https://lore.kernel.org/all/20260903160623.315525-1-alexandru.elisei@arm.com [1]
Link: https://lore.kernel.org/all/cover.1783490022.git.naveen@kernel.org [2]
Cc: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
[sean: rewrite changelog to capture the new gpc behavior]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..599dea22afb8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -601,6 +601,10 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
 			unsigned long hva_start, hva_end;
 
 			slot = container_of(node, struct kvm_memory_slot, hva_node[slots->node_idx]);
+
+			if (kvm_slot_has_gmem(slot) && kvm_memslot_is_gmem_only(slot))
+				continue;
+
 			hva_start = max_t(unsigned long, range->start, slot->userspace_addr);
 			hva_end = min_t(unsigned long, range->end,
 					slot->userspace_addr + (slot->npages << PAGE_SHIFT));

base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
--

