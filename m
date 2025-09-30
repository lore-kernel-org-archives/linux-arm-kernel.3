Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A4CCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+TKQn+vNq79n4CP4HcYIS9958Ey1sQrX8dyzXTAYc4=; b=MjuxSGv4G5NlSOnyG760rj5wjD
	G3/VUSgoXFMCx11eDU1uU8jxTktHiksrXRIxyb+b8DOOpZ87q6sa6yATC2pXDb4/4V3W1lp9s468w
	85XS8EQkWd9Ox6pMFJgE5jfiBnLs1432U3P2/J7UBMn8tMEHvnSOqgESfWzcRM0iXI6eCTHV3Kb5a
	e2/ZNbo+AwXFGArwQQd+hzc+W3Lv7PdOw19euhfnHqzt5qzMDkN2UpMd0J6hSqARxKrFpz4A0qwSf
	49y+S9wiaeVYThoKsiQvVSbqiZGv+8cwftge6yQ5G5tmoql+saUpY+SJJ1Bj1NF8EnV6mEZoOo6wv
	DbRpu9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3X3P-00000004vXJ-2pxe;
	Tue, 30 Sep 2025 09:53:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3X3M-00000004vWY-2Kce;
	Tue, 30 Sep 2025 09:53:49 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B69642B;
	Tue, 30 Sep 2025 11:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759225935;
	bh=+1+bgW1z4wOHbD9FgqcdV990p4ZQHAphmfT13vG2Hu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqgP9J7jW2PATRQAfmomeMRpYnAl95gk/0YYRoCl0iWyQoy+Et2EJZHsOG6+rO7rO
	 zAUB84+P40dlK/QfStwAtcXz8sB+cltvWyLiiVxQF7HxUwFRfbXC6m3yF3aF+BSAOm
	 fksVDHIk0J6NifdmR2Mpq9ERxyiGE3GoXiKbder8=
Date: Tue, 30 Sep 2025 11:53:39 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Anthony McGivern <Anthony.McGivern@arm.com>
Cc: "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>, 
	"hverkuil@kernel.org" <hverkuil@kernel.org>, "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>, 
	"Kieran Bingham (kieran.bingham@ideasonboard.com)" <kieran.bingham@ideasonboard.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"tfiga@chromium.org" <tfiga@chromium.org>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
Message-ID: <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
References: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_025348_788433_6BF4152F 
X-CRM114-Status: GOOD (  12.95  )
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

Hi Anthony

On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
>
> Hi Jacopo,
>
> On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
> > Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
> > contex. It extends 'struct media_entity_context' and is intended to be
> > extended by drivers that can store driver-specific information
> > in their derived types.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> I am interested in how the sub-device context will handle the Streams API? Looking at the commits the v4l2_subdev_enable/disable_streams functions still appear to operate on the main sub-device only. I take it we would have additional context-aware functions here that can fetch the subdev state from the sub-device context, though I imagine some fields will have to be moved into the context such as s_stream_enabled, or even enabled_pads for non stream-aware drivers?
>

mmm good question, I admit I might have not considered that part yet.

Streams API should go in a soon as Sakari's long awaited series hits
mainline, and I will certainly need to rebase soon, so I'll probably
get back to this.

Have you any idea about how this should be designed ?

Thanks
  j

> Anthony

