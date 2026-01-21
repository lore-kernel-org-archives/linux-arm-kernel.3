Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2FED262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msYzEacNskgWR2FwpW1oVJRhShNmIlYJk+rHugIA8LI=; b=I0u5B2bIfg6TONjTpylLWFoq92
	GFFaHNZ6e3Ul3tZzwdkAO0rGNv6RhIvv1NPK3UzeoJ5gXjOX6WDZgcQMKgEJ4vag0fdgNNRUMH7eK
	YF3PUEzEeEos1lcbBftyU7u0B+PoLrQUxxvFu7fro9R4lV33wKxs24NorEWW6zwlX+oc5K3ndGF+6
	WrbQPXx4jYtz7XSIBP28JX79ORqBiRRmc04rmEbjWOOkiMqYkQc1NGwauyhf4fLuCEj+7620WwM8y
	i2UuleY4djuFY8obzOAKaukQ6t+yxXceu369bpMWkLlHCk3ikHQyl+c4ZHVd6lZ/mV7eB262PStsp
	n70cY97Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNmo-00000004lWe-0KOe;
	Wed, 21 Jan 2026 02:17:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNml-00000004lW5-03jj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:17:32 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5BA32D7;
	Wed, 21 Jan 2026 03:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768961818;
	bh=l0aUY0/1BbKSc3HEsxELZqYEPEPlOw016Ycg7UMubsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHBT0vTRvJYrmzDfPlUwurx9+clUr8Ml34BMXzZHPheQ3SkaxoQAh6F8xX8DE1dK4
	 cCwAbUc6T04GdS6+f5z+PpKv3NtEvq8gfyhcvKGpCcNApP3zuajOAqLfv9pFp8JAMJ
	 Kc1aptHZSLk774A3byJ5qKmMCR2pE8gvNm6eEL/E=
Date: Wed, 21 Jan 2026 04:17:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/5] media: staging: media: imx6-mipi-csi2:
 trivial cleanup to prepare convert to common dw mipi csi2
Message-ID: <20260121021728.GI403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_181731_193911_4E61A4A1 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, Jan 16, 2026 at 11:17:55AM -0500, Frank Li wrote:
> Previous https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
> There are too much patches (32) in above thread.
> 
> Just extract first 6 cleanup patches to review easily. The overall road
> map see above 32 patch serise.

I've applied 1/5, 2/5 and 5/5 to my tree.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - collect review by tags
> - drop media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
>   need more time to understand nf_unregister() and subdev_unregister()'s relationship.
> - detail change see each patch's change log
> - move devm_mutex_init() patch to second one
> - Link to v1: https://lore.kernel.org/r/20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com
> 
> ---
> Frank Li (5):
>       media: staging: media: imx6-mipi-csi2: replace spaces with tabs for alignment
>       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
>       media: staging: media: imx6-mipi-csi2: use guard() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
> 
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 209 +++++++++++------------------
>  1 file changed, 80 insertions(+), 129 deletions(-)
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251106-stage-csi2-cleanup-6db1715fd187

-- 
Regards,

Laurent Pinchart

