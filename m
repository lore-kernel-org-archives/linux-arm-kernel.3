Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E562C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30UYlP6ParRa63yvuM0w49yZOb2BNea0YJweSuIHhX0=; b=k32SJtwip5sIJx9ohUH3DaYQPo
	gfVIJmBu44lW1oci5UjFBbXkw4p8Hcf2Wgv6dIgzJZxbcO++oQZJpMCfD5SMzsLRsNee2IpY0eCYo
	ZLTgyJ18oksbfSyAdChYs7Kk5rwayrtTtDTTntHSQ+FJQE+JBg8euL6TZEmIft/Z7IJ+bJbIGgHmm
	omIz3DTFegWoQztt3cD7ASqJFoeMFVrNi/J4Du5drIrnd0Ejs4oKqRHk3hLuAh2GSpusUNJgzJGPI
	A93URZj8TY+GvFy/OVfu+SywuyDoiXchWTfTK0sN/5xn5KDvDInVGhCkx6Rg2/agjmWgp9qwRw06p
	Ba/9XDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6W3o-00000007PN3-0KEX;
	Tue, 15 Sep 2026 16:31:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6W3m-00000007PMr-0G9x;
	Tue, 15 Sep 2026 16:31:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7770043BA3;
	Tue, 15 Sep 2026 16:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83601F000FF;
	Tue, 15 Sep 2026 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489865;
	bh=30UYlP6ParRa63yvuM0w49yZOb2BNea0YJweSuIHhX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EPoFbpjbWI0XwVX+rUVSVSPZDxH0pycoeOaWxL9/AY4ZMDNrsCP0MTpUOCPVmkcwu
	 kgsHAgYW4xOK1DG+Yko42BmWmLsqTz71xb1Geo0DSVFr3MGo2PL+UXxZqL+XzCPpuk
	 Iuq9wIri+XjvmiQadc6Ef6CLMchqBWoXoW9KCssZ9rC4b0GEBkPnfHR2bWSoYJIBW7
	 D6qLppbaGqC+zAf2qmShKh04JNRyF+fiRCPBHwtRha9aaedUd7y4yjYuVsegm8X9gR
	 841Co+GNp+ezvcsCmZpwn50nYsjfVQQInCLq+HixkWDHk6EKqRNr2ssFKN0JCF912H
	 I+5Y0BGnx0gcQ==
Date: Tue, 15 Sep 2026 17:31:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: add rockchip rk3576 vicap
Message-ID: <20260915-quintet-illusive-1f3d62aefc1e@spud>
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
 <20260915-vicap-rk3576-v1-1-d3f5eb58a0b5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ECQ4r30L3EqSEGAN"
Content-Disposition: inline
In-Reply-To: <20260915-vicap-rk3576-v1-1-d3f5eb58a0b5@gmail.com>
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

--ECQ4r30L3EqSEGAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ECQ4r30L3EqSEGAN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqlyxAAKCRB4tDGHoIJi
0m7dAQDXJxd4JSFc5q9RF6cxkSGcV5doptDh9Eud28cv+bPggQD9Fu6L0SRFRN9P
Z+/i8kFwYIMibSdSHhK+gHP0w+qDEwA=
=WxqE
-----END PGP SIGNATURE-----

--ECQ4r30L3EqSEGAN--

