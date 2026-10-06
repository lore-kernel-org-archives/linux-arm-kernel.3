Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5DACA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtXewEIARdqyNa+0KtGlyoZpihGzkV6HOi575K/RB5Q=; b=oPdlBK1VQ1G0f+haNRy5VZuhuZ
	U1QWYHe1rIqw8V92EwcdR2P1g/KG/2nqdpAV+ppcN5RNC0nWyPirt2rX6zIQitxEhiQWcRiKD3yFm
	HZxT/0Ei6BFlPX6Ogn46qgv3Wt/xGxn5wn/RjY5GmC9z1RifK5yAQaCV9+Ri8Gm4VfMLj+R/Qfxyw
	ExHshE9ZrVMjIvHxILx/R32qnkPGqnv+dKFMAbVB/7f45XEmuIAyxlisbqq3eWNY2iCy1x6TdFBW8
	buTUQP3xhiaeOGRz6+uBAqpJ1p0zPBg99NaVpHzzNUCwA0FLjsCj8w3zDmHwDUg5W6D40JncTJJmr
	cAQIkBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5Yi-00000000tmC-31PO;
	Tue, 06 Oct 2026 13:50:20 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5Ye-00000000tkr-01xY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LtXewEIARdqyNa+0KtGlyoZpihGzkV6HOi575K/RB5Q=; b=WQmTZ+ZpkQpI5Io8Ikjpil6eSn
	LzHhNYn2S/Iu02bFCzbzdd+EImJPzx82KivwCE5hAIIQR5oBJ0XkGgDvH8wzk0lC70rOCbok2w6vy
	Cho8atTDDDc0WWZWkTOa02D99YNVZy7B+MVqKZvjdnPK47sHgWGHmmFMi41uZ85/+AhB0Z1p9ig1t
	x2LpNPU/BdIugERqvDDmu8sezY6Dz5UFC3iZwoS6E8ProWWBsxRIIx3BNPxx1hdc/LzRzdzqvHTbV
	0yXgVYpOhCFwhqFT4zga8K0MEqKVIs//62N9pATU15UnYbUDJbEOtUG0PWCNjGDUQpqalLlcwmG30
	u6Ola9nw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5Yb-000Fzm-38;
	Tue, 06 Oct 2026 15:50:14 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5Ya-0008c2-1y;
	Tue, 06 Oct 2026 15:50:13 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for SPI-NOR
 flash
Date: Tue, 06 Oct 2026 15:50:12 +0200
Message-ID: <5021357.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <asT7yvlCeQl1rfrS@SMW015318>
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
 <asT7yvlCeQl1rfrS@SMW015318>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_065016_528464_95A1E929 
X-CRM114-Status: GOOD (  16.28  )
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

Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Frank Li:
> On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > The FlexSPI controller uses quad SPI with internal clock recovery.
> > The clock is therefore restricted to 66.666666 MHz according to
> > data sheet.
>=20
> Which datasheet? I suppose NOR flash datasheet, can you provide link
> here.

The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
=46lexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input timing
in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum for
"Frequency of operation".

Best regards
Alexander

> Frank
>=20
> >
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch=
/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> > index 48a687926aa1b..c88d83243097f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> > @@ -63,7 +63,7 @@ &flexspi {
> >  	flash0: flash@0 {
> >  		compatible =3D "jedec,spi-nor";
> >  		reg =3D <0>;
> > -		spi-max-frequency =3D <84000000>;
> > +		spi-max-frequency =3D <66666666>;
> >  		spi-tx-bus-width =3D <1>;
> >  		spi-rx-bus-width =3D <4>;
> >  		vcc-supply =3D <&buck5_reg>;
> > --
> > 2.55.0
> >
> >
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



