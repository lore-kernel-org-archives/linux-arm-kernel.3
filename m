Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43B2C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbDkeRrN0UthwC+qUito6xtMZZcBi/uyJO7W7ZyTn8M=; b=DONaPMCIivXncTPrNzU672td4j
	uVBZe9JMZoXcqbAzGV+qX3P4SjmXFuBSY7VOYsIz3Dbyx15qhG8EOGBGSoIievT6lm1TgoQkGcY4J
	vIkkyIN9kzwWeMMZhVdekDa3X+N2Hc1mRsdpgEdLLgfH4X/2K6nhB8nmPHBYbfhYl5SRYUC9/rsN7
	noQXA9Rh+mee9FIVhCUGpIHQVBqRaR5mNtv8PIdgJ8MYmgtYKZ2W4Ql9eiRNoNWzBmKr4nP0kW42x
	27yenXTMhSp83NHQ9xDE4um7q+XyOF0KGLzNL3CNYcH/X/2lJ5N3HcFFNyk5lgCCFKzYSMvwTHmxt
	BNYRUf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7sX-00000001PJn-3rd3;
	Thu, 20 Feb 2025 14:50:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7hy-00000001MXM-468z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:39:24 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 716881193;
	Thu, 20 Feb 2025 15:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740062274;
	bh=iLN8B9ksN1GWWVoWVQYBbBJYJyiBr+s/2FAxSdsnkwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ix5yJ1MNLbToTzjhWXv1kPGV+NribVBMxOfjCISY3kBKoor1qeqmue2KOaVn9Elun
	 yAZX8xvnBq34+BFHbklcx77G6lqUeyCL8CqExMt9c4jWKJkpp8weUbzT0+S/9pMA3+
	 iAhC+RUnOTS7ms8NZiaJSnCW2R9nxIGz2uGKgKfY=
Date: Thu, 20 Feb 2025 16:39:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Message-ID: <20250220143902.GA17500@pendragon.ideasonboard.com>
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
 <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
 <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_063923_148698_3BDC271A 
X-CRM114-Status: GOOD (  37.17  )
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

On Thu, Feb 20, 2025 at 02:16:51PM +0000, Sakari Ailus wrote:
> On Thu, Feb 20, 2025 at 03:01:41PM +0200, Cosmin Tanislav wrote:
> > On 2/20/25 1:38 PM, Jacopo Mondi wrote:
> > > On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
> > > > Currently, the v4l2_subdev_state_xlate_streams() function is used
> > > > to translate streams from one pad to another.
> > > > This function takes the entire subdev state as argument, but only makes
> > > > use of the routing.
> > > 
> > > Correct, but is this a problem ?
> > > 
> > 
> > No, it's not a problem.
> 
> I think I have a slight preference to keep the pattern of referring to the
> state as other functions do.
> 
> I wonder what Laurent and Hans think, too.

I agree, I think the state should be passed everywhere. This lowers the
risk of subsystem-wide refactoring if a function that receives a pointer
to part of a state (such as v4l2_subdev_routing_xlate_streams()) is
later found to need more information from the state.

The situation would be different if the states were not monolithic, for
instance if the routing table could be locked separatly from other parts
of the state, but that's not the case and I don't foresee moving to
finer-grained objects.

> > > Is this the first step for a larger rework or is this a drive-by
> > > beautification ?
> > 
> > Mostly a drive-by beautification to avoid passing the whole state around
> > where we only need the routing. I'm planning to submit drivers for more
> > GMSL2/3 chips and we're using this just to not pass the whole state
> > around. I think I can just use v4l2_subdev_state_xlate_streams(),
> > but I had these patches in my tree and it would have been good to get
> > them upstream, in preparations for submitting the GMSL2/3 drivers.
> > 
> > > I'm asking because (and I know it's hard to strike a balance) this
> > > kind of changes tend to make back-porting a more painful, and if
> > > only justified by "it looks better" I would be a bit hesitant in
> > > taking them.
> > > 
> > > > Introduce a v4l2_subdev_routing_xlate_streams() function which can be
> > > > used without the entire subdev state, to avoid passing the entire state
> > > > around when not needed.
> > > > 
> > > > Convert all usages of v4l2_subdev_state_xlate_streams() to
> > > > v4l2_subdev_routing_xlate_streams().
> > > > 
> > > > Remove v4l2_subdev_state_xlate_streams().
> > > > 
> > > > V2:
> > > >    * Fix description of parameters
> > > > 
> > > > Cosmin Tanislav (3):
> > > >    media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
> > > >    media: use v4l2_subdev_routing_xlate_streams()
> > > >    media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
> > > > 
> > > >   drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
> > > >   drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
> > > >   drivers/media/i2c/max96714.c                  | 16 ++++++-------
> > > >   drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
> > > >   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
> > > >   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
> > > >   drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
> > > >   include/media/v4l2-subdev.h                   | 10 ++++----
> > > >   8 files changed, 53 insertions(+), 47 deletions(-)

-- 
Regards,

Laurent Pinchart

