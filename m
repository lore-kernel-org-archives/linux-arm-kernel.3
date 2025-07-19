Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7281C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 11:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=outeUP69u0Xntt9zn9rOJgD7Ve3nkruqdrqfEyItxF0=; b=EroYN4WJ2w0retaYZwZrr04JP3
	sFcRQTpBPIbCSD2loG+oGWbCIJiarE3Qnu3mR2nVyxMnsYEnxf6mC5zTK0V224DZlYdzfxIIWq+xI
	kU9QPYRhRAhYsQch5SXeauLsPfNid8TNT/SwA5nBAPunTp1exHnF+EpYLcnG+bFz9XY4cYPUXrDjh
	Ou6JdMZ3DjS70qC6+Sif6lQkeQIyVKFGkFUvBJmzezpItray0C2L7ID8xe/pOPqSktCvmRdLW+idl
	mlU6Qh+RjKo76ZFxRg6TdQW5Q/LxT3WjXWcjZtRv062bq7yAUeOeVp93fjZShLEim0uVEhAdueGj1
	p8eFYVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud66h-0000000ECwV-2ZUx;
	Sat, 19 Jul 2025 11:51:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud64D-0000000ECq2-0kUx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 11:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DA045C53D8;
	Sat, 19 Jul 2025 11:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074C5C4CEE3;
	Sat, 19 Jul 2025 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752925763;
	bh=ji5NuuZw96p1y7UG1zaDiHhl0TkRDc1FoWgIsQTk1B4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uxYyLBtz+MpnD29HvpPg8MORaiwSeEuBRF0TRLpOii8eU5KEfmlKIQyS012jd0WF5
	 Qhm5cO8XqAM86JdgyxcozM02GomXmfHgFbPIhpE8jYWwKT/A1q2ViHzDVUU57dSZ4Q
	 Rnj1NBinK0maC3cjM5AeAojpm9MpoxgtMJCzsWjYAHf9jHrSDJep8iyjL+WvNJZ6w9
	 jsvw93ncEcnWqYPtQs/vSF3Rtffo2LWaa+em/P8U9vgJD1ls8IHMyH5usPlHNm5GXR
	 rxF81Nav8TVf5GSc48nOar2S5jOl/Mzd3V7CLktRMiTZabw1XW3/k2GhpZaCMnpAr5
	 HLIO9mqHXMNhg==
Date: Sat, 19 Jul 2025 12:49:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: David Lechner <dlechner@baylibre.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-iio@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: imx93: Add calibration
 properties
Message-ID: <20250719124914.27536d4a@jic23-huawei>
In-Reply-To: <c9d17343-e4a5-49ab-9a3e-b6da9d591195@norik.com>
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
	<20250710073905.1105417-2-primoz.fiser@norik.com>
	<2bcd758b-c2d0-488a-8ead-ec7fb39f93e2@baylibre.com>
	<20250713160247.0f22bbfe@jic23-huawei>
	<de2c8e15-14e9-4c61-9a13-97ef1ec567a4@norik.com>
	<6b32118a13e9e28b7cf12152af33642c76367c34.camel@gmail.com>
	<c9d17343-e4a5-49ab-9a3e-b6da9d591195@norik.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_044925_299174_875B6289 
X-CRM114-Status: GOOD (  38.12  )
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

On Tue, 15 Jul 2025 07:46:44 +0200
Primoz Fiser <primoz.fiser@norik.com> wrote:

