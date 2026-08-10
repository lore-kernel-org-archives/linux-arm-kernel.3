Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C927C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3Bh3NJf3rCOPgWQ5f4HdFK7uWZYvnbQa0t/yxL+Gns=; b=FJNQ2Z0oL8sgJA3MMyqM7z/ovD
	INOUSvLNksa/+aJH7AYHG7AAyYKWlvnpP6OSouOKXapqBGui0Y1ix/7B2C4nlUJdZ3+oltvMVB734
	WBLqfhhBmjkxUrC6b1IFSSWrpkSxeHOutZrkeLPp7t7K5DGqvEhBIVLymm1Bu7bL3y/S69gGmmk2q
	bjLNs5/lBFU3iEQ3d7+ESXH3RUMQ8BvzKAkwbSpkkLnT4DJFtxbP+fExUhMNIpUF57rFYjC1tErmJ
	6WZcoGpaLij7h/4AU82l4IoALF6B+wUDE5FYhRJHkZC0fth2ZKfu1koi1NgApBJKaznQRSHK1O8w+
	kGgtk0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVLz-0000000Ci1N-3CsQ;
	Mon, 10 Aug 2026 19:08:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVLx-0000000Ci0S-2v1W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:08:07 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 301CFBB;
	Mon, 10 Aug 2026 21:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786388808;
	bh=YCD8HcEbS+FxeNcV5DFf41UK3cMSUjhcxM/ZFXnWEHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItX0Fu+QMKOQQW0pRKRRp8VdpUUM8PNxp9yxk5cc1dbCOV2KAgXMleEkoH+6lSjHt
	 eLWMlNNQ/69P0MUJwr0R4me0BjUh5hWZRaOgynvODjnF8Pud9w9cYSUauYElN+Rfoz
	 FnmEIZJYAdbFUcDgEOkUoZV9GgQuSE6fO0vdujKg=
Date: Mon, 10 Aug 2026 22:08:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace
 clock-frequency in camera sensor node
Message-ID: <20260810190800.GA3046075@killaraus.ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
 <anoerXCIlB8tTgiC@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anoerXCIlB8tTgiC@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_120805_902690_17F7C7AB 
X-CRM114-Status: GOOD (  17.09  )
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

On Mon, Aug 10, 2026 at 01:55:41PM -0500, Frank Li wrote:
> On Mon, Aug 10, 2026 at 09:06:03PM +0300, Laurent Pinchart wrote:
> > The clock-frequency for camera sensors has been deprecated in favour of
> > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > the device tree.
> 
> Remove "clock-frequency" may break back compatiblity.
> 
> A similar case
> https://lore.kernel.org/imx/20d37ab7-308e-4f07-96dc-7ae011af76d0@kernel.org/
> https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> 
> Need provide judgement in commit message about impact of break ABI.

What ABI breakage ? The latest kernel supports the updated bindings
(merged in commit aa1826696a55 ("dt-bindings: media: Deprecate
clock-frequency property for camera sensors") in v6.18).

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Drop added blank line
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > index ca4cb986efbc..0cc05d084f9b 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > @@ -233,7 +233,9 @@ camera@3c {
> >  		pinctrl-0 = <&pinctrl_ov5645>;
> >  		reg = <0x3c>;
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

