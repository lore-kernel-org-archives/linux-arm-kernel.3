Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15916109C046
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOLHph50MygLD+LJIPpWwZg6/ExL863ytypasC2g0/0=; b=NKFRxtCWYRBsDyWaRrmR3SioZH
	6je1YxjutVLbV5hg2QXc9GSMQ6ai+GBK43lXNR8c6fMmD1xkzfGrAqZBAD6IlbVzlIW70DS67kKuX
	uHyTVRLBnhkaQLN19T2KaK9IQQyIyQpjdKojla8oxLPGlVs+0B1ASJG/ff0Y1Bi5iJgs7Awbm/1nx
	qtimzhwqvrg4B+dOrMWLB6SH9yw7wHZXE10M/uq2Z9+zCIPwsZFl7xr6bPRtScHzK0L/9Nl9p+bHP
	6OiEOboVdeaIbJmgy4rwRbiKfR3uAbfSjQcrcIGrhw8TOT+N4Ug/1M0GMMTkV+xZroQLKoGbCHWcQ
	AfthG7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RVb-00000003wtT-1jv7;
	Wed, 25 Mar 2026 16:55:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RVa-00000003wsy-0SBI;
	Wed, 25 Mar 2026 16:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55F8D600C4;
	Wed, 25 Mar 2026 16:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB62C4CEF7;
	Wed, 25 Mar 2026 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774457705;
	bh=RKKiiq8BF8Gnss15GyLrbCZ1nQZVCizvsceHIkQybeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUmZoGmEOFgd86CDps+cN4uba4Z8k0RbTFUgOkt4vajosQUVDMjIwFN9CDpxm5RYr
	 hxBLzLwoS861MUC0M22kcTkbhvNNE0TxmpPEB8PTRQDxPSCmkFS/nFXIBqG5qQp5Ry
	 QiR0645ytteVjCwi/8/pmydejBFyvxu1LUVvWRzHDNnC+VlAXP9zcA0gSHS5r3wYus
	 mjIJ5GADmJ0m70/jwlDNGwr7MGCxpvXj0sHXQTXBpaAeZdT+J1Oi2R6VhFZ82Lk7rw
	 2QdZcVNjPzQA/bE/9lA/B4Gem45JFrTc9Fc3fgl1D3/mHD+g7eStV6briapV+yKL6N
	 ito5CWuspA+Jg==
Date: Wed, 25 Mar 2026 16:55:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator
 supplies
Message-ID: <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
References: <20260324053030.4077453-1-wenst@chromium.org>
 <20260324053030.4077453-2-wenst@chromium.org>
 <20260325-uncovered-carp-of-inquire-8a7acf@quoll>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="waZYWKl2+xYeqLDx"
Content-Disposition: inline
In-Reply-To: <20260325-uncovered-carp-of-inquire-8a7acf@quoll>
X-Cookie: Question authority.
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


--waZYWKl2+xYeqLDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2026 at 09:56:00AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Mar 24, 2026 at 01:30:28PM +0800, Chen-Yu Tsai wrote:

> > +      pvdd4-supply:
> > +        description: Supply for vbuck4

> These all look per-regulator supplies, so I think they should be in each
> regulator node (see also regulator.yaml).

> Or in top-level, but not in "regulators" node. The regulators is only
> wrapping node for children.

> I wonder what should be our preference - have supplies per regulator or
> in top-level node. @Mark, any preference from your side?

The top level, so people can figure out where to describe supplies
without having to read the bindings so much - the supplies go into the
chip, even if they're distributed within it.

Please don't add random characters to my name.

--waZYWKl2+xYeqLDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEE2MACgkQJNaLcl1U
h9BbaAf+OWrcsJ1vWJ5LNMOJFWdpauabUdohO1MiXidlGIsmN2yzEM3MfF9lQFNs
Sv49o8uJQLbaVz3Abgtn4eTj0uD5zyP+QWWO1MGnfca17vRjy2PVg92Rp5GQzOWt
TCU0jGuxbBy9flaSJ1qFyzocxSD6PQh88K2fJ3ksKBc/AUb/LlCYQqTxOaYm25Xo
C13pwZf8CI4BqfV1T2p4h0wPQqaUwNQGi/s5h1KnhYV7H6BI4+WTjR28PpaplHD9
g5/FIRSvoQlyz4QcyfmoCPlOhMQVq2AwuIvXEy/X+tNfVHetDX6NvHs1lPmNdJit
w4hnfdiYl4hBXRqSFNcqwKCAsiDVkg==
=VW8o
-----END PGP SIGNATURE-----

--waZYWKl2+xYeqLDx--

