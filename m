Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2225ED44D59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yV4d+gcq5wGczlzLbS89ak0SkFUw9iFWmBzoA9rCf00=; b=iKkM9eboGak0jvHEfkZe6/QBA0
	T8pY30an/x1uv4uR05jcUG/Zh2tRMDTgZ5aXT/2bHQw243FNQqRVBv2ZNtzsPduhiFd4DWzqTSbZh
	ka7NPTqz99eW2FI1oTgbQuhQm4L3EC8/3lQPofncoE1eJulmQN6T4saFDC30suWuKLqJnLAKgPYwb
	Z69U94sJcOzctY1bhdl6fY/+ksH9r74QIy9is8X4VRQoB57zxqYTDxtJlUzV1KBKodUNKA8l3rxoS
	tb/5KmC2Fv4WtB1hGVcLAkQON+YfbOOFxE8FmL1NOZGygsm5N+aw/eDDOnFswh+Bu6m2FrFFhrIW3
	RLTvqZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8g0D-00000003PFw-2DKx;
	Wed, 06 Nov 2024 13:23:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fQN-00000003I55-3UgN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0D225C494F;
	Wed,  6 Nov 2024 12:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849A1C4CED4;
	Wed,  6 Nov 2024 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730897175;
	bh=YkcPNWLf76J1061B0KOaBUk4W1esB7s7nOVJlCu0VhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAWQLAnwhpRxPJrlAAXLjmqJcDG/Dk9rXVFkrH/BjGcMG+7b3RbMTik3ex1ESTQ+U
	 nCYr7goKQPKySJPhKT+9XbEChMNvLfmUrVeHN/RYQejgmXbsmZ6f2CtjUxlppxVwOq
	 FLKmU4lPxB0SxajmEAZ8oW1Qj9S5GmAgbpjztut26HWgbj8IOTz1DHy3meX4piXSTd
	 0S6jht6A+Gcid3hUC9oPeBG8byJN2T6gJmJAUVTPD6uoi0u5aLUOQREAYSh51g8G8U
	 m089QjGr7B7upaHIoZa215paUUouZItebHbXljOIjyTDe9e5UL6QxhgY4eE92drBGN
	 oYXcAVYw96YcA==
Date: Wed, 6 Nov 2024 12:46:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] kselftest/arm64: Corrupt P15 in the irritator when
 testing SSVE
Message-ID: <36fb49f5-55d8-4890-a8d4-d2cba67a9185@sirena.org.uk>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <20241023-arm64-fp-stress-irritator-v1-3-a51af298d449@kernel.org>
 <ZytSnBSk4r81a3z1@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uY0xOiikQHx+c9tS"
Content-Disposition: inline
In-Reply-To: <ZytSnBSk4r81a3z1@J2N7QTR9R3>
X-Cookie: Include me out.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_044615_941706_B4D3FB4A 
X-CRM114-Status: GOOD (  11.68  )
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


--uY0xOiikQHx+c9tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2024 at 11:27:24AM +0000, Mark Rutland wrote:

> > +#ifndef SSVE
> >  	// And FFR
> >  	wrffr	p15.b
> >  #endif

> Both RDFFR and WRFFR are illegal in streaming mode unless FEAT_FA64 is
> implemented and enabled, so we cannot use DRFFR in the SSVE case.

Indeed, I'm surprised that managed to pass my testing...

> Is there a different instruction we can use?

We could just trash p0 with something like a load or add.

--uY0xOiikQHx+c9tS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcrZREACgkQJNaLcl1U
h9AuDAf9EenSozerVruavdm5ZHWW9Ijf/c0eJQy8RgpZDVdg8IAI/BaK7TYaLRT6
J1MR8UHPRJQWDHhouJnMmJSQfPfKnPxEBFTPgXREFZNxHg/BHRzyYSN+r7h4SA/L
xHpxuucuvuryBlGGSkW3Q6BrTxsQBham/jij3IwsMAORVaYRdBafcea7fd+gj0qR
6734ffT+I2UELAFXYYYQqn9yXRB6ZIDCwzfHaZhhuPVnInmqLeo6bTKguMED6K32
/FE1IFFoKZHmZNT3YnqP3lNkrt14WX6GWGejTjO++Y6JDpQQgEYddStDMt7dMl84
2YNuWHfBf1fWDgcjqpP5Ic4AL9vqQA==
=JVe4
-----END PGP SIGNATURE-----

--uY0xOiikQHx+c9tS--

