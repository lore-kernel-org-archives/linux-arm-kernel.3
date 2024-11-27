Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDF7D6ACC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SaWe6ybEx6oBenIcjOSn7QO5dVWiXFnNc4WUHgGhoA=; b=tXy0dnnPvNck3OXTFcNG8j3A9M
	ysvtcAZsWoPzLBgeKdS7gfTwL0jmyoYVEj++n1Dx1jr2jlM+NPASs1LtVx1vet+FtPeA9bqjbbhdK
	YHLg9p+2QRBln4iPpLcrUb9VIZWaFWYP4YYDrMUtVOQnbS+QoutSWh9emrFlj1rq3tM61p8rLbuna
	EfBdd2vYU7E0FGImGXQHCmlnv+gNyYwPVdslKytURxaAG9bnEQbGKmSGTlhY+hfTMAa96qOy/1Bls
	haTrLkbUBhbkH9hmqWxVPhHvZ3pGOgzO/+PFYOwit0dGdAWgYN1ZSNWuuAfL5J0xNO+DqIdawID4n
	IRDeyqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGC7-0000000D0mG-0UC4;
	Wed, 27 Nov 2024 11:26:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG7R-0000000Czin-33kx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEB3C5C5767;
	Wed, 27 Nov 2024 11:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3842AC4CECC;
	Wed, 27 Nov 2024 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732706524;
	bh=hBwJzSZN+81/po5owZZ+2DG5kWpJPktOtvHeqkBpVtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvfjTREwxvAbySSSU4BvCLuwcU5nihmL7x4BKfU2tbJTQYRS0NqjgNa6qCfNWQvkg
	 uj/YboVRMX7kil/IfAIwJWs2uPKk9U6M/cegs1LryrST9mhtmvHa/Ive5/jAp8Xh3l
	 2P3Hkp5T86ZudIZCOYb+CIoY5w7I25k/59TCt2N8AgYRSoa4nNOrvquV8wUKJrx4w8
	 8geCRMd8CFmq9Gthvk8nM5EfeDC93Kbi5IlBPnTzAwgtxboL40Xzj+AOVswdMnFc1r
	 UafIKD7WSwLTRDriTF8brOh0uHcgX51JotofRUbhMMdgs4CDxy0rQ/Fmog0aiL9kk6
	 nHcUW2AIJrwlQ==
Date: Wed, 27 Nov 2024 11:22:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BOOT-WRAPPER PATCH 3/3] aarch64: Enable use of GCS for EL2 and
 below
Message-ID: <0bb52a0f-bb89-43bb-a64b-e042845c73ce@sirena.org.uk>
References: <20241126153955.477569-1-mark.rutland@arm.com>
 <20241126153955.477569-4-mark.rutland@arm.com>
 <154929d3-c46b-42cd-9785-c48aa1b08d33@sirena.org.uk>
 <Z0YNFCfisiCqU3lJ@J2N7QTR9R3.cambridge.arm.com>
 <287e6fab-e858-4a7b-bc21-687c36742e24@sirena.org.uk>
 <Z0bzmYuVweIT-5L5@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WqrhTCONN5Seprja"
Content-Disposition: inline
In-Reply-To: <Z0bzmYuVweIT-5L5@J2N7QTR9R3>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_032205_860766_9D9E7159 
X-CRM114-Status: GOOD (  30.24  )
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


--WqrhTCONN5Seprja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2024 at 10:25:54AM +0000, Mark Rutland wrote:
> On Tue, Nov 26, 2024 at 06:53:03PM +0000, Mark Brown wrote:

> > The values on reset follow the same pattern in all the GCS control
> > registers down to GCSCRE0_EL1 so the initialisations of the other
> > control registers are equally redundant.  We should be consistent here,
> > either initialising all the GCS control registers or relying on the
> > architecture defaults for all of them, and the note in the changelog
> > about them needs an update if the initialisation is there.

> Hmm... that's somewhat unusual, usually the architecture has a "minimal
> reset policy", where _ELx register fields are only reset when ELx is the
> highest EL after the reset, leaving it to SW to initialise lower ELs.
> It's not clear to me if not following that here was deliberate or an
> oversight.

Yeah, I remember being a bit surprised by the choice.

> > > That does raise the question of what specifically happens for a return
> > > at EL3 when GCSCR_EL3.{PCRSEL,RVCHKEN} == {1,0}. Can you enlighten me?

> > RET will attempt to load and use a GCS record, the pseudocode is in
> > LoadCheckGCSRecord() which isn't EL dependent other than the selection
> > of which GCSPR and GCSCR to use and setting the access as privileged if
> > we're not at EL0.

> Sorry, I got the bits backwards, and had meant the case where:

> 	GCSCR_EL3.{PCRSEL,RVCHKEN} == {0,1}

> ... where I assume the RVCHKEN bit has no effect given we don't have a
> GCS return value to compare against, but wanted to confirm that there
> wasn't an architectural edge-case that we might need to feed back to
> architects.

Oh, good - I was wondering why you weren't asking that rather than what
you asked.

> It *seems* like RVCHKEN has no effect for RET when PCRSEL is clear.
> In ARM DDI 0487K.a, C6.2.291, the pseudocode for RET starts with:

...

> AFAICT GCSReturnValueCheckEnabled() is only used by
> LoadCheckGCSRecord(), and that's only used by the pseudocode for
> RET/RETAA/RETAB, so it looks like we're good.

Yes, we only do a return value check if PCRSEL is active - it is only
meaningful as part of a GCS load since it's a comparison of the value we
got from the GCS with the value passed into the ret.

--WqrhTCONN5Seprja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdHANgACgkQJNaLcl1U
h9CN0gf/alsJV67qFkv6dSBW6vSbi4jX90cjKjfXL6pzTAcFClQJi72cl1gOd6IT
gCXE3J7bREZI+F1oEwDu5ENyAfaneST+p9qbbaDcI/8nSUMr2hrfVLxKSmd7rUcL
Ld+/6DXmopymfdau2xZQJFh+/daOZJCA0mpaT2LxkLN+BY/2intTcqtW7UMgyHlK
aZW0jWLjngr7VROij74b6HwLkUBrjYD1Kw3lavdCXE8K8s4AtPjrI+Jp4egmHplj
QRBkHBm02icqgjXYEnfMl08Gv7Fe2l4OBYA/pwjPKSAmfA+6EDo/yerDB2rpKHrl
vUIttPsCJpF4agwPsOq/q0KvSxAh7g==
=Clru
-----END PGP SIGNATURE-----

--WqrhTCONN5Seprja--

