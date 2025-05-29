Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F63AC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFpGMzk7nosSSNYRKgGkOuDoyLB5ZOi8e3efeVjaynY=; b=3o3Q6c0zAMNQJj3hYppO7IGYBf
	/zintkQyDL/2j6eX6kBnNYKYUqg+OHm//zvQCRknFAmCWHGsxphWt5+vS+8ckO9ygcTHm9fKXUMCk
	wuJvjqoy48WdfTSG4rc1u0hPHaUA76jYOocU1XpLwA2H5VOziJkN20D45omTSbpxNP2SNFCUWpjuA
	Q7mcTHQ8al0zgocOR8DE8hTIoiOsm3MQzF0B+6C+86jCMk/BOIuepMnap8MpP2aaflHjwOFvCJZJl
	yM6Uq4EuVKrHjR5D1W+QwZoUq3zQYQEUHqV7jO7gdoPX5FV5HtIOYJ0rgI/r97+8LbYI2ZZZ2oYbA
	0Q89xA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZoj-0000000FRQq-33WK;
	Thu, 29 May 2025 09:44:53 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZhW-0000000FQQt-1Brh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:37:28 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 May
 2025 11:37:17 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Thu, 29 May 2025 11:37:17 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Rob Herring <robh@kernel.org>
CC: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	"Frank Li" <Frank.li@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, Thomas Richard
	<thomas.richard@bootlin.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Topic: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Index: AQHbz97TDhLekXOKbkmerT2PfEO8vrPodECAgADE/QA=
Date: Thu, 29 May 2025 09:37:17 +0000
Message-ID: <aDgqyF7773LJjjJO@w447anl.localdomain>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
 <20250528144259.2603914-4-john.ernberg@actia.se>
 <20250528215209.GA862463-robh@kernel.org>
In-Reply-To: <20250528215209.GA862463-robh@kernel.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453637562
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <11D1FBF7FEE64642BE637CBA54B3C320@actia.se>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_023726_323171_DD82905A 
X-CRM114-Status: GOOD (  20.62  )
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

Hi Rob,

On Wed, May 28, 2025 at 04:52:09PM -0500, Rob Herring wrote:
> On Wed, May 28, 2025 at 02:43:07PM +0000, John Ernberg wrote:
> > NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> > resource management.
> >=20
> > Allow specifying them for such SoCs.
> >=20
> > Signed-off-by: John Ernberg <john.ernberg@actia.se>
> >=20
> > ---
> >=20
> > v3:
> >  - Fix warnings discovered by Rob Herring's bot
> >  - Declare the compatibles correctly (Krzysztof Kozlowski)
> >=20
> > v2:
> >  - Adjust commit message (Frank Li)
> >  - Only allow power-domains when compatible with imx8qm (Frank Li)
> > ---
> >  .../bindings/crypto/fsl,sec-v4.0.yaml         | 45 ++++++++++++++++++-
> >  1 file changed, 44 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml=
 b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> > index 75afa441e019..a4ada0e2d97c 100644
> > --- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
> > @@ -46,6 +46,7 @@ properties:
> >        - items:
> >            - enum:
> >                - fsl,imx6ul-caam
> > +              - fsl,imx8qm-caam
> >                - fsl,sec-v5.0
> >            - const: fsl,sec-v4.0
> >        - const: fsl,sec-v4.0
> > @@ -77,6 +78,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> > =20
> > +  power-domains:
> > +    maxItems: 1
> > +
> >    fsl,sec-era:
> >      description: Defines the 'ERA' of the SEC device.
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -106,7 +110,9 @@ patternProperties:
> >                - const: fsl,sec-v5.0-job-ring
> >                - const: fsl,sec-v4.0-job-ring
> >            - items:
> > -              - const: fsl,sec-v5.0-job-ring
> > +              - enum:
> > +                - fsl,imx8qm-job-ring
> > +                - fsl,sec-v5.0-job-ring
> >                - const: fsl,sec-v4.0-job-ring
> >            - const: fsl,sec-v4.0-job-ring
> > =20
> > @@ -116,6 +122,9 @@ patternProperties:
> >        interrupts:
> >          maxItems: 1
> > =20
> > +      power-domains:
> > +        maxItems: 1
> > +
> >        fsl,liodn:
> >          description:
> >            Specifies the LIODN to be used in conjunction with the ppid-=
to-liodn
> > @@ -212,6 +221,40 @@ required:
> >    - reg
> >    - ranges
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qm-caam
> > +    then:
> > +      required:
> > +        - power-domains
> > +    else:
> > +      properties:
> > +        power-domains: false
> > +
> > +  - if:
>=20
> This 'if' belongs under the '^jr@[0-9a-f]+$' subschema which will then=20
> remote a level here.
>=20

This is what I had in v2 [1], which your bot pointed out is an unexpected
if-statement [2]. Or should I have wrapped it in an allOf: even though it
was a single if:?

    jernberg % pip install --upgrade dtschema
    Requirement already satisfied: dtschema in ./.venv/lib/python3.13/site-=
packages (2025.2)

[1]: https://lore.kernel.org/linux-crypto/20250527071552.1424997-4-john.ern=
berg@actia.se/
[2]: https://lore.kernel.org/linux-crypto/174833819381.3537254.550804710081=
7417003.robh@kernel.org/

Would you mind also letting me know the command line you run validation
with in the CI? I didn't see the v2 (at first, needed W=3D1 for that) nor
the v3 complaint in my runs before sending.

Thanks! // John Ernberg

> > +      patternProperties:
> > +        '^jr@[0-9a-f]+$':
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              contains:
> > +                const: fsl,imx8qm-job-ring
> > +    then:
> > +      patternProperties:
> > +        '^jr@[0-9a-f]+$':
> > +          type: object
> > +          required:
> > +            - power-domains
> > +    else:
> > +      patternProperties:
> > +        '^jr@[0-9a-f]+$':
> > +          type: object
> > +          properties:
> > +            power-domains: false
> > +
> >  additionalProperties: false
> > =20
> >  examples:
> > --=20
> > 2.49.0=

