Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFF4CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N08QOekjMFS77qElrdRGBoBC0kQl2WIV/5iGwqYOqLE=; b=DK4EHMQ36n6/If5KRhp+202W3f
	h4RmkIj4Bt6wdEl76WmeKQ7zgzhfE7oZL9kLzNeEFZJeH4Y4fbyCDt3V933igq8UMfzZ0lUrDAwCd
	Q2lB9bTWci7upDrYlZVKr9J6rC0E7zrM9Wec8hK0s8Jz9BAz/BS4Mqpn5qYAfMdsQavAE0KAl8qdm
	mn0W+cuw5Xj1wL7LTiLMACcQJjBsCl0PXZbg3kAkhGQwPYwYFjTljq01w74+NCq3EEdf/rpoj9Irg
	bMTRlQRx7wq641kKiRws/+Qdt0qUaK0rI0AI0KQFCRIZgz9fsrlurzgLh5spIPp6zrkrRtNzZrvXO
	PHjLVXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAky3-0000000CJEV-1sfj;
	Mon, 20 Oct 2025 08:10:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAky1-0000000CJCg-02wS;
	Mon, 20 Oct 2025 08:10:10 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86690E01;
	Mon, 20 Oct 2025 10:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760947700;
	bh=4iTaVkDVhtqNyH1zPiNke9J2lhCuLxffwy/MAYaW6jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDq9v8OmBd8NMgmv/AVhWufA9zEPAt03EEofP3nB8gL5ziak6gTLDnogdbUkz1REJ
	 AnFFeU7D/Rzswq3Xp878D/Qwu5FVi0Tu6k5ylEcT/PSyQmN/aSss+UZWZ9Hv+an0nz
	 qSm5o+QsyH6WWhrK9M7jq9GhneRzmc96/o+EVpAg=
Date: Mon, 20 Oct 2025 10:09:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Antoine Bouyer <antoine.bouyer@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
Message-ID: <bprg66hg3xoetosl7dwt2rcs6mpcksfalymmyidla6qvdrnm7u@fpn6237j25ir>
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
 <e82e7c1d-b4ac-49a0-9b76-d101395c7040@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e82e7c1d-b4ac-49a0-9b76-d101395c7040@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_011009_231240_BD3EAF3B 
X-CRM114-Status: GOOD (  34.52  )
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

Hi Michael

  thanks for review. I took all comments in but..


On Tue, Oct 14, 2025 at 11:23:29AM +0200, Michael Riesch wrote:
> Hi Jacopo,
>
> Thanks for your efforts!
>
> On 10/14/25 10:00, Jacopo Mondi wrote:
> > [...]
> > +
> > +The uAPI/ABI problem
> > +--------------------
> > +
> > +By upstreaming the metadata formats that describe the parameters and statistics
> > +buffers layout, driver developers make them part of the Linux kernel ABI. As it
> > +sometimes happens for most peripherals in Linux, ISP drivers development is
> > +often an iterative process, where sometimes not all the hardware features are
> > +supported in the first version that lands in the kernel, and some parts of the
> > +interface have to later be modified for bug-fixes or improvements.
>
> Suggestion:
>
> As for most peripherals, ISP driver development in Linux is often an
> iterative process, in which not all of the hardware features are
> supported in the first version. The support for them and/or bug fixes
> may land in the kernel at a later stage.
>
> > +
> > +If any later bug-fix/improvement requires changes to the metadata formats,
>
> s/bug-fix/bug fix
>
> > +this is considered an ABI-breakage that is strictly forbidden by the Linux
>
> s/ABI-breakage/ABI breakage
>
> > +kernel policies. For this reason, any change in the ISP parameters and
> > +statistics buffer layout would require defining a new metadata format.
> > +
> > +For these reasons Video4Linux2 has introduced support for generic ISP parameters
> > +and statistics data types, designed with the goal of being:
> > +
> > +- Extensible: new features can be added later on without breaking the existing
> > +  interface
> > +- Versioned: different versions of the format can be defined without
> > +  breaking the existing interface
> > +
> > +ISP configuration
> > +=================
> > +
> > +Before the introduction of generic formats
> > +------------------------------------------
> > +
> > +Metadata cature formats that describe ISP configuration parameters were most
>
> s/cature/capture
>
> s/most the time/"most of the time" or "typically" or "usually" or
> "normally"?
>
> > +the time realized by defining C structures that reflect the ISP registers layout
> > +and gets populated by userspace before queueing the buffer to the ISP. Each
>
> s/gets/get
>
> > +C structure usually corresponds to one ISP *processing block*, with each block
> > +implementing one of the ISP supported features.
> > +
> > +The number of supported ISP blocks, the layout of their configuration data are
> > +fixed by the format definition, incurring the in the above described uAPI/uABI
> > +problems.
>
> incurring the described uAPI/ABI problems described above.
>

.. this one, for which I think the correct form is

 > +The number of supported ISP blocks, the layout of their configuration data are
 > +fixed by the format definition, incurring in the above described uAPI/uABI
 > +problem.

Thanks
  j

> > +
> > +Generic ISP parameters
> > +----------------------
> > +
> > +The generic ISP configuration parameters format is realized by a defining a
> > +single C structure that contains an header, followed by a binary buffer where
>
> s/an header/a header
>
> > +userspace programs a variable number of ISP configuration data block, one for
> > +each supported ISP feature.
> > +
> > +The :c:type:`v4l2_isp_params_buffer` structure defines the parameters buffer
> > +header which is followed by a binary buffer of ISP configuration parameters.
> > +Userspace shall correctly populate the buffer header with the versioning
> > +information and with the size (in bytes) of the binary data buffer where it will
> > +store the ISP blocks configuration.
> > +
> > +Each *ISP configuration block* is preceded by an header implemented by the
> > +:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
> > +parameters for that specific block, defined by the ISP driver specific data
> > +types.
> > +
> > +Userspace applications are responsible for correctly populating each block's
> > +header fields (type, flags and size) and the block-specific parameters.
> > +
> > +ISP Block enabling, disabling and configuration
> > +-----------------------------------------------
> > +
> > +When userspace wants to configure and enable an ISP block it shall fully
> > +populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> > +bit in the block header's `flags` field.
> > +
> > +When userspace simply wants to disable an ISP block the
> > +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bit should be set in block header's `flags`
> > +field. Drivers accept a configuration parameters block with no additional
> > +data after the header in this case.
> > +
> > +If the configuration of an already active ISP block has to be updated,
> > +userspace shall fully populate the ISP block parameters and omit setting the
> > +V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the
> > +header's `flags` field.
> > +
> > +Setting both the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and
> > +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed and not
> > +accepted.
> > +
> > +Any further extension to the parameters layout that happens after the ISP driver
> > +has been merged in Linux can be implemented by adding new blocks definition
> > +without invalidating the existing ones.
> > +
> > +ISP statistics
> > +==============
> > +
> > +Support for generic statistics format is not yet implemented in Video4Linux2.
> > +
> > +V4L2 ISP uAPI data types
> > +========================
> > +
> > +.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9ac834d212f88222437e8d806800b2516d44f01..340353334299cd5eebf1f72132b7e91b6f5fdbfe 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
> >  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> > +F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
> >  F:	include/uapi/linux/media/v4l2-isp.h
> >
> >  VF610 NAND DRIVER
> >
>
>
> With the comments above addressed,
>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>
> Thanks and best regards,
> Michael
>
>

