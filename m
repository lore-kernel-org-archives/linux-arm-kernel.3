Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E89CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W96mLjpSreem8JYgAsOyuRcZ7ymmjgLN0pTRaiZIQKY=; b=Ec/+UvWbHUQDqKzSgrNTrN6YU7
	gAg40G/9NIUwFjfwI+xmndQFsW+ZGy+NRkgLNmN4CxoCVtGriTD3tAYT/ahF6nO2XL2OB8fRCSSVA
	JhwEZdTTvw+NSnpJjYzMW1y3Mdo5OpQBQRm0/gd90E9kEXmT9ddOXQJKGm0QrJ8m2i+qu5/RuTuR/
	cdUxSjluRHK03oE9UR4gtlHY0woiZaY4FaWUd+okTQxxpRvhA1tZhZSCu7zZM3xWG0MpaBb/RKpIA
	IvyiLBWEQHspPwrO5wtcqCFcAFBx8wxqTQP7Yawp4MGCwzLVwND7uTyeX0q3LZ8OawZdizrrmhqoJ
	grmcN2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIRh-0000000G24X-3Jrr;
	Wed, 27 Aug 2025 15:52:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFXh-0000000FSrv-1jYr;
	Wed, 27 Aug 2025 12:46:22 +0000
Received: from pendragon.ideasonboard.com (unknown [213.244.170.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7EAE12093;
	Wed, 27 Aug 2025 14:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756298716;
	bh=nnSCxw1iZ1Q7cRVjXpqsgv65+CCdynSW8nKFaPIbcp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEPAr+pGbD0maywrSdDOecgUU2QsS5iWefrUOxYnPfRKZzQXF55DXNttn04Twsdk0
	 GTujJ1IYF9BCcvnU3P3u5KS7XVlCB3BOL+6PDc3o6JyO4azTKeCC4hW1rpz2pVuppa
	 Oi+0eQ5WdBrOvAiapimJEvpqtNmNsA3y3jGycXeo=
Date: Wed, 27 Aug 2025 14:45:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/5] staging: vc04_services: Cleanup formatting TODO entry
Message-ID: <20250827124557.GG5650@pendragon.ideasonboard.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-2-5052a0d81c42@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-vchiq-destage-v1-2-5052a0d81c42@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_054621_591153_8AB3F362 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, Aug 27, 2025 at 11:54:09AM +0530, Jai Luthra wrote:
> The code indentation for the vchiq interface driver is not so bad
> anymore [1], so drop it from the TODO.
> 
> Link: https://lore.kernel.org/all/20241013112128.397249-1-umang.jain@ideasonboard.com/ [1]

Adding '[1]' at the end doesn't seem to be standard practice and may
break automatic parsing. I'd drop that and reword the commit message
accordingly.

> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/vc04_services/interface/TODO | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
> index f6f24600aa86240fba77169f62f3e657e42727c3..6e5f27db88ba8e533ee1fabc3091771d8efe66a2 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -20,9 +20,3 @@ some of the ones we want:
>  
>  A short top-down description of this driver's architecture (function of
>  kthreads, userspace, limitations) could be very helpful for reviewers.
> -
> -* Reformat core code with more sane indentations
> -
> -The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
> -indentation deep making it very unpleasant to read. This is specially relevant
> -in the character driver ioctl code and in the core thread functions.

-- 
Regards,

Laurent Pinchart

