Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A078AC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Szb9QhkBm8QWXm4hOoOHeJ3XDKy36QSFfsjE/sgIgQ=; b=dL5nLtPIYaQL5SjrYEu34BazcL
	Wcx8Ih3w0zaiBKTMFldTZPVRYNtphlOxVvgBNCwWAAPZtdrmbLG3JL6iksx83ZJeogtdSM1zfp/O7
	OxuzTBwDPaf/U1Y93suk92c9RD1VnRXvqxrnF2mvaQK7fl9TPj1yRt7NKu7ocp0CVCWlabM3OyWF0
	odYddeUiZtbh0L+tyc3FOWQXWaVLgEyF0gRcsPXhF7FtDBPbtx/Tae9mRK8JvLfDwxeHkRM3tZvxb
	aFYn7RLEtMFxBVEL1q/ztayQoliy/CklThDmW7l0huNldidXArIHzM85YykpzjRYCEPH24zW2fqqf
	DIE0O+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6F0-00000001WAq-2tJU;
	Wed, 30 Jul 2025 12:49:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6CV-00000001VYu-19j9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 12:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D2ED5C5E9F;
	Wed, 30 Jul 2025 12:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90364C4CEE7;
	Wed, 30 Jul 2025 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753879590;
	bh=Lui6GKk4m26Q1KnLkBRH6igXI56M/yLQNw685PM8lqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9Hx+VyozBE+6nbCPs7o2jtX/f6zv7/XaPbyPQB54clWIALi6VlboH526XPtNImPF
	 3kHmbwamTd7LsAwozYNX8YQFhXFv9CZEkml2QEa003Q64PAKAIeaEUu1vu68EsYyuL
	 8TL3zEbhcZ5QGxWikQjuQM/kji3uL2u8aiTkglI7gxSCFBTOncvHrEP5MapGRUwAFu
	 tntmnP3r+4k1Y/zoS4pId1Hya7XVxZ7qS1cDCmJeS/RrtY/vXZ83ZeYPM2++m06I5D
	 1VC5236EE2aW3w7GIa3acixfZIpj5GJup0/qjqJwQBttxmvBNEgWYPPZ0nJue2ejbN
	 +sqjGsfPiNtFw==
Date: Wed, 30 Jul 2025 13:46:24 +0100
From: Mark Brown <broonie@kernel.org>
To: ew kim <ew.kim@samsung.com>
Cc: s.nawrocki@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Add ExynosAuto ABOX generic platform and PCM support
Message-ID: <f4a71a23-a3ca-42ec-97ee-03e70e369db4@sirena.org.uk>
References: <CGME20250721024611epcas2p43099e043aaa6f48c05eb0237065d31c7@epcas2p4.samsung.com>
 <20250721023052.3586000-1-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lb7pF4nCCeJVaNeG"
Content-Disposition: inline
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
X-Cookie: Linux is obsolete
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_054631_352017_9C2E07FC 
X-CRM114-Status: GOOD (  14.95  )
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


--Lb7pF4nCCeJVaNeG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 11:30:43AM +0900, ew kim wrote:
> This patch series adds the ABOX Generic audio management driver for
> Samsung ExynosAuto SoCs, along with IPC messaging and PCM frontend
> drivers, including their corresponding device tree bindings.
>=20
> ### ABOX Architecture Design: Fixed and Variable Structure
>=20
> The ABOX audio framework is designed with a clear split between:
> - **Fixed part** (common framework): reusable components across SoCs
>   - Generic ABOX platform driver
>   - IPC messaging handler
>   - PCM frontend with ALSA compressed audio support
>   - Solution manager for dynamic control
> - **Variable part** (SoC-specific): defined via device tree
>   - IRQ numbers, stream IDs, buffer sizes, and ADSP allocation
>   - Defined per PCM/IPC device node in DTS

This all sounds from a system integration point of view like a fairly
standard audio DSP.  Usually something like that would be structured
with the generic bits of DSP support done as a library which the drivers
for specific bits of hardware link to, the SOF code is the most obvious
example of this we have upstream but there's a few other simpler ones
like the Cirrus CODECs.  If there's a reason why this wouldn't work here
it's not clear to me from what you've posted thus far.

--Lb7pF4nCCeJVaNeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiKFCAACgkQJNaLcl1U
h9AtLQf/WYJ1EIaoWIZAwVvNH9YQ4sTD4B2XT8JhFja1VlF2nccAJrayd9KIRtyL
KN98pq968BtDvoUfVqUZSMqCxGT9zFbHVnlcz7puPgx5+EaBD3MFetOu8QpQMUcR
spR6D/KBrtRr9e72xsoKqn4Z5h5CzBjMzmjGpAtfGWFjS8iJNHA+eJf4k3+X2VDx
jy6yqXkn6hQYyMmVk8lxuphugWVfhIK94Mnq9Wn59+Z99CiTDaLQue8y6GU+KCNI
46v3KKd2zQXqwS+1I54NIXvftpXBccxgLNhmiCg6Mq7Oh2FQv2Aw+Ha+yp59fRhY
iNQDBJ+7snNxHPIbY9F1EE6hzWiKAw==
=cIJ5
-----END PGP SIGNATURE-----

--Lb7pF4nCCeJVaNeG--

