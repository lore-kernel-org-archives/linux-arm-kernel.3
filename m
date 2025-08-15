Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61887CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/6Mcw8r3LsssT5hKIfF2I2kyTfi7DM26e0QtcBjbYI=; b=41peC98T9PAay0EfPYSvr8kEsm
	8V5l4cPTfO0t/d3HEDRc3B2Z1QHkcJvo2fJjLqZCap8zj5gfayqj82sTH+F0me4IdEqTlv6sUxSFA
	6fnRWjUwJDXUU3y5UWqFRirE5/9Wgy+0tYLgrVcy+7JvxSjuypX46O/LflSEEqtgiO3GuezjW3iWD
	qfjWX5yyAbOxPlmHwvmER5YU90RqgnhCmiLyCILBLI4b+wvNtvoPI9D+XoedUJX5c28FrydRQEKg+
	XIsL08Vv6rSIAMCFYdPnfAa7E7mGXgs73gTIbZwPyvq5R2CFW+QTJ3f/Rtz0YIjoUnQPt5fxCri9x
	CojUzAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvhi-00000002lIM-2qHy;
	Fri, 15 Aug 2025 14:46:50 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umte1-00000002TSc-3MkM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 12:34:55 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c3M4h4gHNz49PyD;
	Fri, 15 Aug 2025 15:34:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1755261286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/6Mcw8r3LsssT5hKIfF2I2kyTfi7DM26e0QtcBjbYI=;
	b=GlNwJ9iBkw3glbp0ymIiCl63fTe5CZCe5pJslQbr1vG/kkI6fxWrY35JpmCqwJM/nz16Fm
	xaO4q+bYwr8bKDJpEKt9Bvu0jD7j0PIIS8ivY6qOkq2o/C1sN6VdWjgUpg7whIbSqZzxna
	FMpKOUZB1p2uopOxN+j7K+DU98KiqSerX3UkAqzN8OA5cv30EJw1ZEovF9LMAMRulfWy1h
	9Nj51K92Df2RCEoiy0jUZMG1OtIIlLFgqkxwjgty5u03Y+olIueRWSgqsa01iNZjJDg4UV
	9OcuGbzWCHKZJo+8tORvWJF+T3E84YvHGjnp7afMmpZEElhwOlBTaWqsRLLsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1755261286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/6Mcw8r3LsssT5hKIfF2I2kyTfi7DM26e0QtcBjbYI=;
	b=kCSurF1hkNHj6s7D5U303HsLuULSF6jJxI0QR8Z760AtTzH2wH/1ziX34RATtcTI3JsWnp
	c7mbgno8qs7Cib4xDHD7dt2PY5XsZ+U3wC5MFytag8YBNefdASUH5cLFebqlbcYFurUxCE
	nL5aLhJ5xfb9ck9KRZckUHHttQKPMFNN57UBwaqLx1nDrUtf64I7sLWJwGP7+3bq9WlV3Z
	Z46w/oq221jc+bVWPIsxEJI6aI+EI7hR/T/gihUGJecpFLY1IVfaGlCafAlE76zzJETe8a
	IYiVbtm3m7LKNgjoeYYnfqIOp7hfWeIgF1TRCqB6V71EjUh7hr7RfntS1qYJKg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1755261286; a=rsa-sha256;
	cv=none;
	b=pef/pESmcs78EUdIVq28pz9/x/msj/tjvZJmM31B5rDcbrfLkPuYfFKBgocj7pffI6UBmX
	6T/4H592XkX/LWtJJzbqNr87hTY3SMeZonwBikXXrrDPUpIBS1FyafXOb/fsAhtc0J6RYy
	Hlw7K0JPH+qUzxvYGdJGHHmQ3bPuFuKrXI1+FaZ+yr5V+4Nn3i5anqq0ORdONI9ISjT9hW
	b8LtQFgQNwHXMPvIJUcJj2XCoC2nfYU1cCDaSjhFaM3QEQPlSWbOY37lNW87rWnJfDIwY5
	kPHyMOLL6Hjdrrch9pKVm5MQfeeGwdXDVYGs22vNwYG3vdblP6hhP5a3/p6c5g==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CBFB4634C93;
	Fri, 15 Aug 2025 15:33:45 +0300 (EEST)
