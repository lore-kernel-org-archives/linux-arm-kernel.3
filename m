Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF93C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVe4AB4EflgrauQLf6RgNDVBTkAUO5bOQliQvYixnW8=; b=DdQxF1+E8BJk8x+a/lyuQHQds4
	TnhePFF8eRLOJqqraHDyqAOxN1Aav7bbg+VIwHXNVZnCx+N3FX6VlnC/a4IZA0dFZsgbKM6xFvsjy
	6rW/X87j9xmsB15Tgjbo0MiqGABnSiTp5QhaR0TUpCx15uDp/8UNhB5TapI5DCKfrPTjQxXaqgZUK
	2Rx+MoRHrDCFAqe3xfPFxYzH9Fj5f9cOaq59TNuFv2SEQkFqy7BcqnvAVZ9nu4Wbo75XZWWARvLVf
	NEH+UK9ShduuroHDjy62p2Nc4dyHOcdzPsuxnaaHDyIiNqGr/hBJc18E1H5qkt0gY/sKBrUNLbFwz
	B6ZsEyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGXv-0000000EECt-18EJ;
	Wed, 30 Apr 2025 23:08:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGW0-0000000EE2I-14az
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 23:06:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78C655C3EED;
	Wed, 30 Apr 2025 23:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6411C4CEE7;
	Wed, 30 Apr 2025 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746054415;
	bh=DVe4AB4EflgrauQLf6RgNDVBTkAUO5bOQliQvYixnW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6vCwD5Ku8V7NhwVQCWwREJPG9bpxTlnAjBWAPC7OHfxwEj5pw6WIXihyOM0y07Np
	 oGmUoxS7a2mBs6MUYDOWJANfPTAeQlHn9gqi2vcfINyLnEW81ZfPWC6QWthwuCtwxe
	 uoLvX5SGnjAG+PStaYDsa20ZdplK/V0lQK4PCJqUSbfhXhxpHZL6q0gCQafGRJ8FUK
	 hqDUKKJknEElV5O81sILkYadirfxvvyLluuq2YvGg858QohSN+Ed8uOWekovraA+6T
	 zR9PoOP6dKH91v49Su5iWlZzX6BSNRYJKxcj8ve7M8lRI8lYzvXNJ8d0sATFVxd9vn
	 HbtwgGZde6m2A==
Date: Thu, 1 May 2025 08:06:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: stm32: sai: skip useless iterations on kernel
 rate loop
Message-ID: <aBKtC6ltm4hyQ3yW@finisterre.sirena.org.uk>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
 <20250430165210.321273-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPEVIUKDWml5O3Hc"
Content-Disposition: inline
In-Reply-To: <20250430165210.321273-2-olivier.moysan@foss.st.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_160656_340975_B34A8939 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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


--bPEVIUKDWml5O3Hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 30, 2025 at 06:52:08PM +0200, Olivier Moysan wrote:

> Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")

This commit isn't in mainline, I think you meant 2cfe1ff22555.

--bPEVIUKDWml5O3Hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgSrQoACgkQJNaLcl1U
h9Ce4Qf+Kx6UyqHkHSI1stvCklQt/+Z4iVfBjGo3/P0vWUe9GgKN+LB/DPfzc/Ww
FwQqXWsx0/xp/XQcgCpQFBEzci6nEGWjdJ240fLzpSphVX/TX/sFNiiuqXCWAffR
jqABT5SrIZx+Oy0KfdzcfNbpaNdd4yRbjDWYi3TMH0DgmxLprzu+iy/65u+sZRtb
mQQ++AZCcMQ+E/a70aYRbffxxRZtrdMpfzQIyl+EU9I3cjCCxMwt+Bt14NZd0VWO
3j2T8f9vxbKM1etsdlP5X9THWTYcSjFZdi1lRGCtM4idZxRaKhYfHlAn+zx4ESdk
OeJLoGUFNDp0qhHDbI93je5/cCKcHw==
=jH7g
-----END PGP SIGNATURE-----

--bPEVIUKDWml5O3Hc--

