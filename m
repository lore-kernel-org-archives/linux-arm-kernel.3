Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D76606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tbGAKV2J;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=BEt9j0U6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtJbWi9XblqGf/oBFuSjQ+CThYnu2eCXkRHoK4PJRfI=; b=tbGAKV2JOvCna9VXGCjIYC1iMd
	SSCY3mf5UcjjrWaKs3EXzmHV+OGszcREM3SKJSTPSGGrWJR504nAAwDDU7u+A1YA/H/S8xDuUaaGs
	sLDPXsoXEoIwRNrwGibP14HB8dFjOYYtgCVBdMMfHPmAI5srBqgbL/DApe5fT5Ud/yWEwezO44GhS
	TaOm+rPKiIX+2hIWlo6a5d36vAuw7HS2pCmIIzanf8mZ8YvooMlmiYbqoDPaDsv+01Z9HnVoD3fy2
	Cimu1dRuSW0+ZKpnuDCX0vAbKljRGG9XzZBy0hgVxSb2hrAW3JZ51dAlf2C3pC3Izy0PcsPXhHeV6
	yh2q9Scg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEVz-0000000ARUY-2BoZ;
	Tue, 20 Oct 2026 18:24:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEVw-0000000ARTg-2nMh;
	Tue, 20 Oct 2026 18:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JtJbWi9XblqGf/oBFuSjQ+CThYnu2eCXkRHoK4PJRfI=; b=BEt9j0U6juqDHsTxevzqy6Cbwj
	ZhdZHc8X2xr8Y0EjV/ex/W3jqfYBfr5aT0wdoMG+sMeIzYq+rrc6VORSsNunbuqoLYGyCPfpOz6Y1
	G8Ii0CAgrY5R/3CCWgfyzJss4+Kc+D/ALPzaherJ2GbCmS5zJcZxXnm4/nLh17rCKEPdNqb6RVMe1
	8naKvOPt12qJv8rSaMd+YtIEWf9GWLhFywOGIR72ZqBwAq/hsgbhnmzP8FUJhWWQsw1Xiy1E4qjlF
	sMZrCh25Muyv8QgvFd+a5G6vR73nYS+VTLNaiyKoCE58dXw8bRwb9IC8prm9g7zbNBVRToteZOgH/
	fyHjy4bQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
 Michael Riesch <michael.riesch@collabora.com>
Cc: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a cell
 to select TX or RX
Date: Tue, 20 Oct 2026 20:24:22 +0200
Message-ID: <2778734.k3LOHGUjKi@diego>
In-Reply-To: <94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <25254818.ouqheUzb2q@diego>
 <94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_112445_112349_10F64ACF 
