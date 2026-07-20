Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13993C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7U/TKnCEzJeCI090qw/PlyCT/RTyolDnBHLzicPIfY=; b=0o7HFxDNSM96x0QxCpofF7ZsF/
	JKGaa+wKDtC1KiYIwRJjJpO5YSMnzej7TeiMb6QF59hCTbOvfhvsBWzD4LxfgdVPbxQKkMoPRK3Mk
	mIPT6bJuSxFK0UMuovY145diuc8cBpfJI5ygd2EhtkiwTr5N4RoSH6BO8L13nxr/CVjiICHs7a+DD
	Q8O6ZK5CIQzqSbguVo8F9OopTveiSHjYswOmhFF09SVouacDwryf1gcR61UqLJF/ztrXaWTnXMpdB
	jSFJfGDffZV/jpudFZe3lT9S7MjbmLfvZzW8mUs6FwYvJn0vFWFnLdoqTcsx1oTS4L9wLqFzjKdBl
	z92vdMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrDA-00000007RCo-3SYU;
	Mon, 20 Jul 2026 16:51:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrD7-00000007RBP-3FfP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:51:23 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44AE2270;
	Mon, 20 Jul 2026 18:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784566221;
	bh=48xzokJJGunmLrBLv47blN7DL2NI8uGuGfFPzvlNX1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtvC+Tjyg+IRDW+9R3MGxXe7KYwLjQLKe6Pw0cyTfAip1Dogo9d5obuoITP7/yJ+m
	 xM5U7Ro1UQ3/rQYp/vmL+3fHL41hvO7vRhc+aHzH0RnfuQRWOrtxWSoxMM7Z3K/V0r
	 dAW1E7tFtqUvpY6mtrqMfSye/Rwq5kchcsOyA1+A=
Date: Mon, 20 Jul 2026 19:51:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: mchehab@kernel.org, kernel@pengutronix.de, estevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: media: nxp: imx8-isi: Add Frank Li as
 reviewer and i.MX mailing list
Message-ID: <20260720165118.GA42426@killaraus.ideasonboard.com>
References: <20260630163456.3317624-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630163456.3317624-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095121_960060_5E2043AA 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Frank,

On Tue, Jun 30, 2026 at 12:34:56PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add Frank Li as a reviewer and the i.MX mailing list for the i.MX8 ISI
> driver. This helps ensure patches receive review by the NXP i.MX
> maintainers.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thank you for volunteering.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 361a4f447277c..62ed60238b1cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19470,7 +19470,9 @@ F:	drivers/iio/adc/vf610_adc.c
>  
>  NXP i.MX 8M ISI DRIVER
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +R:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-media@vger.kernel.org
> +L:	imx@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml

-- 
Regards,

Laurent Pinchart

