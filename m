Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AC9112584F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkL28Zt7d61TOBmiZxhJGNQf12l05zfWJssuViW/fCE=; b=aIp3gREISY3MR2ycGXV00XHK8M
	D7uLyTHDZsyG21UNFjeuISiR7YdZ2KOWD8zuSDjcbbajSBxdfGPT9ovJbod2/9qNat89xJE7Gk3r0
	HN/rfej1vHFHfI6Kq0ZR0Qo+SvRvvGKUcl2qvdjhoVFGL9NIkXJc9aQvRDWETCKEkcU96i5clTszy
	+1mvQk7ssTzl2JzHOQhL3QgmWE9dWUvdIxtgT2ONEVj6oUoPCFqfgQnHw0gsSk4iAZhtDfvJyjU74
	+mb0n7LviMtlNyyKAZfDr+7KTBGcU0Q+K3mzNqkNDffct/qE2D+LS3j6VuOG/LVxOk4GIjNbwKc7w
	qOSd7KZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lx7-0000000BrnR-20WY;
	Wed, 11 Mar 2026 15:58:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lx5-0000000Brmk-1wJw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53F5741829;
	Wed, 11 Mar 2026 15:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDED1C19421;
	Wed, 11 Mar 2026 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773244706;
	bh=ED7NNKBzNmG/FXhJsQ/WT85kkqplmyBGp4L6pYcJxWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4usjLSbxt9x7w+rF1mAiUbrGRKXZ4a9efW4SfQpg2jvTFMb2CpxXLOLPDDLUsldG
	 lA4/yXx0bYL3oLaaCcIVe4GgULw1+JdVdrZmxDaA4alQsU5cJFvOiuJ3qGZ1oKMSZO
	 yeCQ69vjIpknZ4PsNOL1vK7aDw7o/Fj120JIU0Bz++zvVdxS9mt81VRUXAgIPOOJVd
	 z4Jjr2YvFKJ6k8XeOLHyeKa98WPujC6Yx8pOETzt8atyVlUUOjRPZn8C1Wq4euQ/YY
	 fTBnw3KpN3QM804+x+7PrSze26z9VD4BO7jP6fswdqMLZoyngvQ1x9xZW/APXieaVi
	 j66NpL9xpoe0Q==
Date: Wed, 11 Mar 2026 16:58:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pwm: imx-tpm: count the number of enabled channels in
 probe
Message-ID: <abGQ3VxC0o9obnLk@monoceros>
References: <20260311123309.348904-1-viorel.suman@oss.nxp.com>
 <abGLriw_VJ0MadPB@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="epwke632gsn772f2"
Content-Disposition: inline
In-Reply-To: <abGLriw_VJ0MadPB@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_085827_522996_3AD0FE04 
X-CRM114-Status: GOOD (  14.92  )
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


--epwke632gsn772f2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: imx-tpm: count the number of enabled channels in
 probe
MIME-Version: 1.0

On Wed, Mar 11, 2026 at 11:35:10AM -0400, Frank Li wrote:
> On Wed, Mar 11, 2026 at 02:33:09PM +0200, Viorel Suman (OSS) wrote:
> > On a soft reset TPM PWM IP may preserve its internal state from
> > previous runtime, therefore on a subsequent OS boot and driver
> > probe "enable_count" value and TPM PWM IP internal channels
> > "enabled" states may get unaligned. In consequence on a suspend/resume
> > cycle the call "if (--tpm->enable_count =3D=3D 0)" may lead to
> > "enable_count" overflow the system being blocked from entering
> > suspend due to:
> >
> >    if (tpm->enable_count > 0)
> >        return -EBUSY;
> >
> > Fix the problem by counting the enabled channels in probe function.
>=20
> Fix tag here

No need to resend just for that. I'll add

Fixes: 738a1cfec2ed ("pwm: Add i.MX TPM PWM driver support")
Cc: stable@vger.kernel.org

when committing.

Thanks
Uwe

--epwke632gsn772f2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmxkRwACgkQj4D7WH0S
/k49dwf+Kodx+Y+g4n26ScgW6Ze48U9EgGiR9yxq7dz2goKKDxa4YJG+NDsYOGua
uy0Lq6MKoO+hX03g4UVHmfIUCCC8wCwdF9wKIsh3iIn7wszC6rFIdbLUiF2RB93x
Spp2nTDM+UXeJd/WxCK3qoUMtouBNbN39Dh1+RY9b7VO4Bt2ZNX2eZ41Ydq7aQmi
mvIEVimmqa0Qg6OJ5kWJF4Pzwua7Hrsi44izn0J0NfkdxyDJ7UgMmH4TwiwbXk5s
X205KND+T5CmHjJlh39wXHuWWA2UtEEBHgWAmtAaTvpY/ChPTYrLilbXV/gd1s23
dFpStRPsKRRlXHv+AbFbZ1VvevPB3Q==
=+vB+
-----END PGP SIGNATURE-----

--epwke632gsn772f2--

