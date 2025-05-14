Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3334C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6MToiZ/ZauRK/RYaxIJvsiWU7gySuNIYl9/2HcONR8=; b=oYu/v6iPNLHyz246TxEEyrtCHM
	l1ZglOEZt41ZtfVRFmkc/M7GTkEfV6OXWRSczDCGUQFD/bi/hvvMcqATvlVfq6I09ERKmepIZt1lp
	xRdVP6GUtWqpspLIMjuPXKI68Aq+dprs7VEf0Dsy2PO9zj+mffT/2UnffpxjS2RvKzd79UvL+i436
	aoM0FnIHcjY9URg+LgDLa8dip5aE0ESwe/rLsKb+aIaYXQJvPyJmdTWL4aOmq/0DpIm3ky0RRc5Cv
	BH8/pO285QAy3u3embf7cnlYcbJdFuRNkVjV3mkqROKE2b9UqOA7tdrTj654HGFunq7q1n5lC496m
	yEHnw9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8ZF-0000000Eh3P-1zHs;
	Wed, 14 May 2025 09:38:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7nB-0000000EYpZ-1o8v;
	Wed, 14 May 2025 08:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6B3B439E5;
	Wed, 14 May 2025 08:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAC4C4CEE9;
	Wed, 14 May 2025 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747212524;
	bh=uCmjXaOhjzMRvOdlrmvh9Jv4vusVTVEV7PlNeoZHK2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWGVpVV2AnInMVIQyr4+h1d2Z2wezsYiBtYvtO3OouNGwGwx/ZSeUK/Np7tIvWFsY
	 R13ReZKVBEjQ6SR3GHVjlBhMD9JM668q9iHG1qcrTE6Pctb9Ker1E/55DRJkPwuFW8
	 mfRgskQhbcwLu63ZALoA0wWZzBR1B5aYBucbkU7ey3V9tmdP6lLNEfc9m9J7fPWbDO
	 IMCaXjiAn/O1UpJZstFuwtLv/ai/vQ69my2ysuM8xFX+YlDHUzARDP3zMIg3Ylj3zU
	 jXBJvvNn9U/QQWsmT4cFSupiO50HJS0z6q0Gmtt30LKmYZAyHTsxO9rStgfNCy9L7S
	 aSGhzR+n2iCNQ==
Date: Wed, 14 May 2025 10:48:39 +0200
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: Devices not instantiating on Alta
Message-ID: <aCRY5_LOGKxO4pVz@finisterre.sirena.org.uk>
References: <aCRQqRucgWMOjUPj@finisterre.sirena.org.uk>
 <1jikm3y4zb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q9yiZFCysaobh9Lx"
Content-Disposition: inline
In-Reply-To: <1jikm3y4zb.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_014845_491291_CEFE0C33 
X-CRM114-Status: GOOD (  16.31  )
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


--Q9yiZFCysaobh9Lx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 10:24:40AM +0200, Jerome Brunet wrote:
> On Wed 14 May 2025 at 10:13, Mark Brown <broonie@kernel.org> wrote:

> > For the past few days in -next I've been seeing the reset controller and
> > audio subsystem failing to probe on Alta, I *think* the audio is a knock
> > on effect of the reset controller.  I didn't spot a smoking gun in the
> > log:

> >      https://lava.sirena.org.uk/scheduler/job/1388164#L4875

> Maybe I missed it but where can I get the -next sha1 used and associated
> config used for this test ? I'd like to give it a try.

The SHA is in the job title at the top of the link (IIRC that log is for
yesterday's -next since today's isn't out yet but it's been at least
since Monday), the config is just a plain arm64 defconfig.

--Q9yiZFCysaobh9Lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkWOYACgkQJNaLcl1U
h9CNEAf9E4+bw4nFJQKdAqZnByRhZlRSXSJduLtELptef9Mj78Dek8S7GhPCaUZS
8oSJUT/jKtrhyoReAQprMnENuIQpgG2P6hjz4lHburZ04CuNzgLApfW7xY1Twmuk
J6JRqHIXY9IiEvRt8cAa4OJeTVbPVBWVv9HjQ8DQ4HLHDb/eKmIm1ApmPTX1w7Zt
SmRwGTgTQ7o4/9Dng6d2moIpdZF+GIxxH+yx+SBpw+2OR4D1Xnw/EKe7oJz6bGPW
txUhoR271fwBzimorBS5l7RB3ov5Ms8uT8Yz5m6/D8Oi41IRyUS2kprCVRO98wKS
qfH2RGdThBxMQ0K4tgLTuQO82k6kVg==
=cLUl
-----END PGP SIGNATURE-----

--Q9yiZFCysaobh9Lx--

