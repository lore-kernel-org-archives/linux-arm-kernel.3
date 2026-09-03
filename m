Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9C6C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI67CPM8yi0ZXHmIKGRDTSpV4PxMt/Uk06vuw2OahkI=; b=JUHymguIbfSKQt0ESNBc7aoI1N
	+WG0McJVRdmJiR4vXWDkLdz6bc5yhnZlvylH81KMD3YwoW+UJw2G/mvzgisGlBm9qYSnFuiVny5Un
	OQ06oYge5byrq22LEs0zzrJUp7JLHVET5f1/zqujmdJFMRLl/z2IJRkRNw4xVPToqUJaoSUAGnbVh
	Ep99ItvONw8qXMUvcA63gEiDOhTw+RoKatD/ZoN9+IMDTuhNSfsKxUQDiu+0gYBKW08tV/KxtwQxB
	aK66J/v4LUu34qLkXoJsez9YCkZUWvpjaIQaqacdgCwdZCFCWFvRZtcEUYev3hc9lyrButzAYLw5P
	5hJ0ALyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25j2-0000000HDW7-0NaR;
	Thu, 03 Sep 2026 11:35:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25j1-0000000HDW0-10KH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9BE0437D1;
	Thu,  3 Sep 2026 11:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9A31F00A3A;
	Thu,  3 Sep 2026 11:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788435322;
	bh=GI67CPM8yi0ZXHmIKGRDTSpV4PxMt/Uk06vuw2OahkI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=O2IlCtuMNbakoyXY2D31P0E159cHIcVJigxX8w1haBC94Qr6S6epMXjHIa6zRKBcI
	 OE+3f+rxDwwrGfsAD39fX4eezjvDMWYQsiEBdjcI2ykCvpuYqCZaATkfJtH49cQ18l
	 krxnRw67DEnZu6K+iHbcYVCl8cpwh6T+2TyVgAZ1f3p50VYIJOnhiW6vlOJB77V4Ko
	 bG6Ibq/G59tGMPHPCGWYjsKzLdkjHjjnOyo4mBexT8oQGRPZLzX6I9LxqSU40yLiBI
	 6ioEwGaIon7j50uKjJMCzEfi2pGebyH9VSRHP603iIbFtQsc0r2t+s5gmnlXTPVxsg
	 JAvkM9kZDFz6A==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id E4DBF1980047;
	Thu,  3 Sep 2026 07:35:19 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 03 Sep 2026 07:35:19 -0400
X-ME-Sender: <xms:dVuZaovR-c4KRU0bTmDyoCGKVMfDysb6kHC1eD5iZo1XHtRzHLg5MA>
    <xme:dVuZagTuUyST6iT-SQLgc4S5CPheVwCXWPsq_mLPsKpOjysyPxS8RjXzOtmsnJIsE
    R0PLVOL7-kSEieR9iijT3rSlPzPfP4Uw1qparPP_tnFvwZYqtGYWTHQ>
X-ME-Proxy-Cause: dmFkZTE35Cj2o9w6o+pggtHOOqOz+sFl03EWpmd0tgzo6J4wCd8a6EDhiYd49BIPNtsWXQ
    0iMYBwpT31vuwS1JR8RCBFTjzAOhlfyq3ma8jZDDtkEvhBXicIKS9OZnuxqiHsod5f97xV
    J8FuqC6e1eFexwdHQ5OjGxcGDKBn7IryT10wtxIaC4dZKH5cEiidOl7qSUhty7IyZid1Fl
    fJ0P/6Mj3V5MrBQ8WAroV/0glwDye2vhVcP3ViBaNekQHcc/o76j8jjKJ02MtH+5zbHJSw
    +wpKAV5qAtjs+NgZNC3uSWYGjXjfwAGnlPYRQsAVCbM4H1PPFRNi5pfmReEaN61S6yq6m/
    m2p+KCzk8ukGUj/kpko5dgEeh1qnctYJ9br2Pae92FQF+tYhovlKnfL2iqeYktjPnfAk/m
    QjD5Bzno//eaVQPd+UzOzdmPZgjpenScHoY+Trtdb2FKlTvt0XEgWaQ5kDNUaGo1qGjiwo
    nlswmSKj5eQT7TsC7UUKNsL+u8qbVBS/QO6Ds8ZwXRRCiIlcAfYe+la8gV/Tovgl2NjQOO
    dweU/H5/dm2ZtkVoyH71W94LMdRNNDu5RgOWguqkAVYgC4NDPF2qmjcSI6JU9aBDfc5FPQ
    nhqY/ZXhVMXQQ6ujvQfC/dRftD41+DoPW3t84Fqh1lJN4xRWiI6VMF5Jrbwg
