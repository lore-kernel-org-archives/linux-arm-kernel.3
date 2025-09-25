Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A2CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrNoezNBFaJZztyAmAxpBLPcnlcQ5iJ5bSlvrmLLqEE=; b=PETEfOysHDc5oU212oWEZmqgHq
	YuxeTLHHa6dz/6JHwMuQFHcgWPFSFhxmem5aowm5IGtXulBE3ds8czovB/887mrJkhi4HqGQ1iayN
	L4dZx75zp7+mwmUBE48ua/9OQttbqpGialhvYFmdJCxNio7m8IAsDqWIGYeIUY3Romo2Abbf7fW26
	T10vMwINg3sloh82nDYOBCApFBzqf309/uF8l7gAtIaiqx9NY25c+68icUa53ISljnylTuec71kne
	C9SX0NC/SK9CSeWVqZOrKxxQuYkRZhKtiNbwUVoXX275NkOyIHvMlQJbChiShLaKDEgAf7rvWO57G
	+ovtu8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rsw-0000000CQMN-2Gsb;
	Thu, 25 Sep 2025 19:44:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rsu-0000000CQL4-3ssV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 19:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 413926122B;
	Thu, 25 Sep 2025 19:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499BDC4CEF7;
	Thu, 25 Sep 2025 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758829447;
	bh=UrNoezNBFaJZztyAmAxpBLPcnlcQ5iJ5bSlvrmLLqEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mq6jXjhe9sHXnCl/y6aXDAqKIhy8d4IVJPkwB6URy+qmuH1qcy1FpRHGl4RtNCOBC
	 oqfffN9iyIdqUAAGapTRrpPStowk5uPZ688KT/4qCC05fl4/JUhjZvYQmqra881WkD
	 JfZR74v1djWJV1mWgIasFLNc0CZHPsHTsYhz5Bi6rB17RHMTWrSDK/DZKVOTDY5sTL
	 Cel8hTNbzk5+7yI9VPKEpz4YdWJYG3pYYKeC4UsG+Ukx8EzeZYS5fQP9QneT8pJpS3
	 EYWLGDUBcsr2u00XTzCzXxIv9fu0PqRXzKXb/Yw08aagnZ8lL7pzmfXweJfy/lzooq
	 C2kfBfkKs+vsw==
Date: Thu, 25 Sep 2025 20:44:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: media: fsl,imx6q-vdoa: remove redundant
 ""
Message-ID: <20250925-wing-accustom-250326a9698e@spud>
References: <20250925193546.305036-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nlhU1AayOf/rp+SO"
Content-Disposition: inline
In-Reply-To: <20250925193546.305036-1-Frank.Li@nxp.com>
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


--nlhU1AayOf/rp+SO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--nlhU1AayOf/rp+SO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWbggAKCRB4tDGHoIJi
0huUAQDSSuao0QlibS1EgDwm7Y79REVUJZg5kI27IzzjbhZx5gD/UIC2V6vcjOCV
S0nAL4sJHGS5dFFBWZa7UTQ1Fpgb5gc=
=d6TN
-----END PGP SIGNATURE-----

--nlhU1AayOf/rp+SO--