Date: Fri, 15 Aug 2025 12:33:46 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
 <20250815113633.GM6201@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250815113633.GM6201@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_053454_013241_E52EA79F 
X-CRM114-Status: GOOD (  52.48  )
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

Hi Laurent,

On Fri, Aug 15, 2025 at 02:36:33PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 15, 2025 at 11:25:24AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Fri, Aug 15, 2025 at 01:32:05PM +0300, Laurent Pinchart wrote:
> > > On Fri, Aug 15, 2025 at 09:18:13AM +0000, Sakari Ailus wrote:
> > > > On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> > > > > Although 4 lanes may be physically available, we may not be using all of
> > > > > them. Get the number of configured lanes in the case a driver has
> > > > > implemented the get_mbus_config op.
> > > > > 
> > > > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > Currently, the imx-mipi-csis driver parses the device tree to determine
> > > > > the number of configured lanes for the CSI receiver. This may be
> > > > > incorrect in the case that the connected device only uses a subset of
> > > > > lanes, for example. Allow the drivers for these cameras to create a
> > > > > mbus_config to configure the number of lanes that are actually being
> > > > > used.
> > > > > 
> > > > > If the driver does not support the get_mbus_config op, this patch will
> > > > > have no functional change.
> > > > > 
> > > > > Compile tested against media-master (v6.17-rc1)
> > > > > ---
> > > > >  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
> > > > >  1 file changed, 41 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > index 2beb5f43c2c0..efe4e2ad0382 100644
> > > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> > > > >  	return container_of(sdev, struct mipi_csis_device, sd);
> > > > >  }
> > > > >  
> > > > > +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> > > > > +{
> > > > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> > > > > +			       0, &mbus_config);
> > > > > +	if (ret == -ENOIOCTLCMD) {
> > > > > +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> > > > > +		return 0;
> > > > > +	}
> > > > > +
> > > > > +	if (ret) {
> > > > > +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > > > +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> > > > > +			mbus_config.type);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> > > > > +		dev_err(csis->dev,
> > > > > +			"Unsupported mbus config: too many data lanes %u\n",
> > > > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > > 
> > > There's a bug here, you override the number of lanes retrieved from DT,
> > > which is the number of connected lanes, with the number of lanes used by
> > > the source for its particular configuration. You will never be able to
> > > then use more lanes in a different source configuration.
> > > 
> > > > > +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
> > > > 
> > > > None of the above is really specific to this driver. Could you instead
> > > > implement a function that parses the information from the fwnode endpoint
> > > > and uses mbus configuration on top?
> > > 
> > > That would need to parse the endpoint every time we start streaming, it
> > > doesn't sound ideal.
> > 
> > Perhaps not, but does that matter in practice? Parsing the endpoint is,
> > after all, fairly trivial. The advantage would be simplifying drivers.
> 
> It's trivial from a code point of view, but it's not a cheap operation.
> I'd like to avoid making starting streaming more expensive.

How cheap is "not cheap"? I'd be surprised if parsing an endpoint took more
time than e.g. an I²C register write. Of course it depends on the CPU...

> 
> > Alternatively we could think of caching this information somewhere but I
> > don't think it's worth it.
> 
> Drivers likely need to parse endpoints for other reasons. I'd cache the
> value in drivers, like done today, and pass it to a get_active_lanes
> helper.

Then drivers presumably would also validate this against the endpoint
configuration, wouldn't they? That's extra code in every CSI-2 receiver
driver.

> 
> > > > The function could take struct media_pad pointer as an argument, or struct
> > > > v4l2_subdev pointer and the pad number.
> > > > 
> > > > I wonder if any other parameters could change dynamically but I can't think
> > > > of that now, so perhaps just the number of lanes is what the function
> > > > should indeed return.
> > > > 
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > >  {
> > > > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > > >  	csis_fmt = find_csis_format(format->code);
> > > > >  
> > > > > +	ret = mipi_csis_get_active_lanes(sd);
> > > > > +	if (ret < 0)
> > > > > +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > > +
> > > > >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > > >  	if (ret < 0)
> > > > >  		goto err_unlock;
> 

-- 
Regards,

Sakari Ailus

