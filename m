Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C492CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlWfipCfpVrBkBpAdX/tN7AaGo2a4SCb8Dd/ea6jDuk=; b=fmiVvilNCGlybgOt5nelPnufpg
	wJYsTsTFxgbPXscAbI+hDbUq8tQ6TPwwpnjRCcTWP/6Rg6P1dUeY00kRwMIdgABLOg/6SD6Ad/xq8
	keCtszVGRDWGVpT2KWtvIudlSE3PAUswIr+mqZxDl/L2INSRQKUDQWtdtcO7SdIs0gTjgsS3Qts6H
	7v1iKESSxbuJVXrr1aNRHT/BkBdCItVPgTliN7cVD7kXfVUG+h/5jMzhcJ76NI1AdNvuDrworTOmN
	CGpg1DBXfNCVPjhhCjQ/qeTfl/puVNtD5c/gtf20lVg3PfdTHJ2xNXDzwrnRdwBO0oA48W40Lxd0H
	Sq/GE6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtvI-00000002Pc5-3PNR;
	Tue, 26 May 2026 15:42:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtvH-00000002Pbo-1bLc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:42:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 450D260018;
	Tue, 26 May 2026 15:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC651F000E9;
	Tue, 26 May 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779810146;
	bh=xlWfipCfpVrBkBpAdX/tN7AaGo2a4SCb8Dd/ea6jDuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ho9Mwa3WhHSdo7xEuFgtdR/cQ34pFe1npVVRysfDY9CzFIYmnThmBFnEWJ5ComMBT
	 8ZDkNmuiTIalJbOf3wZJNkifn2t10XtdzMU7bvaPnk3AD6hEZ2xEU3t5VGHtrieSFg
	 A4naN5Rir2bdI/5TGpEIQgQCTlvjo7NrDWVxde2kTku9DBDjz4kCc1XeJA2mShNEFD
	 xAKasSBbNS2/rVIXRGIwIcXYGBMOFd3sfj7p8ALlsmHzb1w339CbIG95fgGNNceOjV
	 vmd4dXJFrx8dQG1wAIrvRbSfcjfctFypiIssNDbsc5JXKpURjFOi+/ytHF17JU0j30
	 p49X/wQTnXt5w==
Date: Tue, 26 May 2026 16:42:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 06/18] arm64: fpsimd: Remove sve_set_vq() and sme_set_vq()
Message-ID: <7eaaac65-cb58-4808-8b54-83cc5beb0b42@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-7-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OMsXyzo8b24o7qHQ"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-7-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
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


--OMsXyzo8b24o7qHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:44PM +0100, Mark Rutland wrote:
> The sve_set_vq() and sme_set_vq() assembly functions (and the
> sve_load_vq and sme_load_vq macros they use) are open-coded forms of
> sysreg_clear_set*(). There's no need for these to be implemented
> out-of-line in assembly, and the 'vq_minus_1' argument is unusual and
> confusing.

Reviewed-by: Mark Brown <broonie@kernel.org>

--OMsXyzo8b24o7qHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVv1wACgkQJNaLcl1U
h9AE8Af/cdVzDAtuMAzFV5XhnfVEkEQuVDx/Ewt1ITp0WL10LAgaKMiNGY+fn/bs
UPn297NFIf4xDb7KwuGQPO/ocs2IaTsYL9Dh4WMPrW7Y0RlhzEgP88u4ZRaN2gvr
+t83aeAij9rWvCkqf1g9CcASMz//VMwG5nMa2NKySYpT7aNdxBBVB8Vy5ixRNHJe
Al9r9xg0MCdxVr+uhTNQ8smW2uyNKXyVTHKA9tjfuPqa+SY9K88uSHdMUdnDZ0uP
8tLk90UaleDzvvUlaYjtAN2idk3+xdnIHPVq+3XHk5q34ntAHzvmEUpq8D2xdo3I
oIUR+8gcyi/EB8CRprGHPM0HoV5qhw==
=pLbJ
-----END PGP SIGNATURE-----

--OMsXyzo8b24o7qHQ--

