Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E5FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyXNjuHLnx3cU+qPnE9MNm9qjAiojX2ux1nNWDZm2TY=; b=csxT2lQEri2xe+t9vc/sW4QM+g
	GB0e6C5SNS+M80wVPtTNspQHQtq3GABaHL1S1rOaYYODQN5XWKQPYqFzL6ABTRH30SwDPOn/ZaCt8
	AcVyBLQMUQZJpqWykAfb/S9Tao9tX3p00XTRtskBJvZ3lKVTsrF/y5vO5pPgZG8MO9tSgc8+gIKvA
	BlxfGP1RX2sPkX13MAtMyVX/kXyaXHTZfUeRHX2DkHMFHh/SVXqVxFXaAoDbpmOpnHZtLZob61MM7
	aRpjjbo3C36xIy9zcsH1orsCuF4QoLfwpqc1xb0kASG0aGtVO4uoo4e9EfOYOlhzO9JNmu4RVXZsW
	G3lAG2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIav-0000000CFST-0TJM;
	Thu, 06 Mar 2025 21:17:29 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIXQ-0000000CEha-3t2r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 21:13:54 +0000
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Z82GN1hW5z49Q16;
	Thu,  6 Mar 2025 23:13:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1741295629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RyXNjuHLnx3cU+qPnE9MNm9qjAiojX2ux1nNWDZm2TY=;
	b=QHKpVznW8iOM4SSfMfAUzcBerrMwpo5ndWtah6O0FYF5U5qIavbQWW0yuVdXBWA1duZfPG
	/tPNUGI/434peavUNxEA2kX3HSOY9FIMbXWNYSAPJKQdVQ7rgoY+fQnCfgOk1SxxG1BHxc
	23NY7Y6H0hyhzO6u2omYlpkPPM/s6q9LNlrxIWndp5uz99rOSfAxRhvL92OD3YWvxGpy0U
	YJ+iPeMNPhJGbqwzzEa0omqYpudmdFN7+Jp4Lz2X86ldR8Sx94xeFlvOhcwhj0cd/io67F
	W3As/b7mzHhPVyiTFykzsK9o4FIFi5weN9IMheju33jYHCZVd+/nB9nx3wAnZg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1741295629; a=rsa-sha256;
	cv=none;
	b=odHNYxXjVxIMvfaBsNyalVkmcTcgedlDXyrhQhsDLMI56nvguJdnH9gEt1w0TSUd5UJwJ5
	cLwunozpTjPqWC33xOmxa/EE8rfzQLM4rGvYTc1+ziYvrPJT8zjsyTyAjcQIgQDBDKDQ0L
	jRAhQ39xD6luECNolcTi0pLdNZGO6cRihpAnNXEKq96nd+JY72TWHGwqDGY+1y2PKVGStZ
	o3ed7haqNQr3UlHxrQByRgXhgZlI+WQZQUJQPlQ6N8P7y7EkBGzgsu/B5PmeLS9iNA9uUE
	W98onpkBkWErJ2mECRo0vso+TTrKHKPeeyjv4vfFPSP8hlvPhtE+M210UOlhGg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1741295629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RyXNjuHLnx3cU+qPnE9MNm9qjAiojX2ux1nNWDZm2TY=;
	b=eJzhBEsC+Ytpu13kBlhPZecQyJnWw45qF0/4DHv8VDb+WsOQoiPKvwZDprykmqqd61Tk+W
	M+/yFaW2nLr3dI+hzkbXgNlIy9WkyjULc0TMPcNPEMWS1lXV2mSQ4gQ//71LERkXyEX8kg
	GhY/y6YffUbBlB9s8lCfVY3pv0nsFw92Y/OGVWeOF1vBNetpA0guOfq0liwMN9VIX80QII
	28OgfEKAcYtP8Y69c/6tJkOGvVGjnrB5Vp8xOPj1J7errMK189/gEl57RcyvZN9uuyNTdS
	5XDgw/x4K0wal3SYfTSUdf4YF8qd2ViDIDxaIeWS09XUPFBG6jdm3zJfi3yDeg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 095B1634C93;
	Thu,  6 Mar 2025 23:13:47 +0200 (EET)
Date: Thu, 6 Mar 2025 21:13:46 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mathis Foerst <mathis.foerst@mt.com>, linux-kernel@vger.kernel.org,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v1 1/1] media: imx: csi: Parse link configuration from
 fw_node