X-ME-Proxy: <xmx:d1uZalmMn24bZvw6ZcLzuvbcrJAKUgXdzzzS8Ud0C6nXYA5EVSPc0Q>
    <xmx:d1uZariQuCSm2xXM69lE3G6vkzqSsl66MJ4aSRGJ0xZNmHI3CWwIlg>
    <xmx:d1uZaiSh-nrRtvN90zTY6qN6k34XEQY-5mUsY52qudIhz0_2VpP38g>
    <xmx:d1uZagiQ1esEatnM-Y_IcDnASzPxDyVKHWkMTHuTWVtpIJAbsM8j7g>
    <xmx:d1uZauiiVEu2LLn_6b5rQDBKimEFB2v8DRx7K80_-fufnxKLOWw9oQim>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 12337F8007A; Thu,  3 Sep 2026 07:35:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 13:34:56 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Sven Peter" <sven@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Sudeep Holla" <sudeep.holla@kernel.org>, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 asahi@lists.linux.dev
Message-Id: <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
In-Reply-To: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel sharing EL2
 for Apple Silicon
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Sven,

On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
> Hi,
>
> Usually, idle and sleep state are implemented in firmware running in
> e.g. EL3 with the kernel trapping into that from EL2. Unfortunately,
> there's no EL3 on Apple Silicon machines and we'd rather not run the
> kernel in EL1 since this would result in losing KVM support.
>
> While the shallower states could be implemented inside a custom cpuidle
> driver (like we do downstream, see [1]) the deeper states result in a
> complete loss of state and require bootstraping the cores again which is
> quite involved. So instead we need some way to call back into our
> open-source firmware to be able to handle that. This is even more
> important for M4+ which don't even support the architectural wfi anymore
> and always lose state when that instruction is executed.
>
> Luckily, EFI runtime services provide much of scaffolding we need,
> namely a way to keep some code and data mapped and the ability to jump
> into there from inside the kernel.
>
> This series adds a custom EFI table that points to a PSCI entry point
> (plus some other stuff that has to be available before EFI runtime
> services are set up) and adds support for this new conduit to the psci
> code. We can't directly use the normal EFI runtime path because that one
> takes a sleeping lock and we need to be able to call into PSCI from
> atomic context during e.g. cpu bringup or during idle.
> It also adds support for specifying the specific MAIR attributes for EFI
> runtime mappings as defined in the latest UEFI spec since Apple Silicon
> is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.
>
> This all results in a surprisingly small diffstat. I believe this
> approach was originally suggested in some IRC discussion years ago,
> possibly by Ard, but I can't find the old logs anymore.
> Happy to add a Suggested-by tag though if anyone remembers.
>
> The firmware implementation I used for testing can be found at [2] and
> the full kernel tree with this series applied at [3].
>
> Best,
>
> Sven
>
> [1] 
> https://github.com/AsahiLinux/linux/blob/asahi/drivers/cpuidle/cpuidle-apple.c
> [2] https://github.com/AsahiLinux/m1n1/tree/psci-via-efi
> [3] 
> https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git/log/?h=efi-psci
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (6):
>       dt-bindings: arm: psci: Add EFI conduit
>       arm64/efi: Add and parse custom PSCI EFI configuration table
>       efi: Add EFI_MEMORY_ISA_{MASK,VALID}
>       arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
>       firmware/psci: Add EFI runtime conduit
>       arm64: dts: apple: t8103: Add PSCI and CPU idle states
>

I've picked up patches #3 and #4, which are useful in their own right.

I'm not sure if the arm64 maintainers will want to consider this, but
I think it's a reasonable compromise, as it puts the abstraction in
the right place.

I take it this will be contributed to u-boot if it gets accepted here?




