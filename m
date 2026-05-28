Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD85CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y/q4DHE4I6kofJEa8EbrZ4uiX1Bo74IORrWzMYrFRk=; b=xF9oWuJpmT47GJFpBWBNQeJDXm
	jhG9gbdbVOX4fyKa/MgdhcxB8HgXNLBlehbToyZkWFRH5To8oDZgucgCB8BZsExliDIS69YDpwH8u
	Mu98xYCL2NbqS/wai0anZZhQUu4Lc7JV5c3UkoJHjHQF/orQ9vTweGV8s9od+Q29tl6iqsQWhDKgi
	rZsvWkANyOy7/EyxTNC4T17E7UhJkdvAzkPLa6eklfZMdrAEEnv3l1tKYDBWbkAHjfLxXr+vvA5wD
	W65Ir6QpfohIA9sWsl65Iw62QGtjmipbcKnkBA8DxQhT8/NDN2SXgufZNelmNSvYCcjF5CVE7g3/G
	fk32f29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbYs-00000005pqs-09tl;
	Thu, 28 May 2026 14:18:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbYq-00000005pqV-01Qn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:18:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48170432DE;
	Thu, 28 May 2026 14:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60B41F000E9;
	Thu, 28 May 2026 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779977891;
	bh=8Y/q4DHE4I6kofJEa8EbrZ4uiX1Bo74IORrWzMYrFRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X82UcBfN8RcTWtZVbhWxccD7RyaJ5exs0b0O8tm7i0BxGNvXfWWzzaCqPwsopVlpE
	 tv8llTT4fysg8k8ZhN1P3E2Ql9Qw/yENEbt5v/B+vhNEbHfnNGV1fvCqwOukQABWk6
	 u/gY1ataw06qMYbNLyhuHyAJ43nCHxEvkoZ4QA9ZwGYHF8dbtrfZ5+BUaD0iezvOEU
	 6zo9IJmNLk+a12OByhjTN27hrvXHmbG1I/yLJyCgKasRhQxmR4dDN1zQmX6lyrVh6M
	 n220wQAMfZZfuqNWrYRCrV01Bj4g3keSZs1OEjsOxSBiw2lUdo45t4RlGHTC8ajNDg
	 3iKPuxAaBVIKQ==
Date: Thu, 28 May 2026 15:18:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: imx-rpmsg: Add headphone jack detection and
 driver_name support
Message-ID: <5314b232-9688-4f59-a57f-4cca044c9e44@sirena.org.uk>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260528020725.2265321-1-chancel.liu@nxp.com>
 <37324dcf-5214-432f-9aea-90bcff5fec32@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wWa6HuIO+szsHHcJ"
Content-Disposition: inline
In-Reply-To: <37324dcf-5214-432f-9aea-90bcff5fec32@lunn.ch>
X-Cookie: Someone is speaking well of you.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_071812_062648_5E0832B7 
X-CRM114-Status: GOOD (  16.32  )
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


--wWa6HuIO+szsHHcJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 04:12:58PM +0200, Andrew Lunn wrote:
> On Thu, May 28, 2026 at 11:07:22AM +0900, Chancel Liu wrote:

> > This series adds two features to the i.MX RPMSG ASoC card:
> > 1. Headphone jack detection via GPIO: Introduce the "hp-det-gpios"
> >    device tree property and use simple_util_init_jack() to
> >    register a headphone jack with GPIO-based insertion detection.

> I'm not familiar with ASoC, but have been in a long discussion about
> RPMSG and GPIO....

> I just want to confirm the GPIO you are talking about is a local GPIO?
> You are not tunnelling the GPIO over RPMSG using some vendor protocol?

This is a GPIO accessed via gpiolib, the driver is for an audio
subsystem accessed via rpmsg.

--wWa6HuIO+szsHHcJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYTpwACgkQJNaLcl1U
h9BDfgf8D56dWhhtsJtiSVFFuAtK4SvR827YA8oEpusYCpy8rCSmJYQnBDfSHJL8
1VrmMggbVk042uz2wvOxhYiFzrcIaovpNISfUClaUy4i4qnyJZdGMjJO3lw46YoN
5txxEzVwGv6HmZj+F6pUj9O4EjnISED6u/Sw5QyOtwmaiSQkkL+CYWoqY9DULilk
8yAN5S0yocXka+Y43Wz038BtoknsfwolP7jitXTF3uDeXfT95xq09lnS14RxhmPN
TpBMDniASO5sgXWS8mSzdpKnHz5NrdaeUeedgnxfMumutsGcv6px/73O5rpo95Mi
n4FPg8mfRPM1F6ljySHha7bIdQFf/g==
=w2JU
-----END PGP SIGNATURE-----

--wWa6HuIO+szsHHcJ--

