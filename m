Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F695C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8ogG/47F4IqO7pbsdC95YUGxWpwo2h49Z+Cc9K66nA=; b=x0diulqPxYnlvX6tEEQIRXKNux
	e/t5n6IumZMzGUWlpiFnLnaDM+JCTxlcr+e356u65ioY+uWa477ruzHvNT7+hPu+sdljO5SeGW/dJ
	f8j/HvJlDUjFAgO8ziEpxXHZ3YAM+fptINg+br0u9k9LdO4F8UGE+DnOloZU2eXh7r0CE0aRXKYHr
	J4DWFH6QuI3OT+UTfL7xx2n0xc2+M7d3wM7iR4o4SKRlQd6z0U6/IuvRG+CkT+Lj3MUMvQnYyFB1h
	WEDA4XbppmJxdu7KHbR6KNCpG+mhwYGjTuP79hCY5xfyB1ZPDJ7tcuyPDkZg7XxmRgisVcWJClVKy
	1eaJuEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9xa-0000000DNkQ-48ob;
	Wed, 30 Apr 2025 16:06:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9vb-0000000DNM9-0TwW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:04:56 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4372564;
	Wed, 30 Apr 2025 18:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746029087;
	bh=2o8KjSOQ0kCQc1hrZro78LxSpcqLmTAbM8i12O3bEpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNiibFZrKRe1wSBLrpTTP3Fe6bNB44rXCsWBXHfcWudkFx6OE4F9cVVAsjIcZqwXL
	 JS1LLfV9gIxTjWH0XMtl32ITUIeHt2olyVtU/XrYHgfwbbilKQ4It2oItrYfr6wMJT
	 2N5qg8xiYa6fl/XxBSSfEssYsqGocb5DpnCEZaEQ=
Date: Wed, 30 Apr 2025 19:04:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Message-ID: <20250430160445.GB31516@pendragon.ideasonboard.com>
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
 <20250430131856.GB25516@pendragon.ideasonboard.com>
 <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_090455_735196_55B88EE3 
X-CRM114-Status: GOOD (  33.08  )
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

On Wed, Apr 30, 2025 at 02:52:01PM +0100, Dave Stevenson wrote:
> On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart wrote:
> > On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, 30 Apr 2025 at 14:58, Niklas Söderlund wrote:
> > > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> > > > frequency and pixel rate") the driver expects two specific
> > > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > > (222750000, 148500000) operation. The driver fails to probe without
> > > > these exact settings.
> > > >
> > > > Update the example in the bindings to match this to make it easier for
> > > > users to incorporate this sensor in their device tree descriptions
> > > > without having to read the driver sources when the driver fails to
> > > > probe.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > > @@ -136,7 +136,7 @@ examples:
> > > >              port {
> > > >                  imx290_ep: endpoint {
> > > >                      data-lanes = <1 2 3 4>;
> > > > -                    link-frequencies = /bits/ 64 <445500000>;
> > > > +                    link-frequencies = /bits/ 64 <222750000 148500000>;
> > > >                      remote-endpoint = <&csiphy0_ep>;
> > > >                  };
> > > >              };
> > >
> > > I guess the link-frequencies property should gain a rule that it
> > > needs two values, too?
> >
> > The driver doesn't require two frequencies (unless I'm mistaken), it
> > could operate with a single one (albeit not in all resolutions), so I
> > don't think we should require two frequencies in the bindings.
> 
> The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
> Add configurable link frequency and pixel rate") and
> imx290_check_link_freqs()

I realized after sending the previous e-mail that I was indeed mistaken.
I thought the driver iterated over the DT link frequencies to check if
they're supported, but it goes the other way around.

> However I'd agree that it'd be better to make the driver accept just
> the one and make any compensations, rather than amend the binding. I'm
> happy to try and find a few minutes to make a patch for that.

That would be nice, thanks.

> My experience of this family of sensors says that we should be able to
> run any resolution at any link frequency, but it needs changes to
> HBLANK to ensure there is sufficient time per line.
> Dropping to the lower link freq for the 720p mode is only because that
> is what the datasheet describes for the precanned HD720p. The window
> cropping mode lists no such requirement, and yet could produce exactly
> that same 720p output.

And with more information about the INCKSEL registers we could possibly
even support other frequencies.

-- 
Regards,

Laurent Pinchart

