Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1FCC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS7MQ9GjgYYlC4ZQk9Q4bZOhvViKnvGdrp25MRR4MdQ=; b=uNOXUSu1saleYZObqhsZQtalIl
	IcDdCLJefcj5N0eWrb8v2F35J8yH8o7v1To8F5sgSRFIfSoNCU7NfsvoZIDS7dcmYtaIvMii5ceEP
	AjpMCIb6caE6A27lJ3B7Tz5oTxZME7RD2GcPQa8RGgNRGptiC/UFmlggjzQ8DP9QSisMSxAy0IsCB
	jKHcuBHtRRsSVQ+7BOWGLIFWurQRxMP9mIVfoVin1VrXBSmxUIVDnOF806rCwoNJV1Ij/s935rEE5
	iU/4PdTHx2LK+QZyxgsyM7DkzkMJzZntBQeKxcoEhQTjgRDXjSps9QOH+qDVWltFMgZeSUb4l274Q
	TIViAVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR2Z-00000000Pcr-2ePZ;
	Thu, 16 Jul 2026 18:42:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR2X-00000000PcR-1z5G;
	Thu, 16 Jul 2026 18:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dS7MQ9GjgYYlC4ZQk9Q4bZOhvViKnvGdrp25MRR4MdQ=; b=yW30b834kQXISkqSpGGts9DsCP
	sM6c+crhLEO5njaLdSNLyFD1PbydnQSCz7PQn4cf4yuS1LCg1zVDjosI5IZnI1ywsBZV03Gm4DrBk
	I/MwW6nqhNHN/BBE+8eA/75lqt1WGB6b2lRGObIRDWs43L4v/mSopocNX6kuMH+SPYScmiPp5UDg6
	DLs8mRx/QKJYKGjUzDcvXTqnZBAdFFIjrgdk0kG/DfeLLkmpe0wOTYCngBkhvktnm5xuEXknwUugm
	eAQp5kdswfFrzGA9oYmZFZfWBKAEWSUKgYjATbCKSPpdOWyGNy0E8D4/OBfOXPeF6hLhE9QHq7Q9p
	F7ytLbcA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add
 rockchip,efuse-write-enable property
Date: Thu, 16 Jul 2026 20:42:30 +0200
Message-ID: <1819181.QkHrqEjB74@phil>
In-Reply-To: <6gn64vxmeksjtrp7q7y5jwniszeqrmdurbp4l466tli63aixnz@i6nlxwdjhewh>
References: <20260715110107.409204-1-hrushirajg23@gmail.com> <2363663.KTMopqUuYO@diego>
 <6gn64vxmeksjtrp7q7y5jwniszeqrmdurbp4l466tli63aixnz@i6nlxwdjhewh>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114233_714049_40A64593 
X-CRM114-Status: GOOD (  31.84  )
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

Am Donnerstag, 16. Juli 2026, 11:43:03 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Hrushiraj Gandhi:
> On Wed, Jul 15, 2026 at 01:42:56PM +0200, Heiko St=C3=BCbner wrote:
> > Am Mittwoch, 15. Juli 2026, 13:01:06 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Hrushiraj Gandhi:
> > > Add an optional boolean property to explicitly opt in to write (OTP
> > > programming) support. eFuse bits are one-time-programmable and
> > > permanently set once written; write support must therefore not be
> > > enabled by default on arbitrary boards.
> > >=20
> > > Boards that intend to use software-initiated eFuse programming (e.g.
> > > factory key provisioning) must declare this property and must ensure
> > > the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
> > > is present and correctly sequenced during writes.
> > >=20
> > > Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> > > ---
> > >  .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++=
++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.y=
aml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > > index b80fd8d1ae5b..8a7195245c84 100644
> > > --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > > +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> > > @@ -46,6 +46,17 @@ properties:
> > >        this property is defined.
> > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > =20
> > > +  rockchip,efuse-write-enable:
> > > +    type: boolean
> > > +    description:
> > > +      Enable write (programming) support for this eFuse block. eFuse=
 bits
> > > +      are one-time-programmable; setting a bit is permanent and cann=
ot be
> > > +      undone. This property must only be set on boards where irrever=
sible
> > > +      OTP programming from software is an intended use case (e.g. fa=
ctory
> > > +      provisioning), and where the required VQPS programming voltage
> > > +      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
> > > +      correctly sequenced by the board's power design during writes.
> >=20
> > Devicetree is not a configuration space, and I think this really does c=
ount
> > as configuration - as the efuse will be writeable on every board.
> >=20
> > You mention the VQPS voltage. If I'm reading schematics and application
> > notes correctly, this is a separate input used solely for writing efuses
> > and _needs_ to be 0V (off?) during reads.
> >=20
> > You mention "needs to be present and correctly sequenced", who is suppo=
sed
> > to turn on/off that regulator?
> >=20
> > So you very likely need to define that regulator and can even use its
> > absence as an indicator to disable writes.
> >=20
> >=20
> > Heiko
> >=20
> >=20
> You're right, the boolean property was the wrong approach - agreed
> that it's policy, not hardware description. I'll drop it.
>=20
> I was planning to model VQPS as a proper optional supply in the
> binding:
>=20
>   vqps-supply:
>     description:
>       Supply for the eFuse programming voltage (VQPS), required only
>       on boards where software-initiated OTP programming is intended.
>       Per RK3399 TRM section 21.6.1, table 21-3, VQPS must be 0V
>       during reads and 1.8V~1.98V during A_PGM mode writes. If this
>       supply is absent, the driver leaves the nvmem device read-only.

I don't think the description _in_ the binding needs to be this verbose.

  vqps-supply:
    description:
       Supply for the eFuse programming voltage (VQPS)
=2E...

The text you have above, would be great for the commit message of the
dt-binding patch.


> and in the driver, gate reg_write on whether
> devm_regulator_get_optional() actually finds it:
>=20
>   efuse->vqps =3D devm_regulator_get_optional(dev, "vqps");
>   if (!IS_ERR(efuse->vqps))
>       econfig.reg_write =3D soc_data->reg_write;

Or alternatively just error out _inside_ the reg_write callback.
But not having a hard preference. I guess nvmem-maintainer will
tell their preference, once that change appears :-) .


> The driver would own sequencing entirely inside
> rockchip_rk3399_efuse_write(): regulator_enable() immediately before
> the A_PGM STROBE loop, regulator_disable() right after - mirroring
> how efuse->clk is already handled around the same window. reg_read
> never touches the regulator, so VQPS stays at 0V for the entire read
> path.

Sounds reasonable


Heiko



