Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6979C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTp0qjOcxp2jZbShvxZWz63ZINdiCAdAUh+7tD4hbVY=; b=pavTChoAFgPGyUg47Cd1+rZ6Xj
	2VN6/aFXsn+X9YIAjsgwKPInyoxoFTGd08gKodhm0zvSOuq1K4LwvoMDgaMtf/P0nMGoakOYhZcis
	oqnLKw8TZoJoFQ6og5mpryNwvuP45rcfNO+mZt4PRpbUD92Aps2Xw3X5wUmAgG4ZhWTOr2dRAEehX
	puCIBhUnAc8Jaii25vUjzjlXBP72c02SGxfrWjx6DuCtp7p/7e4W88UXorEKWzHbNHzAXO1L2p5UV
	EK/k7PISecTO0wRx5BtImb2H1PT+9nr7+EVOqFlI5jmC73x/vej+EKnpkSLNPZA4JxpXFbbPigEVm
	xuCG77YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhYe-0000000FcVN-2Yr6;
	Wed, 21 May 2025 11:24:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhVK-0000000FcAO-2QIZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C22BAA4EC5D;
	Wed, 21 May 2025 11:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068F2C4CEE4;
	Wed, 21 May 2025 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747826457;
	bh=u7vr35/b6Z4rimsIPB7+DevWJCfwHCoiHs6tR4unzJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2p1VLrxUwfqyMbBoUwQvFyzTw1U5bigGBzmzSskNfGo3lXKt04N1oDp5+uW5Jy0TB
	 9Ne3mdK9cA155l06g9Uv7GzHiORLbDJViJfu4cudZamHhWoXnMTgpPfzJ7qXw+si1e
	 f/kC+hHFhHfYkHbLyLJgI74CKxGvPaKXKaFAaNSc=
Date: Wed, 21 May 2025 13:20:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
Message-ID: <2025052121-glisten-serpent-8ede@gregkh>
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509221152.13564-3-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_042058_677508_7304DA1B 
X-CRM114-Status: GOOD (  18.19  )
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

On Sat, May 10, 2025 at 12:11:52AM +0200, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Document the IOCTLs for the VCHIQ character device, which provide
> a userspace interface to access the VideoCore VPU of the
> Raspberry Pi. Several ARM side libraries make use of it like EGL,
> MMAL and OpenMAX.
> 
> Link: https://github.com/raspberrypi/linux/pull/6801
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> [wahrenst@gmx.net: Rewrite commit log]
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev
> 
> diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> new file mode 100644
> index 000000000000..99ab2567643e
> --- /dev/null
> +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> @@ -0,0 +1,87 @@
> +What:		/dev/vchiq
> +Date:		October 2016
> +KernelVersion:	4.9
> +Contact:	kernel-list@raspberrypi.com
> +Description:
> +		The ioctl interface for the VCHIQ character device.
> +		Following actions are supported:
> +
> +		* VCHIQ_IOC_CONNECT:
> +		  Establish/confirm the link to the VPU peer.

I understand the need, but this does not document the parameters to the
ioctls, so it's not all that useful.  How about just a normal
documentation file with this all written out?

thanks,

greg k-h

