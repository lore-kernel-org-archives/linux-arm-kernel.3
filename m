Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90473C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 23:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUbcZyGB8MO0vO/sFtb0GygojCC8Xcppuu4da7lXPV0=; b=g5FjIC9zH0hsfl1Z+hrzImSaq3
	vgiz4gkCOD8Dm9duxaBejFoyK7mtfTB4cNvPJDUXCgMY00ZPW8qH6g7hOHapE7JMj9ZA4xzozjDId
	r0Cv6fwGX199rg8zSR8UHEfQMLg9LQbzXwNwrKkbRWt1J9TmkOwC5Syh4JGnpLQwpfvVbLqrdw+4h
	LvNlooYsx1+TGqpyyBkeu06ORAuU4lwcK5KvqMfbRqBcZ7PNn8bsb3nyY4eOKOZPdkoQfPc+ioXiZ
	JL+Ka8ZVqYatSiqZHMJvhhpJjbg36q9wVTmo63VvoTOdCarWdmolvyfxw0QuCQiHh+J2oEAyqO1Y9
	S0rYhfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0gW-0000000DH63-3auX;
	Thu, 10 Jul 2025 23:28:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxyo-0000000Cwz4-0ygu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:34:55 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4F13D1A9A;
	Thu, 10 Jul 2025 22:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752179662;
	bh=gwm/BETqS9ZCGKtb3EIYk1BW28Lo76No90DkH2szew8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L81CRFpj5oL8/FjSvjjDbUsSOOXdnHVu8kack2zW22u7nofbm1lEVF5x0eiTUFDjt
	 WLg3cH2TO2Qa4TdTTkClKVP7yRjU6EDKQhTngYG+aG+Thfc/ajYbTVncCSbxiFsk0v
	 3SMEKP2/pfKNiWYlE89bTpRajJdUBDbe2BL9fW/s=
Date: Thu, 10 Jul 2025 23:34:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/72] ARM: dts: nxp: imx6qdl-wandboard: Replace
 clock-frequency in camera sensor node
Message-ID: <20250710203421.GC22436@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
 <aHAgHygUe6rWB/TA@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aHAgHygUe6rWB/TA@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_133454_409609_BA245414 
X-CRM114-Status: GOOD (  16.14  )
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

Hi Frank,

On Thu, Jul 10, 2025 at 04:18:39PM -0400, Frank Li wrote:
> On Thu, Jul 10, 2025 at 08:47:02PM +0300, Laurent Pinchart wrote:
> > The clock-frequency for camera sensors has been deprecated in favour of
> > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > the device tree.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > index 26489eccd5fb..e5ac78ffb31c 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
> > @@ -136,8 +136,11 @@ camera@3c {
> >  		pinctrl-names = "default";
> >  		pinctrl-0 = <&pinctrl_ov5645>;
> >  		reg = <0x3c>;
> > +
> 
> unnecessary empty line here

There's often a blank line after the reg property. I don't mind dropping
it here if that's preferred. Same for the other patch you reviewed.

> >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > -		clock-frequency = <24000000>;
> > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > +		assigned-clock-rates = <24000000>;
> > +
> >  		vdddo-supply = <&reg_1p8v>;
> >  		vdda-supply = <&reg_2p8v>;
> >  		vddd-supply = <&reg_1p5v>;

-- 
Regards,

Laurent Pinchart

