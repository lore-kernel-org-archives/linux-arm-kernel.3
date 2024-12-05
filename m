Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0496CE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUkpGobwppRi0KFfWA1Eb71YN+dmKzIdBY2K7yHXYjk=; b=LPH9F/+Of74ivAlnDvojVHcvDH
	20gadJEQJD8LcR5NI66+v9xgyOfrJlWf4k24IjpivHxo0+hLg0FhX6vFUf2BDIW2kzeT2Nk02pOYU
	CSsMquZ4ECIIRQE5CZKl8d4Xbdg3S795KxTSgmlePsB30Ldv+lHO7f2sZcoxRGFb0+aS2jj1/DluF
	LKXiUD5BT943E6jviUoaqJwPmf9LXDZoZvbM+elfErneEyYQRUq4yR5x7/dE5K+BlUSsqJFPMQFLg
	72FivcrKOBz0ZV5Led0d4Jcs+4U4sDncVrXuwjep4EQm5MCLviuOr5LbkO4SJeoZk+bzcnWbHegUx
	RMUI75Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFjp-0000000GyAB-0gA8;
	Thu, 05 Dec 2024 17:34:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFim-0000000GxvM-3B9w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E233BA43E7E;
	Thu,  5 Dec 2024 17:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D5FC4CEE1;
	Thu,  5 Dec 2024 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733419979;
	bh=A4HKlLGP6RuuEleImAaXneXIJLzkRN3tyzYIhdCc+Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiT7KgEIA6zYesoTXQs1I50aE1CdHjoz/pSjFaMcX9Rt0GnslQzQeWvJtS20Wjy8c
	 sebQo4CNXtZdTPUG11bB+mLPN88zlA3b47N30dE/55w8RxNLm5JQweKcTJyvcbOAW7
	 +XNZpoTpYEtj3rTffILW+LZNuuAmvRZCAW4YKQ0LRGc3Wj5ewwqrtSYkwpavwl9NOh
	 CtJ5V1Gi0Z5pAKIW1T2hBxJzOkeRNIFFN07foLyx/GqgxW2y4dnseGncww5f72qxGw
	 q852tvP6nhRnaoUDXvJsxFgdEi9kC5rs/RqVWXlbTh2DMm+d7cwtyHssxflhXsw13C
	 B9LMQzsOo769w==
Date: Thu, 5 Dec 2024 17:32:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH] dt-bindings: dma: atmel: Convert to json schema
Message-ID: <20241205-silt-legwork-8cfe9a41bb2e@spud>
References: <20241205-xdma-v1-1-76a4a44670b5@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ScQk4iEEumBXrCPc"
Content-Disposition: inline
In-Reply-To: <20241205-xdma-v1-1-76a4a44670b5@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_093300_859064_10804C2B 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vinod Koul <vkoul@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--ScQk4iEEumBXrCPc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 03:26:18PM +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> - Add the required properties `clock` and `clock-names`, which were
>   missing in the original binding.
> - Add a fallback for `microchip,sam9x7-dma` and `microchip,sam9x60-dma`
>   as they are compatible with the dma IP core on `atmel,sama5d4-dma`.
> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.
>=20
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ScQk4iEEumBXrCPc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1HjxwAKCRB4tDGHoIJi
0vQFAQCykQ0pcZXNpjHqd6IymSH2h4phZPWh5G8QohuQFfFThgD/WTDUDFfxBKTn
OnP8Z6iBbruK5JlxwD3g8+4iMSnZDwc=
=f8hZ
-----END PGP SIGNATURE-----

--ScQk4iEEumBXrCPc--

