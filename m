Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B2E1125857
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqRkaG7PZa3SdAEeTnU/sidXS9ZoBoMf8Fu+ald3Woo=; b=3zh5tubEw9oYXg1YOKngFmKsVb
	JCEoNZ5hD9a5Kb4/cTgaYqqTpf9HRC46ewMNdwysqX9ETab2RMdkn1CH8D4SUo7/7MRfPDizJbUZM
	naHLknDxDXI1bYd4HbiBFI9n0sN1MuO2GQ7E0MjUP6IPLkvp5WSZ6TmY3tHhKKFpgh0IYsuqdnjxo
	bqIANmpFxufr4EuwlKiaLTXIUbaAG1mzlpI5L0MFe7uzufQC3Rct+dYAz3I0yOtja9JWFd9uBJpZC
	Eoo95mMwbijjIrHGxDND2TQshvnOlc0AWAHzhf2W8xfn2op4/Wjuwbi3ANRx3nWKw0ulhKaC/V9Sg
	EeawqqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0N1N-0000000BzpA-0qTg;
	Wed, 11 Mar 2026 17:06:57 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0N1K-0000000BzoZ-3NaL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kqRkaG7PZa3SdAEeTnU/sidXS9ZoBoMf8Fu+ald3Woo=; b=kwdqmx+NAasOQZGYG54tryJcZ0
	AfMjN3FGBLE5KmmmBbkCbpK70Ic9l4Gtwck8sMUK303kbnkDTcmlkTTDOwl7OdQllNgQli3G6krUp
	7CS6yKO5LPnGuastE8TXkbyWhv3VnDh6m4Qo0CpkwGvVj8ItP2t9YIvIPwvRF8vsr6fO9LffnZ+8h
	dllUPhUe4z6N2kue631IK/deKIIyvQHxxKe25bLj86iAtBE/xmhlX8QhMT3xyZZnMzi2obRry0qOJ
	CRrTu+RUCl81n/MCgjcEvgxbCZ3OYX9THYoqFi5B+m8Jt0DPp2+D6EF25pZSjizeiC6e1eozMOlR7
	nae7u5qw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0MkP-000NK7-0K;
	Wed, 11 Mar 2026 17:49:25 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0MkO-0008lW-1w;
	Wed, 11 Mar 2026 17:49:24 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-g133han01: Remove
 compatible from overlay
Date: Wed, 11 Mar 2026 17:49:23 +0100
Message-ID: <6599983.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <abGWGel76qoy20cI@lizhi-Precision-Tower-5810>
References: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
 <abGWGel76qoy20cI@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100654_948262_78F7C6F7 
X-CRM114-Status: GOOD (  17.43  )
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

Hi,

Am Mittwoch, 11. M=E4rz 2026, 17:19:37 CET schrieb Frank Li:
> On Wed, Mar 11, 2026 at 03:52:15PM +0100, Alexander Stein wrote:
> > There is no reason to override the board compatible in a an overlay,
> > remove it. While at it, update the copyright year.
>=20
> Any bad things happen if overwrite in overlay file?

You might override the board compatible when it is set (differently) in
the mainboard.

Best regards,
Alexander

> Frank
>=20
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lv=
ds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl=
=2Dlvds-g133han01.dtso
> > index 5058cd9409c75..129b02a69ccf0 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133=
han01.dtso
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133=
han01.dtso
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> >  /*
> > - * Copyright (c) 2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * Copyright (c) 2023-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> >   * D-82229 Seefeld, Germany.
> >   * Author: Alexander Stein
> >   */
> > @@ -10,10 +10,6 @@
> >
> >  #include <dt-bindings/clock/imx8mp-clock.h>
> >
> > -&{/} {
> > -	compatible =3D "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql",=
 "fsl,imx8mp";
> > -};
> > -
> >  &backlight_lvds {
> >  	status =3D "okay";
> >  };
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



