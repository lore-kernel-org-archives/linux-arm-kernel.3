Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B8C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj9WhkqkZdb3jP0eYrqc0Rs9Sev/2nJjaxalhss33qs=; b=Q0oFUAuyf+3AhhE3D+Q1D611zh
	I7e9cVzejicQZ/MucilsBx2zxb6/03Y9q4WZeEoSaeXrJ7CwMLOCkM6ApS2NJy60Ua39PzsjnWfgg
	Id9+BLyLwl6YKaQA1aw/nJZEYV945Cj+O1g1sdY+4O2wuoQ6THPjQJ+eNtoU3qXyEFiSVqE5/v0ic
	uup5nzShp/YPXP4cmS3jRu/CcV96AoktBkjGImKClvKuBDf1usP97mbqzzn9je6oEK3FzSMm9Fn0I
	Pd0liOSdpqm9/C1TuzpTp8PuH33uGv5enlZ/ZaWTczQdfpSVhvVyaXUY5Csxs4d/jlDjIfMzQTmiO
	qr4zzOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuMy-000000019nu-0YAR;
	Tue, 25 Aug 2026 16:51:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuMw-000000019nm-35w9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:51:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2995840790;
	Tue, 25 Aug 2026 16:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF461F000E9;
	Tue, 25 Aug 2026 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676686;
	bh=uj9WhkqkZdb3jP0eYrqc0Rs9Sev/2nJjaxalhss33qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0UfYeBFq6LJSnyuICm7ghI6FTvFcSUB336zoKnLgEVcq1t7M13917xMX+2+NqijR
	 iBY8Lr2CqCEi8qovye0uCDx5yUpcimHnY1fUVXnQUdNsmfVwNpRCSII85miYDBBscS
	 Z6zHuToi8LupYVvMFPz/fE835Sud9/76cP6/X2KiSymr5RNulzF8dARWUbAN3wdLiE
	 ln65cpvGvNRz7lgyCxxjPv4NFeVGhEVCaC7eyFofwHqK8NoLDGrFgOTihjUcqLNHAp
	 Z6d2iC/BPJqIPUVxMcIOTEkSLwIcfVLRzFG3/VKgPL51P/y5yGfzYDRzmbsmUtVYD/
	 la4oVnjxr22NA==
Date: Tue, 25 Aug 2026 17:51:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, elena.popa@nxp.com,
	cosmin.stoica@nxp.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Message-ID: <20260825-slighting-tweak-7edb9705411a@spud>
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
 <20260825120812.2152-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thp85LlBU4kVyd6v"
Content-Disposition: inline
In-Reply-To: <20260825120812.2152-2-laurentiumihalcea111@gmail.com>
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

--thp85LlBU4kVyd6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--thp85LlBU4kVyd6v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao3ICQAKCRB4tDGHoIJi
0q3LAP9eiNOKbeSHdVJaupRVPyTvh2tBUfSgxHD90LXQpr/7cwD9FY9qLM8PxlSn
hv40hzjuLm7uotv6kc2j2kEw+o2QygE=
=TJNO
-----END PGP SIGNATURE-----

--thp85LlBU4kVyd6v--

