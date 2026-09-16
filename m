Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AB7C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTV5XMyrmHp39LHImMD7jLIBjdgbYzzgBsLUqmjYR3M=; b=lEdznMW0rAT5ktM81Q7Raia/d5
	TJdcYAxQgt4K9QCUU9MLZGu5KyNwl7lJnP/GbUW3aOw9uxFhnWY2IplZgxmECKpD1nVjbrdCme7im
	vuQv+yUkagWUuxQhczOgmCzMCyIzl9zRtgYax2WfjetzzvnMV3dmyAdXNhR6uF6V2g7kybcTeEfGw
	K8YQ++FfUlws7x1BhPebuAh+oXlHCwmFXP1uecLAk6Lv3E1g0zP7fQemQD8MUbaaun7/3V20/aEQI
	StcwT5VB7LsHNWR9zGz/8ECb8kfIXdEu5mqZJx0aKjlM+MWpgqNZkagM18XLSdjXRYyFGXRp2da/P
	4sYItm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lqs-00000008pBq-2gkV;
	Wed, 16 Sep 2026 09:22:50 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lqo-00000008pAK-3GOJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:22:50 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 1CB4A22819;
	Wed, 16 Sep 2026 11:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789550564;
	bh=BTV5XMyrmHp39LHImMD7jLIBjdgbYzzgBsLUqmjYR3M=; h=From:To:Subject;
	b=T0JrFGj1/D4bssAaOGqKlJb+MlfTwpU+rmpdeUZaoGgTMQlHtWmIBgKSv6CPgR5pu
	 CJOcJwIxs9Br5Grbb0Jgo4NsmF8jhNEmC+f3g3WM0fCsiPfH+ObpmpO8wCM4uT1qew
	 V1rIi407+uL42ECJgC6e5fSOOvfWK4tWxnJJiYriUEeSeQzyrD87kt82LOEx7744rw
	 JM+KJGHb+fy+2MoqMyzrWct/oZ5HhIfbMh8LNsQS3crESWCXOrgJ1R9ck25n6cXvzg
	 8VoH2BINXGyYMm0ZbsyNxb306RT3moHfBVGG+6IR+YXarl6NmMqkuF/5DKVMnyqT92
	 0W8BP2CYLyb/w==
Date: Wed, 16 Sep 2026 11:22:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
Message-ID: <20260916092242.GB277833@francesco-nb>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-4-francesco@dolcini.it>
 <178954813309.214898.9623998050171113140.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178954813309.214898.9623998050171113140.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_022248_771932_B08FD9E7 
X-CRM114-Status: GOOD (  18.72  )
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

Hi Luca,
thanks for the review.

On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
> > The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
> > the bus-width property accordingly.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > index ec3c1e7301f4..1eb1cf2d7395 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > @@ -229,6 +229,7 @@ &lcdif {
> >
> >  	port {
> >  		lcdif_out: endpoint {
> > +			bus-width = <18>;
> 
> I don't know the hardware in detail, but the datasheet [0] mentions 16, 18
> and 24 bits, and says "Up to 24-bit color (18-bit recommended)". More
> details in ection 5.6.1.
> 
> This patch would force 18 bits, but "recommended" suggests 24 bits makes
> sense in some cases, no?
> 
> Can you elaborate on this?

The colibri family standard defines only 18-bit for the parallel RGB
interface on the edge connector, the additional 6-bit are mapped on
different pins that are not on fixed position, depend on the actual SoM
and can also be not present at all. The standard/generic colibri family
carrier boards can only rely on the 18-bits being available therefore.

24-bit is possible and makes sense only on a specific combo
carrier+module, and not as a generic SoM feature. Assuming you would
have such combo you should just override the property on the carrier
board dts file deviating from the standard colibri family.

let me know if you want such detailed explanation in the commit message

Francesco


