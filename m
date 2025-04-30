Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E905FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O34u8ezf1UpIISYNNIslqdVLDdHjoKWEW+sx50Mfqc8=; b=cVfdhWBrdXIpZqfjwcP47ZXknU
	7UVMDiz3mwksjju0LoqrYY7P4Wgwvu8vv3+SUGqRVs+U+9pTUc+vJsBtl1oCYj/Q3vZCr6mwDqUNF
	a4yLcY4syz7Wxt3XZcRGgnLIyT8gxiXbi1vEgd6loLudDmOefnuZeHbNb3mwIq2PzlKbWf1jFMN39
	PxZwLLsSBiQoJMHqXdV7rF54ybLagjYlQGILRSY2kj/0aVQ+tZqKUtSvD4uWx58gADYUP3DtHBlwu
	TXEL1l2fS8YgAjL7bF9mo1/iCG+UkFKbSdZ7cfu2Yo7PbclbCBkkhkt9k/jwTP1elcfXHU2TPdr4T
	sRjzoCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7Lw-0000000Cygq-2nGW;
	Wed, 30 Apr 2025 13:19:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7JQ-0000000Cy6w-2LaW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:17:22 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D23A5725;
	Wed, 30 Apr 2025 15:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746019029;
	bh=gUxFERNFiI8Fti0Ax2R+rmqI6Qrh+qBwEPYn2etkdf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBd/rYbSg20QCw/0EwavmiKXQtw3vQlPHdqZzwD9mrtld2/hrPn/nB3Q1oU2/Ybag
	 zNZ1++QaKWcnvbMpMLWhqhp0BdevlHUyCmFl/mDiAVuMNUKFTm4SCZgKGVb2ptrF9z
	 H3eA7KcvL9Wn3n0ahYev0FZp2sRvK8ToeaN8XPIA=
Date: Wed, 30 Apr 2025 16:17:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Message-ID: <20250430131706.GA25516@pendragon.ideasonboard.com>
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_061720_733166_A4553E03 
X-CRM114-Status: GOOD (  19.76  )
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

Hi Niklas,

Thank you for the patch.

On Wed, Apr 30, 2025 at 02:53:22PM +0200, Niklas Söderlund wrote:
> Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> frequency and pixel rate") the driver expects two specific
> link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> (222750000, 148500000) operation. The driver fails to probe without
> these exact settings.
> 
> Update the example in the bindings to match this to make it easier for
> users to incorporate this sensor in their device tree descriptions
> without having to read the driver sources when the driver fails to
> probe.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The new values match the frequencies that the device expects for 4 lanes
operation, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index fa69bd21c8da..990acf89af8f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -136,7 +136,7 @@ examples:
>              port {
>                  imx290_ep: endpoint {
>                      data-lanes = <1 2 3 4>;
> -                    link-frequencies = /bits/ 64 <445500000>;
> +                    link-frequencies = /bits/ 64 <222750000 148500000>;
>                      remote-endpoint = <&csiphy0_ep>;
>                  };
>              };

-- 
Regards,

Laurent Pinchart

