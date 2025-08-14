Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F92CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3o62n1jvBvaD2lGjnYCtfClf9GS2F9lsAhVKwWipI00=; b=y04v6DVxzkM1a69GxDE/kGT+ht
	kH+/2M63slaDEKDhStroPL5lpxw0B6G1sDlA1h4+Lp1zlv7wbJfqk21Qxu4l6o+CToLAE6IEI57gI
	+2ih8rAIYFshbQfofR2BwbKeUNQE/exJVpQjGNHGmgHcHI010Ikk18/Ow9DKxsDrI7Z/OBw5P/4B/
	C8azggmbaFPJToaN8YMt5VPAfAuLCIjZBNoex8Gc2g0biQasi41vjoqqO4CQDe/EfyFPUa1K+s8co
	0kSPclnoSTmqQGq27ymNNuZii89HnSRnzDEqt0Snbgx/Ai7lDBvrHEAiieYcSbqyX9oyYbGRCa2LL
	QKn70HVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcyj-00000000Lyw-468J;
	Thu, 14 Aug 2025 18:47:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcvJ-00000000Li0-18lp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 18:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3o62n1jvBvaD2lGjnYCtfClf9GS2F9lsAhVKwWipI00=; b=MeC4BhniXi/qyJsU/60Do4Zasj
	U4pYm6op41pJ+Jxuh3huwKO9YwonFhCpSn0rtqlvqLqUUz2PZGid77gLu92Z3TWsbl+sp0zFEk5U5
	ZNuciQacX8QxqmIFGVV0lA5Sk0KUCNRXTPkRizNiRp4IY4lIuAoF1/cdtl7NhERg0wW7zRrlgVTER
	2Aveli+zPYslKFfpmSFemBCH3u3Qf5I7wCKY4NJUmhTXC471vQgOdt+MFyIEnVKIJkl+hVVOp5+dq
	W0IK82xIgrg9mbv5zZiciJBoW4yNQV/mNlBGZMzry0x+0yYe0aj3ZGe7SnKeBfBr9yc2vABW69J+A
	h1YTBIow==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcvF-0000000GX1f-3ii6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 18:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2610AA57424;
	Thu, 14 Aug 2025 18:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC47DC4CEED;
	Thu, 14 Aug 2025 18:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755197011;
	bh=+edEx8wP5sj6lIPPo4+9dTecgBzL9N0lb1TKODlviEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+OwVj2OLlRjK6XZS/8srDIRauWKxHcA5a0JJhaqDHoM751EWi35LMp2Qe71x0vJI
	 F3EJ42mzPbM5HV+kbrIw+hh1YmI3ExfnBXTCfklBDrnUbATkYqavQRwnzlA8+5Es4P
	 0+ej6Zk10WhURXK1AJDCbBBAXRx0GmNAAYusuOELHieRqq67QzKPoAdJiF1E9AAV82
	 axYbo7gzJ/2k223McejgeoQ1CdcFwGND6LcXLewKrTSJqwkWLyxwizNuzO3cAJYp3l
	 /DuPYD3q9QH5fFlOheUTni3cZbMk0KIUxvxBoLChPc+8KhPSF8Pv+R2INB3sXR0lN8
	 RYjoZvJjyUDsA==
Date: Thu, 14 Aug 2025 19:43:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com
Subject: Re: Re: [PATCH 1/2] ASoC: es8323: enable right-hand DAC-mixer
 connection on ES8323
Message-ID: <7d2529cb-7ecb-4616-af04-f65b1f309d89@sirena.org.uk>
References: <b5a64166-c55f-4ca4-af92-52c954847af6@sirena.org.uk>
 <20250814183344.59453-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V6wTkxydwkAjWbTz"
Content-Disposition: inline
In-Reply-To: <20250814183344.59453-1-shimrrashai@gmail.com>
X-Cookie: This sentence no verb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_194334_207456_FC1D60E7 
X-CRM114-Status: GOOD (  29.45  )
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


--V6wTkxydwkAjWbTz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 14, 2025 at 01:33:44PM -0500, Shimrra Shai wrote:
> On Thu, Aug 14, 2025 at 01:11:59 PM +0100, Mark Brown wrote:
> > On Wed, Aug 13, 2025 at 08:47:31PM -0500, Shimrra Shai wrote:

> > >  	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);
> > > +	snd_soc_component_write(component, ES8323_DACCONTROL20, 0xB8);

> > Neither of these should be unconditional writes, these should be user
> > visible controls.  We don't encode specific system's use cases into the
> > driver.

> I was just following the precedent from the driver's prior
> author(s), in the manner of the line above it. Presumably, enabling
> the left-hand DAC-mixer connection only was a solution that worked

Yes, as I say this is very bad practice on the part of the original
authors which only escaped review due to the magic numbers.

> instead of using a blanket for all devices as I thought. In that
> case, that means the original author was also wrong, and so I need
> to know exactly where it should be placed.

Like I say these should be userspace controls, not just blind writes.
Probably wired up in DAPM, SOC_DAPM_SINGLE().

> which suggest it is in fact controllable already, but I wonder why it
> is in the "bypass" switch only and not the "playback" switch, which
> seems to do nothing (SND_SOC_NOPM). Would it perhaps be correct to
> move these to the "playback" switch, or to have both switches
> collapsed into a single switch?

Those will be different audio paths, it's almost certainly a bug due to
the hard coding of the enables.  Both DAC and bypass paths should be
normal user controllable things, from the sound of it what's needed is
to define the register for the DAC path.

> In any case, if these are the correct places to enable this control
> and it is already supported there, then it seems neither write command
> in the setup is needed, viz. we should _delete_

> snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);

> too. What do you say?

Yes, ideally that shouldn't be there.  There's some risk that there
might be some userspace relying on having the mono channel enabled by
default though so perhaps it's safer to just leave that as is - the path
can still be configured by userspace, even if we end up with a weird
asymmetric default.  I guess there's also some other things in that
register which most likely should also be controllable.

--V6wTkxydwkAjWbTz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmieLk4ACgkQJNaLcl1U
h9Aujwf9H4/FrH0RsNY7gMqAmRWMuc3EYNLFbcnfpLD+rFs2X4sX3XiQCaPzY/S0
XgDhpQP1+6+oLIJx8m9+mm5Tpcbr237cNLkYkktWT16vTC0Kb9mVmjMR5i1plscZ
NbsFHXCZmmxYv6TFYYgjIq1vuYCssxzU7QBFJJSdXBzehOi4deYinNcN9lRti0jX
TYcfWOxYT9xKhzaJuXWAoQLt1XFMNnzS1LBD5QfWUKgnmEV7RQ0o7io2flZVnqVA
ZD4wQwRqGVlB7R9pQRuupNhoKJyruO5Cd7NmwmQFtuUSwXS8ca4UO9pU/52dJueh
jrSJ+kSDmrF7fheV6q3yHrpBoYPuhQ==
=x+Gy
-----END PGP SIGNATURE-----

--V6wTkxydwkAjWbTz--

