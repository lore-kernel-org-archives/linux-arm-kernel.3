Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fHyTKMsoevoSMKCVyG7YFlSq3TWqO0gq0A7jnn6kts=; b=4IG6OnQ1YhL0k3myNT76fr+/MN
	2Y8VUTWhVAwTS++gOyHBmAM1sSrPDNEsWlqOcsuyw9zEY/J/sofbIZWi8Gzia7K1UPsQhH2H2SNKz
	q2u4JbrW529QRWmBhig6WZ3JNtsQ2iSKnDxpVV97fKX0xRmnDjSZhMNVawH+jl4CIYv60CqK/pWV5
	R/FgVjsFKvwRgD3t9jNxniGZi2WtFXTQROI+ycro0wF0CxlZc4D15dOUVsQRYmgirsJ6mpILK3rnl
	w2wkvKYvqojH2ATfJJTvfFUk28BcrAz8nt8HCGy4lJBpS7zwBJ8ByeuK6TxbfSZWkEnUtrm93+JtE
	JGl+NU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxb6-00000003xfk-3w5m;
	Mon, 17 Feb 2025 09:39:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxJo-00000003ujQ-40KX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:21:38 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tjxJc-0000cm-6B; Mon, 17 Feb 2025 10:21:24 +0100
Message-ID: <0e233b5210e3245266fd1954e0fd198bc6864c24.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] arm64: dts: imx8m: Add pinctrl config definitions
From: Lucas Stach <l.stach@pengutronix.de>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	 <imx@lists.linux.dev>
Date: Mon, 17 Feb 2025 10:21:23 +0100
In-Reply-To: <PA4PR04MB76308879CAA0764BB293C4C3C5F92@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
	 <d0dd61ea558ef8b18978301ef710925b83ef4037.camel@pengutronix.de>
	 <PA4PR04MB76308879CAA0764BB293C4C3C5F92@PA4PR04MB7630.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_012136_995422_FFCC360D 
X-CRM114-Status: GOOD (  14.23  )
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

Am Samstag, dem 15.02.2025 um 10:02 +0000 schrieb Maud Spierings |
GOcontroll:
> From:=C2=A0Lucas Stach <l.stach@pengutronix.de>
> Sent:=C2=A0Friday, February 14, 2025 5:28 PM
> =C2=A0
> > Hi Maud,
>=20
> > Am Freitag, dem 14.02.2025 um 16:57 +0100 schrieb Maud Spierings via B4
> > Relay:
> > > Up untill now the extra function mux (pull resistor, etc) has been
> > > defined as a raw hex value, this is difficult to interpret. Add
> > > definitions for these parts of the pinctrl registers to allow for mor=
e
> > > readable pinctrl definitions in devictree files.
>=20
> > I certainly prefer the short form with the hex value, I find that quite
> > a bit more readable than very verbose swathes of defines ORed together.
> > But each to their own.
>=20
> I personally prefer it, but it would be accepted if I write a dts using t=
his if it
> gets accepted? I am currently working on devicetrees for all of our devic=
es
> preferably they would use this.
>=20
I'm not the ultimate authority on this, as I'm not the official
maintainer of the i.MX DTs. That would be Shawn, so he has to agree to
this. However, my gut feeling is that it would be accepted if you as
the author of the board DT prefer this style.

Just don't go around and convert other board DTs maintained by other
people to the verbose define style.

Regards,
Lucas


