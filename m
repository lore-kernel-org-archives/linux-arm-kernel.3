Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E043C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCTmPr0jzKHoZl86DcvtgrtrgnH2xMGSk1hygEEwuEQ=; b=4DEWdkmRFKZ4VyvjE2a83pPxej
	4nmTNuiWrTFkMAfSxODmW2SyIhEg0dkV87nq8pXxohiswW/LJKCtxY2k5afDSUsvzcHE9R5709oZ5
	5qsJo0pDQciE6Q/2FtZ7XEZgvxUKQsBn4iOrMORfUFUwHXWkl/Te0i9THlWC6XmEZCrRqtB5xPNYw
	ViZseex2NOsuXpTCRON4K1slchHyy8ctUqKmZyfLpxk0ZgBE5nFPY5LeIfUXHvb+UYY9Yo0oqjrMJ
	OZ++gjPy95Xv5Vnenr+G9kiolR1OUcAHb/9XWYustIuVkBarDl5LB4Viht7RLCihVgg6kIcRPYazL
	fnsgeIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7Q1-0000000CzGN-3EiM;
	Wed, 30 Apr 2025 13:24:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7L7-0000000CyXX-2vWe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:19:06 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB74B725;
	Wed, 30 Apr 2025 15:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746019138;
	bh=+KDMROeZ7s2Cm69JjTcB0iiwQi3LCIays5wrt+DL+54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPgxb5rNDjCja/gJ/JzZAhyFLTOSdfvLt5dsGvPcqtK3GSuXLyAWVGTiVBVaJmyhF
	 dn78rUIFB7tfNKFwmkIq/a4deEGgyuafznT9K9TJtGUPPpscw0h3Qi1+fbFTP3v+mF
	 GZ752b/wV8H4awC207Yfs7s+iI3JPkFABM2DRBNw=
Date: Wed, 30 Apr 2025 16:18:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Message-ID: <20250430131856.GB25516@pendragon.ideasonboard.com>
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_061905_872399_06F2713A 
X-CRM114-Status: GOOD (  20.08  )
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

On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> On Wed, 30 Apr 2025 at 14:58, Niklas Söderlund wrote:
> > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> > frequency and pixel rate") the driver expects two specific
> > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > (222750000, 148500000) operation. The driver fails to probe without
> > these exact settings.
> >
> > Update the example in the bindings to match this to make it easier for
> > users to incorporate this sensor in their device tree descriptions
> > without having to read the driver sources when the driver fails to
> > probe.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > @@ -136,7 +136,7 @@ examples:
> >              port {
> >                  imx290_ep: endpoint {
> >                      data-lanes = <1 2 3 4>;
> > -                    link-frequencies = /bits/ 64 <445500000>;
> > +                    link-frequencies = /bits/ 64 <222750000 148500000>;
> >                      remote-endpoint = <&csiphy0_ep>;
> >                  };
> >              };
> 
> I guess the link-frequencies property should gain a rule that it
> needs two values, too?

The driver doesn't require two frequencies (unless I'm mistaken), it
could operate with a single one (albeit not in all resolutions), so I
don't think we should require two frequencies in the bindings.

-- 
Regards,

Laurent Pinchart

