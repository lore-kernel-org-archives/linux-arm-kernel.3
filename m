Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CD4E6749E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InnbTxM3f/wDfQC//0Q8/OnFX1X5UMvCqLa3Cym9qos=; b=QZjba0ACrvyfaOiH7BgrGEG3WM
	0ZU+kS/vYUFlqxmw6jCxLB4OCg/7mCUicRUdDrAIDmgDsvrH3UOJq49BxzQoLEg5mhvILLCN5+1vz
	dEpmEKIZcKeg3der7A9WehQliT/asGOLfqywifaNVMqSfvWx0PjAkDOOxb81UDPwvXGa7T9T5ajQJ
	TO2NepRYUElzOAAcnVI6E++DW8Cy6Gc7zAKzxDxPmio+6dXE2pFrsB0wtqkEsMtkwHDhU1krD6k4+
	/wC2Od7T9oe4OC0fr1+sYHRPJVA13kL1aDTbfQDz7Rzvs4HGZHonrZhipqaieH3mX3SiD4vTwCrpR
	40Bztmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXers-0000000Djhn-27G9;
	Mon, 22 Dec 2025 12:18:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXerp-0000000DjhD-0dC6;
	Mon, 22 Dec 2025 12:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=InnbTxM3f/wDfQC//0Q8/OnFX1X5UMvCqLa3Cym9qos=; b=Rqum/xwuZ3U6nPNRJZ6j4sm0An
	yIt0IXG2ecYP9sVf8DVtTJh46L9HrUV5BRumtRBGYuvZbd6hmNMXTsGuv3rqeFPDCE0O4/O75TQTi
	YodXKuTb8eegjIkN1cvmBn81lPsbXAsKBHBqk0CZiMKTejHDnHrdmd8UxGvdButOlFWODnYfWpBgP
	ZRbJWlt2gmWE5K468pc0+jqE9JI9B6ijHAAZ4epfAxtInFEQsQgkwXYeeqCbX1xbD0UGNC1zN1hEz
	+z4mrNKcIvGuIpC206JL5cPZmkdi8obtVprZTp2gjN2RhyevE4eKoSN3Q4W+AMEV2pFgzAUSQYOs3
	Fp3Z4aIQ==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXerf-0005Na-Tu; Mon, 22 Dec 2025 13:18:15 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Martin =?UTF-8?B?SG9sb3Zza8O9IChQcm9iYWJseSBOb3RoaW5nIHMuci5vLik=?=
 <mh@probably.group>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable both 2.5GbE ports on Rock 5T
Date: Mon, 22 Dec 2025 13:18:15 +0100
Message-ID: <5037086.R56niFO833@phil>
In-Reply-To: <3903009.mvXUDI8C0e@workhorse>
References: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
 <034BDB37-34FB-441F-B79E-1631CA501576@probably.group>
 <3903009.mvXUDI8C0e@workhorse>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_041825_305831_CDFBEC3A 
X-CRM114-Status: GOOD (  22.86  )
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

Am Freitag, 19. Dezember 2025, 14:06:12 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Nicolas Frattaroli:
> On Thursday, 18 December 2025 07:27:06 Central European Standard Time Mar=
tin Holovsk=C3=BD (Probably Nothing s.r.o.) wrote:
> > The Radxa Rock 5T board features two RTL8125B 2.5GbE Ethernet controlle=
rs
> > connected via PCIe lanes pcie2x1l0 (fe170000) and pcie2x1l2 (fe190000).
> > Currently only one interface is functional because the PCIe controller
> > nodes lack the necessary reset GPIO configuration.
> >=20
> > Without the reset-gpios property, the RTL8125B PHYs remain in reset sta=
te
> > and are not enumerated by the PCIe bus. This results in only one Ethern=
et
> > interface being detected, or none at all depending on U-Boot initializa=
tion.
> >=20
> > This patch adds the missing configuration for both PCIe controllers:
> > - Enables both pcie2x1l0 and pcie2x1l2 nodes (status =3D "okay")
> > - Configures reset GPIOs (GPIO4_PA5 and GPIO3_PB0 respectively)
> > - Adds corresponding pinctrl definitions
> >=20
> > With this change, both 2.5GbE interfaces are properly detected and
> > functional on the Rock 5T.
> >=20
> > Tested on Radxa Rock 5T v1.2 running Linux 6.12.
> >=20
> > Signed-off-by: Martin Holovsky <mh@probably.group>
> > ---
> > Changes in v2:
> > - Sorted pcie nodes alphanumerically
> > - Sorted pinctrl nodes alphanumerically
> > - Added Signed-off-by line
> >=20
> >  .../boot/dts/rockchip/rk3588-rock-5t.dts      | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm=
64/boot/dts/rockchip/rk3588-rock-5t.dts
> > index 0dd90c744380..aeb8e0d42f09 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> > @@ -68,10 +68,24 @@ &pcie2x1l1 {
> >  	reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> >  	status =3D "okay";
> >  };
> > =20
> > +&pcie2x1l0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pcie2_0_rst>;
> > +	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> > +	status =3D "okay";
> > +};
> > +
> > +&pcie2x1l2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pcie2_2_rst>;
> > +	reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> > +	status =3D "okay";
> > +};
> > +
> >  &pcie30phy {
> >  	data-lanes =3D <1 1 2 2>;
> >  };
> > @@ -101,6 +115,14 @@ pcie2 {
> > +		pcie2_0_rst: pcie2-0-rst {
> > +			rockchip,pins =3D <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +
> >  		pcie2_1_rst: pcie2-1-rst {
> >  			rockchip,pins =3D <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> >  		};
> > +
> > +		pcie2_2_rst: pcie2-2-rst {
> > +			rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +
> >  		pcie2_0_vcc3v3_en: pcie2-0-vcc-en {
> >  			rockchip,pins =3D <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
> >  		};
> >=20
>=20
> This stuff is already in rk3588-rock-5b-5bp-5t.dtsi. Ergo, this patch
> does nothing at all. What are you actually trying to solve?
>=20
> Heiko, please don't apply this.

Thanks for the heads-up, both to you and Naoki :-)

Heiko



