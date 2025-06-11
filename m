Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C64EC678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfoFFUPD76jO2mIqlfhWfyL0YTbTDFdkOtfTP4u7ehc=; b=2guJk20UMfergFzk5qkTeVgcFV
	D+d8XT4ii9nMoVEBBdqLw1zGZoGWKiO6a/ZMGY44C0Xcv4QffMRf5oxsbpWrobC2AFz0Rj+Y46G8b
	IVPpEyFDp4mHDqV4vmlJODqeo0emAdn0eJ6oolNUorullLaZsbw/0p6owZrYm5PKFAdpoIu+UUp6u
	HOohQXwPRnIXajm9nhZEugOzsnr1TI9/M/dcDtm9oOJQEb+/0LIMh/WgSfOa+HVEqs7rkaVUyO+GM
	Rn6m/QHcyEe0yA2G1+bWNRwTsEB6vMPhzuRQyF3i/sX/bEPZEAllCDT/JkqVmudsRlafJSbjAAGEP
	/BftIeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN8T-0000000ALU1-3KUq;
	Wed, 11 Jun 2025 15:13:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJu6-00000009mX8-0hxM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:46:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DBE86154E;
	Wed, 11 Jun 2025 11:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85076C4CEEE;
	Wed, 11 Jun 2025 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749642361;
	bh=yfoFFUPD76jO2mIqlfhWfyL0YTbTDFdkOtfTP4u7ehc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWDk/iSBgx58xukMpduc0JP0LDeiOXrIlwWACHX3KwW/fsFoIa7//sB/RD3tbDFxG
	 5D6VhdG6p2R5W9cEnl6hcMmgb0dlCJ/kQZFVLqMNTQm5Wj7Y7DHfIuXlIah/wm8j21
	 itsU0bR9tgtIHo7WK5sneuerZarIlONoe3iJgdMiplPvjtQWBVZhlY9EGohZA7C3pq
	 s3l395vlZFckFzcRjAK01kBkFs8rrGwKilOYSkGiux91cHBl8NyOLdDKfBxHPH+BuH
	 XFjwd0KqO1NhJ9crlBcgNttQWvt25QNZnPvslZb1TekEI/nyR/jWVaJpYGYC+mMiD/
	 v5sXaQCvQPYlQ==
Date: Wed, 11 Jun 2025 12:45:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/9] kselftest/arm64/mte: register mte signal handler
 with SA_EXPOSE_TAGBITS
Message-ID: <6fb3a9f2-23ba-41f2-83dd-3c6cf3db1d4d@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0SZYrttKAASFEr/1"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-5-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
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


--0SZYrttKAASFEr/1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:02AM +0100, Yeoreum Yun wrote:
> To test address tag[63:60] and memory tag[59:56] is preserved
> when memory tag fault happen, Let mte_register_signal() to register
> signal handler with SA_EXPOSE_TAGBITS.

Reviewed-by: Mark Brown <broonie@kernel.org>

--0SZYrttKAASFEr/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJbHMACgkQJNaLcl1U
h9BZFgf9Gz+zAyeJ/at/lIKaVjYaKkMIQa7idQxUCTDHdHScft4bmLoz85osmCTj
vnIBDhUv2yhtweZio481iiQoejuVnEvNiD9luZNBzeDo0NpMtd3zSDrGDHFb0rTi
xHrFZsbVpeuUaf5I1QkPQk0kP+wOa8UNLwO05wxu4ZiNBlUcVS0kP+D3DRa+viWd
moqnlUrUPRgRIg4ZFE+vSEJ3D+IdM/Ku2Gz6A9FITZDtq3Iz8LMLK1FqN3wwsz7G
37fzSlPw/i/j8ArcfmnDqXu31UpsXevEybQHvaE3ZhNsStB/kVe0nrFNJC3xiF8p
HbL/4jW9KJF57647vuvE4eNSzLWNCg==
=V7iI
-----END PGP SIGNATURE-----

--0SZYrttKAASFEr/1--

