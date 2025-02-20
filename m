Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD662C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3Uh5zOOiwIsld8+v+RjgUqYTcZEPZGI2jscvOAId7s=; b=CL7cu/KTb5cDUVr2npX8wo2MU7
	dFnhsjs2BzeJz8XVT9IMFi/oMAWKEknDTJfclBFGzgJT0tt8cabZHqDLdySLfyxcZp18Xd57a4WBL
	SqpsxBFmk71eLt3aIrJepTDnBGklN2Gfc6BGaRGeS5JkTt7QgZljqs6P78EH/fq5HW72ol0xMf0Ka
	61zfj6PuTjFjHwhu5mEh92fBm5qCMTzJcYFAhCqxCgkeT5n54tW1NuVYNiyh4ZonFUO0t6YtVGw7B
	HnTc1heIWmX/CocfQ0Gvotu9korXeI6oQtTndQA7WVCTyKR8kMcQrGjy5FxsxmDIKQofs3gLTYbL+
	/csKpEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4uO-00000000bWt-2hlK;
	Thu, 20 Feb 2025 11:40:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4st-00000000b4n-1qA4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 11:38:28 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5799074C;
	Thu, 20 Feb 2025 12:36:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740051415;
	bh=xlLl1DJawLisfXNM+nY3LWGqJWif1fFYtqrXN7NQV9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKwk5ZKUmbL7p+4UlYHMd9yLoF+qhwDfO0XI15X3Y/17FQw11Lyfn8Kw7Vu8ZJV3D
	 fL9TUKSCylYI7F86cDZtGiMbY+Rdwp9hz2A2cjAlcVR9dUHs34BbpXuJc7B36waG6K
	 KP2QE64oFCS07JtT6hLnotuPVhTLCfhOAlktIsy0=
Date: Thu, 20 Feb 2025 12:38:15 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>, 
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
Message-ID: <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
References: <20250220092036.6757-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220092036.6757-1-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_033827_606683_504F441D 
X-CRM114-Status: GOOD (  18.95  )
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

Hi Cosmin

On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
> Currently, the v4l2_subdev_state_xlate_streams() function is used
> to translate streams from one pad to another.
> This function takes the entire subdev state as argument, but only makes
> use of the routing.

Correct, but is this a problem ?

Is this the first step for a larger rework or is this a drive-by
beautification ?

I'm asking because (and I know it's hard to strike a balance) this
kind of changes tend to make back-porting a more painful, and if
only justified by "it looks better" I would be a bit hesitant in
taking them.


>
> Introduce a v4l2_subdev_routing_xlate_streams() function which can be
> used without the entire subdev state, to avoid passing the entire state
> around when not needed.
>
> Convert all usages of v4l2_subdev_state_xlate_streams() to
> v4l2_subdev_routing_xlate_streams().
>
> Remove v4l2_subdev_state_xlate_streams().
>
> V2:
>   * Fix description of parameters
>
> Cosmin Tanislav (3):
>   media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
>   media: use v4l2_subdev_routing_xlate_streams()
>   media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
>
>  drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
>  drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
>  drivers/media/i2c/max96714.c                  | 16 ++++++-------
>  drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
>  include/media/v4l2-subdev.h                   | 10 ++++----
>  8 files changed, 53 insertions(+), 47 deletions(-)
>
> --
> 2.48.1
>
>

