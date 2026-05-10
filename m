Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE628CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fSTWzSgvZHZRTkQMtfK8BXd/rdqxNY7xJPVCHohYaA=; b=mjJIApkW/MgQ1GE+q+4VP7mrms
	RwdnDmc2EQxtsILhA90B5LXXy5qqGyMWzPqWE9vDrdgQssgckx04AIZQiFlP8AhQlCMmnL8CLOC/o
	14riASqsuS3Bx3JQ7NwmF/uX2BIaZc65rkxMDiNnb0IyEZBLIJKxH2K/PMXQI0jraWLztR6LkSQXo
	lfiXP0Flhxu6s8tMGd0wzYP9lHABRMm+WC51HRMZPqR4WKeQ1PZhqqPu9B5T/gHauxiRx/YF4Lwzh
	Kgl5xz/ORU6kXa7nai1LMorzYFK1ni3VpRZvokwlQtvLvk92SjC8w8rjPcylzZcVxVtJcp5Ym12Kd
	O0RHhJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLsvA-00000009wow-1B6t;
	Sun, 10 May 2026 01:25:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLsv8-00000009woi-2cxH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 01:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FD6C6001A;
	Sun, 10 May 2026 01:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD42C2BCB2;
	Sun, 10 May 2026 01:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778376324;
	bh=+fSTWzSgvZHZRTkQMtfK8BXd/rdqxNY7xJPVCHohYaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVHtxyvZZN/lPxtzS89qAvrTwsrWkagV0UXsIHOWpQLcdIUya6YyCss6wRwSSgRH4
	 CBkcYf2MWg2ej+QBnMseCQH2ctpB4Vw01WpjOeMiHiaSPMeMEt4LLdounV5Y/MOKtS
	 2AAvJMxHw69r3+uq58ISBONcnUdctz4z5cbH8R0LtuxOc8ru6g8JraNg+q8PlD3IKp
	 HzZZY89u2dB6BmcqZOJZ44ecvtdsB7in2IqbekC2Z4aeqF8j5Ykd8ElF+j9cagOHRq
	 YZ8EENDGJ/oqEWY6Fazl3h5cKE3W9+ktM8XUJDo8d6TTj9Wrt2xqL/pnhyDDxrtqm/
	 LI84R6/1Ti+/w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 375C81AC5897; Sun, 10 May 2026 02:25:22 +0100 (BST)
Date: Sun, 10 May 2026 10:25:22 +0900
From: Mark Brown <broonie@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to
 use the DT
Message-ID: <af_egt2d3xwOJg8G@sirena.co.uk>
References: <20260509214622.38319-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wQR79ERn67QPs7uj"
Content-Disposition: inline
In-Reply-To: <20260509214622.38319-1-enelsonmoore@gmail.com>
X-Cookie: Truckers welcome.
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


--wQR79ERn67QPs7uj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 09, 2026 at 02:46:19PM -0700, Ethan Nelson-Moore wrote:
> The eukrea-tlv320 driver contains checks for ARM machine IDs via
> machine_is_*() macros. The boards concerned now support only FDT
> booting, which does not use machine IDs, and therefore the code should
> be updated to check the DT compatible property instead.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--wQR79ERn67QPs7uj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn/3oEACgkQJNaLcl1U
h9C6Ngf/VgpL6/dY6oe9kbIkiwzw7zZb5+n21tUveYgzPidX0a4toLehfaAR+hTS
4FJcIwVvXbleEDcEIkLVZQCUQV1FvUCz7HVW5wubSRGSRtd7UsQ5WANT95sjdBwe
xrrXCQuF4HEcQnVuyEI2Rt1CSqfwqPvMVje+aMVwm0I2F9/4rzMwSYbyNrC1i0Oa
ODWObnHyeFqscnD4awYCTj1LpwwMZ6Cu2NwbO5Ub4W9nAijkDJYQ9cHDw5t0SZYE
sXsDdxCz47BiTeLIFvgwmQZ3WFy5kce54ceig/KpYkFDaFDyYltxO5DNaLn+PvSy
am3YpHjAz2qx0CGRSWdpXdoHmLNp4g==
=c9YV
-----END PGP SIGNATURE-----

--wQR79ERn67QPs7uj--

