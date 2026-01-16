Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E779C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpKuylbwXqt7Z3+CRxtEsnYQ0YTVTu2EgQdA3RMjTkQ=; b=NG7UTKdWMT6+i2RqxcTq8xwnYs
	dSc7VWBfyXrE8u3pZ9gT07Iz3rkjO39/58Owz+xWATR8A6Yaj+cBz8gs9gmfBW6+QKv8H+2mwwMR2
	2NToTkW52Sfyvl9swGc9DcEEXaWSGOPp0FWjQaw1oo412sFTH+JTTo64C2MPy1w9vUfWPTwPkz7BL
	Lck36wJeq1pa07Edh+qzYG565LbB2Z6A7XDh5lVIfLnkdUhRpDPKvYuAPKyWn5Vcni/h48gT7cfsv
	29iud0rV1xH7bPNXjh6ciSpc36m43/oltoPUf+tQwx1y9q42doLbqfkPb8eW++tdvRdWkX0Eu5+ir
	8egh9qTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgltC-0000000ENV5-3u3m;
	Fri, 16 Jan 2026 15:37:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgltA-0000000ENUA-1jRv;
	Fri, 16 Jan 2026 15:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A018143362;
	Fri, 16 Jan 2026 15:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A40C16AAE;
	Fri, 16 Jan 2026 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768577847;
	bh=qiVgr628GGRLF6BCGNE6F1dNfg5w/bvsIxbfkIRZkqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7RCDi6ogwDyc0P0xl1DnaT7khpYpVWRlnCeGr4QVmo6ydjHaF8Qh5lThqEdyP3ke
	 0j9cy0zk9xvtOsyjZDKPdjYCnOCNHpnAR4dUPJPi2dm983LMLA/KR6sjUPqPm6PPFo
	 66uOKRx9++/BtmbxvmAjUzRUK/roZWEqRH8I4hEWXWbUBZED1yKA0E8f7bNrgwxHVJ
	 T3zmV8P9r9xsh/WfEoMH7+xIsPybxG79XZJzZ7Hf3MvTnIAaUkV8MZbbDWg3pw61MK
	 liVO5TNo3NhA4UPFaY+FkvhUStDeVWSZyCF/7FYIdvCckuzrhJVU2DwJmY79p0z9Nz
	 rFCE2yPwCmG8g==
Date: Fri, 16 Jan 2026 15:37:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Aishwarya TCV <Aishwarya.TCV@arm.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] spi: rockchip: Use plain request_irq()
Message-ID: <a5b6c607-9b8c-4fa6-98c5-6ba848f7f2e2@sirena.org.uk>
References: <20260116-spi-rockchip-threaded-irq-v1-1-c45c3a5a38b1@kernel.org>
 <f8658bd7-7381-4770-935a-6a98ea3f652f@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XPdBLVUHRgYjhzwD"
Content-Disposition: inline
In-Reply-To: <f8658bd7-7381-4770-935a-6a98ea3f652f@rock-chips.com>
X-Cookie: I've only got 12 cards.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_073728_471381_A05B8123 
X-CRM114-Status: GOOD (  17.41  )
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


--XPdBLVUHRgYjhzwD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:19:39PM +0800, Shawn Lin wrote:
> =E5=9C=A8 2026/01/16 =E6=98=9F=E6=9C=9F=E4=BA=94 21:23, Mark Brown =E5=86=
=99=E9=81=93:

> > The Rockchip driver has since interrupt support was added used
> > request_threaded_irq() but not actually supplied a threaded handler,
> > handling everything in the primary handler.  This is equivalent to just
> > using a plain request_irq(), and since aef30c8d569c (genirq: Warn about
> > using IRQF_ONESHOT without a threaded handler) the current behaviour has
> > triggered a WARN_ON().  Convert to use request_irq().

> Is it preferred to use threaded version if latency is not a critical
> concern ? I guess the original intention was to use

> ret =3D devm_request_threaded_irq(&pdev->dev, ret, NULL, rockchip_spi_isr,
> IRQF_ONESHOT, dev_name(&pdev->dev), ctlr); ?

TBH it looked to me more like there'd been some deferral of more complex
work at some point but that didn't make it into the final code.  In
general it's better to handle things in hardirq context if they are
appropriate for that, and for a SPI controller the end requirements are
coming from the device so you have to assume they're going to need
things to complete promptly.  There's overhead from scheduling a task so
no point in incurring it if it doesn't buy you anything.

--XPdBLVUHRgYjhzwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqWzIACgkQJNaLcl1U
h9BZEwf9E/UdYem+/snD3D/JY1NMjR4Ze+1L8MvjU4ZY8KuZIFJqMYDOQY6Hb2Ce
qL6AiwhxKtCZwYpFLT1KAN9QP7aLxEd3wEwSDmOrMrsSUnAntzGMEYIDTh4Nn3pH
ekSmtMPNFXgLRULZn9IeeNuNxMz+IZCfw6yZvmubmyP9NyMmllZg7UPCVNfXJZfu
aJiil1rcQI7cLiBU2rGHNNB8Vsq0K6CcpF5z/w2I5FkYTnC7XQ2WiZP/+gCvA52K
3G4GdhdRfH9bYJgKH2+PU0+fkvJTVNs5QfXp1H/UgAL1CGOM4jedtwBeII4hLh/9
/2OecQXsuvIE0aH/VcNZqDmaYzNYPw==
=4SUn
-----END PGP SIGNATURE-----

--XPdBLVUHRgYjhzwD--

