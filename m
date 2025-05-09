Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AE4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar0SPW5IYzbm+WBjNMCImL+vIzV0ecGjk9MWdGhcZtE=; b=YL6OLiIwlWHZ26xgA7OCyCtJJD
	xOjclx0cGwdvH6hmKxu8y6e6z3QmCb0gGzMj5n47E2O5jj2ENxfOLITjYvWvjmo84Bj7KUGlsSqMY
	Fup1HSdr6H2XD8JiD5DGa+RtcQoOFG170ZWajjuxVjtCgpsnwQBSJSupT+diP55XQpn2+VON75gVt
	V41c9IvVuztfUdFOtEn/VmKRfSxdH3CzCpWUHAoJHfjhQZ0TJUFEbRU0gOMNgTfNPD3iFNe97KtVT
	dlNjOM9+HFs0ZbVTHn20YCNF0I+iJiJi/+rqjygvmST0sBRbw+gjtJVpuAJhvRhZaOntcNV3m/NIs
	p0UF6wxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDM60-00000003SXU-3SoO;
	Fri, 09 May 2025 11:40:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL6u-00000003Ipp-1XI0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:37:45 +0000
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 097798DB;
	Fri,  9 May 2025 12:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746787049;
	bh=AfXvqVxIz0QcRni0bewoQ8SDWdd4YjFQcafte966bIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7UT3Xjs/pRKhU7lxaM7WRQzVzWXhWuGkKSZOVmofA/WwZhYru/+PZSvgknKuF1io
	 7yJl7/1OKYS1WcQS+7fOrgo6TQiFhCzwe2JfRfSElkSSS8v4VRUhaCoeF/EqXEDaSY
	 Noa+E4+cX5kKCjN0bwC/cIqTP8Qn2TJvN+XUtzZE=
Date: Fri, 9 May 2025 12:37:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
Message-ID: <20250509103733.GE28896@pendragon.ideasonboard.com>
References: <m3h61u9jy2.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3h61u9jy2.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_033744_539701_B851A6A2 
X-CRM114-Status: GOOD (  16.18  )
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

Thank you for the patch.

On Fri, May 09, 2025 at 12:07:01PM +0200, Krzysztof Hałasa wrote:
> In addition to raw image data, certain MIPI sensors send additional
> information like NULL packets or "embedded 8-bit non-image data".
> Without DT (data type) filtering, these packets end up in the frame
> buffer, corrupting it.
> 
> Tested on i.MX8MP with IMX290 sensor.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 29523bb84d95..d53a4262b63d 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -654,8 +654,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
>  	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
> -	if (csis->info->version == MIPI_CSIS_V3_3)
> -		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
> +	val |= MIPI_CSIS_CMN_CTRL_INTER_MODE; /* enable filtering by DT */

The condition was added because the CSIS in the i.MX8MM doesn't
implement the INTERLEAVE_MODE field. We can't remove it unconditionally.

You mentioned i.MX8MP, that's a platform where I'd like to see proper
support for *capturing* embedded data, not just dropping it. Have you
looked at how this could be implemented ?

>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
>  
>  	__mipi_csis_set_format(csis, format, csis_fmt);

-- 
Regards,

Laurent Pinchart

