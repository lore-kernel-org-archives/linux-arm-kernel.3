Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139BACAC585
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChmIAcj/dnFANRrz5jNvnNUzLHzNhXpK8n1dncSrldM=; b=gI61t1k06z/uXM6ISodT09PXgN
	rW9FNDKFdnhGk4mkTEcrgmErCAIokJVGpF/7OCggAd42Bdw7lF6BewPj6IS4zt8t3NsgNtyvH+yGB
	pxCLCxYLFJ/w1fQzZsTujtlvlm4YLeRZyUn22tYnxuHvfc1+1KbUjshWCjmol7QnJYBda2wRnpb1r
	RROVMnoHqC/oTjpEVyM/9ZpT/FhhlrS9tBpD6By16tSHOP5lMIDyj5BO96RFklTOldMEyvvcLI9xe
	gy5HH0rLxERmJbpsuqHYtRAd6dWs4h2BsWpeZy7PNajBxT7mgPuog2mI6/rYTRqAUMB8YcotX6RkY
	Z2xnBwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUg-00000001VAv-48xQ;
	Mon, 08 Sep 2025 18:21:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcNk-0000000HYDE-1xYs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA91C44804;
	Mon,  8 Sep 2025 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B949EC4CEF1;
	Mon,  8 Sep 2025 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757339887;
	bh=ChmIAcj/dnFANRrz5jNvnNUzLHzNhXpK8n1dncSrldM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9P+QMlcB6/kv65EJ/r8wgbS1+rtOGpcJZUD3K2SSnlyfyzMP8DgDTBOVsziC87ae
	 /egbfDyxkD5rX9oSgZVjb7NVefInUL4WblogJNfV3+OQHHKQQpEnrXG0Xi566B+TR1
	 gX4+mCXL0bfdZ0/jA0ufVCBMIIibVRZ2HmdLLAc8yQrsBu4xP7jUhn6NQD8qp2F+as
	 a5D+4mzU25h7R40AJN/y6zcCH/hI0aDQ/k8zlMzoYRfjG0YUdJy3lQPvHPZxoMP7Gk
	 6BvWpUPTcBPLsZHe40AL7pooO7YRLZVkRZ+9LxRGC15ZP4n6lYQ5iru41RQoaXhH7b
	 W+Fb8Cjzu2tTw==
Date: Mon, 8 Sep 2025 14:58:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/2] arm64/sysreg: Update TCR_EL1 register
Message-ID: <a195095c-8ebd-4d74-959b-7b407d416a1f@sirena.org.uk>
References: <20250907123000.414181-1-anshuman.khandual@arm.com>
 <20250907123000.414181-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fenb2D74LwSI5seO"
Content-Disposition: inline
In-Reply-To: <20250907123000.414181-2-anshuman.khandual@arm.com>
X-Cookie: Air is water with holes in it.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_065808_523128_FF63B566 
X-CRM114-Status: GOOD (  10.43  )
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


--Fenb2D74LwSI5seO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 07, 2025 at 05:59:59PM +0530, Anshuman Khandual wrote:

> Update TCR_EL1 register fields as per latest ARM ARM DDI 0487 L.B and while
> here drop an explicit sysreg definition SYS_TCR_EL1 from sysreg.h, which is
> now redundant.

I actually checked against DDI0601 2025-06 to spare my poor machine the
strain of loading the ARM.

Reviewed-by: Mark Brown <broonie@kernel.org>

I guess the cleanup of the redundant definition could've been a separate
patch but it's not super important.

--Fenb2D74LwSI5seO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi+4OoACgkQJNaLcl1U
h9DpUgf/eYIiyohWTImwl29rN26NIgS5XpcDfsusIXjvrtJB++D0WIWMytjRlJQW
fmO8gsCX7JHPCsUWsVW8XGlK4etS1VKCNzhrrdhddLXpba6ehzkIIAL39P/55a1H
C5tRtgSOakcYFO9RgLunVn4NaXZ0onGAzKwgEzfQROETU1jxAFFPxPMzdX4NC6cE
1BjFexNWOPIXyde1/U7oQC4lqutO7mJ3JXfnwqJ7I2POTngOYtNzSfjaOxUUTfh6
78jdDrGCsyC8f0X9P8RNr+DBI1nsje/20MI6akPiwMDbD61NYkNuQJ2shiOdG+Fz
bAE6/MUBIxbUJaEUZXpZVZuDh8sxDg==
=Md/t
-----END PGP SIGNATURE-----

--Fenb2D74LwSI5seO--

