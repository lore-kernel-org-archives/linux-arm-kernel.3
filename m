Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D516C98328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTeDDUYpVGe7M/61OjeKHsRil0i2u7a0iXfAqfC2qDw=; b=OM69DQBLuCsgUAIHitwjeT00ar
	ZnJ7BeG4iZK+HnFSpUck+6tpPsZSXqVunDmCjQhSRI3j183vlebiIQkoo2LEfaacnHVmntTRLDp0L
	7hwsPr7rVYUloAsB/lXe8VccYeAF9vZXQg8prC/430rGbnbJlqHHlYbRVBa8M/EG4WLvS2o1avxYJ
	d6mNILQKDxows4IKgp5ohLo6HyWKgk6cb3I9RxrjfIvghZsvnAXD24dVGBivYBa+IvGHSc9xYB41k
	q790ZTJA2IMe5S3aPqSPRRHjEAJNXujnMSVnZ7JOSuNjivrxITaJga+OS7/o+ezx3SeNK/BYsnJDs
	8BpXGlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA93M-0000000DzWJ-0NT5;
	Fri, 25 Sep 2026 16:45:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA93K-0000000DzVx-2gRU;
	Fri, 25 Sep 2026 16:45:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D314860136;
	Fri, 25 Sep 2026 16:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B8B1F000FF;
	Fri, 25 Sep 2026 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354737;
	bh=pTeDDUYpVGe7M/61OjeKHsRil0i2u7a0iXfAqfC2qDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTVAVS87PFDNYO1ihtNP9LhEW+E5VsAWvO15oeNSOqN8zMkavdxNPpTI8Ak5R8kUZ
	 LXuYJ9KTf2lrQExbq4AGaniedsqj2Up1kF88ad57rB0LGsemzEr4g6/djkPkRovKNQ
	 h99cueIy/iKxxNBICwLYivMbsjaxlbVz8ify8P4w2beydZopnDF4uAmrWC/FTPWnSL
	 iAcdBDUXOucYC0+AmkXIb0U7nim12ZYm7MCBmwiOUHA6OO5GPjioLrtoFTci7f60T6
	 I8P/rW4M485REn5bzDMZGyrUccfRDkmRqf0f6FBgl7jRa0QhdRcZ3QF58H/pPtBDa6
	 oqD77b+8s2mAw==
Date: Fri, 25 Sep 2026 17:45:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v4 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260925-bacon-uncured-cc89ab761efa@spud>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
 <20260925085152.41852-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gH3REXVqU2jdjW7C"
Content-Disposition: inline
In-Reply-To: <20260925085152.41852-3-benjamin.gaignard@collabora.com>
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

--gH3REXVqU2jdjW7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--gH3REXVqU2jdjW7C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaralLAAKCRB4tDGHoIJi
0plnAP9LM8rGrHulmmHoWd/deDQf6tr9Q5c0S3hW774fYhioYAEArVyQqqAcGZiu
1nqADdmsPGJOoGQ990oWI81L6sOoqgo=
=EY5o
-----END PGP SIGNATURE-----

--gH3REXVqU2jdjW7C--

