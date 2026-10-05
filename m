Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2153FCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPfeZ1pvE8U6ad/VWKL619ZklTO17ImScbG2yGjxAUE=; b=HUItqpeR85evpToUQRKhOenk4J
	SkLYrfFQ1wbwUfI9F09YKPUdLJ2ZDTO3bDpW1nxT46G+bAaCJ+BWicxLy9KPqprPzAOcEs6kQcOXR
	PuaDgXMZfrvCRpdCSjhV0CI9GPBvBHQlHnNmwMUkNniABcHjLtH1tWSTAd5sVOFxC3zTWgf8W+TI0
	SCnJrr4Xit07Awdc15EqquvDW9ArvYC0PMRiqjbo9gUCGw+8O+47fXb1xzSjMEBfKSvN/X+O/7GEX
	zVrVY7oCRnPrrZlvB3lVzuPmZ0uoK+RBeomKRwkVQEWIZfvEIzgwW3otPvrjZ2tWYztPEpD5a3/9y
	+5e+EUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkHc-0000000GjCm-2yKR;
	Mon, 05 Oct 2026 15:07:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkHb-0000000GjCf-4Aqw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:07:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 039EC60514;
	Mon,  5 Oct 2026 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA5C1F00893;
	Mon,  5 Oct 2026 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791212834;
	bh=iPfeZ1pvE8U6ad/VWKL619ZklTO17ImScbG2yGjxAUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQNnATcZ53KbVtJLtVuXDRrssveixvWX+45sLhiBd5IJs/8Lfex2aQKrAy4e3C0Av
	 PU1v0Yl/zHapQHuClLg6v5zbbNgBbHk35h6qdnD8HWqFwjZZ8l2XMOOxvVfDge9/S6
	 xLdFzIcjgkM213Facnp04hF41GYg18CxbbIiZjylQ4l0Pyklu6XKh2h8BOVd/QDXyD
	 0iR9x1t/l6hWNQiYtIQaG/QZQ80owZh5o0DlooXVNhyh4BO8+oyKFZPLlqLjMrxQLb
	 OMRE+pK82PxG6FZcj9O3HZAihZ5KFRq40qKuGjUtXkU9xcJyhc1433UCUI+qkLcFmd
	 uGpgzFVTsjKwA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 453E116B2223; Mon, 05 Oct 2026 16:07:10 +0100 (BST)
Date: Mon, 5 Oct 2026 17:07:10 +0200
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section
 calls
Message-ID: <asO9HgunrGVLdpc9@sirena.org.uk>
References: <20261005110511.157016-4-ardb+git@google.com>
 <20261005110511.157016-5-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cDTElpWIoLj2lYO2"
Content-Disposition: inline
In-Reply-To: <20261005110511.157016-5-ardb+git@google.com>
X-Cookie: Use the Force, Luke.
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


--cDTElpWIoLj2lYO2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 01:05:13PM +0200, Ard Biesheuvel wrote:

> This means that calls into a module's .text section from .init.text,
> which may need to be routed via a PLT if .text is out of direct
> branching range, may result in BTI exceptions due to the indirect calls
> performed by the PLT veneers. (Note that calls to .init.text from .text
> are not allowed.)

> The 'solution' is to emit yet another veneer - this is what the ELF
> psABI for AArch64 mandates in this case.

Thanks for doing this - it'd be great to finally get something like this
merged, it's been sitting for far too long.

--cDTElpWIoLj2lYO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrDvRkACgkQJNaLcl1U
h9A51gf6A8PYaiLV8T7mhlzI64at5uWtH9y77bPA68B59G2rRuLyg6axZlyhFAI7
nGnzXgpTFs2B520ojNPjBOYyABI+rkN16ETrKP+q/K1HI29oX3bs2jvC6F/qpRYO
T3M0pfe8A8iNvz/JGQ5vZU+TldrjpJEq/cM0mHghhUoFzKQtR2pgAGUCRtVOH16D
u/q6R0xjO1zWhdRPBIKguHLEwjTkYn47Er5RQBTod0ffIOlZH51EaauKHDKqTCif
SHrTtpPiahw0qoGZ7cdKFvlXRcgSXqlZGbYfwD2z2fGop/T9kU3QVRhNvuTWRvJZ
//suEcsPwJX3xvaVj7G8Msnm710OpA==
=5LQf
-----END PGP SIGNATURE-----

--cDTElpWIoLj2lYO2--

