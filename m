Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66EEC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtu5AYC+2HBQQqzHNniOotAidzq+BnhVH9Ig4llAsl0=; b=P1ISqn4jPPX6wBZxUTzoDVZxu6
	i1T3ZvL0rW73BRE0LWZ1caYLO/pA7tGqYTohvbUljzcGNYwbyux+ugLYq24YZp/GAW1RX60cauhHA
	Yi0si+OrZxTxGfcfnj0WnIqPq5kII/AnTVI1uy7zWt4wmnEOpVvWQA8r1wHeE3d/qSO2qrq6HLI45
	MSS05e4bjQ82vHvr2nCbFf1vS4oAeZO0OVFRl2ihgsPKvaCV2FxLZg2N0iUY0OiSYdKEdW9LohI3f
	Cugf8NHQ2IZiX4teyzCfjO6K2P9KG1ARt0KQGi5qlnuuNq/XHsz+pogYGJ/kZGa8ntANFJCxuzpha
	i6/dzTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvDR-000000001LF-2kaN;
	Fri, 30 May 2025 08:35:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv7D-000000000N3-3yGy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 08:29:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv71-00076R-2j; Fri, 30 May 2025 10:29:11 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv70-000wlp-2I;
	Fri, 30 May 2025 10:29:10 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv70-000oiP-1q;
	Fri, 30 May 2025 10:29:10 +0200
Date: Fri, 30 May 2025 10:29:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	carlos.song@nxp.com
Subject: Re: [PATCH v2 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
Message-ID: <20250530082910.o5jg7s5ckbm6knms@pengutronix.de>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
 <20250528015837.488376-5-shengjiu.wang@nxp.com>
 <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
 <CAA+D8AMDbenx8scnBZdABAxF8MaYsBRzxXZjgGhMRbCJ-1wwcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMDbenx8scnBZdABAxF8MaYsBRzxXZjgGhMRbCJ-1wwcw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_012923_987491_ED65B808 
X-CRM114-Status: GOOD (  23.57  )
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

On 25-05-30, Shengjiu Wang wrote:
> On Wed, May 28, 2025 at 4:37 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi,
> >
> > On 25-05-28, Shengjiu Wang wrote:
> > > Add WM8962 codec connected to SAI1 interface.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
> > >  1 file changed, 79 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > > index ff6e9ac5477f..da08aaa95904 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > > @@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> > >               enable-active-high;
> > >       };
> > >
> > > +     reg_audio_pwr: regulator-wm8962-pwr {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-max-microvolt = <3300000>;
> > > +             regulator-min-microvolt = <3300000>;
> > > +             regulator-name = "audio-pwr";
> > > +             gpio = <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
> > > +             enable-active-high;
> > > +     };
> > > +
> > >       reserved-memory {
> > >               ranges;
> > >               #address-cells = <2>;
> > > @@ -50,6 +59,21 @@ linux,cma {
> > >               };
> > >       };
> > >
> > > +     sound-wm8962 {
> > > +             compatible = "fsl,imx-audio-wm8962";
> >
> > Out of curiosity did you considered making use of "audio-graph-card2"?
> >
> > The "fsl,imx-audio-wm8962" seems like a pretty simple sound card which
> > could be added via the "audio-graph-card2" as well. Don't get me wrong,
> > it's not wrong what you're doing here but making use of the generic
> > sound card would be nice because it's very common to just copy'n'paste
> > the audio integration from the corresponding evk.dts file.
> 
> Thanks for the suggestion.
> 
> WM8962 has a function .set_pll(), which hasn't been supported in
> audio-graph-card2.  so we still use fsl,imx-audio-wm8962.

Thanks for the explanation.

Regards,
  Marco

