Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9EDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/kgSeZLXjRyHUDcJXPtvV+beH0TRcjHCUn8WUFoQSs=; b=M1hVnq/pCaFtSnbsT13hHDXmvT
	+XeDbJkXKxeYSpuO7ZBJklIdrM2r/WYsWfWCMo8QXo2+VDVIDtWyT5m6ngnTK1ZPQis/6IRk09BNI
	ZJhubDbphB3yd8Bwt0Ct1hyimpsBszNekM4n9gH0Qj+bfjI8Bq/NERi7YtyDqlWcM1U6ujvIgZbr/
	ODLwcplKRJKTQHr8XWtYXb2g2IJuVGDh9KrF56F3PSyIy54akuB6Gyii4wdTCObHnINgRHRRJQuCi
	ChtMu4MFCW1wkphrdhd0UBjUjLKaSppwVSt3m/DycvQAkckzQyVvup1LiTBpVj5Rln3t/eMbFyWIb
	evhGVfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZsw-0000000FS99-0apT;
	Thu, 29 May 2025 09:49:14 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZm0-0000000FR6v-0nxw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:42:05 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 May
 2025 11:42:02 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Thu, 29 May 2025 11:42:02 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Frank Li <Frank.li@nxp.com>
CC: =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Thomas Richard
	<thomas.richard@bootlin.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Topic: [PATCH v3 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Thread-Index: AQHbz97TDhLekXOKbkmerT2PfEO8vrPoAHkAgAE6HYA=
Date: Thu, 29 May 2025 09:42:02 +0000
Message-ID: <aDgr6Sc-7CafIr_i@w447anl.localdomain>
References: <20250528144259.2603914-1-john.ernberg@actia.se>
 <20250528144259.2603914-4-john.ernberg@actia.se>
 <aDckaszTLMcUdIiY@lizhi-Precision-Tower-5810>
In-Reply-To: <aDckaszTLMcUdIiY@lizhi-Precision-Tower-5810>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B14453637562
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <A07E64761B5D8A4895653371B0A38C92@actia.se>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_024204_232831_20937960 
X-CRM114-Status: GOOD (  19.94  )
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

Hi Frank,

On Wed, May 28, 2025 at 10:57:46AM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 02:43:07PM +0000, John Ernberg wrote:
> > NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> > resource management.
> >
> > Allow specifying them for such SoCs.
>=20
> suggest comment:
>=20
> Add compatible string fsl,imx8qm-caam, and allow power-domains for it. Ke=
ep
> the same restriction for others.

Ack.

>=20
> >
> > Signed-off-by: John Ernberg <john.ernberg@actia.se>
> >
> > ---
> >
> > v3:
> >  - Fix warnings discovered by Rob Herring's bot
> >  - Declare the compatibles correctly (Krzysztof Kozlowski)
> >
> > v2:
> >  - Adjust commit message (Frank Li)
> >  - Only allow power-domains when compatible with imx8qm (Frank Li)
> > ---
> >  .../bindings/crypto/fsl,sec-v4.0.yaml         | 45 ++++++++++++++++++-
> >  1 file changed, 44 insertions(+), 1 deletion(-)
> >
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
>=20
> suggest add fsl,imx8qxp-caam, fsl,imx8dxl-caam also

While I know the DXL comes with the CAAM, I don't have access to any boards
with a DXL on it nor the DXL security manual. So I cannot validate any
changes I would make for the DXL variant.

I propose to keep the DXL out of this patch set, is that ok for you?

I'll add a compat for the QXP in V4.

Thanks! // John Ernberg

>=20
> Frank=

