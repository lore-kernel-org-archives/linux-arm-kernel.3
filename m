Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BBFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdjlEKFZ9NzMsLgN2AE+HdIRkMtuy3rMl1mEXsaBBR0=; b=ygvCgSYpS/sZYFw5FY3BOCplTS
	UjdEMbporY4RHvYRvCe8JPPpS3ewcFJvNj7YBC9hKKaGSK+1PCTS+RNM9xfuqfCIecrjay6zraubn
	y+K5Wuq5mKd9VIzYEHvBzUDoM7nkqaZGYzZCsIQeD2+rl4fWfa3xsQJMvazjFDLh4C3TZf6ZxDClf
	JdJlPSWXUxHMvXHO+kTRwfFszOxn2pEqF28e/LPSiIM+3OjDVx4nSObku+TW7Kcqk/BWln6YGo1Ui
	aQ59k60NdeGi/ETwtfOPFiymDJxQpnYuW9nOcbgS8PI2MRNbWrPyUV7mnAiDbCf6u+5worH/2VTT7
	ZS6huuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCtr-0000000HEI7-49x5;
	Thu, 18 Sep 2025 11:34:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCtp-0000000HEHI-0djN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D441C44223;
	Thu, 18 Sep 2025 11:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98794C4CEF7;
	Thu, 18 Sep 2025 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758195244;
	bh=DdjlEKFZ9NzMsLgN2AE+HdIRkMtuy3rMl1mEXsaBBR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TfJgonj9G78trjkdbZthUXy3M9CxmQXxteeJxfwCo4sh2OSpKsvib0CTJl0x7DC6A
	 4UvQXTtDqkfp9TV9Ize8+X0zCMyVSXqX7mInHNC3VFcDEtTxyVSF+PQERu4Kx2/qY6
	 gbTPSWKP1V/1P7bSGnEb2cDU4Ajy6t5OUENB/sKH1+mXH8nYH8U8qRrfxFEhJQFFxT
	 wvKq4GPeDFn7586iQzlWlCjLZOKCOX0Jms1SIdx5o6TZi3J9VGQSWG4kKrZfLPlZj0
	 lW9YTNLuXOdKsVVCI+9wZPWQt2iMTcj+ey26lu4GHCv75zxpXMUQGtqtjY5MuqIXaw
	 48W+1JH1OwRmA==
Date: Thu, 18 Sep 2025 12:33:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: pxa: Return -EOPNOTSUPP instead of -EINVAL
Message-ID: <81926717-0884-4df5-aaf2-a938c58ce892@sirena.org.uk>
References: <20250918112102.64314-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ut2fU8JBkxiT4pjD"
Content-Disposition: inline
In-Reply-To: <20250918112102.64314-1-thorsten.blum@linux.dev>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_043405_210640_39AFBCEB 
X-CRM114-Status: GOOD (  10.11  )
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


--ut2fU8JBkxiT4pjD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 01:21:02PM +0200, Thorsten Blum wrote:

> Return -EOPNOTSUPP from mmp_sspa_set_dai_sysclk() instead of -EINVAL for
> unsupported clock ids, and remove the obsolete comment.

Why?

--ut2fU8JBkxiT4pjD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjL7iYACgkQJNaLcl1U
h9AfpAf+PClvXVRNKry9PjFfChYkB5BWOoBVFPmgVT0lUGZ3XggLvtJefzT/qRU2
rBNBg9rpCWQooNz2RhX/Q7HxETpUrJPMmQf+J6pU2343ygF1AGoQEjd6vUEYGQ0r
ckwCMlN9H9eJLgKZiQc9fglni9sz5t02N94BiapFRwUZtZeVa1EE6X5S1umD0FTA
gSaX5+jgfUa0F+ZO9ITpJcJcUdvMtOmWvIbRNicPsD2JulzQ/9d9XVKZxRignyQW
qWNREApxKmepz++1TRstt6atFxVKaow1qcrrp3LkHekGssm7JTj0ELBk67Mf3OAD
htz3PE/X0drg9KCFXC8WBT4oXPn6vA==
=a/MZ
-----END PGP SIGNATURE-----

--ut2fU8JBkxiT4pjD--