Message-ID: <Z8oQCuqKVH225lPw@valkosipuli.retiisi.eu>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
 <20250305113802.897087-2-mathis.foerst@mt.com>
 <Z8nOTrjEW_OYBGlq@valkosipuli.retiisi.eu>
 <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84aa2d87-d7f1-46c9-b28d-6f0e9a78788d@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_131353_139079_ED44D63C 
X-CRM114-Status: GOOD (  44.20  )
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

Hi Dan,

On Thu, Mar 06, 2025 at 10:07:20PM +0300, Dan Carpenter wrote:
> On Thu, Mar 06, 2025 at 04:33:18PM +0000, Sakari Ailus wrote:
> > Hi Mathis,
> > 
> > Thanks for the patch.
> > 
> > On Wed, Mar 05, 2025 at 12:38:02PM +0100, Mathis Foerst wrote:
> > > The imx-media-csi driver requires upstream camera drivers to implement
> > > the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
> > > implement this function are not usable on the i.MX6.
> > > 
> > > The docs for get_mbus_config [1] say:
> > > @get_mbus_config: get the media bus configuration of a remote sub-device.
> > >             The media bus configuration is usually retrieved from the
> > >             firmware interface at sub-device probe time, immediately
> > >             applied to the hardware and eventually adjusted by the
> > >             driver.
> > > 
> > > Currently, the imx-media-csi driver is not incorporating the information
> > > from the firmware interface and therefore relies on the implementation of
> > > get_mbus_config by the camera driver.
> > > 
> > > To be compatible with camera drivers not implementing get_mbus_config
> > > (which is the usual case), use the bus information from the fw interface:
> > > 
> > > The camera does not necessarily has a direct media bus link to the CSI as
> > > the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
> > > between them on the media pipeline.
> > > The CSI driver already implements the functionality to find the connected
> > > camera sub-device to call get_mbus_config on it.
> > > 
> > > At this point the driver is modified as follows:
> > > In the case that get_mbus_config is not implemented by the upstream
> > > camera, try to get its endpoint configuration from the firmware interface
> > > usign v4l2_fwnode_endpoint_parse.
> > > For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
> > > V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
> > > configuration.
> > > For all other mbus_types, return an error.
> > > 
> > > Note that parsing the mbus_config from the fw interface is not done during
> > > probing because the camera that's connected to the CSI can change based on
> > > the selected input of the video-mux at runtime.
> > > 
> > > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> > > [1] include/media/v4l2-subdev.h - line 814
> > > 
> > > Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> > > ---
> > >  drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
> > >  1 file changed, 32 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > > index 3edbc57be2ca..394a9321a10b 100644
> > > --- a/drivers/staging/media/imx/imx-media-csi.c
> > > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > > @@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > >  {
> > >  	struct v4l2_subdev *sd, *remote_sd;
> > >  	struct media_pad *remote_pad;
> > > +	struct fwnode_handle *ep_node;
> > > +	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> > 
> > Are there any defaults in DT bindings (other than 0's)? Also initialising a
> > field to zero this way is redundant, just use {}.
> > 
> 
> I was going to respond in much the same way.  This is equivalen to:
> 
> struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };

Thinking about this in a context of parsing the endpoint, in fact the
bus_type should be specified. Presumably the hardware is D-PHY, so the
correct value would be V4L2_MBUS_CSI2_DPHY. This way
v4l2_fwnode_endpoint_parse() doesn't need to guess.

> 
> > >  	int ret;
> > >  
> > >  	if (!priv->src_sd)
> > > @@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > >  
> > >  	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
> > >  			       remote_pad->index, mbus_cfg);
> > > -	if (ret == -ENOIOCTLCMD)
> > > -		v4l2_err(&priv->sd,
> > > -			 "entity %s does not implement get_mbus_config()\n",
> > > -			 remote_pad->entity->name);
> > > +	if (ret == -ENOIOCTLCMD) {
> > 
> > 	if (!ret)
> > 		return 0;
> > 
> > And you can unindent the rest.
> 
> I was going to say this too but then I thought actually this needs to
> be:
> 
> 	if (ret != -ENOIOCTLCMD)
> 		return ret;
> 
> Which is weird.  Better to break all the new code into a separate
> helper function.
> 
> 	if (ret == -ENOIOCTLCMD)
> 		ret = parse_fw_link_config_stuff();
> 
> 	return ret;

Indeed. get_mbus_config() presumably wouldn't return an error but
correctness is usually a good idea.

-- 
Regards,

Sakari Ailus