> Hi Nuno,
>=20
> On 14. 07. 25 18:11, Nuno S=C3=A1 wrote:
> > On Mon, 2025-07-14 at 07:56 +0200, Primoz Fiser wrote: =20
> >> Hi all,
> >>
> >> On 13. 07. 25 17:02, Jonathan Cameron wrote: =20
> >>> On Thu, 10 Jul 2025 10:46:44 -0500
> >>> David Lechner <dlechner@baylibre.com> wrote:
> >>> =20
> >>>> On 7/10/25 2:39 AM, Primoz Fiser wrote: =20
> >>>>> From: Andrej Picej <andrej.picej@norik.com>
> >>>>>
> >>>>> Document i.MX93 ADC calibration properties and how to set them.
> >>>>>
> >>>>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> >>>>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> >>>>> ---
> >>>>> =C2=A0.../bindings/iio/adc/nxp,imx93-adc.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
> >>>>> =C2=A01 file changed, 21 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-
> >>>>> adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.=
yaml
> >>>>> index c2e5ff418920..d1c04cf85fe6 100644
> >>>>> --- a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> >>>>> @@ -52,6 +52,27 @@ properties:
> >>>>> =C2=A0=C2=A0 "#io-channel-cells":
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0 const: 1
> >>>>> =C2=A0
> >>>>> +=C2=A0 nxp,calib-avg-en:
> >>>>> +=C2=A0=C2=A0=C2=A0 default: 1
> >>>>> +=C2=A0=C2=A0=C2=A0 description:
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable or disable calibration avera=
ging function (AVGEN).
> >>>>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +=C2=A0=C2=A0=C2=A0 enum: [ 0, 1 ]
> >>>>> +
> >>>>> +=C2=A0 nxp,calib-nr-samples:
> >>>>> +=C2=A0=C2=A0=C2=A0 default: 512
> >>>>> +=C2=A0=C2=A0=C2=A0 description:
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Selects number of samples (NRSMPL) =
to be used during calibration.
> >>>>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +=C2=A0=C2=A0=C2=A0 enum: [ 16, 32, 128, 512 ] =20
> >>>
> >>> Allow 1 as a value and drop the enabled above.=C2=A0=C2=A0 Averaging =
over 1 sample
> >>> is same as no averaging and gives simpler binding.
> >>> =20
> >>>>> +
> >>>>> +=C2=A0 nxp,calib-t-sample:
> >>>>> +=C2=A0=C2=A0=C2=A0 default: 22
> >>>>> +=C2=A0=C2=A0=C2=A0 description:
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Selects sample time (TSAMP) of cali=
bration conversions in ADC
> >>>>> clock cycles
> >>>>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> >>>>> +=C2=A0=C2=A0=C2=A0 enum: [ 8, 16, 22, 32 ]
> >>>>> +
> >>>>> =C2=A0required:
> >>>>> =C2=A0=C2=A0 - compatible
> >>>>> =C2=A0=C2=A0 - reg=C2=A0  =20
> >>>>
> >>>> This seem like things that should be set at runtime rather than
> >>>> in the devicetree. Unless there is some justification on why
> >>>> these values depend on how the chip is wired up? =20
> >>
> >> It depends how ADC 1.8V Vref is wired up, especially how noisy it is.
> >> =20
> >>>
> >>> Further to that, I'd like to see some explanation of why we care
> >>> to change it at all. Is it ever a bad idea to enable averaging and
> >>> pick a large number of samples for calibration? =20
> >>
> >> This is a snippet from the i.MX93 TRM, chapter Analog-to-Digital
> >> Converter (SAR_ADC) describing calibration steps:
> >>
> >> 1. Wait for deassertion of functional reset.
> >> 2. Configure SAR controller operating clock (MCR[ADCLKSE] =3D 0).
> >> 3. Bring ADC out of Power-down state (MCR[PWDN] =3D 0).
> >> 4. Configure desired calibration settings (default values kept for
> >> highest accuracy maximum time).
> >> =E2=80=A2 MCR[TSAMP]: Sample time for calibration conversion
> >> =E2=80=A2 MCR[NRSMPL]: Number of samples in averaging
> >> =E2=80=A2 MCR[AVGEN]: Averaging function enable in calibration
> >> 5. Run calibration by writing a one to MCR[CALSTART].
> >> 6. Check calibration run status in MSR[CALBUSY]=E2=80=94wait until MSR=
[CALBUSY]
> >> =3D 0; alternatively, MSR[ADCSTAT] can be
> >> used to check status.
> >> 7. Check calibration pass/fail status in MSR[CALFAIL] field. If
> >> MSR[CALFAIL] =3D 1 then calibration failed. Detailed status
> >> can be checked in CALSTAT.
> >>
> >>
> >> See point 4).
> >>
> >> Not sure why would there be an option to configure i.MX93 ADC
> >> calibration parameters if one use-case (max accuracy max time) to rule
> >> them all?
> >> =20
> >=20
> > Sometimes HW guys just want to give you some options. Does not mean we =
have to
> > use them all :).
> >=20
> > I guess what Jonathan is interested in, is to understand in what condit=
ions the
> > defaults are no good for the calibration? If we can have a set of value=
s that
> > should pretty much always work, no need to further complicate the bindi=
ngs or
> > the driver. =20
>=20
> In case you have a noisy Vref you can adjust the parameters to pass the
> calibration and have a working ADC.

That's a fairly odd sounding situation.  Is this a case of it will always
pass because there is some drift going on or something low frequency like t=
hat?

Or is it a case of retry until it passes?

Jonathan


>=20
> The trade-off is a less precise ADC but at least a working one.
>=20
> In ideal case you would have Vref supplied by the dedicated LDO and tons
> of decoupling caps, but in real-world you have it connected to a noisy
> SMPS and you need to adjust the parameters accordingly.
>=20
> That's it :)
>=20
> BR,
> Primoz
>=20


