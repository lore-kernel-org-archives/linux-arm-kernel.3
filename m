Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F90E8784B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DyRmtu1RQq8mmyFtwjhtVz4UTigxzR401xkAt/YOC8=; b=o+Yx0oRuG+SKerF9czoy0KvLwG
	4qs30BL19XWXJqhBUjqWL2vWdAgQlFAFmw2k5gebP7h4n59WJqPVcUWKxG+qJGqH7sxOfyZgih8V7
	IHlWht79GnqiwgJ6GyQ0H8cSdpcs3pCt13mmvSbESwkNHMpTqrkF9+Ty0mmxNeB9mVEwGph0EoP2q
	jOqkljF6uv+pw6lJ7k8YI1DxmokqcXPm8AKWYpaZ4BpLkqlL+hFu4zy7Ux4Lbn9iMRiHIC3BVZCfW
	i9BwANts7g97ES9NN+h6FxkRO/qDVq0XJED0j2EqVhz1Wn4a6r9UoxnDQbijvr5fFiCxiegBCATKj
	VKhMij/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJjU-00000006zxN-2AfS;
	Tue, 03 Feb 2026 16:58:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJjS-00000006zwr-1wGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:58:31 +0000
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65D381C6;
	Tue,  3 Feb 2026 17:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770137867;
	bh=NSYPUPZWXDLuCtO39t5GyykpA1ZOhaUNZcwUuf6zVQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n237boGuSEMhCNzRCGdQjcQHn/aGtDAHdOd5l+/pvjqzaosOeZgIUItXQJ6Ro/Zom
	 VP0XrFPNMMrLpIhZpU6E3REhd427vqfHPhwA7NwJ+LPE21LKmpR2KCV90zLWqk8Q6j
	 Vdbibs49jVEfAKte33Yynrx79VudptUKR61QrMEQ=
Date: Tue, 3 Feb 2026 17:58:25 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 03/11] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Message-ID: <aYIguNosvsnnraZO@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-4-antoine.bouyer@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-4-antoine.bouyer@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_085830_641041_706DF70B 
X-CRM114-Status: GOOD (  25.52  )
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

Hi Antoine

On Fri, Jan 23, 2026 at 09:09:30AM +0100, Antoine Bouyer wrote:
> Add driver documentation for V4L2 ISP generic statistics format, mainly
> copied from the generic parameters one.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  .../userspace-api/media/v4l/v4l2-isp.rst      | 42 +++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> index facf6dba1ca7..9024c6998b2c 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> @@ -32,8 +32,8 @@ types.
>  Userspace applications are responsible for correctly populating each block's
>  header fields (type, flags and size) and the block-specific parameters.
>
> -ISP block enabling, disabling and configuration
> ------------------------------------------------
> +ISP parameters block enabling, disabling and configuration
> +----------------------------------------------------------
>
>  When userspace wants to configure and enable an ISP block it shall fully
>  populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> @@ -59,7 +59,43 @@ definition without invalidating the existing ones.
>  ISP statistics
>  ==============
>
> -Support for generic statistics format is not yet implemented in Video4Linux2.
> +The generic ISP statistics format is similar to the generic ISP configuration
> +parameters format. It is realized by defineing a C structure that contains a
> +header, followed by binary buffer where the ISP driver copies a variable number
> +of ISP statistics block.
> +
> +The :c:type:`v4l2_isp_stats_buffer` structure defines the buffer header which
> +is followed by a binary buffer of ISP statistics data. ISP driver shall
> +correctly populate the buffer header with the generic statistics format version
> +and with the size (in bytes) of the binary data buffer where it will store the
> +ISP statistics data.
> +
> +Each *ISP statistics block* is preceded by a header implemented by the
> +:c:type:`v4l2_isp_stats_block_header` structure, followed by the statistics
> +data for that specific block, defined by the ISP driver specific data types.
> +
> +Driver is responsible for correctly populating each block's header fields
> +(type, flags and size) and the block-specific statistics data.
> +
> +ISP statistics block configuration
> +----------------------------------
> +
> +When ISP driver wants to share statistics from an ISP block, it shall fully
> +populate the block statistics and set the V4L2_ISP_STATS_FL_BLOCK_VALID
> +bit in the block header's `flags` field.
> +
> +When ISP driver wants userspace to ignore statistics from an ISP block, it can

What would be the use case here ?

I checked a few datasheet and drivers and I haven't found any "failed
to read stats" bits, and even if that would be a thing, isn't it easier to
simply overwrite the header of the failed stat block instead of
marking it invalid ?


> +simply omit the full block, or set the V4L2_ISP_STATS_FL_BLOCK_INVALID bit in
> +the block headers's `flags` field. Then driver can omit the additional data
> +after header, and set block header's `size` to the header structure's size only
> +in such case.
> +
> +Setting both the V4L2_ISP_STATS_FL_BLOCK_VALID and
> +V4L2_ISP_STATS_FL_BLOCK_INVALID  bits in the flags field is not allowed and
> +userspace shall not handle it.
> +
> +Extension to the statistics format can be implemented by adding new blocks
> +definition without invalidating the existing ones.
>
>  V4L2 ISP uAPI data types
>  ========================
> --
> 2.52.0
>
>

