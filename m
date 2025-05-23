Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD7FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoFtYnTceEtN6fz6SSjtMb7bx0bRb2RkcJzA9O1EjXM=; b=o5AED+IijQaR3oyJVG0ZR/WnA8
	uxqDOxbXw3Hivvzp1LaDaprP61kOanYs102CaatzLU2iesfP8DTNOrZZC5CAgSO0AKQCvf+MZ5Bng
	1Hf5z2xDfs25jtazlcHBX9Hq729saic6ljwePXJsqZQvzj9s4AXB2oIB8wDNSV2A5jgO5Jhk/SE2v
	q9I25fysUQ30RmoZqKKpTAXOyVjyl2xd58mx/DvCJCTkWrYcJme43Fv9iNohnJN8yaQ45W2yIjOxw
	3mBfHDGq7kRcFiCJ78FjVfkk4AFEfCHDzrWRjMncRdrJQeTBDFQ1O41vyqBD2B9qpaY60840O2MM0
	N09n2haA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINh4-00000003Ihf-2TwJ;
	Fri, 23 May 2025 08:23:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINRh-00000003GPj-1ddk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 08:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FoFtYnTceEtN6fz6SSjtMb7bx0bRb2RkcJzA9O1EjXM=; b=fXuZoSPULVPey9F95HW7EV+aM/
	DhWdccFKKkG3OVp86p/4g6Dn8ViFMAGmmGvYPDEYTdGeLiUxJL++DWCFePz2t13P1uDMfCkd6XD7p
	8jAZlq9Y815rhkwhj0Ssf5hw/8w/7PHalUGnwLneA1hKedUufu1KKo4PhM2vEDnJEulHJ27/M6AYw
	SH284OoAxmzSwt54epGZ7oM+yvGiOYVCBC+6s3UboTjnGDYxExHoGtwIh5m+ipOMHfuQ39p20lhYw
	R+obO/tWIMShHl06zbmMjvp0rbQOylkPWTJu3tqhoIG2w0npE23Vvuvn5edBrNF6d8nHjDfKX8Sxn
	aaGnh06w==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uINRd-00000001DNS-3LvQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 08:07:59 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E29664A4;
	Fri, 23 May 2025 10:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747987653;
	bh=I/rX/siILyzcMqHEzdmC4zV4w4CMLB3jlkKhgSTSTIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOwv6jzDniXOI7R7TljMRUoekN9Lv/wtRzwufJk6Ggu9PcyDMnpK0dlVBsmht/kkm
	 TXLdq+q1XcVwiXalQN2mFK6TjBDLR8TSy1rS7FR17KCvvTtr0I2gf09E+ojSpDqBBd
	 5zmkAUEXbhHpaHpy5+17r04rk/XIUxp43SjnPxi8=
Date: Fri, 23 May 2025 10:07:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 1/5] media: i2c: imx214: Reorder imx214_parse_fwnode
 call
Message-ID: <20250523080748.GZ12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-1-bfb4a2b53d14@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-1-bfb4a2b53d14@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_090758_168736_4DD22979 
X-CRM114-Status: GOOD (  15.27  )
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

Hi André,

Thank you for the patch.

On Wed, May 21, 2025 at 09:34:24PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Reorder imx214_parse_fwnode call to reduce goto paths in upcoming
> patches.
> 
> No functional change intended.
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx214.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index dd7bc45523d8b5fcb3ec95728a6d32c4fddede72..0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1261,10 +1261,6 @@ static int imx214_probe(struct i2c_client *client)
>  	struct imx214 *imx214;
>  	int ret;
>  
> -	ret = imx214_parse_fwnode(dev);
> -	if (ret)
> -		return ret;
> -
>  	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
>  	if (!imx214)
>  		return -ENOMEM;
> @@ -1295,6 +1291,10 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
>  				     "failed to initialize CCI\n");
>  
> +	ret = imx214_parse_fwnode(dev);
> +	if (ret)
> +		return ret;
> +
>  	v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
>  	imx214->sd.internal_ops = &imx214_internal_ops;
>  

-- 
Regards,

Laurent Pinchart

