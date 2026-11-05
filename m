Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=akziVjp3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UnPfYa3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yK5guq06GyB2POOrEH6V5+qRnqqw9aF5Y+PexajT4A4=; b=akziVjp3JaOfKiBkeV15oWt1AK
	50tIqN165AwTLQYiCSTZSlX5CuR+FgRKtt10Lz4ZrZQgkJ+JU15MCacvCa+TqZH3ZZVxfpgMddJMU
	HMhqrESHMkRx9LBirzk8oHwik1rTh2wbG77hLjUcFYTLiOr07Fi9SK5QXrnMtbnzkkzNWQFZ7Zmd2
	CcmSJ1lNZcyK4DXpaWgZ4eozrBVoElAtCXGntnB3jogHtwe69HI1z0pwUUpM+RAmljD/lB8q22n46
	YGsuOpfoYeEXaJLrJ56q4ke70oG+Genqd6gUJDzUauTalzn9E6j3iQd56wAnfc988X9Z9mmgvQyT4
	psWRO8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Z3-0000000A06J-3t9b;
	Thu, 05 Nov 2026 17:47:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1Z1-0000000A05n-3oFo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E3DF60148;
	Thu,  5 Nov 2026 17:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EAC1F00919;
	Thu,  5 Nov 2026 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793900870;
	bh=yK5guq06GyB2POOrEH6V5+qRnqqw9aF5Y+PexajT4A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UnPfYa3qDnqLQRHvVrNAuqpvDaJOJ6jHV4/9Jd5TTybeyTuR2OyeLNAuJTFs7rX74
	 WdurwevvTTlLMWrTN+MB/OG8bqZbWlno2jZcDxqc8v6r5x5eDVVKYWye0VDbOgCzS9
	 VnvjRlqdfPSOTPQNHP0WxkFApO6jZlD/ka496TCgdL52NPJAE573xfOxfF2qxK8fll
	 wn5Amn07xx1cFgTDqBxL376qtOmGlb9aBEq70HVIbobk0ptY/VS7lM+xWSrrA/kw02
	 YgqNnPraKUOLNRVTyJzRdeSj+cwT1oRv9DlhuUkbMkiV4Gd9fZi3XeVp3Rn/Q9CKOl
	 +siiQprvThIEA==
Date: Thu, 5 Nov 2026 17:47:45 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 00/28] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <auy-TwnMbIn-r2xl@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alex,

I've gone through all of the patches now, thank you for your patience with
the review :)

So there are various dependencies/architectural decisions that need to be
made here to go from RFC -> non-RFC:

1. The 'Ignore MMU notifiers for guest_memfd-only memslots' patch [0] is a
   hard dependency for the series. I chased over there, hopefully we can
   get something landed there.

2. non-VHE, pKVM, NV disallowed for SPE - As I mentioned off-list, I spoke
   to Marc, and he confirmed that he's more than happy for these to be off
   the table for a v1. So I think you can drop the HACK: patches and just
   make these conditions of using SPE.

3. The entire VM needs to be pre-faulted, but who should do it? - I do
   think that relying on userland to do this is a little iffy. So I wonder
   whether it might be possible to, on SPE first run, prefault the ranges
   there, and make that a condition of using it? Relatedly, KVM could
   reject non-guest_memfd memslots for an SPE VM rather than trusting
   userspace there too.

4. Dirty page logging - patch 27/28 relies on series [1] being landed,
   which is also an RFC, and allows migration of SPE VMs. So we need to
   decide - do we want this migration? Additionally, I think it's
   reasonable to, if we want it, send both [1] and patch 27/28 as a follow
   up separate from the v1 non-RFC of the series.

5. Errata handling - the default already disallows SPE on the affected
   silicon, which seems right. I wonder whether kvm-arm.ignore_spe_errata
   should exist at all though, other than in some sort of debug mode.

So 1 is a known dependency, I think there's no getting around that, and
thus that makes merging [0] or something like it a top priority.

It seems to me 2 is pretty clear-cut, and 4 can reasonably (if we want it)
be sent as a follow up.

So really 3 and 5 are the decisions to make here!

--
Cheers, Lorenzo

[0]: https://lore.kernel.org/all/20260714160411.302386-1-alexandru.elisei@arm.com/
[1]: https://lore.kernel.org/kvmarm/20260702142912.6395-1-alexandru.elisei@arm.com/

