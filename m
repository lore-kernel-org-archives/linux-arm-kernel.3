Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A531606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=27Q3aif5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S01wnnpf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kKaE2yjUItddwayqhFLc6/VrDJxfB6w63CQjP5urAJw=; b=27Q3aif5t53X1t6RdPpb2W+zko
	4aG6pX5ZsFmHZkOwnpyHpwBBsD0Vy9ajNCSE7KSsBhCwue4gSw8VNuPB2zzbDVAfgFxSIrXtCOSrd
	Q9+q3u1wdZQGAZP8txV5/WwVCsGTg8i+cAtkZ/qSBetpTyAgcI+qPQm16R6VlEfcksuvI2qgcbPHD
	31YM6jGFBdYI+PbYiwl4jpSp3VAjK5Z8HhUyw0j4VHhYGHHCpp441z7uvOobn3Lf3Oy15tJkWkzb4
	Hi98iuf2zERM5zdJA1yiqKcLOsQ4QEIQQx+GrRCdsSY3pVSJTwsZZ+EkqbV2Q5HBFatQmVySqFprE
	36vUjOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP38h-0000000AK1z-25vw;
	Thu, 05 Nov 2026 19:28:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP38b-0000000AK1n-2uon
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D183460154;
	Thu,  5 Nov 2026 19:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E752F1F000C1;
	Thu,  5 Nov 2026 19:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906920;
	bh=kKaE2yjUItddwayqhFLc6/VrDJxfB6w63CQjP5urAJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S01wnnpfdcAvDRxUlG2/kuPzRhJwbOeTPHsEO0h1aRJnt2K1f991HVV8siyFWIa+2
	 7HpudfOQAGdVO7y6m9VBb5MKMlQHjlTCNSE+EllC147SHXC+kirGOhWz68m6QMxGVq
	 Kgx5o58Ho2Kfm7ADlJSI61TjnU/6ozzQouA9PbH38QTLSNr7j6kp6T3zfS3hyx64Dm
	 9vyGrPEIhO0RXjzwJxm9IHYsE2QOcY5IpYnN8Gqa2yVcB75aMPaV/kZhNtMtK9wAeH
	 36XpSG6NvM7Yl7LLf2blUsKT51bzsErXa24mf9BOu+QTtdnDoSRDCzLJ1YlT37OVjt
	 818FZjm26ttmg==
Date: Thu, 5 Nov 2026 19:28:35 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 00/28] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <auzYnfOQeB44niFy@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <auy-TwnMbIn-r2xl@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auy-TwnMbIn-r2xl@gremlin>
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

On Thu, Nov 05, 2026 at 05:47:45PM +0000, Lorenzo Stoakes (ARM) wrote:
> Hi Alex,
>
> I've gone through all of the patches now, thank you for your patience with
> the review :)
>
> So there are various dependencies/architectural decisions that need to be
> made here to go from RFC -> non-RFC:
>
> 1. The 'Ignore MMU notifiers for guest_memfd-only memslots' patch [0] is a
>    hard dependency for the series. I chased over there, hopefully we can
>    get something landed there.

Sean has kindly put together a patch for this, which is now very simplified
given that a dependent fix has landed, so that's good news on that one :)

https://lore.kernel.org/all/auzSxEsGAcm3MYtN@google.com/

--
Cheers, Lorenzo

