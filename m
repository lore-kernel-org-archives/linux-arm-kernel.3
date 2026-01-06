Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C7ECDC18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrWrmUEcepjc/MxZzu/XcC1bCoyGapqRcLqcZx24Lh0=; b=dmd2TGnRcxzfZr763TWz3M1zct
	Hb6bCOxClWMIxnPA0ADKXobiZej/ya2aONOuH8auUZTVitHrYtQ0723PCu3tABVKokFs/2MnryoLY
	2XEWFCD1Ij8l0MSq6mXGVsAMqZUDo/WNzQY3p3Mm39LjRU+BkD7Zic92iJNSty0nh4/UgQbYh1qgN
	Xxd+KHdpuIGMms6Mp9ss6EzGI5R85n/bi8PSmQUNsc7G0BgpPJ+CHzRNv/4dEQeGvSL1BNhe2hKrt
	bMUz8CsboV/9OXndq8XAoFfw9Pq/vQFUTK27+Pg2qjA0wdW52vzefZ3o27ztyzFo8spe5ruyaYzCU
	q1OoXOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd64x-0000000CzGn-41wA;
	Tue, 06 Jan 2026 12:22:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd64w-0000000CzGF-1F8y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:22:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A02A43C13;
	Tue,  6 Jan 2026 12:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FA7C116C6;
	Tue,  6 Jan 2026 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702145;
	bh=jrWrmUEcepjc/MxZzu/XcC1bCoyGapqRcLqcZx24Lh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLEhYDz1TABUPl7Bt+1isx1W/IoqjaL0c9Bf8+Ejn7ltzoHcT8txIDSsusunYH2Gd
	 AEnQpgkabg5E14S7Xsffe5rTmchjuF96RorZW8htJhJ4USnPHdSuWYVef9LslrKGF6
	 FMtjp0BZiGTmVQvfLfLFUq2igbf2tginL2GyFbTxBCS2S8vPMm0WMyB6HKqdIW92rm
	 Xrur1LTvo7zCApwER3eHjBOQp0ddEQa7hnOjb71FzT8HSpgFZLzZMTHdqQ+am0Dk4p
	 pNoAnXaLUS3X+thFmGlAUm0AqjTKfiqo2kXoGqozTqHOzqLHYhE7YqEqaFdG+8vrL4
	 1+9mS7ARkBKxA==
Date: Tue, 6 Jan 2026 12:22:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] drivers: spi: st: use pm_ptr and remove
 __maybe_unused
Message-ID: <fe48d1c2-07c4-451c-a2e7-338570557e93@sirena.org.uk>
References: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RUu1iIbwe7xJ/Z4d"
Content-Disposition: inline
In-Reply-To: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
X-Cookie: People respond to people who respond.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_042226_352008_822F2BE8 
X-CRM114-Status: GOOD (  10.99  )
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


--RUu1iIbwe7xJ/Z4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 06, 2026 at 01:14:16PM +0100, Alain Volmat wrote:
> Update ST related SPI drivers in order to remove the __maybe_unused
> statements on pm related functions thanks to the usage of pm_ptr.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--RUu1iIbwe7xJ/Z4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlc/nwACgkQJNaLcl1U
h9AbdQf+JYxZvoJLlKwbsDUTQjC4Mk5hdBG2qxuT/3zMqhob+VxeKNv5oFGesf+E
E3qS3sArsrkBNbU40i4mb4fCuGKhA+WILehyZ0DE3BmyjE1zwBWI6rruHu7AVuMG
uQ+2IA00P2lMlGF9Nsj5sf2r7kQ+EwOB2IfLJUPQs1BsBk9yoPbp8aNmMPuYWGiB
o18LxSypSDRAvCLu1IpBQ82TSjuAINHON+dHgiltYVXfebxeyvBocGulD5858d9v
i4+ghAzTRxSrol2f7BRtHjgK/n8+IVgHEC+FTa400Bwqh5gCezuol2de7fIRDXPK
NH/e26NI4zMfPcZ7HuTt+orpJyzEfQ==
=ZYVd
-----END PGP SIGNATURE-----

--RUu1iIbwe7xJ/Z4d--

