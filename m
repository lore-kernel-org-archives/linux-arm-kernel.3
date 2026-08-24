Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1DCC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKkamCww1q5Ba18PxYV1T6fttml/X82gi0Gcp6tm1xU=; b=qeY9wQ9AvifzDKSi6uDJ+6BDys
	1VUBneumebegm6JZt3CxDG7KkI51XGXF+V5Vx0CssZQdJnNUEwOPvVZJcfOB47kDFQlb2Dc6cLXmp
	uvsLSJCsQ/+uSNEN1G4DV7J1Bz7nurFF+VNe57Oc8Vzu3Jl+zXoPMhbwohHE7YeDnBPuQwS1qW1OQ
	884ypmVGMVxEXHCsUgxCkngYcT/uQRPnevfby5qg8sprNawxY35pve0jkv8yRnYjEC17QKMAhHhkI
	izr3pCRpnGsGo3XfRpsQsUnSmhBnfiOS9sOayFM8GX/ymXV9k34HMFtamaXSxtUMnIYdOgOqYRQU9
	6jxMSouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT3G-0000000GX7R-3RTQ;
	Mon, 24 Aug 2026 11:41:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT3F-0000000GX6o-2lXm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:41:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EEFF6013A;
	Mon, 24 Aug 2026 11:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19BC1F000E9;
	Mon, 24 Aug 2026 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787571676;
	bh=oKkamCww1q5Ba18PxYV1T6fttml/X82gi0Gcp6tm1xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hYiXYYC7ozYlvjA4gz2sZSYuHLqlOuiXPUsqaRU8sJcZziXbXCBdB4qHTv2x7x0cs
	 Ukqybg6GDCZmBkZoVu45RJ1OxwUwsCWdfkoulgJ34nqLCRymjWo5riEbmKJV0lISnQ
	 Udmj21xM50PIYzZA7vKYruUvu0OSBAkcf4szAnBoioAUgnFgWbDsfwKXKbsGUN6DLO
	 pN1bk4q9+xMUT8yu0+7WOUXKvYAw9cLlHxd76/AjPVKqpD5Hp7G/Lxq1dXps5qC1pg
	 ipj4NiJCQAzvAQt4jY69XHSe/tkWj8rZ5DnW5+kA0YFpdIp0Ci4u3FaiNdxiJV9qAO
	 F2ZlsxRiC0LgA==
Date: Mon, 24 Aug 2026 12:41:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <219e4bf6-f7c2-4651-b032-e9b1ea11feab@sirena.org.uk>
References: <20260823050012.17067-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PRkKuBKNpKGJW20A"
Content-Disposition: inline
In-Reply-To: <20260823050012.17067-1-rosenp@gmail.com>
X-Cookie: Accuracy, n.:
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


--PRkKuBKNpKGJW20A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 22, 2026 at 10:00:12PM -0700, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.

This doesn't apply against current code, please check and resend.

--PRkKuBKNpKGJW20A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMLdcACgkQJNaLcl1U
h9DxTQf+INtzJgyDvqgqcnc4gNY8dx1hZe21T8KpXzsJojjOXwkDwQGQulFOAJgL
zAECBEeLfPd4N6aFurXZkKHxEe1BpwJisUnq7/9fmQybVM+OemOQNOhs5x14YXzp
uoqs9VUsYKYE0JMLDskxrWs1Z5zwCYWUt9Tm1n3U7uOmIHQtZsZWOGU9wvVYeOIv
tsi0suIQPyulXa/JBpciNv3TW10mL+E8w1FfZxu+hSSxHab9ZAm8sF4RiiUc6ulb
awFeBY/aju3oKS/YhB4jvYB3txuVuapfZ5xFbjgb1By69qYGd+K2qqOB5JjaL+5c
d48RB4uNYBlp2EMGcLjWy5vorczVzg==
=bl82
-----END PGP SIGNATURE-----

--PRkKuBKNpKGJW20A--

