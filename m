Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F907C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dw3v8YNqvr+JafReR5Z5Q1bvgBUca6l2zWI8zP4bBuI=; b=VnqKWdafxuTQ6Tx8t1rpf1/jAc
	3GCm03bA1dU3Rf47PFQ/n+LNeUsbGUYw8mztxpMeYucuAaA+kGaBpa/nSfWrK7KIJI1636hLy3caI
	bJtCRQsskSTY2UnNet8XBpm4gb2zew1oxLeH4Idst5DcbYGVQaRtWv0L4OB11zCwOVeqjUaQ+x0PG
	04Fqu4KrEM6lmYkvoWwG1cBevbxitvbdIlrLXyFwAr09IEbhA1hcpCALMC4pJma+voaeSaw1CFK3y
	9jNoWCRVsbQlbc0oBeM9fzgiJ/0jpSGqRls+w7MRzWi3hIAyGlNL9hBiM8I2O0/H8HzeqkYG3ZsHg
	JD5bA/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQs9-00000000Oku-0nNC;
	Thu, 16 Jul 2026 18:31:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQs7-00000000Ok9-0wHf;
	Thu, 16 Jul 2026 18:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Dw3v8YNqvr+JafReR5Z5Q1bvgBUca6l2zWI8zP4bBuI=; b=HDq4JOfUdqiH4joBS0lJcZlMYa
	VABto7cXTjoKVWfwsWbgMymrXvMVXLi7ZVdcBZyp1EryW6hyaDTYuvDV1p4hhLNvXkMIxDsFXXD/6
	xHBPeDOkVNqZ/fmjcnb94YDg7O5K50IXaqXS8oS4pVbIWw8TJZF2x7BesSwnIY24mPagQQ2EApzkZ
	cf5q/WVDrB54xvMi+jCBAoq8qEpz2cXYI3v8/6JRfcrHfF0Nx31SX3rK3MIKah2vh0XrOiObKh+Q3
	QpAMP+RWPl+6PIoqaeShlMffHVv/yxbNN68VgtKAunk6k8wXM1VIiFPeix91nUihaPsbHurO7ysFt
	qM7tl9jA==;
From: Heiko Stuebner <heiko@sntech.de>
To: sashiko-reviews@lists.linux.dev,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to
 support M6 boards
Date: Thu, 16 Jul 2026 20:31:38 +0200
Message-ID: <3413772.oiGErgHkdL@phil>
In-Reply-To: <CAPSPb=v=ZDGJ41auxGgSOpKo69MycE=FtMyHf9sG9a3ju9PAaQ@mail.gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713204131.C58091F000E9@smtp.kernel.org>
 <CAPSPb=v=ZDGJ41auxGgSOpKo69MycE=FtMyHf9sG9a3ju9PAaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_113147_263665_C39CA3B5 
X-CRM114-Status: GOOD (  24.31  )
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

Hi Joachim,

Am Donnerstag, 16. Juli 2026, 11:24:20 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Joachim Eastwood:
> On Mon, 13 Jul 2026 at 22:41, <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Medium] Unintentional restoration of `regulator-boot-on` for `vdd_np=
u_s0` during refactoring.
> > - [Low] Dangling phandle reference `&vcc5v0_usb_otg0` in the common `.d=
tsi` file.
> > --
> >
> > --- Patch [11]: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r=
6: refactor to support M6 boards ---
> > commit 056adff75ec08989b96f09adc0efff6c3a5d662f
> > Author: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
> >
> > FriendlyElec NanoPi6 series consists of four distinct boards; R6S, R6C,
> > M6 and M6V2. Refactor FriendlyElec NanoPi R6 base dtsi in preparation
> > for adding NanoPi M6 support.
> >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/=
arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > > new file mode 100644
> > > index 0000000000000..a8e532ad8b7a8
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> >
> > [ ... ]
> >
> > > +&i2c2 {
> > > +     status =3D "okay";
> > > +
> > > +     vdd_npu_s0: regulator@42 {
> > > +             compatible =3D "rockchip,rk8602";
> > > +             reg =3D <0x42>;
> > > +             fcs,suspend-voltage-selector =3D <1>;
> > > +             regulator-name =3D "vdd_npu_s0";
> > > +             regulator-min-microvolt =3D <550000>;
> > > +             regulator-max-microvolt =3D <950000>;
> > > +             regulator-ramp-delay =3D <2300>;
> > > +             regulator-boot-on;
> >
> > [Severity: Medium]
> > Is the addition of regulator-boot-on here intentional?
>=20
> Seems like I screwed up the refactoring of the code, and Sashiko caught m=
e.
> I will fix it and send out a new patch set later.
>=20
> > This appears to accidentally revert a prior fix that removed the boot-on
> > property for vdd_npu_s0 to save power during early boot.
> >
> > > +             vin-supply =3D <&vcc5v0_sys>;
> > > +
> > > +             regulator-state-mem {
> > > +                     regulator-off-in-suspend;
> > > +             };
> > > +     };
> > > +};
> >
> > [ ... ]
> >
> > > +&u2phy0_otg {
> > > +     phy-supply =3D <&vcc5v0_usb_otg0>;
> >
> > [Severity: Low]
> > Does this create a dangling phandle reference in the common dtsi file?
> >
> > Since the vcc5v0_usb_otg0 regulator was left in the board-specific
> > rk3588s-nanopi-r6.dtsi file, it looks like compiling a new board (like =
the M6)
> > that includes this common dtsi will fail to build if it doesn't also de=
fine a
> > regulator with this exact label.
>=20
> I don't think this is really an issue. Both nanopi-r6.dtsi and nanopi-m6.=
dtsi
> will have those regulators defined.
>=20
> Unless someone tells me this is bad practice I will keep this as it is.

I think this is ok. Like as you said, the regulator will be defined by
boards - just with a different gpio I guess.
And nobody expects to build the core dtsi and if another new board
materializes that does not have the otg port (and thus regulator), we'll
need to move more stuff anyway :-)


Heiko



