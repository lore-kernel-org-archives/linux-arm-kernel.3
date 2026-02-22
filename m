Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB07C6369F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNr1BH1ncB6E4X8VLYgEUnRPPNRKypjHb80+TAJpXII=; b=3HL0ndvDSNMoNpBzjro0OfI/cZ
	wajDcuoferyzqwT4fQwvKKSVM1U5bubl7sP2qXDbOzdW9dJNiJDeKNoQ47Exac1+Cd6uK8gb6gdVI
	QxMh7kqFtWZ2T2eew0ak3nMIC45mI9k8bEF6Qp4BG4clP1xeziaDJ7bcGngis8IIq/hIowN2RX+ty
	cr+G798YVJaHCp5cDPMBOdJ4RalEoWBse9OFQJcPInL5gBRJbnNNIVxCcqcB1MGKIR7gFuuLH32ZV
	xS3Vh8U1PsF7C+PcuoC6EFhtbP3/0+ujg/zukoPwuknyNTQbBkfpcna5xZn5boS/PYET6L/fQvtZE
	dfd9TUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu9JB-0000000GiUm-3fxs;
	Sun, 22 Feb 2026 13:15:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu9J8-0000000GiUK-37AE;
	Sun, 22 Feb 2026 13:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gNr1BH1ncB6E4X8VLYgEUnRPPNRKypjHb80+TAJpXII=; b=DuNpd7ZhMvT4/9iYrvA1Uwk5Zr
	2HDXtDLIGTeWNxTM5B0lOkm+LZaTuPcEj/MIjSqmfyTxdN6Sk+eeAZXMu2wXx8qm81PpE+mBqZlqz
	WG6xAdbu2rRkFIae0f7X6QlBOFg5nsYlZWhEe1ddGrrL+4DWNEqNVp9m/S9P+PH8e5O7ASierrjwy
	TN7OFVs5HRNZzanepQOhTbwDTDn6tT+7I9MdlXAsqUoUt/wdxum9rpczyaTwTb75Vj/aKCJXL/Q3i
	X/V6TpbcQlokmv4YMK/taipUte3EYEHYo2+8RJMp4rqVpqMy3CzR9BxGKW7KMMGj0rZq8XZnqBoYI
	DeM4j7Hg==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add domain-supply for pd_rkvdec0/1 and
 pd_venc0/1
Date: Sun, 22 Feb 2026 14:15:28 +0100
Message-ID: <3596120.QJadu78ljV@phil>
In-Reply-To: <1849787.VLH7GnMWUR@phil>
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
 <ea9df274-278d-f344-f66d-8821388e6690@rock-chips.com>
 <1849787.VLH7GnMWUR@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_051534_787698_821215E8 
X-CRM114-Status: GOOD (  26.96  )
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

Am Sonntag, 22. Februar 2026, 14:11:26 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Heiko Stuebner:
> Hi Shawn,
>=20
> Am Freitag, 13. Februar 2026, 03:42:07 Mitteleurop=C3=A4ische Normalzeit =
schrieb Shawn Lin:
> > =E5=9C=A8 2026/02/13 =E6=98=9F=E6=9C=9F=E4=BA=94 10:35, Shawn Lin =E5=
=86=99=E9=81=93:
> > > The power domains pd_rkvdec0/1 and pd_venc0/1 depend on two voltage s=
upplies,
> > > vdd_vdenc_s0 and vdd_vdenc_mem_s0. These supplies might be missing or=
 cause probe
> > > deferral. Since the Rockchip power domain management code currently s=
upports managing
> > > only one power supply, and both supplies belong to the same PMIC (mak=
ing it highly
> > > unlikely for one to be available while the other is not), a practical=
 solution is
> > > implemented.
> > >=20
> > > Both supplies are configured with the boot-on and always-on propertie=
s. Only one
> > > of them is assigned as the domain-supply for pd_rkvdec0/1 and pd_venc=
0/1. This allows
> > > the power domain code to perform a nominal enable operation on this s=
ingle supply,
> > > thereby successfully acquiring a reference to both supplies (as they =
are from the same
> > > PMIC). The system then relies on their boot-on and always-on flags to=
 maintain the
> > > correct state.
> > >=20
> > > Crucially, this approach handles cases like probe deferral correctly:
> > > if the PMIC is not yet ready, enabling the power domain will be defer=
red until the
> > > necessary supplies become available.
>=20
> just as a question, does the board have problems without these supplies?
> Aka, is this a fix for a problem, or "just" future proofing the board?

Ah, I take everything back. The pmdomain patch in
   https://lore.kernel.org/r/1770891364-52147-1-git-send-email-shawn.lin@ro=
ck-chips.com
is the actual fix.

With that patch applied all board should work correctly by deferring
the vdec probe until each board adds its domain-supply.

To not cause too much disturbance, this then counts as feature :-)

Heiko



> > > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> > > ---
> > >=20
> > >   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts  | 16 ++++++++++++=
++++
> > >   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts | 17 ++++++++++++=
+++++
> > >   2 files changed, 33 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/=
arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > > index c9d284c..09bc7b6 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > > @@ -568,6 +568,22 @@
> > >   	domain-supply =3D <&vdd_gpu_s0>;
> > >   };
> > >  =20
> > > +&pd_rkvdec0 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > > +&pd_rkvdec1 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > > +&pd_venc0 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > > +&pd_venc1 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > >   &pinctrl {
> > >   	audio {
> > >   		hp_detect: headphone-detect {
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch=
/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> > > index f820505..25d80b6 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> > > @@ -381,6 +381,22 @@
> > >   	domain-supply =3D <&vdd_gpu_s0>;
> > >   };
> > >  =20
> > > +&pd_rkvdec0 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > > +&pd_rkvdec1 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > > +&pd_venc0 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > > +&pd_venc1 {
> > > +	domain-supply =3D <&vdd_vdenc_s0>;
> > > +};
> > > +
> > >   &pinctrl {
> > >   	audio {
> > >   		hp_detect: headphone-detect {
> > > @@ -580,6 +596,7 @@
> > >   			vdd_gpu_mem_s0: dcdc-reg5 {
> > >   				regulator-name =3D "vdd_gpu_mem_s0";
> > >   				regulator-boot-on;
> > > +				regulator-always-on;
> >=20
> > Oops, I sent the wrong version. Should remove the this line change.
> > Will fix it if v2 needed.
> >=20
> > >   				regulator-min-microvolt =3D <675000>;
> > >   				regulator-max-microvolt =3D <950000>;
> > >   				regulator-ramp-delay =3D <12500>;
> > >=20
> >=20
>=20
>=20





