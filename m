Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67246C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QjcAcsEEHrJSOSCRYWpmi4nBtjqFuR1nRpd26ULcxU=; b=nQVRFBGML+53Bb/hAglCjZGBCj
	BTxmgTp+ItexxdkPXzxsa6GZLUi3lhaa97Yc7zpKfb8QHkTrrN6nfwLFTDW+nvQfHbykiNW2UWzcK
	K3n3NR4yR+hB6eCQm3eTJSVLHUWSA7RhdcxDZ8g9YqleKJelRAnWh3jBvTsd0HImst4tbT6W7jrJs
	T9EctAiSW3/rGD+vuMj4rEXAC1leBtNpprWXUQ5drPWnhAvtNBYt9q/xHmPPb9pOz4TM6AkSPmGwF
	mHXzRbfWFOBgCRu3sZyQCqUdjduZuC1uvEil2cpssm5X5B7cYTLZ1xdeXLjYxcaX5FUlBqUvbuMr0
	hd1io5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UoY-00000002N82-34KL;
	Fri, 04 Sep 2026 14:22:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UoW-00000002N6D-132p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:22:45 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CE05177;
	Fri,  4 Sep 2026 16:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788531667;
	bh=maWBdJuLYCyT6JcoAf1a+wUeBnVCyx7cYqPorvDgB7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9sOpBn/IOAIrlAhZ7k6LdxZAA7KM4Sdu0/b3RlbuB1QFrxrOtVjPYP772r/52GrO
	 w0+BwCGi+S1Z2ti7bAvtb7r/CS43hR+nhoXrUNurzaq2mLn9sPyGqGRphux/K/aRtB
	 rZoJcA5xD/0zmn/rMokATeOSkh029J2JsegKJRXI=
Date: Fri, 4 Sep 2026 17:22:38 +0300
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
Message-ID: <20260904142238.GB795906@killaraus.ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
 <anoerXCIlB8tTgiC@SMW015318>
 <20260810190800.GA3046075@killaraus.ideasonboard.com>
 <antS9HruNMrGbZIc@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <antS9HruNMrGbZIc@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_072244_438355_525AD99D 
X-CRM114-Status: GOOD (  26.41  )
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

On Tue, Aug 11, 2026 at 11:51:00AM -0500, Frank Li wrote:
> On Mon, Aug 10, 2026 at 10:08:00PM +0300, Laurent Pinchart wrote:
> > On Mon, Aug 10, 2026 at 01:55:41PM -0500, Frank Li wrote:
> > > On Mon, Aug 10, 2026 at 09:06:03PM +0300, Laurent Pinchart wrote:
> > > > The clock-frequency for camera sensors has been deprecated in favour of
> > > > the assigned-clocks and assigned-clock-rates properties. Replace it in
> > > > the device tree.
> > >
> > > Remove "clock-frequency" may break back compatiblity.
> > >
> > > A similar case
> > > https://lore.kernel.org/imx/20d37ab7-308e-4f07-96dc-7ae011af76d0@kernel.org/
> > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > >
> > > Need provide judgement in commit message about impact of break ABI.
> >
> > What ABI breakage ? The latest kernel supports the updated bindings
> > (merged in commit aa1826696a55 ("dt-bindings: media: Deprecate
> > clock-frequency property for camera sensors") in v6.18).
> 
> Dts now not only use by kenrel. such as uboot may use the same dts file.
> 
> uboot may still use "clock-frequency". but uboot unlikely use camera. for
> this case, just need mention at commit message
> 
> "lock-frequency property for camera sensor have deprecated since
>  ("dt-bindings: media: Deprecate  clock-frequency property for camera
>  sensors") in v6.18, no known other user like (uboot) use it. So drop
> it safely"

How about the following ?

----
The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties since commit
aa1826696a55 ("dt-bindings: media: Deprecate clock-frequency property
for camera sensors") in v6.18. The Linux kernel ov5645 driver has been
handling the deprecated property as optional since the same kernel
version.

Replace the property in the device tree. There are no known users of the
property outside of the Linux kernel. In particular, U-Boot doesn't
operate the camera. Switching to the new bindings will therefore not
introduce any breakage.
----

If that's fine with you, can you please update the commit message when
taking the patch ?

> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Changes since v1:
> > > >
> > > > - Drop added blank line
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > index ca4cb986efbc..0cc05d084f9b 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> > > > @@ -233,7 +233,9 @@ camera@3c {
> > > >  		pinctrl-0 = <&pinctrl_ov5645>;
> > > >  		reg = <0x3c>;
> > > >  		clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > > -		clock-frequency = <24000000>;
> > > > +		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
> > > > +		assigned-clock-rates = <24000000>;
> > > > +
> > > >  		vdddo-supply = <&reg_1p8v>;
> > > >  		vdda-supply = <&reg_2p8v>;
> > > >  		vddd-supply = <&reg_1p5v>;

-- 
Regards,

Laurent Pinchart

