Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F44AD6EC05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8uYRgewgmY2CCZ2ZgZNqrndEt/oJcvikZSaglGja44=; b=tn2d6wsVmE/0lc6FQjH3zYkhTK
	HfMSL2n4dQXPxss1F43EJbPIwtfybEhKoouMCpej5q+AsK30kbuR6I0VyBN5k3L2SbrOrdQEGzewq
	DZjWDdRm4F/jODfGl6gdi1Tn+RQN24ZKy0MBbXON8bRpF1qZqEpxYzXIK+hLhg6wdEjRKKLjvHJ1r
	AIzG38s0MDnZ7mf25MBkRODYe0MDuGc6qvZ3IBjo3kfRIgDOw1uANSZ5qoEmt2jKS9m70ZmgOlTqP
	z7qvD2EnuyezB9m/u2OZrg3evK/kZtPxYbE23it6nBMOPlPIgEPa20eIN8pmpb8rFdcWLvekA+VMy
	DZqqmvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0Mb-000000006KW-1Wwc;
	Fri, 29 Nov 2024 12:44:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0Lc-000000006BT-1IHq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 12:43:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tH0LT-00045D-0h; Fri, 29 Nov 2024 13:43:39 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tH0LR-000n1t-0v;
	Fri, 29 Nov 2024 13:43:38 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B67CF381226;
	Fri, 29 Nov 2024 12:43:37 +0000 (UTC)
Date: Fri, 29 Nov 2024 13:43:37 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: net: can: atmel: Convert to json schema
Message-ID: <20241129-excellent-optimal-rattlesnake-b352fa-mkl@pengutronix.de>
References: <20241120-can-v3-1-da5bb4f6128d@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dfxtl2sovlzdezlx"
Content-Disposition: inline
In-Reply-To: <20241120-can-v3-1-da5bb4f6128d@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_044348_344870_77119BD1 
X-CRM114-Status: GOOD (  18.11  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--dfxtl2sovlzdezlx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] dt-bindings: net: can: atmel: Convert to json schema
MIME-Version: 1.0

On 20.11.2024 13:58:08, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> - Add a fallback for `microchip,sam9x60-can` as it is compatible with the
>   CAN IP core on `atmel,at91sam9x5-can`.
> - Add the required properties `clock` and `clock-names`, which were
>   missing in the original binding.
> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.
>=20
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
> ---
> Changes in v3:
> - Modified the commit message with reasons for each change
> - Link to v2: https://lore.kernel.org/r/20241003-can-v2-1-85701d3296dd@mi=
crochip.com
>=20
> Changes in v2:
> - Renamed the title to "Microchip AT91 CAN controller"
> - Removed the unnecessary labels and add clock properties to examples
> - Removed if condition statements and made clock properties as default re=
quired properties
> - Link to v1: https://lore.kernel.org/r/20240912-can-v1-1-c5651b1809bb@mi=
crochip.com

Applied with fixing indention in example.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--dfxtl2sovlzdezlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdJtvYACgkQKDiiPnot
vG8hDAf/RR6qkSZh/4/lRzmSO1k04OMiEoWCXmhlM3ceBWDO7RKSUFaV5SO+bJ28
oFpMj2ly5MimZpjnm8oaeFGPCBl5l4dY0YJn/Ghw7wZeS/Kvsg1MLQmaZ6GeP0EX
6YizPxq9+0ZqAO4YwA2RZtA4CxLdB28XWDj9pIuFTxrSaWq1s9LZ1rcYHXX7tZry
TM6ZxAKA5IcWrMLS3/uN/unIPAOID7av9vTyM98YeGe1kgQ7KSOZJ7m7oraOPnvr
/+ZrGQveyEHDwNfbKQ9o4khWkp77w+pVttx86+SZtxMBgFeqcIQpGHc8qZo9Szik
jBXrO5qN25gTCXiz2LUXeW2MNtjNnA==
=Yz1e
-----END PGP SIGNATURE-----

--dfxtl2sovlzdezlx--

