Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0eCghk0V5B2+bwkFHAFXwdVxEzSQzEO3eUOlJFDsFY=; b=NbGYkhmHLEVcNz/uVKNOiEtl4w
	4bTLkOGbkPRBIQoRgNmUA7lubnqS0DWFRoVS9qJpQ4v5DUIB0BpSsSFFHpnpX6rxpG14USZvj1VHE
	6BpJLmWXDi11t9cUh0KPDdqiRYrLNKS6Nu4SqogyFjByrYXVaqaxyRv/gq3Ml9xnB2rMWQz48Jabe
	JGz8flcyzJ9nA36Jp3VrvB3KnCkotArJT+/QxnvYkxHzDmVMmtFf1hOATWmcae9wV6WqnneqDekHM
	re9tV0WSbNv6dqIuyOJihURFRPPl4J/hXmojwX/rNpkjSS1+faPkWz+rJweG+NEmXW6ZPAY27EsZ0
	kfkoD/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYu-00000001dtV-2vmq;
	Mon, 07 Apr 2025 18:51:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ppi-00000001Ivt-3fyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77BC343BEB;
	Mon,  7 Apr 2025 17:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD75C4CEE7;
	Mon,  7 Apr 2025 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744045226;
	bh=c0eCghk0V5B2+bwkFHAFXwdVxEzSQzEO3eUOlJFDsFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMXJ+F/iIL7d8F1Ecp+RO+vw7oK17bsA+ADX1BTTS4qKxKck6S9dG19Ewu5QFnxI6
	 OY2vMJu0Afz1MinJzFR2nv60wUrgT0Uob/JTu8MPpZxZ4AB7/C1llJxYoNX6zMowiV
	 ZeXbVv2zQ14FHc0a3qnZagjJ8woYdSN25vAa+m39BCc+C7PAzA53e2CwYL9UIdABmZ
	 P46RHJz9OOLr4qyd3hVT5n27tSBZzWglBhz+O0mOOhGOc+bPMOfzwh7KoVb9HmWWFW
	 +wG/K6pnunnH/s/lFgTMmLGWjS+FvHaVMtYG1XnMf2zvxwdFGs6MNSRMMXPIZ4ZJPZ
	 59ixEXhSylJPg==
Date: Mon, 7 Apr 2025 18:00:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 10/14] arm64/fpsimd: Fix merging of FPSIMD state during
 signal return
Message-ID: <037c4788-943a-442a-a87c-c1d3e13ec3f1@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-11-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sCvOrvQ71sVDzElt"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-11-mark.rutland@arm.com>
X-Cookie: Meester, do you vant to buy a duck?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_100026_931527_7E88B135 
X-CRM114-Status: GOOD (  10.27  )
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


--sCvOrvQ71sVDzElt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:31PM +0100, Mark Rutland wrote:
> For backwards compatibility reasons, when a signal return occurs which
> restores SVE state, the effective lower 128 bits of each of the SVE
> vector registers are restored from the corresponding FPSIMD vector
> register in the FPSIMD signal frame, overriding the values in the SVE
> signal frame. This is intended to be the case regardless of streaming
> mode.

Reviewed-by: Mark Brown <broonie@kernel.org>

--sCvOrvQ71sVDzElt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf0BKQACgkQJNaLcl1U
h9ChJQf+MC0c26+itPuGACrZhABnN9n5fzK9GolzkXHBSMuodms5+wDd7whuz/zu
zmXKb4Xtltvsgy/4mduLU8r9pw1oA0tBSQzYA00wBTzftURLSWX6VReLe8CdAaIL
je1X3FTCGL8LLEGGDqzx1MGHpzcvYGmIUT3JQ30T3zrccdduqfpXxWlaLADGmTCZ
XY4YORD1OtNe4lWHPaRmGMU6RLKS8wpb1pcqsjCkHw0zUEL4jXIZi4C7wIA2/Fur
iuXVXs6yNMtzfhZKDFdDD3ghLSvA9NZ6WMj1GI006UYH67Eh2lm9yyqdRNti+lAT
38xZaVzfsGj3y8bXGpNPbbVA/BpfDw==
=xVT6
-----END PGP SIGNATURE-----

--sCvOrvQ71sVDzElt--

