Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEE9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4QsNcOQhnUQw6VKEs7EI/wgC6PCFii9ExA5HZIUu54=; b=zaWx0feUD7YW1iOEobasxe9yuW
	Je/Ek0aQZiPBWtHJ3fYRcaySpbkb969ug6SLJTtKGfD1h7kik/wGxB5Z+4KnPJoM39Gyu/729A0zZ
	qB1wYceCnRY66h5rabj+em1D+AIvPPgzlrtP+hoIs0c/y5mNSJoZKprTAeMwVdYmNpnv4X75bt5ZI
	X0EzwvriSMYmCYNv1/fgEJLS4uEzaVBOlbChK4aQIQpM2MhV7aqyol58mc7vj743Vs7537/rwTfem
	Zqxfgsp9+Vum6DkZoDKi8X+0z/kSIh2uDDur6aQKVtwn3ICy77w9N+B9cd6YUaamuKRuEU7IOvZI2
	KSHHIA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Lc-000000001Sr-3YnS;
	Wed, 29 Oct 2025 07:11:56 +0000
Received: from dd54918.kasserver.com ([85.13.167.58])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0LZ-000000001R8-1FcB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 07:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202509031142; t=1761721899;
	bh=p4QsNcOQhnUQw6VKEs7EI/wgC6PCFii9ExA5HZIUu54=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bznq++z1b8rF88YPcJ6xYK7ARpc5BTe4nHGirZoOAmRxuOpP6qsWpbhDl+YJIo4Sa
	 1xp7tRIrE6inZOQEh7tLtORenFq22DazEDbm72wtHcPpMHPdGOW0RR2As/KtzRm6hm
	 h+ggStXDiMT8tKoPcI+oWGccGbYV8+Kd4sX6W98RnzhBdJk07WsloMsyICnrKkcmMi
	 EvlCHhmUsG9z1w9HNONCrZ2sOgjqR8SEyv4PQCn9bxIGKZcGgNH4cnOgTPi3ntgGil
	 SNXjBfuIY1n+xEoCYcstKwVb4ZhjLy9ZQZUnzWrMnYAkzTPejA2GAuwMacrThsSEL7
	 XVV8ou4/lOLgQ==
Received: from karo-electronics.de (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id 4A289772C311;
	Wed, 29 Oct 2025 08:11:39 +0100 (CET)
Date: Wed, 29 Oct 2025 08:11:38 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
Message-ID: <20251029081138.2161a92a@karo-electronics.de>
In-Reply-To: <938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
	<20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
	<a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
	<65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
	<938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_001153_781016_3AE2A7C9 
X-CRM114-Status: GOOD (  30.45  )
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

Hi,

On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
> On 10/28/25 13:42, Maud Spierings wrote:
> > On 10/28/25 13:15, Matti Vaittinen wrote: =20
[...]
> >> Could/Should this be described using the:
> >> 'rohm,feedback-pull-up-r1-ohms' and
> >> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment=20
> >> correctly, that might allow the driver to be able to use correctly=20
> >> scaled voltages.
> >>
> >> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/=20
> >> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
> >> =20
> >=20
> > Ah I didn't know those existed, should've checked the bindings in more=
=20
> > detail, thanks for the hint!
> >=20
> > I will have to investigate this carefully, since I don't have access to=
=20
> > the actual design of the COM, so I don't know exactly what is there.
> >  =20
>=20
> So I am not yet entirely sure if this works out, I used the calculation=20
> in the driver:
>=20
> /*
>   * Setups where regulator (especially the buck8) output voltage is scaled
>   * by adding external connection where some other regulator output is=20
> connected
>   * to feedback-pin (over suitable resistors) is getting popular amongst=
=20
> users
>   * of BD71837. (This allows for example scaling down the buck8 voltages=
=20
> to suit
>   * lover GPU voltages for projects where buck8 is (ab)used to supply pow=
er
>   * for GPU. Additionally some setups do allow DVS for buck8 but as this =
do
>   * produce voltage spikes the HW must be evaluated to be able to=20
> survive this
>   * - hence I keep the DVS disabled for non DVS bucks by default. I=20
> don't want
>   * to help you burn your proto board)
>   *
>   * So we allow describing this external connection from DT and scale the
>   * voltages accordingly. This is what the connection should look like:
>   *
>   * |------------|
>   * |	buck 8  |-------+----->Vout
>   * |		|	|
>   * |------------|	|
>   *	| FB pin	|
>   *	|		|
>   *	+-------+--R2---+
>   *		|
>   *		R1
>   *		|
>   *	V FB-pull-up
>   *
>   *	Here the buck output is sifted according to formula:
>   *
>   * Vout_o =3D Vo - (Vpu - Vo)*R2/R1
>   * Linear_step =3D step_orig*(R1+R2)/R1
>   *
>   * where:
>   * Vout_o is adjusted voltage output at vsel reg value 0
>   * Vo is original voltage output at vsel reg value 0
>   * Vpu is the pull-up voltage V FB-pull-up in the picture
>   * R1 and R2 are resistor values.
>   *
>   * As a real world example for buck8 and a specific GPU:
>   * VLDO =3D 1.6V (used as FB-pull-up)
>   * R1 =3D 1000ohms
>   * R2 =3D 150ohms
>   * VSEL 0x0 =3D> 0.8V =E2=80=93 (VLDO =E2=80=93 0.8) * R2 / R1 =3D 0.68V
>   * Linear Step =3D 10mV * (R1 + R2) / R1 =3D 11.5mV
>   */
>=20
> Because I do not know the pull up voltage, and I am not sure if it is a=20
> pull up.
>=20
> So:
> Vout_o =3D 1.35V
> Vo =3D 1.1V
> Vpu =3D unknown
> R2 =3D 499 Ohm
> R1 =3D 2200 Ohm
> Gives:
> Vpu =3D ~0V
>=20
> And:
> Vout_o =3D 1.35V
> Vo =3D 1.1V
> Vpu =3D unknown
> R2 =3D 2200 Ohm
> R1 =3D 499 Ohm
> Gives:
> Vpu =3D ~1.04V
>=20
> I am not quite sure which resistor is R1 and which is R2 but having=20
> there be a pull down to 0V seems the most logical answer?
>=20
> I am adding Lothar from Ka-Ro to the CC maybe he can shed some light on=20
> this setup.
>
R2 is connected to GND, so Vpu =3D 0.
With:
	regulator-min-microvolt =3D <1350000>;
	regulator-max-microvolt =3D <1350000>;
	rohm,fb-pull-up-microvolt =3D <0>;
	rohm,feedback-pull-up-r1-ohms =3D <2200>;
	rohm,feedback-pull-up-r2-ohms =3D <499>;
the correct voltage should be produced on the BUCK8 output, but a quick
test with these parameters led to:
|failed to get the current voltage: -EINVAL
|bd718xx-pmic bd71847-pmic.3.auto: error -EINVAL: failed to register buck6 =
regulator
|bd718xx-pmic: probe of bd71847-pmic.3.auto failed with error -22

Apparently noone has ever tested this feature in real life.


Lothar Wa=C3=9Fmann

