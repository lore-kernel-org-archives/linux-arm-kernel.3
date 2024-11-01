Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73769E6B255
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atkj4kmXGUrUUV2EHgMjf22ONdCtUS/VSDuo68tESV0=; b=O4ODnn2AWRv8jLRqqMH4DgwQ+Q
	4q24RPmo5LQzqnaVwn2AKdP8Dev6+5Snam4MDhjEKYsz87BtaeaBZBhdBDzUxXqYkkG7y8r+0niFU
	uPVWz5XBnhR/EiJJg9moSwf69tKi0BCSInmubgM/J6bPPs/DjOsFlj+OOWCR1skflA/lyOi0cSYMa
	hDsVCKD3yxhmU3rUKhS8nkp4KfUZWGH5UKljQYEAJC1tdkUo6QS0EWSuPHGRXLryFEHPG9+yjPRuk
	qpF3KoMjEbfvHb+oQwRlYV4z/vvrDFRxbBZlhb1hTM0SWu4+cW8oyFXxSVNb/KCpYFfT67jS32ALB
	GkPDEOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qro-000000073Fx-0qqq;
	Fri, 01 Nov 2024 12:35:04 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qLE-00000006qIt-1KWe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=atkj4kmXGUrUUV2EHgMjf22ONdCtUS/VSDuo68tESV0=;
	b=VAqWeGe6wWCfF6zc7L4vTs3lxIzieh4GsT6ndyXBLs4JrKifUByOQly0yQxibI
	Tg7S581mnpW5OXqGeFuIxeFsOeFNghJXr70INFJ1Kl86yByeKt+NTSDHGo17K1HO
	Tc2RZ0DFDF+AGSlMjGp+LCrNw9+5J3tLZUgE7hHgDkmSM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3e7AFwyRnKxVjAQ--.13699S3;
	Fri, 01 Nov 2024 20:01:11 +0800 (CST)
Date: Fri, 1 Nov 2024 20:01:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Message-ID: <ZyTDBTxMl9oDkem7@dragon>
References: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
 <ZyTA3WLJ36ZAQyDN@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyTA3WLJ36ZAQyDN@dragon>
X-CM-TRANSID: M88vCgC3e7AFwyRnKxVjAQ--.13699S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4rZr48KF13KrW8WFyDKFg_yoW5JFW3pF
	yUCF18XrsYya10k3sIvFWxJr98t39rXr4xuFWxW347tw4fAFyjgw1xGrs7Wr10vr48Xw4I
	kF13Wr1fKryYqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzc_fUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB6KZWckrmUzrgAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_050124_736213_A75EBDC7 
X-CRM114-Status: GOOD (  15.76  )
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

On Fri, Nov 01, 2024 at 07:51:57PM +0800, Shawn Guo wrote:
> On Thu, Oct 24, 2024 at 12:27:56PM +0200, Dario Binacchi wrote:
> > Add a simple-framebuffer node for U-Boot to further fill and activate.
> > 
> > Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > 
> > ---
> > 
> >  .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> > index 7675583a6b67..3d670534a714 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
> > @@ -4,6 +4,34 @@
> >   */
> >  
> >  / {
> > +	chosen {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		framebuffer-panel0 {
> > +			compatible = "simple-framebuffer";
> > +			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
> > +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> > +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
> > +				 <&clk IMX8MN_VIDEO_PLL1>,
> > +				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
> > +				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
> > +				 <&clk IMX8MN_CLK_DISP_AXI>,
> > +				 <&clk IMX8MN_CLK_DISP_APB>,
> > +				 <&clk IMX8MN_SYS_PLL2_1000M>,
> > +				 <&clk IMX8MN_SYS_PLL1_800M>,
> > +				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
> > +				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
> > +
> 
> Unneeded newline.
> 
> I dropped it and applied the patch.

I replied too quick.

arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi:10.3-10: Warning (ranges_format): /chosen:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)

Shawn


