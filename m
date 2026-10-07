Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D42CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OexaRCcgt6XYkDM8a+OmC5h/6OPxo9ybl1gjEFZyPZY=; b=SX/FE/9YFIhoMvYfGFmAM+Klrw
	nEjNAtZP2rgL9ysr6JaNkBzz9nychcZruB/oXSC11hXL0YeWTDwtV9PNx2Atd/Nt7KhAkkXQNZjbX
	YW3P4+gNmCJfBerb7RpSTLxwvzkNJjs23VCuTTxf+JRrz5RAxP/YxCHJMekOqSF8jlQeyXxCfh1g+
	snsy4eACKBUadodA1lRa5YBbd1BGrGXf+VwrH4S6FI6VZNo0QOlM9VGsT9DYMyxZQ06VCCOloWJjA
	P/z057cicCBi2m05S4KnJY+akKftxT79nGyg/eZw5ZFT9aq0XzbcedQ4AFLQfLxEomvy+Sy56+6UH
	ytUEPuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELVh-00000001oQA-2o3C;
	Wed, 07 Oct 2026 06:52:17 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELVe-00000001oPa-3FxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OexaRCcgt6XYkDM8a+OmC5h/6OPxo9ybl1gjEFZyPZY=; b=q/j60Yb13/I9m6w0+nIy5uqC3r
	AOYolLvel59Eq9GOidlv2e+1esaRmd1CyZRrut7gT2ANNsVk+AP+6Ui9tdLH6kLIpEPrQO4Oe3uhX
	Sx0wdJQrI2HS8Lk9oZFCM/WICPTAOTOvenLSlTzEeBgZdR9mYxflW2t53TqwejP+Q5DYsavgmIEz0
	k26N7WP4QsnKjHKOcg+Hib/LNWCLoIPqLTTz9lMM4w90fxDt7PFf7LVS02bkZZv3Bwoo7k4wDIhAG
	ohfMTcxE97n8Ijg1cLxTg/9qGS0f1ce9Bf/SS8vXgZFE1tZbWYq1/3/fvYLPZK6oQDOqFMeofJSyM
	1qzK2n4A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELVc-0008ir-0L;
	Wed, 07 Oct 2026 08:52:12 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELVc-000II6-0d;
	Wed, 07 Oct 2026 08:52:11 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for SPI-NOR
 flash
Date: Wed, 07 Oct 2026 08:52:09 +0200
Message-ID: <8205013.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <5021357.mvXUDI8C0e@steina-w>
 <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_235214_928095_CDD40AFC 
X-CRM114-Status: GOOD (  14.21  )
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

Hi Fabio,

Am Dienstag, 6. Oktober 2026, 15:59:22 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Fabio Estevam:
> Hi Alexander,
>=20
> On Tue, Oct 6, 2026 at 10:50=E2=80=AFAM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Frank Li:
> > > On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > > > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > > >
> > > > The FlexSPI controller uses quad SPI with internal clock recovery.
> > > > The clock is therefore restricted to 66.666666 MHz according to
> > > > data sheet.
> > >
> > > Which datasheet? I suppose NOR flash datasheet, can you provide link
> > > here.
> >
> > The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
> > FlexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input tim=
ing
> > in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum=
 for
> > "Frequency of operation".
>=20
> From the commit log, I also got the impression you were referring to
> the SPI NOR datasheet.
>=20
> Please clarify that in v2.
>=20
> Also, shouldn't all patches in the series contain a Fixes: tag?

Thanks for the feedback, I'll adjust the commit message in v2 and
add a Fixes: tag as well.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



