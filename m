Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB050F46112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OscSA7VX88n3XrL7v79AKQUAYIeU7nasD2rrGASIl8w=; b=PPrdZpES3h/jK4Bji0PoKdIJ/Y
	A04mFwkS6KrLhoAqevZ+1vdbv+/CPKKk81OPhGNEpHklhE+poaen5P8Q53Qk3S/HwzBCsuQ58xZp2
	Zw0cYj4bP7uzS+mCOFPNHU9R2tA/diQjT0tiad9BMroiOm+GcDWAdTpk+8SL+7xthiqFs2JC8losU
	9kmrwx2A44AHeTvA1CTrlhVj9b+fx1tq02e32FuhVeswAr0d84lekQidLP81mVxW7r4ylX9zlKXLz
	Sjad2wNSMUgFc43wbwZCIf8fzBN37jUhB/obZOvD0fvUwsRXMGbnIlj+q8gTAsiWNXKFC47GIhm4D
	AMbY9+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fcv-0000000GrXV-2Iax;
	Mon, 23 Mar 2026 13:47:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fcu-0000000GrXD-0mE0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D2B4600AC;
	Mon, 23 Mar 2026 13:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA10C4CEF7;
	Mon, 23 Mar 2026 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273647;
	bh=n/BN5CL1WxBMpMxMXTlEGYNKW0+Dt8dFs9PN5GhrPc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFqT8tOKxCtEL4bjUYtNwV0kyZpM34BPJ1M7/93ycZ8k+sJjClfRZHcpWmd80cGFW
	 VQ+Brrjc4Gc68SlSQvKBmgHg63PEeO0YQGlKgHC2+UX4HtnYp1e2xxtx/ihz/NOuv3
	 WbVIT734BcsAp35mgE/L5VJDSGjJDrM0OfqKuSb03tCMkub76wR9a6AFLDbwkTe1Md
	 FJE583U1jnwmjBtb8+gl6xbV6x+Py0Rqe12Xh7E46hYf+QJdrYdytiFZKwsQTh1vk+
	 0HbKVfl068bHzb798Kg3ZmEt9hR1oGxSve/zPag4U0kuT227V/hUPR+WSnLBlQsEcw
	 Xpet+rWYat6Mw==
Date: Mon, 23 Mar 2026 13:47:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	lgirdwood@gmail.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: stm32: Fix incorrect compatible
 string in stm32h7-sai match
Message-ID: <e4146fbd-3e2e-4d2f-b042-2af006bdfefb@sirena.org.uk>
References: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qE4q0SY78LU6P2Qu"
Content-Disposition: inline
In-Reply-To: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
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


--qE4q0SY78LU6P2Qu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 21, 2026 at 02:20:11AM +0100, Jihed Chaibi wrote:
> The conditional block that defines clock constraints for the stm32h7-sai
> variant references "st,stm32mph7-sai", which does not match any compatible
> string in the enum. As a result, clock validation for the h7 variant is
> silently skipped. Correct the compatible string to "st,stm32h7-sai".

A web search for stm32mph7 appears to show stm32h7 as the correct part
number...  ST people, any confirmation here?  Are both valid?

--qE4q0SY78LU6P2Qu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBRGgACgkQJNaLcl1U
h9Ad4gf9FDP7GFBd0VCxZa8UNz10NKWI6UItALUjjjsjEf9mhswPDggnsknBDl2Y
4w+9nGrTJ1aX9nQUDXAk5ffeZJkk91NB7AwIOTVNqXoduBQZ3SaN/xy79C2JNNEN
CDIUAvRPa7QIA4bxmHJCA7AttHDuDToBYSGm3TOMJpJqtDZiGBmLckgE9tkMEzDX
odvwRZL1SHf94AwsDZw5rSV3+xBtGHwSiGcOr419u7dE8MuEZmU/W2/ghdhCHgMx
cuL7bDPqfruIPaOgiVXK3yoSyOQjs/KqtyOrwIjMoxjLUt8bNUMTkKvbB2udagcV
P3rXfJ+QMo5MqneyzB7J7DS+1Mjf0g==
=Zi5l
-----END PGP SIGNATURE-----

--qE4q0SY78LU6P2Qu--

