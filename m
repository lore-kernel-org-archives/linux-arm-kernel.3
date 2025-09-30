Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005B0CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydKLTPsKquVvITPiVvmwkR6Fuf7eKJp+h06joPt7Wbg=; b=p8e748VZQ5UKnihPUVluYrLA9J
	o8UEwVQJ/8dh+JS+hx2JZW62rhpZWPGsuXuVmyFuYDJri9Sryn40H5VkTTT9xl1FLaR0bjwd1EADX
	lpAiTYsDEEDXot1aP07kmiUEoxMdBmZxTgO4mlJpVZJ7A0EX/96X0/weMO0xbEoOA3gCEe/wgSMWm
	e43aZHFs5s0/WXbdZ4ASn1NWT+JXhZ8UYgCkmSuun2YT/42q+LdoTlGJPS8I+csC7tELeSr4YKlg3
	SPbCG8pfnOVNCGqgbiTi1B/JdCwrnzLipN1lvB/J8ngapozZAzGljJ5A/4ezqJtMM/M+EcQlw8PSL
	Ya4gdUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XPS-00000004yqg-30ZL;
	Tue, 30 Sep 2025 10:16:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XPP-00000004ypv-3stP;
	Tue, 30 Sep 2025 10:16:37 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A43A7982;
	Tue, 30 Sep 2025 12:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759227303;
	bh=JJyuhPS9cvJhhH392NVdpZy5/YDKI9Im/fRJvp2gzYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EB28MsHTRbdEej/CC6YghJ9Eo3P8+FbQJ1UqsMq0WpbxKzf4mwaLmEXwRS+YbJzAk
	 N45+x+jzf8P/Y+kDYqFNhsWhTKcRfuNUYgvUgvOuuc6cU8fzwZzWXTuR/Mnfma8Tn0
	 cd6B1AEJP0lk7qU3NaGOQbbhZfrH+sQM0WOCtodg=
Date: Tue, 30 Sep 2025 13:16:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Anthony McGivern <Anthony.McGivern@arm.com>,
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>,
	"florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>,
	"kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
	"Kieran Bingham (kieran.bingham@ideasonboard.com)" <kieran.bingham@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
Message-ID: <20250930101626.GE25784@pendragon.ideasonboard.com>
References: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
 <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_031636_106901_809776DF 
X-CRM114-Status: GOOD (  20.69  )
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

On Tue, Sep 30, 2025 at 11:53:39AM +0200, Jacopo Mondi wrote:
> On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
> > On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
> > > Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
> > > contex. It extends 'struct media_entity_context' and is intended to be
> > > extended by drivers that can store driver-specific information
> > > in their derived types.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > I am interested in how the sub-device context will handle the
> > Streams API? Looking at the commits the
> > v4l2_subdev_enable/disable_streams functions still appear to operate
> > on the main sub-device only. I take it we would have additional
> > context-aware functions here that can fetch the subdev state from
> > the sub-device context, though I imagine some fields will have to be
> > moved into the context such as s_stream_enabled, or even
> > enabled_pads for non stream-aware drivers?
> 
> mmm good question, I admit I might have not considered that part yet.
> 
> Streams API should go in a soon as Sakari's long awaited series hits
> mainline, and I will certainly need to rebase soon, so I'll probably
> get back to this.
> 
> Have you any idea about how this should be designed ?

Multi-context is designed for memory to memory pipelines, as inline
pipelines can't be time-multiplexed (at least not without very specific
hardware designs that I haven't encountered in SoCs so far). In a
memory-to-memory pipeline I expect the .enable/disable_streams()
operation to not do much, as the entities in the pipeline operate based
on buffers being queued on the input and output video devices. We may
still need to support this in the multi-context framework, depending on
the needs of drivers.

Anthony, could you perhaps share some information about the pipeline
you're envisioning and the type of subdev that you think would cause
concerns ?

-- 
Regards,

Laurent Pinchart

