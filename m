Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00EDC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlpmkVwXsSfTCEC12mussiAVSmhATir2Oel/lJPjC/g=; b=UTn2PQqV4p64FAuilSEk9LUNFF
	Sg2yKuI3V64UwVgOUrjHrTBNEdcXxvw1lUUv/vcU02JUmIvCV3qKIkdI0qwRHy5Pa5vdXV8MXxYl2
	3X0anPyOGSMOMRz3MqYGCHDGuCYEZoSVZ8eIOURM+BMQuqbn4JKFdharO/XnjfWxMOz1UDXHik0Ha
	Q9Ky1p4n5+DKW7lWuMMGkDl1fTCUYLZK+tDo5oqHRXCRcgrTx2R9vEFEgp8Xswn7uZIgl65HegPuU
	oFa09ghulQ7PX+iLsldnPze4Op0LCnbYL8grnwlPd+zYpCeC8XCSe596oBndp3AvXRpAOQpwWDJqJ
	qzdyh4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsb7-0000000BnJe-3uxG;
	Thu, 27 Mar 2025 19:09:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsTN-0000000BmPw-0CjW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:01:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F829F6;
	Thu, 27 Mar 2025 19:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743101951;
	bh=jHiI8/2owluTBB3WHQQN9xYP11FWsCemYmAsZhjPNCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fs347zSJVHQzT8CTrlNNTSh/teH6wTkT6xwdknDyYuy5XZCaAJBKDNSvV+J+ezU3u
	 7F5MZ3bII+Dde7y26fecQDxXrgWoYagTBqIpLU8RiUOqvJGaR2uixUbzi6pvfLq60Z
	 6WxFtXQYvJO1eXmGyIB7xs8vBiTxwTTAv1lKs6AI=
Date: Thu, 27 Mar 2025 21:00:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Message-ID: <20250327190037.GB22659@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-11-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-11-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_120101_241166_DBD5C206 
X-CRM114-Status: GOOD (  19.43  )
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

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:30PM -0500, Frank Li wrote:
> Add linux,cma node because some devices, such as camera, need big continue
> physical memory.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 9 +++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 8 ++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index 50fd3370f7dce..61ef00f4259e1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -113,6 +113,15 @@ dsp_vdev0buffer: memory@94300000 {
>  			reg = <0 0x94300000 0 0x100000>;
>  			no-map;
>  		};
> +
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
> +			size = <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};

This is system memory. Why is it reserved here, hardcoding a specific
use case in a board DT, instead of specifying an overall CMA size in the
kernel configuration or through the kernel command line ?

>  	};
>  
>  	lvds_backlight0: backlight-lvds0 {
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index be79c793213a5..89c6516c5ba90 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -56,6 +56,14 @@ dsp_vdev0buffer: memory@94300000 {
>  			reg = <0 0x94300000 0 0x100000>;
>  			no-map;
>  		};
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
> +			size = <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};
>  	};
>  
>  	reg_usdhc2_vmmc: usdhc2-vmmc {

-- 
Regards,

Laurent Pinchart

