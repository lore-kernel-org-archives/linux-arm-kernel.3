Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD19FCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUW0Z333IiCKgXVmqfMRQe5esGU8+9Ygf7s5D+D+ak0=; b=TBJ2XNYWvgPKJzvd+B7C1GXMaf
	Vqk8n0FUExf4kvar82mTNi5GGglbAGPjQCpSoT8LXndUSXLH9fMbLpktNkF1zqxk/A0fbCyFfhGC7
	wncJ5jxeFGRw0BQ4UMxJUupfQEy8IvrwFlc2K2OO0+rRUweBlwTXVh9vc/vCaWEC+6tXB9eDggPDU
	0aC9PoU3ukxN9HrEbFogWL2Nhu4uK9pLjyDe2LwjOKhrt7OLQiISquszgWMhlYXpQrH4iU7+EIdbm
	7yS0IgDSwm1s6Gs7EsHEOgrW/aQ065LHsBDLzhbIawrNdYDEtzFwbdJax/vDfhmQMYLP0KX5rK+O2
	8rCFNSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaIZ-00000000bkG-3kyQ;
	Wed, 06 May 2026 11:20:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaIY-00000000bjh-1JrL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:20:14 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D970DC21;
	Wed,  6 May 2026 13:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778066408;
	bh=+nUdTQL/+FvfuWAAGXkRsJ122b/1Kj58MJeHDQn6nlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGVkRYjyvzx1Epvvka4sDCYZKNzllTUbRdMRtNAQbie70SiIeQSnHPKyabi5fMyE5
	 rHaIAWnZFjYt10UMzE/5omQOi2nzv0Wy245NqdR4pU9ECaghw+QubNYbh3/J0ssb0z
	 DBMWmq9Xo87aj94QmlfUe+gQvshQPrNzsCKV5VXw=
Date: Wed, 6 May 2026 14:20:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robby Cai <robby.cai@nxp.com>
Cc: Frank.Li@nxp.com, martink@posteo.de, rmfrfs@gmail.com, kernel@puri.sm,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, martin.kepplinger@puri.sm, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
Message-ID: <20260506112009.GM1598374@killaraus.ideasonboard.com>
References: <20260506090124.2960477-1-robby.cai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506090124.2960477-1-robby.cai@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_042014_498651_B4FD64D5 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Robby,

Thank you for the patch.

On Wed, May 06, 2026 at 05:01:24PM +0800, Robby Cai wrote:
> The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
> labels, which is confusing for an i.MX8MQ binding. Rename the labels to
> imx8mq_mipi_csi_{in,out} for consistency.
> 
> Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
> Signed-off-by: Robby Cai <robby.cai@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 4fcfc4fd3565..71f79651dd96 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -220,7 +220,7 @@ examples:
>              port@0 {
>                  reg = <0>;
>  
> -                imx8mm_mipi_csi_in: endpoint {
> +                imx8mq_mipi_csi_in: endpoint {
>                      remote-endpoint = <&imx477_out>;
>                      data-lanes = <1 2 3 4>;
>                  };
> @@ -229,7 +229,7 @@ examples:
>              port@1 {
>                  reg = <1>;
>  
> -                imx8mm_mipi_csi_out: endpoint {
> +                imx8mq_mipi_csi_out: endpoint {
>                      remote-endpoint = <&csi_in>;
>                  };
>              };

-- 
Regards,

Laurent Pinchart

