Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ECEC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/33P1yXMcEpdsQoJA0FxWJn94KsTH/e4Gm87YEyN1Y=; b=NSBM0VJ+aunulgK4SR/JrBytVL
	t95FuyYqkWowg2oW4n/pXNBPGwaib9QttNgNpD/IaR1cts7HVxo78JU2GyUzXLRGMng1n8jB9dh5M
	awky+iJuNRd3S7Fg7Pe0WNQJXPTvIlVg1KSzaRelxAskS3NffrsQ6M15tb7kdoFnQ6kvOuJHSU0rz
	gX1WbPPHd36kOxEE0WTU/i0yXmnO47RuvVTWK3UZVSl7M46D3eAgu/t3f4VqW9efPrU8mq9JIh/sp
	tHc4h/vLXLWdkQStomDgd67nnvbWbO0L3ILMQUdPpyvUcI1G9Zwr+crmwHLy7ZqEU31OuBlcZFjnk
	t0Uo5qzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSmc-00000004sOg-082K;
	Tue, 04 Mar 2025 13:58:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSl1-00000004rtG-1UM9;
	Tue, 04 Mar 2025 13:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741096584;
	bh=BYE1PMNXLmh6humc1AIGM9TE2xmShRPk4wpB/+IC4Io=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QxiPpaI1gQj9880lB5GeSnWv9GwWvx/teUExUau16QIQy3E8IMXe8lO3CUGrKPZSb
	 sT6kj9+chBIcxXE6lH7noxnJNI9fpSMcyWDY8ftrWXqfUWMePf4KpMwCuPS0h5ijZ3
	 +6AdX+R+qk02CTJ0728+othIa2MD/3gHvbK957DJXY/5BBNqSFsZ7m/jQoK8LAcG0W
	 U4zu+zm2sfC8zHXMlCH3vL7MsAM1cWpZXSMjmN6J2GDProNFX28/mPwXbJmRMEXJnT
	 ILO9AkVOAj41TIoqlWK5qnuiQQsTzSRxiHL1D1k9etwNqBqdN8Enfg/uO2KrQrsY9i
	 KVYwqaSaj+fhw==
Received: from apertis-1.home (2a01cb0892f2D600C8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0038A17E086B;
	Tue,  4 Mar 2025 14:56:23 +0100 (CET)
Message-ID: <3ee575154a95627b7ecaf33b2f52b6fa0ce4a352.camel@collabora.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI
 DSI port
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 04 Mar 2025 14:56:23 +0100
In-Reply-To: <fc0a9471-da47-4f4f-a471-1b20f344ad22@collabora.com>
References: <20250226-radxa-panel-overlay-v1-0-9e8938dfbead@collabora.com>
	 <20250226-radxa-panel-overlay-v1-1-9e8938dfbead@collabora.com>
	 <fc0a9471-da47-4f4f-a471-1b20f344ad22@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_055627_576715_B6505894 
X-CRM114-Status: GOOD (  24.00  )
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

Hi Angelo,

On Mon, 2025-03-03 at 12:32 +0100, AngeloGioacchino Del Regno wrote:
> Il 26/02/25 15:35, Julien Massot ha scritto:
> > This board can use a MIPI-DSI panel on the DSI0 connector: in
> > preparation for adding an overlay for the Radxa Display 8HD,
> > add a pipeline connecting VDOSYS0 components to DSI0.
> >=20
> > Also add the backlight, and some pin definitions available
> > through the DSI0 port.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts=C2=A0=C2=A0=C2=A0=
=C2=A0 | 60 ++++++++++++++++++++++
> > =C2=A0 1 file changed, 60 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > index 7184dc99296c7f5d749c7e6d378722677970b3b7..65c77e43d1cd4913b6741e2=
5130febd746ff753c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > @@ -48,6 +48,17 @@ memory@40000000 {
> > =C2=A0=C2=A0		reg =3D <0 0x40000000 0x1 0x0>;
> > =C2=A0=C2=A0	};
> > =C2=A0=20
> > +	backlight: backlight {
> > +		compatible =3D "pwm-backlight";
> > +		brightness-levels =3D <0 1023>;
> > +		default-brightness-level =3D <576>;
> > +		enable-gpios =3D <&pio 107 GPIO_ACTIVE_HIGH>;
> > +		num-interpolated-steps =3D <1023>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&dsi0_backlight_pins>;
> > +		pwms =3D <&disp_pwm0 0 500000>;
>=20
> This should be disabled, unless there is a display connected to the DSI c=
onnector.
>=20
> If there's no display, there's no point in enabling any backlight, as tha=
t pin
> may be reused somehow (with hardware hacks, maybe, yes, but still configu=
ring
> the PWM IP and the pin as PWM while unused is at least a waste of energy)=
.
>=20
Yes, I will keep it disabled in the board dts.

> > +	};
> > +
> > =C2=A0=C2=A0	wifi_vreg: regulator-wifi-3v3-en {
> > =C2=A0=C2=A0		compatible =3D "regulator-fixed";
> > =C2=A0=C2=A0		regulator-name =3D "wifi_3v3_en";
> > @@ -499,9 +510,20 @@ &mt6359_vsram_others_ldo_reg {
> > =C2=A0=C2=A0	regulator-max-microvolt =3D <750000>;
> > =C2=A0 };
> > =C2=A0=20
> > +&ovl0_in {
> > +	remote-endpoint =3D <&vdosys0_ep_main>;
> > +};
> > +
>=20
> This goes to the overlay that enables the DSI display.
Ok

>=20
> > @@ -912,6 +960,18 @@ &ssusb2 {
> > =C2=A0=C2=A0	status =3D "okay";
> > =C2=A0 };
> > =C2=A0=20
> > +&vdosys0 {
> > +	port {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		vdosys0_ep_main: endpoint@0 {
> > +			reg =3D <0>;
> > +			remote-endpoint =3D <&ovl0_in>;
> > +		};
> > +	};
> > +};
>=20
> If you enable this path, in the event that the DSI display overlay is not=
 added,
> the mediatek-drm driver will fail probing: even if a second path is enabl=
ed and
> that will succeed regardless of the first one failing, I don't see a reas=
on why
> whoever doesn't have a DSI display attached should see a miserable failur=
e in the
> kernel log :-)
>=20
> Besides, mediatek-drm failing will also slow down boot for no reason.... =
etc etc.
>=20
> Please move the display path setup to the DSI display overlay.
Sure will move the display path setup to the display overlay.

Thank you,
Julien

