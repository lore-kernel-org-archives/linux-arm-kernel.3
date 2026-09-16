Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739D3C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u02QRcLt049ZAT6aaaZxvp9GLfHLpQsKy5lJH5r5naM=; b=O6qU3U153pTA3YVp7i6Frrhfke
	cifz56NAVjCXzywdhh6JhYm/c0AbDBQcp+gE1726ap0v3EPiKSa9WZrc7HylylXFrx/Gs+4oOpQMi
	U6LNPhMnPFIqvctNiI5ohQB+yQVNmVMlyKjg/2FkTakOKZqEssS02Se5qYiNDRss8CPV3ARR0uulS
	D0USdgv2OHz3MskuwLZgazg/NgFPfN431a8QZmIc0gSFt0C0VinKLnvXjOifzc2SFa5QFP5Pnho3Y
	fLcDA5dCm4xx+TqjLE8rdVvpB8LnQ9eYwv8T+158MSu/GuVYYX4mUtuN1jEMEx2HOOEt8nJrS+WuJ
	Rd6P9tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nZM-0000000942D-025N;
	Wed, 16 Sep 2026 11:12:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nZH-0000000941g-44fP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:12:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 20D421A07A8;
	Wed, 16 Sep 2026 11:12:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E53FF60337;
	Wed, 16 Sep 2026 11:12:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 265ED11C7AFE8;
	Wed, 16 Sep 2026 13:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789557158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u02QRcLt049ZAT6aaaZxvp9GLfHLpQsKy5lJH5r5naM=;
	b=QSKFtydsijs/fSver9QSpsKcj+EVggX6o7OLuUT/sZ+HCtCtYOnV96tLPkTKOlOio9bt/a
	nCdzJ8o1x+njqGiZ+98ZrOlpHGlGd4ah/cSkldvIee+ChcYUXs4u0K3ECyFeM+HMxOKD4U
	kNDC/+2WExsg9VwFJTlaM5uXjCZB6/WzitNoDe6n/yj8nEvMC/3NEsAtR8LEejtnmrSCy0
	nwaIHrc7Yu2fCIPrIlWWit/1kR7PhISe2+ViYCPIYWeYm0wwCpL/Htik2t4PT9vdBZKopV
	IHOH4HBywuyEOyad0QtjCFk4/Y2uwg098nN+Veq6bBGlqXBtBizUmVJm7gUsfQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 13:12:30 +0200
Message-Id: <DLGP2DKCP2T1.1HOJ6X8CS2GET@bootlin.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
Cc: "Marek Vasut" <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Francesco
 Dolcini" <francesco.dolcini@toradex.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.22.0
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-4-francesco@dolcini.it>
 <178954813309.214898.9623998050171113140.b4-review@b4>
 <20260916092242.GB277833@francesco-nb>
In-Reply-To: <20260916092242.GB277833@francesco-nb>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_041248_166539_4B5A4BBE 
X-CRM114-Status: GOOD (  19.86  )
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

Hi Francesco,

On Wed Sep 16, 2026 at 11:22 AM CEST, Francesco Dolcini wrote:
> Hi Luca,
> thanks for the review.
>
> On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
>> > The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
>> > the bus-width property accordingly.
>> >
>> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>> >
>> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm=
/boot/dts/nxp/imx/imx6ull-colibri.dtsi
>> > index ec3c1e7301f4..1eb1cf2d7395 100644
>> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
>> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
>> > @@ -229,6 +229,7 @@ &lcdif {
>> >
>> >  	port {
>> >  		lcdif_out: endpoint {
>> > +			bus-width =3D <18>;
>>
>> I don't know the hardware in detail, but the datasheet [0] mentions 16, =
18
>> and 24 bits, and says "Up to 24-bit color (18-bit recommended)". More
>> details in ection 5.6.1.
>>
>> This patch would force 18 bits, but "recommended" suggests 24 bits makes
>> sense in some cases, no?
>>
>> Can you elaborate on this?
>
> The colibri family standard defines only 18-bit for the parallel RGB
> interface on the edge connector, the additional 6-bit are mapped on
> different pins that are not on fixed position, depend on the actual SoM
> and can also be not present at all. The standard/generic colibri family
> carrier boards can only rely on the 18-bits being available therefore.
>
> 24-bit is possible and makes sense only on a specific combo
> carrier+module, and not as a generic SoM feature. Assuming you would
> have such combo you should just override the property on the carrier
> board dts file deviating from the standard colibri family.

Ah, that's clear now, thanks!

> let me know if you want such detailed explanation in the commit message

Yes please. With that added you can add:
+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Same for patch 4.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

