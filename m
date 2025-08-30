Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880D6CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 21:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W23h0CU2XPvyIBlM/7fXI8zhA7EF97uc2vwHzm5DU3E=; b=BbkXr2lxUTFcbbPOuKEDgWFcDx
	5QakMmuHCd8D8jLc3ve3jSnOlAsqL3VI5huRjNYMFyw2rbFa9pk7RclVDbh/9jBEXIFuG+H2uZH9j
	/26HNYcRC+IaAwcRDIcSz/9g53d/ashztEpTvK66b1ajtBpi1HNSW1IIaUpk0VYClddhgLPaIPwMb
	jQDaqHDnltfdnihL4j9HO8jPkdmv2xm1krT3TdceQStIRAVU68DzudRaWJIFZX0GwVxNpWglQ+FFv
	gvs2ytuI835ZvvJQJt4qhQ89BwcOrtcky1MIRc6qvgnSJs3Cdli8GCqHW6wA3IozPQvtnqq+Mr9em
	zV5HAdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTEB-00000008SLj-2U4W;
	Sat, 30 Aug 2025 21:35:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usT8w-00000008S2P-33Vw;
	Sat, 30 Aug 2025 21:29:52 +0000
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 16DE4337C;
	Sat, 30 Aug 2025 23:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756589319;
	bh=nazjNil7c6YoIWTwvr8MF0GJzNNzswGy21FyNw0czQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coZsIh5JzjfqVisAaGMLyp5r3GM20OUCq708856ovzdu6b8NgKEA/LDIg//jBFcP0
	 mfOCQ3HFvKWfn0LCAMQshiidRtUEWNvZKqdkD+7VF7GwY4qdCh2aWCVsVdy7ikrctI
	 NLu8VHtXbco5TeC5FJpaGl1jWjf8LrXEKYIObNN8=
Date: Sat, 30 Aug 2025 23:29:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com, hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vc04_services: bcm2835-camera: avoid
 -Wformat-truncation
Message-ID: <20250830212923.GB16364@pendragon.ideasonboard.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-3-nogunix@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250830173850.323897-3-nogunix@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_142950_920815_A6065D17 
X-CRM114-Status: GOOD (  16.51  )
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

On Sun, Aug 31, 2025 at 02:38:50AM +0900, Masaharu Noguchi wrote:
>     - Fix -Wformat-truncation in vidioc_querycap() when composing bus_info.
>     - Use scnprintf() for the prefix and strscpy() for the remainder.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c    | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index fa7ea4ca4c36..c2788659af12 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -874,13 +874,14 @@ static int vidioc_querycap(struct file *file, void *priv,
>  	struct bcm2835_mmal_dev *dev = video_drvdata(file);
>  	u32 major;
>  	u32 minor;
> +	int n;
>  
>  	vchiq_mmal_version(dev->instance, &major, &minor);
>  
>  	strscpy(cap->driver, "bcm2835 mmal", sizeof(cap->driver));
>  	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d", major, minor);
> -
> -	snprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev->v4l2_dev.name);
> +	n = scnprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:");
> +	strscpy((char *)cap->bus_info + n, dev->v4l2_dev.name, sizeof(cap->bus_info) - n);

The fact that we need such a complicated construct is a sign that
there's something wrong in our APIs. The above code is too complicated
for what it does, making it less readable, more difficult to maintain,
and more bug-prone. I don't know if we need yet another sprintf variant
in the kernel, or something else, but this doens't seem to be what we
need.

>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

