Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7349C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 23:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10IfIX+rqXW9HmifgBGHYLj8pbiOaELoC1OJPRB25vw=; b=oMMGKKmYUO4M6os+Mh4ciCIiPO
	xUMl9M1U7WYkUxQ1QGyK6AckEqnxLXpLoMgUCSxH/VhnfBVaYXrnRqG5ANSpQaNohAksgjBlTGWMu
	1jxZUeGqJHxQsXaLPlJJoMPJNSMgzccv8D/xHCdYfESRHwHc5Mf6Yu11cc1UDhYrRyvQV0plQM/tj
	QXBVbeO54dZ7K5boqr39xKCOdoPEtyKNJUhZZfLSkcXoH1RRH2kAOB/BTTILed9uC/hVGJF2tb7PE
	I8bTIU6EnhIlMxqtZMJOEQy2HOUgkjL29IBDIQPp3/VZyBgUg2ZZ5udpUw74wa7EFkKfEtLuSU1/W
	Ss8KOSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7kp-00000006rrY-1ASP;
	Thu, 06 Aug 2026 23:44:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7kn-00000006rrR-3NaQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 23:44:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B719441774;
	Thu,  6 Aug 2026 23:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C4C1F000E9;
	Thu,  6 Aug 2026 23:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786059839;
	bh=10IfIX+rqXW9HmifgBGHYLj8pbiOaELoC1OJPRB25vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+oz6sxa9HGSy5MHI+BM441vfRRzalEmnA5bzBcTpPD06U+ZUgy1+0cjxdLBd4Bz8
	 haXgSL/OEm52jucijCprlmmazsTfy0uuKIlDhnomTgcHH3ljxDKYDxHbNhTSFvEjJp
	 zEZ7kh/O9dLP/LeVJgXNLSPkP1p4250euaD1ovr2jRE4pTlL0pbToJDj6gTrzg4HWs
	 6H4mdQWcqdtOciWl/EBJ2lTg34UdJ9oDU6qLVvUzAJH8z6hOQ1/AtYkvCEaAt8heL+
	 +iomO0Axf3o/kkJgmG65noWSnkqPy1L0tw9CSGigyXcm+Ag+/exyZE9+v5vgxmj73n
	 N0AaDg5KA9IQw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0B95F1AC5738; Fri, 07 Aug 2026 00:43:57 +0100 (BST)
Date: Fri, 7 Aug 2026 00:43:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: use devm_clk_get_enabled
 and simplify probe
Message-ID: <anUcPCENjlj65W-C@sirena.co.uk>
References: <20260806233812.31851-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EsmF25R3uavR+2WT"
Content-Disposition: inline
In-Reply-To: <20260806233812.31851-1-rosenp@gmail.com>
X-Cookie: Swap read error.  You lose your mind.
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


--EsmF25R3uavR+2WT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 04:38:12PM -0700, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove.
>=20
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly.
>=20
> Assisted-by: opencode:deepseek-v4-flash-free
> ---
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 47 ++++++++-------------------

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--EsmF25R3uavR+2WT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp1HDwACgkQJNaLcl1U
h9AgcAf/XKL7xUSbmRRfV1Xf1pAt9hc7vV91sDkz/pszgYtTKuHK1UxO5mctw/n2
PHxst+59W3feDmAeukN8XpGW2MjtLqDKkVlLV28fSOXyWDOV7ULCUvwfKBSsQRjY
SIry+jGcn0AGaUR/FG3s2EDma4aWund8XD/qKWSmB4ZKlBD8CFy0xSGnbT4DYSMe
pyZscTpdQDZ6F6Njt13aMG37sUiBzOOCEggfkaaKfVrGhmqkdP4MBStmxBqTbO2r
gBqMtvBhrxhOtnXme/aGaWP22M1pzuLeQVNSovc+4SN5QBP3FZN13oJVYD8YzewT
skPIY8fsUS+mDy2PlnjEXx1dSs9ZuA==
=1T0e
-----END PGP SIGNATURE-----

--EsmF25R3uavR+2WT--

