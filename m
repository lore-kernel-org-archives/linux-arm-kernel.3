Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D927C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftLsGvA8tpXtRAir0zYiCCYaF4PWQVgvBF12CyrxUJE=; b=IUe0rC5pzIKvuSdV346lJyil+P
	kXv+HBcefq7OJz+hhrZeMx36vUeTq5sfOMJkjRZzTPs+vsn6F1htG/EQwFxShFNopXPrQuqh3RRfl
	fVtq591QdvnTWvP/qnOerTfYEbmyqJJ5vjpGmyErcumD2Ku93zdfhH/0RQ5bYp67m9hMzmtcjIw95
	lNcHdZyVQzTUdu1wEJ6UnARXoa/k/6EcN2PRwXnXcllr6tgTuBVsShR3Qg79/1uw/ZEOSf2dULymc
	2CaulbOob2Q3OnH5/ZMrrj15wX9CvWxwJGKnATVSibuExXRWwwW39/FjH92/ZpMEbrIwzxbV2VqHB
	7f8mLgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJ9-000000024bm-37b4;
	Mon, 07 Apr 2025 21:47:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhF-00000001j7i-2U4h
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ftLsGvA8tpXtRAir0zYiCCYaF4PWQVgvBF12CyrxUJE=; b=mpTZU2msJ2XO5VkJ3615ipa8Db
	m5v2qIQhrXz0OtTo4bR+5aErsR8qPwTYtZLjs7ZHBiQPq8mcGnvSaX0shUqrUIE7phzzCAtmZ4FXh
	w0A3gsw9kc3+7OeptQpa/DpoYEmF4Yp8Vq6vGMhx5LTbxhXCIU1m3MdAPMpS+97wpiz81IP1i0f//
	A13QIYc1A5gEUglq6tyHDkS/oTxho3yo6V9766IBjslEonNmSkfyovCFMqNVSTI4JwJhhscrjqsMS
	pLHAPQ22wmwIz8jEshTVfF68vKpqcMqGXmbfdxwgIjykRXgrSq/fcz5FSQq2JFbWu6QAmSRKVMb5N
	hTGw6tSQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rhC-000000086jG-2qiL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39F5245065;
	Mon,  7 Apr 2025 18:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF63C4CEE7;
	Mon,  7 Apr 2025 18:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744052384;
	bh=ftLsGvA8tpXtRAir0zYiCCYaF4PWQVgvBF12CyrxUJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IImG5A+i9NuyXI2vGRobqfgtD1M6bUTY89EBzQ1QjXMBAVjP3X8gAz+lqLfayPJ/k
	 dTJIDjflOvO4oLgEU3Zn+A/QbRYYmJ0BgU3bMMpaEXYHLG1ngSCFUE3lDe7g4oPu5w
	 DpsNvmAYCnS3tx2U9R3VrTn5k7rqfE6rw4MSflt+DhUiGAUG3s7hpNibBtKqP8XeKE
	 l7YkhWPXwDRsa5gVBnnGjF3GTa3Pg3vZGiSeNIQ6qE4d7GakRhk1AsHHQ0i81fRZfL
	 XpfCYXAJuib+noYhzZ9EJ3aKCJ34dkusjw5zci/Dzu2H5bdaRE8JZEWlE++Qzcsa4x
	 mm3Mjh+Rv8SnQ==
Date: Mon, 7 Apr 2025 19:59:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 12/14] arm64/fpsimd: signal32: Always save+flush state
 early
Message-ID: <1df65cad-e6e1-40c2-af9c-18ba94c51217@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-13-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jy3nOR6Ki93a7Cs2"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-13-mark.rutland@arm.com>
X-Cookie: Meester, do you vant to buy a duck?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195946_944777_C43CD8AA 
X-CRM114-Status: UNSURE (   9.96  )
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


--Jy3nOR6Ki93a7Cs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:33PM +0100, Mark Rutland wrote:
> There are several issues with the way the native signal handling code
> manipulates FPSIMD/SVE/SME state. To fix those issues, subsequent
> patches will rework the native signal handling code to always save+flush
> the current task's FPSIMD/SVE/SME state before manipulating that state.

Making things consistent will help a lot:

Reviewed-by: Mark Brown <broonie@kernel.org>

--Jy3nOR6Ki93a7Cs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf0IJsACgkQJNaLcl1U
h9BBggf/XCjna58M6l+Y9h0yx/APZBWekc2D95tMHPOrUE1Jj3bh+G2tw6Mx3Zrr
8/rnLaGRhRnYGFzLN9dieif57rdnya8ArwRK3uyoIwGImggJRfeum6M+UHsBlMFo
57ud8joE8i9RCcEy/Gg+Tl84eMLTRpPTU0oUeEipcosPidaML2IqRzB8HhD6QtJT
yNO0m4DgILoBA8HT7qvMPIr6YHidFMQdXjG5Cch/NR9b2K68ab6DrJ6mXjRLvPs6
JQD6qmnRnSFnUU1HM3WmkoTGg5+xTSFUYfWFBFivc9IT/hPUuY2oKJBc3LYCmtld
t5yfwXzGKBrtIgzRVWsQBaJ8AyPefA==
=frBm
-----END PGP SIGNATURE-----

--Jy3nOR6Ki93a7Cs2--

