Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F7FCE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTPGv/tLBwdmKSviE1Wp6sqQYguPPNhwDEFGwKwpuq8=; b=hDKLqa6ioKpg0K4puX+wDTEhez
	McEzC9PEZ7P5IOMlFEPMIWq56Q6AIFVOy9SYmYBqevyiEG51vbojoM2NEGY2pfYUixNvwkxdEblWK
	Z2/KJuoclaQ2+Yphtf3rGTZNAiJTjihVgtIuUPI4jt5RA/qnxwNvsJ7+w6n2Y/4BFuAvnRojoLi8W
	hQkaC5jzpFlMOzOZjk4odhLIGeBqZFyaIaNRDGZs+kiorg3YhafEkHdYRnjz2xFRDzStAeRMrsJu8
	ip/lAcryIaazU51ctyPoV6qdjaxJNOESFgpenRT8VpOkQT9F+sCzAlh7JJC9Z+vN+pcP9CwpP0KQX
	aV7vhVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40N0-000000012Zh-0Kfa;
	Thu, 24 Oct 2024 16:07:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Jm-000000011ZZ-2yiy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A4BEA45646;
	Thu, 24 Oct 2024 16:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D56C4CEE3;
	Thu, 24 Oct 2024 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729785849;
	bh=qIkOxIq97P2O6Gu+DLiuvn/RMN7SEd2Sbsm8fcvwju0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Amgj9rjT6okGjpJlT7kg3kLcymJBnG/LvyVfgweNxht8CbrutPzsktUTb6r+GHkJE
	 L0B3TAzPVlqmky7r5QkrpAwti2aDr5VP39PCmq44U0TPXRMts5RgnNM7CXrx8t5oaf
	 VZr21or9sH9PvAfcwDaK9vVm0fkmbg/l7fu8C8vdulLWXCJFl3A6LyB7OMKi4Je+cP
	 ZobumImXUysN73+kbSS6pj74vpYtcaXiDBwoO9sB4r+M9TiH27dVEzWlEb/xt4uA6A
	 VS00Cv35qqMWpMyv4UA25wZBKMYmKeV1h8FiDUAVev+GYziRAL1NdydFFTMWpB/B5N
	 pLsrnfryPtXsQ==
Date: Thu, 24 Oct 2024 17:04:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 2/3] ARM: dts: imx: Add devicetree for Kobo Clara 2E
Message-ID: <20241024-afterglow-elk-e7c3a2b40fee@spud>
References: <20241024142206.411336-1-andreas@kemnade.info>
 <20241024142206.411336-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T3UjkdWASUbyf0tP"
Content-Disposition: inline
In-Reply-To: <20241024142206.411336-3-andreas@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_090410_833877_7E438E4E 
X-CRM114-Status: GOOD (  13.03  )
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


--T3UjkdWASUbyf0tP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 04:22:05PM +0200, Andreas Kemnade wrote:
> Adds a devicetree for the Kobo Clara 2E Ebook reader. It is based
> on boards marked with "37NB-E60K2M+4A2" or "37NB-E60K2M+4B0". It is
> equipped with an i.MX6SLL SoC.
>=20
> Expected to work:
>   - Buttons
>   - Wifi
>   - Bluetooth
>     (if Wifi is initialized first, driver does not handle regulators
>      yet)
>   - LED
>   - uSD
>   - USB
>   - RTC
>   - Touchscreen

>=20
> Add human-readable comments for devices without mainlined driver and
> binding. Such comments can e.g. be help to find testers if someone
> starts to work on the missing drivers.

In case me not responding would case this to get delayed or w/e, thanks
for adding that.

--T3UjkdWASUbyf0tP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxpv9AAKCRB4tDGHoIJi
0uAYAQCqYOgTn9AGX8//+f/z/8np6mw4cZpj4O0o2rhhFIEZYAEAmZt0drEaPIEn
SjW+fgPKfA06B7JMovRg/rmq0gvLvwE=
=Vkas
-----END PGP SIGNATURE-----

--T3UjkdWASUbyf0tP--

