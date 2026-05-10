Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A454BCD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lfPAlcuUiZwREX72w1AsmII9P9fRz7cXXMZqiRiphw=; b=bKRwt7yQPSYTMa72IK1/OfSdvB
	JYOdUJ1i41cUj+8HvoD4czzGByj7WaQLyNEYoEyix121AwKiXN6UYURLcFrdm+YOJaC7TWkLkgfjs
	2GHnmiCWLZw2wD1FTMMWlDUz6u2fLh+DQnnkDgFGv6K8NMlCBNjMdUZfRgoRCmF+dn3NMD3ut0uOq
	3AlL63j+CG4vxfhV9SBH3jcaOuc4hkRBDvo7IuBZnwKZIxky4tWfkWmMF1oRojOMAy+kZtgHKX+w1
	MsKprlpfIzMeRW54dKHW01fQMnEROFUB2sXDO4RRE4u7wJI9Ie7SMxWvdTop4+AbLhfMp+50tGjkg
	POtUJhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM2fo-0000000AfKI-0pF2;
	Sun, 10 May 2026 11:50:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM2fm-0000000AfJy-422q;
	Sun, 10 May 2026 11:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEADB6001A;
	Sun, 10 May 2026 11:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BE4C2BCC9;
	Sun, 10 May 2026 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778413813;
	bh=NFtd+mTJBVH7K+laWInbZslx5+0S5y6GE1FbKK8hc9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ub60GZ+yc4YZUqsJiukrPgWWJJZdA71lPC0rOeaODli+Y1/pA3S6/QA+n/lQjSlcB
	 ysM+RtCWOhnMFI+ax6CQ0SnU9qKWxtuh7EOO1r/YeE8uq8YfGGO5r8n66LLZz/MmP6
	 GXxWZLp5fagv2iy9d7DkP3mEyThfbRyd2Kw2fulkyWrthaRtkgSkHjxO17TQ0mxt0d
	 mkKO0t23By5V/bvAqcdf7+Sw0jo4Lxc2LzAAKkKgpZPonGGUXQNYOdGo/SasAcSAMk
	 3bTCWzxgnxvIDuZbPR/EGecyBluk2Zedrfyn6tTG/NdOHu9IVVBpbZrvGZbwzCVgO9
	 YL4UK+04mwTtg==
Date: Sun, 10 May 2026 17:20:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 RESEND 2/2] phy: mediatek: xsphy: add support to set
 disconnect threshold
Message-ID: <agBw8aDJDSHUGe3S@vaman>
References: <20260413122836.4848-1-chunfeng.yun@mediatek.com>
 <20260413122836.4848-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413122836.4848-2-chunfeng.yun@mediatek.com>
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

On 13-04-26, 20:28, Chunfeng Yun wrote:
> Add a property to tune usb2 phy's disconnect threshold.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: change property name
> ---
>  drivers/phy/mediatek/phy-mtk-xsphy.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
> index c0ddb9273cc3..46345e4f4189 100644
> --- a/drivers/phy/mediatek/phy-mtk-xsphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
> @@ -61,6 +61,7 @@
>  #define XSP_USBPHYACR6		((SSUSB_SIFSLV_U2PHY_COM) + 0x018)
>  #define P2A6_RG_BC11_SW_EN	BIT(23)
>  #define P2A6_RG_OTG_VBUSCMP_EN	BIT(20)
> +#define PA6_RG_U2_DISCTH	GENMASK(7, 4)
>  
>  #define XSP_U2PHYDTM1		((SSUSB_SIFSLV_U2PHY_COM) + 0x06C)
>  #define P2D_FORCE_IDDIG		BIT(9)
> @@ -107,6 +108,7 @@ struct xsphy_instance {
>  	int eye_src;
>  	int eye_vrt;
>  	int eye_term;
> +	int discth;

Please see 

https://sashiko.dev/#/patchset/20260413122836.4848-1-chunfeng.yun%40mediatek.com

>  };
>  
>  struct mtk_xsphy {
> @@ -256,9 +258,12 @@ static void phy_parse_property(struct mtk_xsphy *xsphy,
>  					 &inst->eye_vrt);
>  		device_property_read_u32(dev, "mediatek,eye-term",
>  					 &inst->eye_term);
> -		dev_dbg(dev, "intr:%d, src:%d, vrt:%d, term:%d\n",
> +		device_property_read_u32(dev, "mediatek,discth",
> +					 &inst->discth);
> +		dev_dbg(dev, "intr:%d, src:%d, vrt:%d, term:%d, discth:%d\n",
>  			inst->efuse_intr, inst->eye_src,
> -			inst->eye_vrt, inst->eye_term);
> +			inst->eye_vrt, inst->eye_term,
> +			inst->discth);
>  		break;
>  	case PHY_TYPE_USB3:
>  		device_property_read_u32(dev, "mediatek,efuse-intr",
> @@ -301,6 +306,9 @@ static void u2_phy_props_set(struct mtk_xsphy *xsphy,
>  	if (inst->eye_term)
>  		mtk_phy_update_field(pbase + XSP_USBPHYACR1, P2A1_RG_TERM_SEL,
>  				     inst->eye_term);
> +	if (inst->discth)
> +		mtk_phy_update_field(pbase + XSP_USBPHYACR6, PA6_RG_U2_DISCTH,
> +				     inst->discth);
>  }
>  
>  static void u3_phy_props_set(struct mtk_xsphy *xsphy,
> -- 
> 2.45.2

-- 
~Vinod

