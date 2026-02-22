Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F58C6369F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVQ1HvYuj4l7iwcq8/NX4tU7HmBNPxeJhIc4SDEkhro=; b=hWbFuQzZX9GMJXZAaayXA68qDz
	oaPPx8ZLatMWd5Br5Y1WHZdYNp4NmEEdJ1Dfi47OpVvIeOiSlPHEgiqL+1yUzm2Wu6BjQVrowpzEQ
	kJynOyhjWCxgbaQ4V49nt8piPCCWmdOq/sQX7EFwjCcQgZ73V+3JAHQ8yQ1rSNIa3vKHHR84vVTPn
	Y6tBoLUTi8P6D1LPJZo45ShL4V0CCQtnZ9NjEwqHBERMADKNJvRw3nV/y6tYaUxdQv8uOPvg4yfg1
	mjTDpSmAzu6/aF82D3y7aTrsBaL9A/EWr/zzwv/I7EUgXiaV6liTsYPFzjAsCcfEzAYvovZUHlGmc
	m9Yc4xEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu9FL-0000000GiGp-36p5;
	Sun, 22 Feb 2026 13:11:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu9FI-0000000GiGO-1OwZ;
	Sun, 22 Feb 2026 13:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JVQ1HvYuj4l7iwcq8/NX4tU7HmBNPxeJhIc4SDEkhro=; b=Znax5x+YKVoO0sIMBG6dytXhS3
	QgHMOC+Olb6d0WkCcaJJzuK58fnB1nKgSM7YXlXgx1qiTKRBPQLNUWDoyovSBCF4kaw1gtHNgllOA
	vLwmirLnhaZ9sPE4CtQQq5DmZfsct3E3ZB3+IQjwABr5caXLXFar9fKANSRWM4vfc1u6mFHbQ73Jf
	m2u6wAk7/EXZcY10LZmoW3TWTzEWdogTl3KJXE5WMQf91F9iALMA444y0wDdwYPl/3oEjbgx79Ny1
	MqOfhmuvOyUNhTaZiWv1pIJlPwOs+9ByMomBRwMpY4+5OuLyLwG3qMKSKlxZirNuA/3Rk6knXk7wV
	nALUasvw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add domain-supply for pd_rkvdec0/1 and
 pd_venc0/1
Date: Sun, 22 Feb 2026 14:11:26 +0100
Message-ID: <1849787.VLH7GnMWUR@phil>
In-Reply-To: <ea9df274-278d-f344-f66d-8821388e6690@rock-chips.com>
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
 <1770950113-19802-2-git-send-email-shawn.lin@rock-chips.com>
 <ea9df274-278d-f344-f66d-8821388e6690@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_051136_568661_BDD05CDF 
X-CRM114-Status: GOOD (  23.20  )
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

Hi Shawn,

Am Freitag, 13. Februar 2026, 03:42:07 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Shawn Lin:
> =E5=9C=A8 2026/02/13 =E6=98=9F=E6=9C=9F=E4=BA=94 10:35, Shawn Lin =E5=86=
=99=E9=81=93:
> > The power domains pd_rkvdec0/1 and pd_venc0/1 depend on two voltage sup=
plies,
> > vdd_vdenc_s0 and vdd_vdenc_mem_s0. These supplies might be missing or c=
ause probe
> > deferral. Since the Rockchip power domain management code currently sup=
ports managing
> > only one power supply, and both supplies belong to the same PMIC (makin=
g it highly
> > unlikely for one to be available while the other is not), a practical s=
olution is
> > implemented.
> >=20
> > Both supplies are configured with the boot-on and always-on properties.=
 Only one
> > of them is assigned as the domain-supply for pd_rkvdec0/1 and pd_venc0/=
1. This allows
> > the power domain code to perform a nominal enable operation on this sin=
gle supply,
> > thereby successfully acquiring a reference to both supplies (as they ar=
e from the same
> > PMIC). The system then relies on their boot-on and always-on flags to m=
aintain the
> > correct state.
> >=20
> > Crucially, this approach handles cases like probe deferral correctly:
> > if the PMIC is not yet ready, enabling the power domain will be deferre=
d until the
> > necessary supplies become available.

just as a question, does the board have problems without these supplies?
Aka, is this a fix for a problem, or "just" future proofing the board?

Thanks
Heiko


> > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> > ---
> >=20
> >   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts  | 16 ++++++++++++++=
++
> >   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts | 17 ++++++++++++++=
+++
> >   2 files changed, 33 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > index c9d284c..09bc7b6 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > @@ -568,6 +568,22 @@
> >   	domain-supply =3D <&vdd_gpu_s0>;
> >   };
> >  =20
> > +&pd_rkvdec0 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> > +&pd_rkvdec1 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> > +&pd_venc0 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> > +&pd_venc1 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> >   &pinctrl {
> >   	audio {
> >   		hp_detect: headphone-detect {
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> > index f820505..25d80b6 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> > @@ -381,6 +381,22 @@
> >   	domain-supply =3D <&vdd_gpu_s0>;
> >   };
> >  =20
> > +&pd_rkvdec0 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> > +&pd_rkvdec1 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> > +&pd_venc0 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> > +&pd_venc1 {
> > +	domain-supply =3D <&vdd_vdenc_s0>;
> > +};
> > +
> >   &pinctrl {
> >   	audio {
> >   		hp_detect: headphone-detect {
> > @@ -580,6 +596,7 @@
> >   			vdd_gpu_mem_s0: dcdc-reg5 {
> >   				regulator-name =3D "vdd_gpu_mem_s0";
> >   				regulator-boot-on;
> > +				regulator-always-on;
>=20
> Oops, I sent the wrong version. Should remove the this line change.
> Will fix it if v2 needed.
>=20
> >   				regulator-min-microvolt =3D <675000>;
> >   				regulator-max-microvolt =3D <950000>;
> >   				regulator-ramp-delay =3D <12500>;
> >=20
>=20





