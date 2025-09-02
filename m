Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B5CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9QRj2oillD5HFFVDl5mC6T9f0hZKrwjC1B4Kps+QT0=; b=goz6ujzY53LLU4j8BhTUVcAHZL
	tF60gCVx5OP6Jiq+FCUW6gn3zAFPr9/uJLNRR0geqfznq4kA7pzL66mWDd9dTz8NJhB9pSkql9MVV
	JpjIoqB6N9hJUpVM2VJ5AC7Zt6fZ2VFzTyYcCgwxz0L88/73KBpwl3LWXtDLUdpRNnjjQRtxJdmiT
	2/Ch0Y6BPQiSa9JT7e7mldWF/yA3R0d70/iRXCqUtToat9tooRuKOEbAUEqnkaeGuZ70+iE12IpoK
	/2TgoPMObWDpY4JlFkMwuSSmJgcSC2AKpRyuut50sm7lC2wSkJz0KRIoYVWiUCPoTGTvKd9cNtn4V
	HMnU1u8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMvH-0000000GF7Z-1zZO;
	Tue, 02 Sep 2025 09:03:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMYo-0000000G77P-0u3o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:40:15 +0000
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 16AAE8D4;
	Tue,  2 Sep 2025 10:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756802345;
	bh=uW30a3YGTsj0W+a1T1uBxXtDwEFQcaARUE4pQoMLTho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4QJEfV44G6twamlObXx/YUAwG4jsdoQmQZ0+PVfIeC6qznJSEbkOUgh5TP82K8+b
	 UwpKKOye4Z3lvjYOeQqzYHikdnDKSG33TVMIx+RPavpwIDV8wV3s+knDCyOJkenzoq
	 7/OeHc9NAmbQ2L0duFwCNJGHXztiyUQ1oiQ51X3k=
Date: Tue, 2 Sep 2025 10:39:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Explicitly
 release reset
Message-ID: <20250902083952.GE13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-3-67964d1471f3@nxp.com>
 <20250901153632.GA13448@pendragon.ideasonboard.com>
 <AS8PR04MB9080AD8135277660ACE41FF0FA06A@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080AD8135277660ACE41FF0FA06A@AS8PR04MB9080.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_014014_396937_DCAB7980 
X-CRM114-Status: GOOD (  27.47  )
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

On Tue, Sep 02, 2025 at 02:21:58AM +0000, G.N. Zhou wrote:
> On Monday, September 1, 2025 11:37 PM, Laurent Pinchart wrote:
> > On Mon, Sep 01, 2025 at 02:25:31PM +0800, Guoniu Zhou wrote:
> > > Call reset_control_deassert() to explicitly release reset to make sure
> > > reset bits are cleared since platform like i.MX8ULP can't clear reset
> > > bits automatically.
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402
> > > 100644
> > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > @@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)  {
> > >       int ret;
> > >
> > > -     /*
> > > -      * these are most likely self-clearing reset bits. to make it
> > > -      * more clear, the reset-imx7 driver should implement the
> > > -      * .reset() operation.
> > 
> > What happened to this plan, would it be feasible to implement the
> 
> Since reset in ULP isn't self-clearing, so need to release the reset before return.
> And I think it's no side effect to call reset_control_deassert() here since it makes
> more clear and readable about software reset implementation.
> 
> > .reset() operation in the relevant drivers to be able to use
> > reset_control_reset() here ?
> 
> Implement the .reset() operation in in the relevant drivers should have same effect
> like here. If you agree, I prefer to use the patch here since less changes usually mean
> low risk.

I'm OK with that.

> > > -      */
> > >       ret = reset_control_assert(state->rst);
> > >       if (ret < 0) {
> > >               dev_err(state->dev, "Failed to assert resets: %d\n", ret);
> > >               return ret;
> > >       }
> > >
> > > -     return 0;
> > > +     /* Explicitly release reset to make sure reset bits are cleared. */
> > > +     return reset_control_deassert(state->rst);
> > >  }
> > >
> > >  static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
Regards,

Laurent Pinchart

