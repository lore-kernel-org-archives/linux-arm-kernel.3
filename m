Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB7FD6C281
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 18:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59x/LtG3m4y7wF3nygdztti9iVOF3i3ebYRm4+XJOCc=; b=iOLGJGAh22fn5j/d23/L55T6A1
	32/mrz/kwljbStCP4tYY1ipVf7PsaiAEL7CjoZ2kAMielL4ob5GWIWfwGsriqMA6Joh2Yy9MRv2Yc
	7r5Lomuw3VzGbPJKp96vNUQAnJpvHJXGDuhbUjYm/SCPlp+xmUfEcBI3AYOAliVDNvJop9iXemDoG
	wsvpvuNMTptNOL45ie/nDpcwJPGSAsZ1QOlFOBQHsop3vMsCtUZmPTCtSORMFWKSavuqooqHwBDPn
	3ciGGVGebfOBR/1gwwI6cGEqtcJcxo57iWutejkB4uW51ZO9lbyjSCfI4YRhUVCaCJx+KVjXudOmq
	D0Z5c6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSdY-0000000DKWQ-0m9k;
	Tue, 19 Nov 2024 18:07:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDScc-0000000DKMd-351k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 18:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21DD05C57D4;
	Tue, 19 Nov 2024 18:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54664C4CECF;
	Tue, 19 Nov 2024 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732039601;
	bh=tO29qmXnQBiYVBJ8k86fc371KDYzbkkwm4QvEDUHdCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lkePvW7xB6nW3N7qHX0WDaEErluJ0FIHbMjXEp2BLmeiZ7iz7X49qEx8DoYHKXeB3
	 7AspRArmaFfzIbeHQcZwr6yHrcGiTqsri2Z0Bj//dZHusfpm6vvHumsS8Xpxn8DitB
	 HiBQDsZAc85cPEj48NrsJ5w1/yEhXHMYb4AnNLk9ckNncpsn8teNRWVhn493t2LEtP
	 G5AF7WCZq9sHmNBem0SipWhf1h2KNpXgTLhDM6vP6uRbDzTJdcSWNnGWkBBM9qsn6e
	 IlMKT89zcJOvdAfhpkXpo4oGMVbPMt6uKIyir0ylmYQxsNB+hHu3IGpPmn2KVEMm4s
	 wBSUHLaximUkA==
Date: Tue, 19 Nov 2024 18:06:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, jpoimboe@kernel.org,
	kaleshsingh@google.com, kristina.martsenko@arm.com,
	linux-kernel@vger.kernel.org, madvenka@linux.microsoft.com,
	maz@kernel.org, mbenes@suse.cz, mhiramat@kernel.org,
	puranjay12@gmail.com, rostedt@goodmis.org, will@kernel.org
Subject: Re: [PATCH] arm64: disable ARCH_CORRECT_STACKTRACE_ON_KRETPROBE tests
Message-ID: <c5cd88f1-6390-4148-9595-07b3c09ab117@sirena.org.uk>
References: <20241118120204.3961548-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k2YslX4LOWBeSjJG"
Content-Disposition: inline
In-Reply-To: <20241118120204.3961548-1-mark.rutland@arm.com>
X-Cookie: I have many CHARTS and DIAGRAMS..
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_100642_811733_388C395D 
X-CRM114-Status: GOOD (  17.33  )
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


--k2YslX4LOWBeSjJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2024 at 12:02:04PM +0000, Mark Rutland wrote:

> The test assumes that when a stacktrace straddles an exception boundary,
> no necessary entries will be omitted and no extraneous entries will be
> reported, and when unwinding from a kretprobed callee, the next entry in
> the trace will be its immediate caller (whether kretprobed or not).

> Recently the arm64 stacktrace code was changed to always report the LR
> at an exception boundary, where we don't know whether the LR is live.
> In the case of the kretprobe trampoline the LR is not live at the time
> the stacktrace is performed, and so the entry in the trace for the LR is
> extraneous. This can be seen if a call to show_stack() is added to
> stacktrace_internal_return_handler():

Oh, that's a bit annoying.  :/

> +++ b/arch/arm64/Kconfig
> @@ -14,7 +14,6 @@ config ARM64
>  	select ARCH_HAS_DEBUG_WX
>  	select ARCH_BINFMT_ELF_EXTRA_PHDRS
>  	select ARCH_BINFMT_ELF_STATE
> -	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
>  	select ARCH_ENABLE_MEMORY_HOTREMOVE

This config option is only used for enabling parts of the kprobes tests
so it's not hurting anything at runtime AFAICT:

Reviewed-by: Mark Brown <broonie@kernel.org>

--k2YslX4LOWBeSjJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmc806oACgkQJNaLcl1U
h9ABKgf/R/7u3P8XFaSDhIfVLJlsf9aPjfGZE00dJ22IL5QHSjG6/EL4j3/zOavI
B9waIUtfSwfMCeOYAzmEvr0lO7owU6ZV86Fc+xAwfA0oZVSa5P3PAwZu9PpF1dPY
PJKWNMS5+09RjMZiqKW4/E/JaL1xaQeMiHDnOUSdv9zazoFifqD9EZbwes3q89lW
EniQE3oD7BcoO0mXnLy6nSlJrw26hpbBzqQrXpdkMmUjErGsYZn/nCK6lC0ONJjJ
wmwC84AOeTJr6l9XPAikDLdrUz0QQBffq3sEnk98FSflhgm0foj3VaxSmaGcdjXA
xWCxzWIvczqUnGO4gsoD8hrq0wrllw==
=lv33
-----END PGP SIGNATURE-----

--k2YslX4LOWBeSjJG--

