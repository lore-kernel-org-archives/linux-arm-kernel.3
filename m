Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5383D59F50
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pu0Wia3hlf/LB7O+kFXEPDBndKHemByXqXEUjPGYIYA=; b=oJheCQbVrvYWOE87KTzQ29RtXr
	ycYPEcY0+EMYDIp/Qh2GRTavCxFN+0cZnx7fCYscHKmyaekydhlPrHxRoXHZpDlChiOWqBwoepMrP
	QNjraW31ZTG0UlSSIh4BYE8iXcTSMtPLz8zpoPs+yRuZzH2rrZhv0AEHOOHNiGoa49hRpMDOrl37f
	j+UjqIeSHJDplxqklzV8PFBdfmSckpuDdfKASrzLNNTtahFyDA5YZvhSnWkG5/QN8ASMg9QmQ7tf2
	iwAzaJuyZIEA/NGY2SeT7NxWbFiJmPsb9f/4Oq0i1FVNgZD6+HlaBZt/D0hyV+xRs8Z0Mkbs9h1FX
	wtc/ajTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ic7-00000003yet-1pX5;
	Wed, 06 Nov 2024 16:10:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iYg-00000003xb8-0u2I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:07:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1011FA43FCA;
	Wed,  6 Nov 2024 16:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA84C4CEC6;
	Wed,  6 Nov 2024 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730909220;
	bh=pu0Wia3hlf/LB7O+kFXEPDBndKHemByXqXEUjPGYIYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVkglhNxPwWrrGeFU4VfNT+N0/Fmws0dpjk4ycr9Mq6G78ioY1aIW24tNqbnn3k7g
	 ZqOY6kyG1qsAXiVt0zd/6lBzOvO+fQ/YpdV71+Yv3MVA7F3ACuNH8euLTQTttlk+v9
	 GDuxdlR7EHAVK1dYNZFD92hTGXB5Q+nJB5n3IvEMzW8oD3njFDej1V6HvBFKDBN2S2
	 4f0YKkEaYSoHsX/j+FIYMmHf3WFBHfXlzANK5e3r99QxyQbdNrscxxnbsVFDcEm0C6
	 gpreuk6DBqv2LY86M2eg+L7qOtJJiqSKQTjBBr89+jig7kTsavD686oQmTpWun13+R
	 dZ8KDWyHrwi/w==
Date: Wed, 6 Nov 2024 16:06:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, stable@vger.kernel.org,
	will@kernel.org
Subject: Re: [PATCH] arm64: smccc: Remove broken support for SMCCCv1.3 SVE
 discard hint
Message-ID: <81419669-73e4-45ac-bf41-34d6ba486f7b@sirena.org.uk>
References: <20241106160448.2712997-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3zLnHeDXX/K5rPDI"
Content-Disposition: inline
In-Reply-To: <20241106160448.2712997-1-mark.rutland@arm.com>
X-Cookie: Include me out.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_080702_347246_F464386E 
X-CRM114-Status: GOOD (  11.62  )
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


--3zLnHeDXX/K5rPDI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2024 at 04:04:48PM +0000, Mark Rutland wrote:
> SMCCCv1.3 added a hint bit which callers can set in an SMCCC function ID
> (AKA "FID") to indicate that it is acceptable for the SMCCC
> implementation to discard SVE and/or SME state over a specific SMCCC
> call. The kernel support for using this hint is broken and SMCCC calls
> may clobber the SVE and/or SME state of arbitrary tasks, though FPSIMD
> state is unaffected.

Reviewed-by: Mark Brown <broonie@kernel.org>

--3zLnHeDXX/K5rPDI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcrlB8ACgkQJNaLcl1U
h9BqxAf9FJQETr3FKwFyRVvi66Y62WIGIGeFzckg32dx2UxLO8Yg1eRcUp7nB3jo
qJ4pAmTrvh77Fddq0pv2C5CehTTI+Y3NmpkWTmcuejupSO7lOsH+Ysf8/b0aBE1Z
r12WSzdvqj3t60quOmQ8h92vNwY6J9tuv9Iuwrj43tTrgB3C5EFXYQKx8ioCpyeA
i4Z2kaFpJdTcAGtAumAfyUosK/FVE7DTmGTvKJtHvuuVjhNKS6GkW/9o/Mn6bbuB
RElkfET7HuzX3oaWv5fAttzZXAIkQvD3tOMBy56pq0inUNxFNmynNxwBLraoe57k
iX62RIodw2Kj2mDfAew15cQG6+Renw==
=8QHA
-----END PGP SIGNATURE-----

--3zLnHeDXX/K5rPDI--

