Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E21D6004C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfqowqicAe51ZhHOZTTB6dgjENdJBWasZKzLoQgVKhc=; b=o1x32+i0vyTcqph5xWeLxertI5
	u7TmtevZaqIgfNsaFbzqGCeG+ZDgaSTzZFrTSUH9JSGtOxwyQztXifmKUylmuxzHTQfm6Cp+bkO94
	qID0TvkA2KfTr4UPtAVkx2jQHuATNPxYmhtAeiaWg7u49vGRuuYzPX2wZ9EU3ODIzrtsskSdY7uQ9
	5xD8JtXZRRJFXIaQpJ3luBqfjGp9z/zX5QYgEuocHbcQgwN+y/bDmzkUs5YKbxBwVtrEMz8m9q1OR
	lUW0Jq/wlFAvgLg0/6FNkXvE+fekKzZvkxb0yzr+tS27ncM0ZW57labG7NAlIW6LptzWIG3cP7/Qz
	KGqxqFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJAV-0000000Bh9x-3wPI;
	Tue, 19 Nov 2024 08:01:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJ9Z-0000000Bgyx-46zS;
	Tue, 19 Nov 2024 08:00:07 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A47C2D52;
	Tue, 19 Nov 2024 08:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732003179;
	bh=AKqXK5hE1lCdeA+EA1n7axXXblY1rK3MxFVF0e5i41Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCzK2FIiheA9ZJqCI+GxBdv6ujE0EnBCO4Rq0VkGg3d37wMXmqL1Hq4rcw5C+Cy/R
	 Bz9NVOABjr/XrCCV140q+sRDaQWkRnoArhjI/7t0XzY47D42cYbMIvsZgHVueM9rNP
	 BZHAQsi81Tc+NOpppX25pieVVoWPB2JQzeABRmko=
Date: Tue, 19 Nov 2024 09:59:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, linux-media@vger.kernel.org, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Message-ID: <20241119075944.GA31681@pendragon.ideasonboard.com>
References: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_000006_157331_A8A9C8A6 
X-CRM114-Status: GOOD (  21.54  )
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

Hi Dheeraj,

Thank you for the patch.

On Tue, Nov 19, 2024 at 12:56:53PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes an unused value issue detected by Coverity (CID
> 1519008). The error condition for the invalid MIPI CSI-2 is not
> properly handled as the break statement would only exit the switch block
> and not the entire loop. Fixed this by returning the error immediately
> after the switch block.

The patch doesn't "return immediately". You can write "Fix this by
breaking from the look immediately after the switch block when an error
occurs." or something similar.

> 
> 'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> optional")'

The Fixes tag should be formatted on a single line, without outer
quotes, and without a blank line between it and the Signed-off-by line:

Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")

> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

I can update the commit message when applying the patch, there's no need
to submit a v5, unless if you want to. Please let me know if I should
take this version and update the commit message, or if you will send a
v5.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

