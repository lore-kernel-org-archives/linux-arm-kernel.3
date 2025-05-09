Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE14C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhejNasXHjZFkWYaBIZfkr92XVjLclygAFZwyGYd4So=; b=W0U76i5gsAeQqg3hxqXweeog8H
	ALdAQuWqrMyh3kA8YlzgWLB5HLL9Ata0QWIYnDvlDUahD1sIXMAQq0jUXYz55WYKZkiO8MvBPFKhT
	qsQc/T1zySAbqgnOfYCuaEQ+513Air3NoWfj2vZHOK3FfoqAH8R66YiQfUNgFs8klb+RWy/56/aCe
	ToyeZ9VaX84U8+LDJUDi/HE2+gntuQZQi6slzWvxTVxFZtHiZieRELqbwlkuV8LG1tTjo6SRsm59C
	8mVhiLKmlMrXr05/jo7wCSQi6ccNEPtdcdcMZBGWB/j3AKsLLpJwdlxSKyGi6G7OfZ58hdW3rwByy
	MEIsduSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKZ5-00000003C7Y-0tkC;
	Fri, 09 May 2025 10:02:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJps-000000034Ff-1Oj3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:16:05 +0000
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97B469E5;
	Fri,  9 May 2025 11:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746782145;
	bh=Nzp7Wep8Y5IgzGQsgim/aXZAWeqc1yrcDR56R8R6neg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnhXNAe4+sQfEgDOYkMYiKQG10FLE2tSDxTvsnAGxsddsbfvD1Ly5Cg2/LAQG5fy6
	 mCH2GkSBchnxZ+2EpRMQyHeI11oLHccol1/E0za+t/v/tkSnMIAlLuFIN5KA4gjtuO
	 2ikPLDUA9kHtnRaptsLtts78lk6gOq4/dsUh8ZXE=
Date: Fri, 9 May 2025 11:15:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
Message-ID: <20250509091549.GD28896@pendragon.ideasonboard.com>
References: <m3plgi9pwu.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3plgi9pwu.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_021604_506939_EA006473 
X-CRM114-Status: GOOD (  13.37  )
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

Hi Krzysztof,

On Fri, May 09, 2025 at 09:58:09AM +0200, Krzysztof Hałasa wrote:
> I guess these messages were split from a single function. Or was it
> for saving memory? :-)

The goal was indeed to save memory.

> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 93a55c97cd17..b6c7f114f9ed 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  						 sink_streams);
>  		if (ret) {
>  			dev_err(xbar->isi->dev,
> -				"failed to %s streams 0x%llx on '%s':%u: %d\n",
> -				"enable", sink_streams, remote_sd->name,
> -				remote_pad, ret);
> +				"failed to enable streams 0x%llx on '%s':%u: %d\n",
> +				sink_streams, remote_sd->name, remote_pad, ret);
>  			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
>  			return ret;
>  		}
> @@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>  						  sink_streams);
>  		if (ret)
>  			dev_err(xbar->isi->dev,
> -				"failed to %s streams 0x%llx on '%s':%u: %d\n",
> -				"disable", sink_streams, remote_sd->name,
> -				remote_pad, ret);
> +				"failed to disable streams 0x%llx on '%s':%u: %d\n",
> +				sink_streams, remote_sd->name, remote_pad, ret);
>  
>  		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
>  	}

-- 
Regards,

Laurent Pinchart

