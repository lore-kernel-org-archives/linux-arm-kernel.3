Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4E6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlakkcoOCjnYwCbOaSnpidLDceoqunl3Hf3duP1nc5E=; b=Plldrywh0ZrrexpIFgY8pVHn3R
	cbd6VaMEGFDZ4tVt2b0eKnL+sEQ2ZsOnO9dxmdIR1zppuLTTOAwCmU+f+gUxyW/Bi+4W9sbXxELoD
	8CD+1pyGjHemwgur8WqodqMYs1eKXAHQ9WOm5jxdmqlKt7lnaO6mqjmdPgsEOQ/ifuJWCsrBc6/pu
	CcQ1JpK+XVizDuU1PQ9hYBT1X9gvm5pSqn+GwBJ5Cf9ZXbf7G1S5fwzz7d32hIhOBHbIoJ0ba81r8
	4TvHX+wxy7HWqPhh5IpRzJfSKUmaNr9+PBeEQbrGgz61H2cimymA0YUUiciqnu73Y96oOShn/jLUa
	sGPpS39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXYP-00000002OTU-285r;
	Fri, 05 Sep 2025 14:36:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTrM-0000000178z-01AJ;
	Fri, 05 Sep 2025 10:40:01 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE792F09;
	Fri,  5 Sep 2025 12:38:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757068725;
	bh=/SlyzfgVaz5SVbHY0pSaBSJpooFqAIbmo2KGxi6A7lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+mJNJ2WN1VUDWHCViREJhjMRCETKXoNXhNDEpstTFTfyNPtbIRFOpHPs94r7JQuY
	 jYFarguhGnF56o+0wsg2oMQKIkA+4f5dJtUwNqZYCckCLQ50eJTLsbjfLhFIqWl5q/
	 Y++NY7IsLJgaow7cQm668/4aaWsPkM8pnInBNF3M=
Date: Fri, 5 Sep 2025 12:39:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/8] media: Introduce V4L2 extensible parameters
Message-ID: <7l6ahcvujnpfqhzqsviwo72oyhenvcqklj4adivx5yv6fmux5o@bzpgpmmtgntc>
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
 <784dcb9e-4e72-44ca-975e-4eb1b0eed5cf@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <784dcb9e-4e72-44ca-975e-4eb1b0eed5cf@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_034000_181185_D3EF148E 
X-CRM114-Status: GOOD (  36.50  )
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

Hello Antoine

On Fri, Sep 05, 2025 at 12:14:39PM +0200, Antoine Bouyer wrote:
> Hi Jacopo
>
> On 20/08/2025 14:58, Jacopo Mondi wrote:
> > Extensible parameters meta formats have been introduced in the Linux
> > kernel v6.12 initially to support different revision of the RkISP1 ISP
> > implemented in different SoC. In order to avoid breaking userspace
> > everytime an ISP configuration block is added or modified in the uAPI
> > these new formats, which are versionated and extensible by their
> > definition have been introduced.
> >
> > See for reference:
> > e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> > 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
> >
> > The Amlogic C3 ISP driver followed shortly, introducing an extensible
> > format for the ISP configuration:
> >
> > 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
> >
> > with a very similar, if not identical, implementation of the routines to
> > validate and handle the ISP configuration in the ISP driver in the
> > c3-isp-params.c file.
> >
> > fb2e135208f3 ("media: platform: Add C3 ISP driver")
> >
> > With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
> > a third user of extensible parameters is going to be itroduced in the
> > kernel, duplicating again in the driver the procedure for validating and
> > handling the ISP configuration blocks
> >
> > https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/
> >
> > To avoid duplicating again the validation routines and common types
> > definition, this series introduces v4l2-params.c/.h for the kAPI
> > and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
> > and Amlogic C3 drivers to use the common types and the helper validation
> > routines.
> >
>
> I'm currently working on another ISP driver: NXP neo, and also use extended
> params so as RkISP1.
>

Nice to hear!

> Using common types looks like really interesting approach. However, only
> params are taken into account, while NXP neo also provides statistics. I'm
> currently testing extended approach for both params AND statistics. But
> v4l2-params only applies to .. params, as stated in the name.
>
> Is there any plan to apply the same to statistics ?
>

Not a proper plan at the moment, but I agree it would indeed be
beneficial to have a similar approach for stats...

Are you suggesting we should drop 'params' at least from the file
names ?

> > If the here proposed approach is accepted, I propose to rebase the Mali
> > C55 driver on top of this series, to use the new common types and
> > helpers.
> >
> > I have been able to test this on RkISP1 but not on C3.
>
> Also tested on NXP neo locally.

Great, could you maybe send a Tested-by tag ?

Also, not sure if you have noticed this series for libcamera
https://patchwork.libcamera.org/project/libcamera/list/?series=5413
where I tried to generalize the extensible param helpers.

Thanks
  j

>
> Best regards
> Antoine
>
> >
> > Thanks
> >    j
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Changes in v4:
> > - Fix the definition of V4L2_PARAMS_FL_PLATFORM_FLAGS
> > - Add __counted_by() attribute to the data[] flexible-array member of
> >    v4l2_params_buffer
> > - Minor style change
> > - Link to v3: https://lore.kernel.org/r/20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com
> >
> > Changes in v3:
> > - Rebased on latest media-committers/next
> > - Take in Dan's suggestion in block size validation
> > - Documentation minor spelling fixes
> > - Link to v2: https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com
> >
> > Changes in v2:
> > - Make v4l2_params_buffer directly usable
> > - Centralize ENABLE/DISABLE flags definition and validation
> > - Take in Dan's v4l2_params_buffer_size()
> > - Allow blocks to only contain the header if they're going to be
> >    disabled
> > - Documentation fixes as reported by Nicolas
> > - Link to v1: https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com
> >
> > ---
> > Jacopo Mondi (8):
> >        media: uapi: Introduce V4L2 extensible params
> >        media: uapi: Convert RkISP1 to V4L2 extensible params
> >        media: uapi: Convert Amlogic C3 to V4L2 extensible params
> >        media: Documentation: uapi: Add V4L2 extensible parameters
> >        media: v4l2-core: Introduce v4l2-params.c
> >        media: rkisp1: Use v4l2-params for validation
> >        media: amlogic-c3: Use v4l2-params for validation
> >        media: Documentation: kapi: Add v4l2 extensible parameters
> >
> >   Documentation/driver-api/media/v4l2-core.rst       |   1 +
> >   Documentation/driver-api/media/v4l2-params.rst     |   5 +
> >   .../media/v4l/extensible-parameters.rst            |  89 ++++++
> >   .../userspace-api/media/v4l/meta-formats.rst       |   1 +
> >   MAINTAINERS                                        |  10 +
> >   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 263 ++++++----------
> >   .../media/platform/rockchip/rkisp1/rkisp1-params.c | 349 +++++++++------------
> >   drivers/media/v4l2-core/Makefile                   |   3 +-
> >   drivers/media/v4l2-core/v4l2-params.c              | 126 ++++++++
> >   include/media/v4l2-params.h                        | 164 ++++++++++
> >   include/uapi/linux/media/amlogic/c3-isp-config.h   |  48 +--
> >   include/uapi/linux/media/v4l2-extensible-params.h  | 146 +++++++++
> >   include/uapi/linux/rkisp1-config.h                 |  67 ++--
> >   13 files changed, 817 insertions(+), 455 deletions(-)
> > ---
> > base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> > change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b
> >
> > Best regards,

