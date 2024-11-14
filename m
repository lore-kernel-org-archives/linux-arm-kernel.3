Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F25ED6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQfNlFJn5un5Q7X63S53AeFCdYUq2T/YlhPFk4SHDeM=; b=HG073XUxGHuNmnI/45VcGsAZaH
	HyQ1hphjvbnRKyWGB7nsLDkbOEW7axooX7AtXVV5j69IAOUiMqDSW9cKN5TeCPehiaf3VAuMMqtyh
	qx1pD6zDm7sHMpp3yxnDD/BaTjtVljiNJaNEyW+5iTRSaxtzQ3imVz2O5CFHlo10jSmJEDM6QpDsb
	3grxL3MyZ6jYv1jCU1rpSHBQq26/ZQ7DGB+ug7KOR95d/7AtI0x1/2Bi0y43r47pQklO3Kro7SIpb
	PKE05AZkmNElhyUlm+FwXFXH+hqB9djk9ONW+qumBbdqlIvslJCk2iT4igaic9TH2lAaamqffRDFc
	35+GcZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgGB-00000000jTW-0SPT;
	Thu, 14 Nov 2024 20:16:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgEo-00000000j9r-21TK;
	Thu, 14 Nov 2024 20:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E19AA41B27;
	Thu, 14 Nov 2024 20:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7857EC4CECD;
	Thu, 14 Nov 2024 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731615284;
	bh=vQfNlFJn5un5Q7X63S53AeFCdYUq2T/YlhPFk4SHDeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpwIZ3x65A2GjtdN4fI4XuWZ4VN9KgC/Po8vXkxyDnAGXTYA6DUgZLtJY5jXuE6Ll
	 4cAQD2IUaShtP18Bj/Z2/c861gmClb7vO4qZjKdrgxameRVWpqMjlrAf5dsNaJdOYM
	 hX5Y82gEP24LjZTxQe7EQ52vQi4JIDM2aQxvlXjQSBj5rmZRTp+32jmM9+4tdDTub5
	 xdh6NTmAeRZYFZfaeDeCc3Blzw0oTFiXTqEdDF9KjjUfT4pQq7ShQ0H6mya/Tqg0uP
	 kx+kNALxt0j0fr4WOvheVaAEGDg4Vxc5/n+8xJ1G8D0XUjNBOmSGnjqRVjnVmIl2Eq
	 OmPuUsW8FYHcg==
Date: Thu, 14 Nov 2024 20:14:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: reset: add bindings for A1 SoC audio
 reset controller
Message-ID: <20241114-latticed-freight-859a3d78d413@spud>
References: <20241112230056.1406222-1-jan.dakinevich@salutedevices.com>
 <20241112230056.1406222-2-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iRBwY+Ocuqf4OHYD"
Content-Disposition: inline
In-Reply-To: <20241112230056.1406222-2-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_121446_588338_C5C37D7D 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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


--iRBwY+Ocuqf4OHYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 02:00:55AM +0300, Jan Dakinevich wrote:
> This reset controller is part of audio clock controller and handled by
> auxiliary reset driver.

I appreciate this, saved me looking up why there was no compatible
added.

> Introduced defines supposed to be used together
> with upcoming device tree nodes for audio clock controller fo A1 SoC.
>=20
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iRBwY+Ocuqf4OHYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZaMAAKCRB4tDGHoIJi
0vR0AP9g44FK5dhvfvAcPhPRREYySybWuiZ3/AVaNTszx4fjgwD9Ft38CPHPa0Qt
TCoNfx7EwoObzzGKwSNH8WbQEaM33ws=
=Psao
-----END PGP SIGNATURE-----

--iRBwY+Ocuqf4OHYD--

