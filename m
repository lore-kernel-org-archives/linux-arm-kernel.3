Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF47CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePK2LwC/xTHhXJJy+XLVhccjg+tyTI18BMRtDL8PtX8=; b=4DLZODeNWkpzjxrhdu7ONNhS2u
	O+J9Ge+qBFHH0m8p2xx4/RJxAfMoY+TpD35hpXzBslIysDic6XVGsAWvEfLrafAzVAm4EJ4YGxeJV
	Hy44ShoYqWYliz1kJIsHjUyUbyNobjbvumetvBR9RQkotKUct2IRHrV99Cw5oZpDjSc7gMTcc87Dg
	KqIjUNebacj0OAT65acnjfrH0JSiBLtbKvahXOoN/7XQLn6SuWx+OvWFs9oEGG96Ds7YkV2KrT0zV
	gro2feqNLvKiH3oFcZOAetIKpm4glgBSRKj8/sEUyvukBxg7YGQ3uox5cdqlR2Wmj+n/rvFS+M1BK
	cR0n8zqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SOr-00000008KCs-0hJ5;
	Sun, 21 Sep 2025 22:19:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SOl-00000008KCB-1MOv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 22:19:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 983FB10C4;
	Mon, 22 Sep 2025 00:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758493067;
	bh=6qGPQVj1x+TxAivO8rmsctxEatL7jxZoOEKgA2zySW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jas5FmLJ811U2Nkd+brDKUy7BmrDI6SYcoz7kCLXyWoUl+LBUq+xAdvDt3vOeUQPc
	 cEdBTwGdzMh8uhhWUYmH2Vn2C2bgxGe051sZFfEDt/T1FsqR8Mt87Iee6IGUkQAsHq
	 2DyNcJHxGpikhAsdtieqRyTzXW5F3wUP/fv0xZF4=
Date: Mon, 22 Sep 2025 01:18:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v2 3/5] media: nxp: imx8-isi: Add parallel camera input
 support
Message-ID: <20250921221838.GC10540@pendragon.ideasonboard.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-3-37db5f768c57@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-isi_imx93-v2-3-37db5f768c57@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_151911_505094_2BE897A2 
X-CRM114-Status: GOOD (  18.43  )
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

Hi Guoniu,

Thank you for the patch.

The subject line should mention the i.MX93:

media: nxp: imx8-isi: Add parallel camera input support for i.MX93

On Fri, Sep 05, 2025 at 02:56:00PM +0800, Guoniu Zhou wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> The ISI module on i.MX93 implements one camera input which can be
> connected to either of MIPI CSI-2 or parallel camera. The source
> type can be selected by setting camera mux control register.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> index 2f5e7299b537d612fb1fe6688c1b75bfd2d6049b..42b2ed2bbdf7259bc83d0678256343a3b606568a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -61,6 +61,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
>  #define DISP_MIX_CAMERA_MUX                     0x30
>  #define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
>  #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> +#define DISP_MIX_CAMERA_MUX_GASKET_SRC          BIT(17)

Let's spell this out fully to match the reference manual:

#define DISP_MIX_CAMERA_MUX_GASKET_SOURCE_TYPE  BIT(17)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>  				    const struct v4l2_mbus_frame_desc *fd,
> @@ -71,6 +72,16 @@ static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
>  
>  	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
>  	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +
> +	/*
> +	 * CAMERA MUX
> +	 * - [17]:	Selects source input to gasket
> +	 *		0: Data from MIPI CSI
> +	 *		1: Data from parallel camera
> +	 */
> +	if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL)
> +		val |= DISP_MIX_CAMERA_MUX_GASKET_SRC;
> +
>  	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
>  }
>  

-- 
Regards,

Laurent Pinchart

