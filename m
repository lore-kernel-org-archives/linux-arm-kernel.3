Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA662C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApNmqOPKAmvywk6QCgE58hkxGIDGVsi2dDUaD5lB3+w=; b=mL66Qy3DnQOsTl9isGRffgls+L
	x+NX1kcyQ6L3S7Hyw8Hhe/sOsv90zrxYaR9Rb8GjDLxOszvHKdv8lM1I+ufyl0jRhpL44AHVtaGsK
	PIwNzkhn93i16gxO3LVeiEXg62XwqRglxYqxFM5Fu4Dkuzl9ypx2Cr1+sxnPFikH2Y3wgL0NNGFWH
	Iqqo/UOepzg4aGbwZHEPzOsh8IJuZTJ+Hv+tyDGRSSAN23DZk/BhSJLz1Tr9c+HP74ebuj2HdMA2W
	6fPT1a1A/lmblvrpCTAUGgoi3eQZParpH2WyiXpQ2vbV8z+43j/SQ8sTWOl1BOxr8rSghY/OcpBma
	1aq8222w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dC9-00000007UkU-2SYc;
	Mon, 07 Sep 2026 17:31:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dC8-00000007UkI-1528;
	Mon, 07 Sep 2026 17:31:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87A9A601DB;
	Mon,  7 Sep 2026 17:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD031F00A3A;
	Mon,  7 Sep 2026 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802307;
	bh=ApNmqOPKAmvywk6QCgE58hkxGIDGVsi2dDUaD5lB3+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l+jXklYNmg0wDcCYIEY+6nO83b2frlpb6P7pg6jBe27xHaqDhgwamiVboo5hC2tC+
	 S5vdDg3uIhVVBUKBnVfwbLxtqUuU+TcQ9ZVhdMELiC+4BnY1R3dP1RTuUezxdR3+80
	 1b/xvY/wz9ANHqBPJ5QbgRnBaZaVvD+5GX111T6bx8qYVqb+6G7ufp9pStuDu3EU7u
	 GjIdpnOPqYD8fSfKUehdhi4xIrrODsVEvCDy2y7lBAxt/S8VqwjcDjE1cUlubOXJND
	 YYqjaH4rv6p47VfSNVQUZvZIelfOlUmU4SH8AG9qUvHZiqsCffnelv5z53qwXnzmLg
	 ymswdYzMDgvSg==
Date: Mon, 7 Sep 2026 18:31:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: peter.chen@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org, krzk@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20260907-bullhorn-charred-125d3920e51b@spud>
References: <20260906032431.470744-1-hongliang.yang@cixtech.com>
 <20260906032431.470744-2-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KgkeIoGAnZ4PK4Ao"
Content-Disposition: inline
In-Reply-To: <20260906032431.470744-2-hongliang.yang@cixtech.com>
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

--KgkeIoGAnZ4PK4Ao
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KgkeIoGAnZ4PK4Ao
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap70/gAKCRB4tDGHoIJi
0tcpAPsFjtkQsLkO0xQoaMnH9KnvF5DZqy2ksAPdjmNcv8D8hAEA1Tok2QAAimrH
dmO9g5jvHqsDBlo/TUjtf9/4XM54DAI=
=pknf
-----END PGP SIGNATURE-----

--KgkeIoGAnZ4PK4Ao--

