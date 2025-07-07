Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D64C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmXXUqzV9IfInF2AqMH8S6kENW5mGyE1n/Oc1UTxzx0=; b=iQfdi+18CGVnDIsL59pIOL5mk/
	CQuljiI/nKBn03jqRlqpz5t0OkUGW35O8oU474V9ef2Q2i5iU287hsa6/oNEm0zJk8+cHS9dp6m6t
	mRMlg6ecOTzcfzl+VRDugb7U78iQARV0fR8j+u2k3NFeedeUoIdZ/dWEgHElk4YyIFSzpW6r62j1W
	IojugojClmwjTwzId6FYccY3goh1OYV9XfLsuhrBdBNxTkw6bqowjGMsCaZpGCaUTHoTAZ4gs7ccQ
	JlInyQBSqXT1agtP7bCi3GZG90dhbDJwALmiolbPYt38apdkHbbmNI+3tHbiHAHOPcF9z4qN7gmNS
	6RdCBSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiuh-000000027SG-0nmN;
	Mon, 07 Jul 2025 10:17:31 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiKj-000000020wP-49Qv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:40:23 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B9BA11F00053
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 09:40:17 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 90413ACAC82; Mon,  7 Jul 2025 09:40:16 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id CDCCDACAC75;
	Mon,  7 Jul 2025 09:40:14 +0000 (UTC)
Date: Mon, 7 Jul 2025 11:40:12 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Message-ID: <aGuV_IYP9dMqUwAB@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan>
 <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins>
 <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h72PPscjtkEBcJqH"
Content-Disposition: inline
In-Reply-To: <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_024022_345486_665599B7 
X-CRM114-Status: GOOD (  48.74  )
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


--h72PPscjtkEBcJqH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Le Mon 07 Jul 25, 11:07, Chen-Yu Tsai a =C3=A9crit :
> On Sun, Jul 6, 2025 at 11:04=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrot=
e:
> >
> > On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-bas=
e.io> wrote:
> > >
> > > Hi Andre,
> > >
> > > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > > Andre Przywara <andre.przywara@arm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > > >
> > > > > Hi Paul,
> > > > >
> > > > > > The Allwinner A100/A133 only has a single emac instance, which =
is
> > > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > > trailing "0" that has no reason to be.
> > > > >
> > > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 di=
e: it's
> > > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > > registers (@0x5030000), and there is a second syscon register
> > > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > > It seem like no suitable pins are connected on the A133
> > > > > package, but that should not affect the A100 .dtsi (we use a simi=
lar
> > > > > approach for the H616 and A523).
> > > > >
> > > > > So I think we should keep the emac0 name.
> > > >
> > > > just thinking that it's even worse: this changes the DT visible pin=
ctrl
> > > > function name, so it's a DT ABI change. With the "emac0" function n=
ame,
> > > > Ethernet would work with stable kernels already (as everything is
> > > > compatible, it's just about DT changes). But with this change, pinc=
trl
> > > > drivers in older kernels would not match.
> > >
> > > Given that the port is still very early and experimental and has very=
 few users
> > > and no field deployment so I don't really think it would have annoyed=
 anybody in
> > > practice. But yes in principle you are right, while the header rename=
s keep the
> > > same value, the string names are used to match the device-tree defini=
tions and
> > > this constitues ABI that needs to remain stable.
> > >
> > > > So I would very much like to see this patch moved out. Is it just in
> > > > LinusW's tree so far? I don't see it in -next yet.
> > >
> > > I don't think the patches were accepted for over a week so we can pro=
bably
> > > still act. I will send reverts, unless maintainers want to manually r=
emove
> > > these commits?
> >
> > I can drop the dts patches from the sunxi tree. Linus might be able to
> > drop the pinctrl patch.
>=20
> FYI I dropped the dts patches for now, though I forgot to redo the -next
> branch last night, so today's linux-next might not reflect it.

Great, thanks for taking care of this!

Paul

> ChenYu
>=20
> > You definitely need to send a revert for the DT binding patch that is
> > already in net-next.
> >
> >
> > ChenYu
> >
> >
> > > Cheers,
> > >
> > > Paul
> > >
> > > > Cheers,
> > > > Andre.
> > > >
> > > > > [1]
> > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/b=
oot/dts/sunxi/sun50iw10p1.dtsi
> > > > >
> > > > >
> > > > > >
> > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwi=
nner A100 pin controller")
> > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > ---
> > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++---=
--------
> > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driv=
ers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >
> > > > >
> > > >
> > >
> > > --
> > > Paul Kocialkowski,
> > >
> > > Independent contractor - sys-base - https://www.sys-base.io/
> > > Free software developer - https://www.paulk.fr/
> > >
> > > Expert in multimedia, graphics and embedded hardware support with Lin=
ux.

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--h72PPscjtkEBcJqH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhrlfwACgkQhP3B6o/u
lQzFNg//bld0WF9jX9jnupUNbhSZ2ERtLt/cRepL9TU8xBS70uf8K//O3I39Eyt8
WnU54hx8rvT3A38ENhyn9aJrCa0cmu0x4rHhyRn38BtKDpalB/j07Y7fpXoDEP4b
evjRO1WGO/T52sqgwLVMvOJAy11GXWa538PmgqLLH2iM7kLySlmaczslLvLc4j/G
y7CRAO0booyYQBwb5iSobzJ+/Kz8nVpgY7cNI7I/V0zCYKU/XyYT5apl9liAIEkg
AVP1Byrl3H0GtPk/r7KhYqjsYVXCyPS/sgXQWtVsJxWEitMt+zE0t0vZMbJvaJoP
tGl2o1nc++Nj9WyimvNMpdYzIizBzg1lMMb/hx9A/BeB0mCwZqwaCwzPVGtX3WnV
FHgS26Jfugvry6C7bdhu4jgbCIXPgUoM+zI0o3TqOTkdUCK5gHls721qWW2mLznY
sFE+hjYmCu+P8sIrMZYwz1P0ZTnDXoe8fMoRT01sz2IIgvBbQKClA1hoiNbui67B
wV9uNQY7J9KfoVKLLSxWUr06TcnM63l1l/kj2jYNo8lM7jJyGEYfUW6+c0r1Tc9Y
7+PS/KH1sOdVBj7OudupYvw0NgJsHWnY9zbVHaY5Z8n7/XyRtTTW78zS3jInsK1E
3dPznzz+CDOsjJ0OS6HoF0hMEu+ya+zlGO7dLDCzZomH/2zpCCY=
=cuHf
-----END PGP SIGNATURE-----

--h72PPscjtkEBcJqH--

