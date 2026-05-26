Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E9DCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aE+R/u09j8qM6TPFTCpY//gr4sjjgMS3TYVXl/OxTJk=; b=jZY86CEL81SOYg+JLmDVAQ5dhq
	vfXGYR1Jgbx6fwX8P7/w4+IRK6PVzQio7orEMQriR8RBWSheovJk8ukdTphvYiqRfbWlX/nIxUXq+
	+nboADdFYyNKhWuv1iPr9+QJNsQP7HxFzFRuzaaN7C0fk7onsbxEFUSadUAiXVUbReMRKImFyKbJs
	Z0CAc0lbuXZNDD0PXpFlQCM7uPFQCNpQiaum1U+LxH54AENdGnwCHOMkoC9ry8WR157v16nP9U8Yc
	pPcviK0hS7DbIoTvP1OTdu8w7zyWPRdFn4GOieVIFPeZBk5id8hiHPXiLYlF3hDtTsK4kJvAUbsO1
	DZp+sKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv4v-00000002cPz-153p;
	Tue, 26 May 2026 16:56:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv4s-00000002cPJ-3aa2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:56:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79079407EB;
	Tue, 26 May 2026 16:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815B91F00A3C;
	Tue, 26 May 2026 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814586;
	bh=aE+R/u09j8qM6TPFTCpY//gr4sjjgMS3TYVXl/OxTJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kRCwgva0cKHWRcWeDrk3mAlIH8Wcj/VmkNwQHUqODoirO01qihrywcJl1QmThtuW3
	 agMpjHifJfRBYr0MeDE6bVrrXzZApgD9GLcaZ7Lgu0K5GOtbwnJA7EnuiF7KL3LswE
	 KyVRGzagtdp55YXgeVhAwIEuBMgtZh7yKGxnJ61e5Ll1o2UcTggRAI+ig9g0yolYvX
	 giPv44vfde7r7yshYJuW7th2tCgIu/bC+FUsj2umteS67UJAbulXe6c9m4WDuf5Nol
	 suzAaTBG1h1Vhsbv+U6v4rs2H15HO42G8LZYEh6cw+iGbahEOy6qfKwpiXy47Jl6zJ
	 WFP1DB06c7DCg==
Date: Tue, 26 May 2026 17:56:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 14/18] arm64: fpsimd: Use opaque type for SME state
Message-ID: <5374217b-c66f-413c-94a3-a17daf64297d@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-15-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k7dlkVAhEl2qN3Op"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-15-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_095626_915814_2E14FEB2 
X-CRM114-Status: GOOD (  12.34  )
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


--k7dlkVAhEl2qN3Op
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 02:25:52PM +0100, Mark Rutland wrote:
> As the SME state size can vary at runtime, we don't have a concrete type
> for the in-memory SME state, and pass this around using a pointer to
> void.
>=20
> Using pointer to void means that it's very easy to introduce errors that
> cannot be caught by the compiler (e.g. as 'void **' can be assigned to
> 'void *').
>=20
> Improve this by adding an opaque 'struct sve_state', and consistently
> passing a pointer to this.

Reviewed-by: Mark Brown <broonie@kernel.org>

--k7dlkVAhEl2qN3Op
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV0LUACgkQJNaLcl1U
h9DQDAf+JGb0gcT8On/y7MnY+7JzDNUH1pP7oAg36SBjfXyTtn67iSOgfyO+BBJV
8bpvKMwIgCrCsfpi+Xphp2Bu7WpJtqgheZG4bm3DrpMuvyf4aaSDb/sTLtsAka/l
CALNrdL7aHk0BSCY7GC6mpw3sMJUZqidhY153exnOytVdqVK4C5mOCvIDN+E6xqa
ITVY8g/Za8gDYAyyyWdLnUAFXBMBfJ6BB1orBdcx/gC+liPEwcj+HG1K36alIuvm
PgZ/DTpNu0/UyS+fT18zKOgd2WFUkmzxRDWC/Ie6oA0O58pF9KnNlLO/WUTOwhA8
O6b1LKf+Uht1imtKIGUJbWjQBesH9g==
=cZ12
-----END PGP SIGNATURE-----

--k7dlkVAhEl2qN3Op--

