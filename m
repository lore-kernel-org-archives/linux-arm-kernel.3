Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCBAC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 23:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHfGxojbb9Y3Eo2SmKKSgucBeB8IuzTavPKqvFFwRRc=; b=WtRAeEE2+AUPvk42/FKgreinSm
	laurRtWsdq+GNGbb5S8a5Myp6ezdYZW4TD3D1KjJGKW4D8cJr8TWlfIhjv4XDzDaD9G9yzCXtQMAu
	qH6cV8WdKMBZI8voP1vXV01qzInpujcpmGsuvSYo45AQsmfETyeIL4UfY0SHFHudv/r+ibexVSsw1
	QNghlUxuwfJDPPrp5N5SodF3zDNeTN/PAC4Pq6UHn0U2ub1qk2u57gDG+SSXIej5lFoX2G09v9SJL
	4eG0qAII9E7JeLmOE3QXETgf9Qf12lGKO5uzvLj5TYOCcVtL8lAwCFom46kznZdoIKseLkS3VVWl0
	LmOPshWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toAEe-0000000D0L0-3GYt;
	Fri, 28 Feb 2025 23:57:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toAD5-0000000D0Co-3pY6;
	Fri, 28 Feb 2025 23:56:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5DB18BE;
	Sat,  1 Mar 2025 00:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740786870;
	bh=jTCdtpRYTRHsMVAmFB/azfiEkPNOYIqmEoX6aj1pEFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZpP9uaQpR66kiiaPF92LMEb35IpeO2GD9C2KMxOyqjXlhvDV0zzctzBqODBjYvgs
	 j0bK89QAMzr4sdPXTBsODKp1N6FM8h658nyRZ+f2f4OtK31bvcBspPHWdB3jBvIBQO
	 3Nb82ZUj91bm+/UZTXXvHX14ztrSeIZZ7w1jeDk4=
Date: Sat, 1 Mar 2025 01:55:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rkisp1: Remove unnecessary defines
Message-ID: <20250228235539.GG7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
 <20250227114558.3097101-4-stefan.klug@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227114558.3097101-4-stefan.klug@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_155604_270956_FCCA109A 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Stefan,

Thank you for the patch.

On Thu, Feb 27, 2025 at 12:45:01PM +0100, Stefan Klug wrote:
> The effect modes are not shifts but numbers which are already defined a
> few lines above. Remove the misleading defines.

s/misleading/misleading and unused/ (I didn't expect you to
intentionally break the build, and I'm sure it would be caught by my
build tests, but making it clear for reviewers is always nice)

> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

No need to resubmit for this, I can update the commit message.

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index bf0260600a19..139177db9c6d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -327,13 +327,6 @@
>  #define RKISP1_CIF_IMG_EFF_CTRL_CFG_UPD			BIT(4)
>  #define RKISP1_CIF_IMG_EFF_CTRL_YCBCR_FULL		BIT(5)
>  
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE_SHIFT	0
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE_SHIFT	1
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA_SHIFT	2
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL_SHIFT	3
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS_SHIFT	4
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SKETCH_SHIFT	5
> -#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SHARPEN_SHIFT	6
>  #define RKISP1_CIF_IMG_EFF_CTRL_MODE_MASK		0xe
>  
>  /* IMG_EFF_COLOR_SEL */

-- 
Regards,

Laurent Pinchart

