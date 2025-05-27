Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF1C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jaCKf8G7/Cms81FmV2FNVC2G7oAmz5iUiukT1H8mHc=; b=PW8RYKj5OWlMeh/JI/F9UqKaUY
	6k/szeoPKj2oRxf92ZAF9RvPC2HlhW+KSqZDqN9Q17d2whRCfoMu/sXA7icl1FPSPt+t4FnE3XyxI
	0wn7U1diKvt60A6y0/mD4viI59FaweOY7sDmP9Fudlvm81fuh5HgH6emiK0p4XKDxc0l7p4NHVVR6
	equNnWy1BEbFIPEXbreBl54WJfF5nT8nmFiTPRXA5jqUujF4oDdlJSqvOlgGqQWD6LZBp/yiBEZEp
	u+3S54qr7rDSHsbvh1SZXzje+Nvr+S3Dxo5jLpZaNbCTvFRCbf7z1AHkhn9VcXO4uWAjkLRAfDRsN
	Kx88h4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJw50-0000000B2RA-0Ceu;
	Tue, 27 May 2025 15:19:02 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvzO-0000000B1iK-1fXV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 15:13:15 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 17:13:06 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 27 May 2025 17:13:06 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>, "Pengutronix Kernel
 Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "Thomas
 Richard" <thomas.richard@bootlin.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Topic: [PATCH v2 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Index: AQHbztc04cnioEWzpkWd5kjCyMGVVLPl8CAAgACEVoA=
Date: Tue, 27 May 2025 15:13:06 +0000
Message-ID: <aDXWfe3I6Cun1PMI@w447anl.localdomain>
References: <20250527071552.1424997-1-john.ernberg@actia.se>
 <20250527071552.1424997-4-john.ernberg@actia.se>
 <15dcde73-3c0e-4cc9-934f-4dbabd92905e@kernel.org>
In-Reply-To: <15dcde73-3c0e-4cc9-934f-4dbabd92905e@kernel.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453607D60
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <6C17C786C22F954BBFA46345487E8483@actia.se>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_081314_435425_99C80358 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Krzysztof,

On Tue, May 27, 2025 at 09:19:22AM +0200, Krzysztof Kozlowski wrote:
> On 27/05/2025 09:16, John Ernberg wrote:
> >=20
> > diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml=
 b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> > index 75afa441e019..a3c938eb553e 100644
> > --- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> > @@ -48,6 +48,9 @@ properties:
> >                - fsl,imx6ul-caam
> >                - fsl,sec-v5.0
> >            - const: fsl,sec-v4.0
> > +      - items:
> > +          - const: fsl,imx8qm-caam
>=20
> That's part of previous enum, no?
>=20
> > +          - const: fsl,sec-v4.0
> >        - const: fsl,sec-v4.0
> > =20
> >    reg:
> > @@ -77,6 +80,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> > =20
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    fsl,sec-era:
> >      description: Defines the 'ERA' of the SEC device.
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -108,6 +114,9 @@ patternProperties:
> >            - items:
> >                - const: fsl,sec-v5.0-job-ring
> >                - const: fsl,sec-v4.0-job-ring
> > +          - items:
> > +              - const: fsl,imx8qm-job-ring
>=20
> Combine with previous entry into enum.
>=20

I think I managed to confuse myself around how compatible enums work first =
time around, thanks for prompting me to look again, I hopefully understand =
better now.

Will take care of this for V3.

Thanks! // John Ernberg=

