Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7142CD65C64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1D4LuRASNjtYcqBlr4oM8lVBwtYsZ6fne/tZREyW5xE=; b=ufwlkVw7/W1JnLVmR+kjYRzgYD
	a5YDEc/DI9k/ZCB1YnhcKRgh2lUgTsf9cI6Zt2w+KH1zBidISUiLyI7SxamH00mSkTPQQyKwAvJZX
	u8nCl0AobjrvoHGFZ2TbCiDbRT3fm62z8KViYB50g77DjDLYqBYzhvXR6LmtfsVkjqXYzTQprPOSj
	1YNwUb3BJYgXISYjkRIpLRGkirOY6zIG7wIDNQLgtff7qaLBivAcAXbZ8KEEE0ZtreS85kcwwxWep
	JCfqnrleuMyqR/7OtvpE6KgWYk/YIL1L3MESaH2CJzLIn8SLH/a+CUXrsXESjU/JE2x8JuXnLjcVs
	nR3SsOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWD3-00000009NAw-2mRN;
	Thu, 14 Nov 2024 09:32:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWAH-00000009Mho-3aZL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:29:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tBWA6-0001EK-Eg; Thu, 14 Nov 2024 10:29:14 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tBWA6-000icz-02;
	Thu, 14 Nov 2024 10:29:14 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 98E12372F4A;
	Thu, 14 Nov 2024 09:29:13 +0000 (UTC)
Date: Thu, 14 Nov 2024 10:29:13 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Charan.Pedumuru@microchip.com
Subject: Re: [PATCH v2] dt-bindings: net: can: atmel: Convert to json schema
Message-ID: <20241114-magnetic-eggplant-elephant-14e724-mkl@pengutronix.de>
References: <20241003-can-v2-1-85701d3296dd@microchip.com>
 <xykmnsibdts7u73yu7b2vn3w55wx7puqo2nwhsji57th7lemym@f4l3ccxpevo4>
 <cd3a9342-3863-4a81-9b09-db7b8da1d561@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ia4wiuv7bjc5o7j2"
Content-Disposition: inline
In-Reply-To: <cd3a9342-3863-4a81-9b09-db7b8da1d561@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_012925_927510_897518C6 
X-CRM114-Status: GOOD (  23.90  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, krzk@kernel.org, claudiu.beznea@tuxon.dev, edumazet@google.com, linux-arm-kernel@lists.infradead.org, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, mailhol.vincent@wanadoo.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--ia4wiuv7bjc5o7j2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: net: can: atmel: Convert to json schema
MIME-Version: 1.0

On 13.11.2024 05:30:53, Charan.Pedumuru@microchip.com wrote:
> On 03/10/24 14:04, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >
> > On Thu, Oct 03, 2024 at 10:37:03AM +0530, Charan Pedumuru wrote:
> >> Convert atmel-can documentation to yaml format
> >>
> >> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
> >> ---
> >> Changes in v2:
> >> - Renamed the title to "Microchip AT91 CAN controller"
> >> - Removed the unnecessary labels and add clock properties to examples
> >> - Removed if condition statements and made clock properties as default=
 required properties
> >> - Link to v1: https://lore.kernel.org/r/20240912-can-v1-1-c5651b1809bb=
@microchip.com
> >> ---
> >>   .../bindings/net/can/atmel,at91sam9263-can.yaml    | 58 ++++++++++++=
++++++++++
> >>   .../devicetree/bindings/net/can/atmel-can.txt      | 15 ------
> >>   2 files changed, 58 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/can/atmel,at91sam92=
63-can.yaml b/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-c=
an.yaml
> >> new file mode 100644
> >> index 000000000000..c818c01a718b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/net/can/atmel,at91sam9263-can.=
yaml
> >> @@ -0,0 +1,58 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/net/can/atmel,at91sam9263-can.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Microchip AT91 CAN Controller
> >> +
> >> +maintainers:
> >> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> >> +
> >> +allOf:
> >> +  - $ref: can-controller.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - enum:
> >> +          - atmel,at91sam9263-can
> >> +          - atmel,at91sam9x5-can
> >> +      - items:
> >> +          - enum:
> >> +              - microchip,sam9x60-can
> >> +          - const: atmel,at91sam9x5-can
> > That is not what old binding said.
>=20
> Apologies for the late reply, the driver doesn't have compatible with=20
> "microchip,sam9x60-can",
> so I made "atmel,at91sam9x5-can" as fallback driver

I think a better answer is:

The CAN IP core on the microchip,sam9x60-can is compatible with the IP
core on the "atmel,at91sam9x5-can".

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ia4wiuv7bjc5o7j2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmc1wuYACgkQKDiiPnot
vG9Sqgf9G/Fg9mjf2UZVGGZWrYCj65mGdUNZgeVJfWBMxLzfrrBzSbDoC7BHvtk8
kTCC4Q9xW18ne3S9xbZBACX/9j3Sn9+r5DPQDo2Nd04p6w1qAzkgdoMsgZw9M8CU
uPbHPsWCqpG6ZyJnDWYYnRcI0DLozdRYeNH+3IJN0FIV9PQUXth6n51mak0eCgei
xCtAqR+8ggUrebUlyuw6MddiZFStgeCFGmqnoxKk3TAz7OdwnPlb+mUDux+1Grpo
GZEM6MMr4bqEtGjXxjXb72nmvcL3LpyE6NVDjvtKILQX03nARds7ZGuSXshaDj84
aN65bsQb3LbFLmqNiBOcJPb1OGHRRg==
=bN37
-----END PGP SIGNATURE-----

--ia4wiuv7bjc5o7j2--

