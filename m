Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F3BC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omtP9ok1iojYdMTStCvMewR9KVHMrUfbkgUBxyeLyIk=; b=AXPMgHlnYJqm3s/PdF+UG6W5pp
	ihDGcXczSMKFSDnhfIOAe9bK/bBIsL+6ddpPBiDySUeWDg5OBdfqkICsuAnWyzt60C4be2l8YO8I4
	16uZ6+wlUIgO9WGOIjwGFcEQRY8lVDB5/AxSPpC4cDE6FCWZkw0wzpRVvwFzWKcK0rfdgxL5qgFzA
	z8ne+XiIgtgZugU7AoFaWOj1g4PlBp5H2/Agk+nJptLy7gSkgbbtT0sYkH4fOHHz4yr5FoEsDf9H9
	yGrajmzVSQ6SU6gVs77jZ/G8QG6edOBfilMugBdKma/iFS0txEoko2dm/lMW3EYGySxLeygGvSx2Z
	H+eeeoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x928d-00000005nJx-0as5;
	Tue, 22 Sep 2026 15:10:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x928X-00000005nId-0gF6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:10:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 329AE60DFF;
	Tue, 22 Sep 2026 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A516E1F000FF;
	Tue, 22 Sep 2026 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089823;
	bh=omtP9ok1iojYdMTStCvMewR9KVHMrUfbkgUBxyeLyIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VIzW9uiOZErgGwpb2MBkx+awxmmwYA78DwwJtiqJZwY5dCV0hNlDcpSr6qG5VMpD1
	 1OxTgIp9ilrwSCytuBosjm5tBO+jnw1i4RnYv9o7EYft6FUBUAiKRfWE2UZOMJkFQr
	 2S6v3AfRRGX8eSdG48n1JLmZI+cp50+pbeol/Ioo+750ldPVBkefk4LPUSiPKn/VsG
	 5J+1/Yfu7IWS9e8LC57iV0y60ieTfPrRKDuSOs3O1qzs/uJWds/1YBdl1PI4l0FMIv
	 SyaIFUf8vq/v11n+gnUf0MTOCSOpZu9JumCDPkotgaZymL2r2orxQlCkQV8TLEbSMI
	 cS/zfPYbzB8kQ==
Date: Tue, 22 Sep 2026 16:10:17 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 12/13] arm64: Kbuild: Remove vestigial big-endian
 support
Message-ID: <arKaWVwH5RXKpDTf@willie-the-truck>
References: <20260918145217.1669-1-will@kernel.org>
 <20260918145217.1669-13-will@kernel.org>
 <arEF5IOJSlQyYwX5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arEF5IOJSlQyYwX5@arm.com>
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

On Mon, Sep 21, 2026 at 11:24:36AM +0100, Catalin Marinas wrote:
> On Fri, Sep 18, 2026 at 03:52:14PM +0100, Will Deacon wrote:
> > -choice
> > -	prompt "Endianness"
> > -	default CPU_LITTLE_ENDIAN
> > -	help
> > -	  Select the endianness of data accesses performed by the CPU. Userspace
> > -	  applications will need to be compiled and linked for the endianness
> > -	  that is selected here.
> > -
> > -config CPU_BIG_ENDIAN
> > -	bool "Build big-endian kernel"
> > -	depends on BROKEN
> > -	help
> > -	  Say Y if you plan on running a kernel with a big-endian userspace.
> > -
> > -config CPU_LITTLE_ENDIAN
> > -	bool "Build little-endian kernel"
> > -	help
> > -	  Say Y if you plan on running a kernel with a little-endian userspace.
> > -	  This is usually the case for distributions targeting arm64.
> 
> Running the checks through an LLM found that CONFIG_GVE depends on
> X86 || CPU_LITTLE_ENDIAN, so it won't be enabled anymore.
> 
> I think that's the only positive test of CPU_LITTLE_ENDIAN.

Would you like me to add a '|| arm64' in there? I was a bit wary of doing
so, given that I don't have a way to test it. Removing CPU_LITTLE_ENDIAN
forces the issue, somewhat.

Will