X-CRM114-Status: GOOD (  57.17  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

Am Dienstag, 20. Oktober 2026, 20:04:33 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Michael Riesch:
> On 10/20/26 16:57, Heiko St=C3=BCbner wrote:
> > Am Dienstag, 20. Oktober 2026, 16:10:39 Mitteleurop=C3=A4ische Sommerze=
it schrieb Rob Herring:
> >> On Tue, Oct 20, 2026 at 03:37:35PM +0200, Heiko St=C3=BCbner wrote:
> >>> Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleurop=C3=A4ische Sommer=
zeit schrieb Michael Riesch:
> >>>> Hi all,
> >>>>
> >>>> On 10/19/26 17:06, Rob Herring wrote:
> >>>>> On Mon, Oct 19, 2026 at 04:15:03PM +0800, =E6=A5=8A=E6=99=BA=E6=88=
=90 wrote:
> >>>>>> Hi Krzysztof, Rob,
> >>>>>>
> >>>>>>> Existing OS should ignore surplus cell if the driver is coded pro=
perly.
> >>>>>>> Same as adding new properties or new front-compatible.  The quest=
ion is
> >>>>>>> how the existing driver behaves?
> >>>>>>
> >>>>>> As you pointed out on 5/8, the xlate checks args_count !=3D 1. The=
 DC-PHY
> >>>>>> driver was merged in v6.15, so every kernel since 6.15 fails on a =
second cell.
> >>>>>>
> >>>>>> 1. Keep the second cell. Add the patch as follows:
> >>>>>>
> >>>>>> - if (args->args_count !=3D 1) {
> >>>>>> + if (args->args_count < 1) {
> >>>>>>     dev_err(dev, "invalid number of arguments\n");
> >>>>>>     return ERR_PTR(-EINVAL);
> >>>>>>   }
> >>>>>>
> >>>>>> + if (args->args_count > 1 && args->args[1]) {
> >>>>>> +   dev_err(dev, "only the transmitter is supported\n");
> >>>>>> +   return ERR_PTR(-EINVAL);
> >>>>>> + }
> >>>>>>
> >>>>>>   With Fixes: and Cc: stable, the stable kernels maintained at that
> >>>>>>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
> >>>>>>   dts, and the receiver fails cleanly instead of getting the trans=
mitter.
> >>>>>>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
> >>>>>>   It goes in with the series, since two-cell dts only exist after =
it.
> >>>>>>
> >>>>>> 2. Use a flag in the upper bits of the existing cell, as Rob
> >>>>>>     suggested. Existing kernels are not affected, unless a board e=
nables
> >>>>>>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> >>>>>>
> >>>>>> I will write the impact clearly whichever  approach is selected in
> >>>>>> the related commit messages and the cover letter.
> >>>>>>
> >>>>>> I think the cell approach is easier to read and more symmetric in =
the
> >>>>>> long term,
> >>>>>> but it breaks more. Which one do you think is better? Thanks.
> >>>>>
> >>>>> I'm not a user of this platform, so I don't care. Up to the platfor=
m=20
> >>>>> maintainers to decide if breakage is acceptible. You just need to=20
> >>>>> document the issue in the commit message.
> >>>>>
> >>>>> Rob
> >>>>
> >>>> It's a bit of a pickle, all this.
> >>>>
> >>>> I gave it some more thought. In the end this is an IP block with two
> >>>> PHYs. No more, no less. One cell is sufficient to address those, and=
 it
> >>>> could be 0 for the transmitting PHY (DSI, display) and 1 for the
> >>>> receiving PHY (CSI, camera).
> >>>>
> >>>> Of course the two PHYs can operate in either DPHY or CPHY mode. The
> >>>> phy-cells have been (mis?)used to select the proper mode of combo PH=
Ys,
> >>>> and this principle has been applied here too.
> >>>>
> >>>> However, we have the special situation here that the mode can only be
> >>>> changed for the complete IP block (and thus for both PHYs at the same
> >>>> time). As Bryan points out, we need to check and complain if the PHY
> >>>> mode is not set to the same value for both PHYs.
> >>>>
> >>>> I suggest using a property
> >>>>     samsung,cphy-mode;
> >>>
> >>> I guess, a maybe nicer way would be mimicing
> >>> 	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml
> >>>
> >>> with its
> >>> 	intel,phy-mode =3D <x>
> >>>
> >>> with x coming from include/dt-bindings/phy/phy.h
> >>> for the distinction between cphy and dphy, so we don't introduce yet
> >>> another way to describe this.
> >>
> >> We already have the plain 'phy-type' property which takes the same=20
> >> PHY_MODE_x values. We don't need yet another vendor specific property.
> >=20
> > even better then ... and I didn't look deep enough it seems.
> >=20
> >=20
> >>>> (name to be bikeshedded) that sets the complete IP block into CPHY m=
ode
> >>>> (DPHY being the default) to distinguish between the modes. Since both
> >>>> modes use a different electrical interface, this is clearly a hardwa=
re
> >>>> thing and thus suitable for device tree.
> >>>>
> >>>> Then, we can address the two PHYs with the help of the already exist=
ing
> >>>> phy cell (without any bitflag tweaks to the value).
> >>>>
> >>>> The sole drawback is that we need to accept the PHY_TYPE_DPHY and
> >>>> PHY_TYPE_CPHY values that some OS in the field might pass. (For Linu=
x,
> >>>> it should only be the former.) And we need to handle those values
> >>>> correctly. But I think this is not more painful than the other
> >>>> approaches. At the same time, this design seems to be the most corre=
ct
> >>>
> >>> The current cell values are 10 + 11, so as long as we don't re-use th=
ose
> >>> exact values for the other constants the driver should somewhat easily
> >>> be able to recognize an old DT?
> >>
> >> I think you will still have an ABI issue of what does old OS do with n=
ew=20
> >> values?
> >=20
> > wasn't the main contract, a newer kernel should support old DTs ?
> >=20
> > Aka the DT is parked in some firmware part (u-boot?) and gets handed
> > to the newer kernel.
> >=20
> > I don't see deliberately handing a newer DTB to an older kernel as a
> > very common occurence?
> >=20
> >=20
> > And from a practical standpoint:
> >=20
> > We're talking about devices with DSI displays that are at stake here,
> > so we're in the embedded world.
> >=20
> > In other areas we're still fighting basic functionality like actually
> > handling the type-c orientation correctly in the usbphy.
> >=20
> > So I really don't see a device with a user-updateable mainline kernel o=
ut
> > in the field, apart from people hacking around on their devices to try
> > out new features and new kernels, simply because core functionality
> > is still evolving in mainline.
> >=20
> >=20
> > RK3576/RK3588 devices still ship with a vendor u-boot/kernel, with
> > completely incompatible DTB afterall.
> >=20
> >=20
> > So yes, supporting old devicetrees on new kernels I do see as important
> > but someone working extra hard to combine a new DT with an old kernel,
> > I really don't see as an issue here.
> >
>=20
> Just to make sure I understood it correctly: the current suggestion
> would be the standard integer property (optional)
>=20
>   phy-type:
>     description: D-PHY (default) or C-PHY mode
>     enum:
>       - 10 # PHY_TYPE_DPHY
>       - 11 # PHY_TYPE_CPHY
>     default: 10
>=20
> plus changing phy-cells to:
>=20
>   "#phy-cells":
>     const: 1
>     description: |
>       Argument defines whether receiver or transmitter PHY is used.
>         - PHY_DIRECTION_TX
>         - PHY_DIRECTION_RX
>       See include/dt-bindings/phy/phy.h for constants.
>=20
> plus handling the case where an old DTS may still have a line
>=20
>   phys =3D <&mipidcphy0 PHY_TYPE_DPHY>;
>=20
> and the new kernel will convert it to something equal to phy-type =3D
> PHY_TYPE_DPHY and phys =3D <&mipidcphy0 PHY_DIR_TX>;
>=20
> plus ignoring the whether or not an old kernel can work with a new DTS
> or not.
>=20
> By the way, if we handle the case of the old DTS with the new kernel
> correctly (which we should IMHO) then we do not need to change the
> existing DTS nodes, thus eliminating regressions.
>=20
> Is this summary correct?

Yep, that's what I had in mind ... though dependent on DT-maintainers
not disagreeing on the reasoning ;-)

Heiko



