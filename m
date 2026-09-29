Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7E0CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/nJ4k1u78ke7ZIHZ4IMT2+oEY9uF0eOOz//6bbIgqY=; b=BW5q8IV53U2AzIJSBI7lBKyYxn
	i7Qi98g1UYlm0lEeXgt9Gl+PgV/6wwQwaLxsIxFC+olKd8kGfGRi6Vpmf+BzhoSzgYOJT6F64wRAi
	PZa3pfTPbdSYRuET3xOCsEAHhpXG605Uq3cJ986FBE2lPxR8F1jljAxAVf+ueE24MWRRUudKddF+i
	A6njqYlQZ7IZTT3eGQUBMRJjgX4VB99qISKBMfj1AkuURqXejMIWaPEW8bhvqq9FDsIL2f8k8rvYf
	g5CONeart6w3sAyNFiRVL9P6bGemAI/ElUA30P0D6BWv5cpMHN9g7VMfCWmdLJkhMzfEEs+cUE937
	EEPtv81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfvC-00000004fRO-3JVm;
	Tue, 29 Sep 2026 22:03:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfvB-00000004fR9-1KNQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 22:03:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6B2A43851;
	Tue, 29 Sep 2026 22:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B401F000FF;
	Tue, 29 Sep 2026 22:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790719411;
	bh=v/nJ4k1u78ke7ZIHZ4IMT2+oEY9uF0eOOz//6bbIgqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mMO3s90BPyVNAf3nUTt7RP3vpKU1sWdUZrUeRmMYdW/AKChDH4asRiPP6HJwxqnyB
	 B1zy1qrfD/5nHEfgGSU1E9IIIEQ1MIHwxuMke8DCbWfqMnf0myGRguUW/8ScsTYajh
	 qz94KFKNJtSIGMHhgdpoksf+uJuLDgGTpj0u/Zo0kU2rM++IUD2qk+jE6cVNpE77wz
	 aYMorE41+yHTgN4bBWx2Yhb572oTvAs+9aWhlC023k50o2sTVgow2/6ZKEtZPoemgo
	 bvktGTajcnXcxEAxxKURHAZ8p4vrR7ZKgm6Lob1JpEtk507QyPnQYbEzinEldEG7kh
	 PgOKbB8HgOlMw==
Date: Tue, 29 Sep 2026 23:03:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <489314ca-0bdd-4d19-8f53-cf0b38130da4@sirena.org.uk>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhcXNUoMVHeEzr/M"
Content-Disposition: inline
In-Reply-To: <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: 1 bulls, 3 cows.
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


--yhcXNUoMVHeEzr/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 05:27:28PM +0100, Mark Rutland wrote:
> On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:

> > When they detect corruption the fp-stress test loads print load specific
> > diagnostics and exits with a failure status.  In preparation for
> > building versions intended to run as KVM guests factor the exits into
> > asm-utils-linux.S.

> This is a good cleanup, but I do think it'd be worth noting that some of
> the existing asm was wrong and worked by coincidence.

> I did mention that in the patches I linked you to a while back:

>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=922d15ef46cb486a79f168949e103f6df26f4fba

Ah, so you did.  To be honest I'd initially forgotten what was in there
when I wrote these, though I did go check them after writing and should
have updated the changelogs when I did.

--yhcXNUoMVHeEzr/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8Na4ACgkQJNaLcl1U
h9B6XQf/afmbwqYeX8wC1xYdsrffIp0UYaX5YWRV++8pmaaLaLV1J+8tGXCUQ+yB
iio51yiXRE4/24GNDnX0AdMaxsruqbgUi2Oy9EWMcY9/juQqWkNAfz9iXo1cUEPm
mJ4Nl6LNNC7GRdO0a1vdLaM7bPQVmb/bS6hl7tmDwgf6Ysz8YEfsd3ww5ARQmlHp
ybmzWIytlXREenELwE2+iTu3x2iIS3pjWIbqSnKF94oNZt+MeoFKo9yoc7T/4qbu
VFUPBK50gtAq1Xx8M1yPk3urF2sWsbgV/Ya5hwQik1haeEBr/E3i/BTLnXDg7K/1
vLmUZuilkfnFkfJkR6XfF6WLOAc+4w==
=8oJI
-----END PGP SIGNATURE-----

--yhcXNUoMVHeEzr/M--

