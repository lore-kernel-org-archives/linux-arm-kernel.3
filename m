Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C703D711CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV0rUrFX0bbnIOz5zP0IF2++dI2GFh6kg6dgCL2TXUM=; b=EoZGAtlcfIV4+KMfWDtQFNlmTB
	CtT9XN08vjOK0eLYDhkLNUw+NzqWOaFGe3knWQjn+wnyL9jY8hJmJYiXhJW8ZZkghDxtnoWECPrN8
	i6HhS4jY6R1mnEuZknr5sOqYzAFTfLj/ZglXeQzZE2xmSE/8WbmKLsXH0pue43RMcfFvlU2L9tR9r
	p7CRrqNrDUBUGZYtHa/z/x285Jl1LiX34TrixnXxpXFuv5TQNDpSogAIBqpTAkJ2huGh7yvZunX9b
	KmxseE4aksDKF66b89KR2Tqgm9q9DOTd8cIvrbZ0VPxrbxY69JqM0ICBIfrF4R3qRPG11fxyTfpEX
	zF1OTbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoEX-0000000FtAH-1EAC;
	Wed, 20 Nov 2024 17:11:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDoDb-0000000Fsy8-0cCD;
	Wed, 20 Nov 2024 17:10:20 +0000
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5E873E;
	Wed, 20 Nov 2024 18:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732122594;
	bh=6OOO8IFdR9aIC/SVVyp7HAsGg+XEQlgbLko2LnIGNJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwdQxF78e1Dr0L6ZUUoFVnaFuNAXCRwNygIHHbCLmtYe98lSHTCXNEKI84RRc7+K4
	 ZUAIog1q3i0rJ+uMmrVfkPzGX5Ww9a3zGc2KkbRhC67kkvgocNJzRplthEMaA5aDmh
	 8C/9ZoHgFVhZGabWxqZX6K4KdRaNeyPm+AsD+2O4=
Date: Wed, 20 Nov 2024 18:10:09 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com, 
	linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 media-next] media: rkisp1: Fix unused value issue
Message-ID: <pbyb5dxy4wbwbnpzpojj6bhjgbqzoebrmk2y6j73szop2ve3wx@jdslb37ejya6>
References: <20241119060220.70124-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119060220.70124-1-dheeraj.linuxdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_091019_321595_4623D0F6 
X-CRM114-Status: GOOD (  19.05  )
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

Hi Dheeraj

On Tue, Nov 19, 2024 at 11:32:20AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes an unused value issue detected by Coverity (CID
> 1519008). The error condition for the invalid MIPI CSI-2 is not
> properly handled as the break statement would only exit the switch block
> and not the entire loop. Fixed this by returning the error immediately
> after the switch block.
>
> Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> optional")
>
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

(if you receive a tag on a previous version of the patch you should
carry it forward to the next patch version ;)

Thanks
  j

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index dd114ab77800..9ad5026ab10a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  			break;
>  		}
>
> +		if (ret)
> +			break;
> +
>  		/* Parse the endpoint and validate the bus type. */
>  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  		if (ret) {
> --
> 2.34.1
>
>

