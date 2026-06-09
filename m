Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E16CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 04:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IakrioQ8Jg2ZmHSWbWnKO0K2u/rTTc8tCu7uH9uLXFM=; b=xA1IzXGK2VBPic1hOiob68l8hs
	SN4LMwnKfTv7ojYZiAcOd88YC46F+os6Htei6tAN1x4SDhvMSUHqDcZIf+CxIoUfnpzXI8gZNmGxn
	1SCeDZh1DfzpYn0Jp0QkVH1dabjcbodCCE90WznKeQWho2S1f69nTh/+ZPV2BwXIDufq2w3O/WI8B
	szcwXTqS23PN/pDQXTIlZPwF5XZDqWdfT14bsL4dFqp0Ol61xvnyohRsQ6G3rvShDu6KiQnzKeKIy
	sOdgxcDht0d2O6adUkeJlW8eFKKtVgwyE2a1NksyysJEgrrCBAtI0sV4nGO7s3gevZp4eORmatxx+
	DzGMbRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWoUC-00000004jKf-3brt;
	Tue, 09 Jun 2026 04:54:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWoUB-00000004jKZ-0xfI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 04:54:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85ECC40E3D;
	Tue,  9 Jun 2026 04:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406D51F00893;
	Tue,  9 Jun 2026 04:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780980886;
	bh=IakrioQ8Jg2ZmHSWbWnKO0K2u/rTTc8tCu7uH9uLXFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndfLh693pkooJpd668JTpzrLBIVvyb5QmE44oEsPZ89NsOCOpfGJmjBgMuvXiyBWQ
	 uZTZL0VxQu/NPB7HLue477LQxKhXn1d0hiPCcTFsFr0qPoG9JgTAea7b1XppxqtmXf
	 k9VhPFnaVaC0FNmH8Hd3AiLkTcuQ3sFRRaGJj9tO5wTB/ETA5MIcpU1g26vC2N04vL
	 i91bH7MkiVn3TaVzPQKj3GKzsIEw+RG7mky3o4Ohu34XmnjRYN3T6/yWL9X0DHIi/p
	 wq8sE1CO118xxbNsITImP7aP9pujk9kdDuBQQaAt3603c5eqlGTYyW+vi3QrNK4ZZR
	 1veYMM9BciQaw==
Date: Mon, 8 Jun 2026 21:54:45 -0700
From: Oliver Upton <oupton@kernel.org>
To: Congkai Tan <congkai@amazon.com>
Cc: blakgeof@amazon.com, catalin.marinas@arm.com, harisokn@amazon.com,
	joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mark.rutland@arm.com, maz@kernel.org, suzuki.poulose@arm.com,
	will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Message-ID: <aieclTmL1op0AYfS@kernel.org>
References: <ah3mObchzwb80_3S@kernel.org>
 <20260608210359.1757125-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608210359.1757125-1-congkai@amazon.com>
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

On Mon, Jun 08, 2026 at 09:03:59PM +0000, Congkai Tan wrote:
> On Mon, Jun 01, 2026 at 01:06:17PM -0700, Oliver Upton wrote:
> > We can't change the value of PMMIR_EL1 unconditionally since older KVM
> > treated this register as RAZ/WI. This also mixes poorly with the default
> > PMU garbage that we have since as the value of the register can change
> > based on where KVM_ARM_VCPU_INIT gets called...
> >
> > Considering everything, I'd like to see this wired up where:
> >
> >  - PMMIR_EL1.SLOTS takes the value of the underlying hardware PMU only
> >    if the VMM explicitly selects a particular PMU implementation
> >
> >  - KVM allows userspace to set PMMIR_EL1.SLOTS=0 for backwards
> >    compatibility
> 
> Thanks a lot for the review! Makes sense. We'll work on v2, and here is
> the high-level design we plan to follow:
> 
>   - Introduce a new VM-wide field, e.g. kvm->arch.pmmir_slots.
> 
>   - Seed it from the underlying hardware value only when handling
>     KVM_ARM_VCPU_PMU_V3_SET_PMU; otherwise it stays 0.
> 
>   - access_pmmir() returns whatever is in pmmir_slots.
>   
>   - set_pmmir() writes pmmir_slots to 0 if the user input is 0;
>     otherwise it no-ops or rejects.

Reject is always better heh :)

So I was previously under the impression that we already expose PMMIR_EL1
to userspace but we actually don't. Grr.

The UAPI around PMUv3 is crappy enough that we should just add a new
vCPU feature flag. When that flag is set:

 - KVM will not create a 'default' PMU, userspace must select a PMU
   implementation to init the vCPU

 - PMMIR_EL1 becomes a user-visible register with the behavior that you
   outline above

 - No PMCEID masking for STALL_SLOT* events

There's a couple larger PMU features underway (e.g. Colton's partitioned
PMU, Akihiko's fixed counters PMU) that we can also condition on the new
feature flag.

Does this sound OK to you?

Thanks,
Oliver

