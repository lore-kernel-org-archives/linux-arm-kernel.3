Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HtBsgoo1pkoyz9U7bxXdbavwf4UmaCm5JaH3qpl05w=; b=mC30pcDRco9UeZNgmNdeQnE9Am
	MqwPr2lKBqXyvxa5LQp73ylowwTwBbNbCnxK4pYxb2WYcB5Bpq9f6faTdGsZH9xWBX2hJMqnrSVB2
	02gz9zP8grtJuHQNk1iYQevmMOo06SDn46aRrhKV0HRUI84/0VFsuzb2wXTLZy1Gnqxp9QkqEvzZC
	NVBIltp84TCggQNm1FoOIQ1LVC83wrIGlc5g/qgRONM63WREfOstLPRZtcAmtlgdVEMEOMng7k+4s
	vdz36bCV0SMZSmOhuAJDiXs5GU0c0WPNjaEhgShMvR/Coo2NfceVb8gKHB3KphSjn+Lhv6YQq9wdP
	J8heu9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdv2e-0000000DJf4-1no0;
	Sun, 28 Jun 2026 19:19:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdv2d-0000000DJeo-0BO9;
	Sun, 28 Jun 2026 19:19:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 599E640B4C;
	Sun, 28 Jun 2026 19:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712A81F000E9;
	Sun, 28 Jun 2026 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782674382;
	bh=4HtBsgoo1pkoyz9U7bxXdbavwf4UmaCm5JaH3qpl05w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaFpI/4sCso+xnOrHQuqjFzj/MK2wIM0gjspGR22goiAf1aEaBymN5YvtdztwMWsP
	 X8DuFWyQZEDYuHuv7X0jAoch3aoG8PslcRnQx1WKz5TORoHyjqwzUbAy3wGo5BXY+6
	 9JTq6kgkgjPx4QgVyidS/1r2HHBSRl72yjFAS5u/QbdCVNL2LAHGDH/5hNpKtmUuDC
	 wMuo/iXA78vNKz66xObpa8OjYJkxYO1mAef6yI+o/zfdvBWb7dwkzWlRDFTgy/c2KO
	 U/W//yVJHGLW0RmDcgF0QjYORG9izEUf04rYzEPd8xIjs9gPUuQOFe7lvuMMNNoltv
	 a97t65VOO/CYA==
Date: Sun, 28 Jun 2026 20:19:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman2
Message-ID: <20260628-retinal-ungreased-4c6d45e3596a@spud>
References: <20260627102633.86222-1-hrushirajg23@gmail.com>
 <20260627102633.86222-2-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g0JoW9tTpk32mUpy"
Content-Disposition: inline
In-Reply-To: <20260627102633.86222-2-hrushirajg23@gmail.com>
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

--g0JoW9tTpk32mUpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--g0JoW9tTpk32mUpy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakFzyAAKCRB4tDGHoIJi
0l9bAQCTqBDKp1DNzljiIyEyzuzlDZi8AwRwZlgHSHmC225+qgD+INSm2SlDd3W1
wMikkhDKqyY6H+ca0h44jK5+HqnxOAk=
=YnMO
-----END PGP SIGNATURE-----

--g0JoW9tTpk32mUpy--

