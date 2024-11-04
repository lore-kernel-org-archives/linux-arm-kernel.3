Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432ECCFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRz/jCOR5nhO6PdsCUpGFQ7Ypz/AFG5Fmh0XSJYheh4=; b=nvM05X7AFqx2UmJL6POqQyKvTl
	E5Bj51LjeATs+0LN1yeCmxAOMnvI+XZ+idSrFX0/74JZM//ETolELgJya8bgAcwNUJM3JjRnB/ioB
	Q7wNMM3gkQo+6tm3D0KwzipRApYzL4t0Ch6TrzdlTdHKNSjZw9htEKSfy3IpDTXNNWwR7K6k7vInm
	yTaiCdL+8OSFImWoRGx5f1kgcry6fHlK9OylWrnfyKRsfhlEyG9Y0QW7lxsHp7HCXiMzf4PV47Ozz
	bCfG8Q55TjRjHVgCQkeIYCUE2Tk7924BqOAIH/KUeCmx8+JcwM3jYPDtvHGpx/6EDTiYrDgjJGh2j
	3pux3+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zJ8-0000000EGPx-16dq;
	Mon, 04 Nov 2024 15:47:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zH1-0000000EFqk-3LJg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:45:49 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1t7zGg-0007oc-VO; Mon, 04 Nov 2024 16:45:27 +0100
Message-ID: <4feae7cc-273a-40a3-a075-ad82b4ae542c@pengutronix.de>
Date: Mon, 4 Nov 2024 16:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: marex@denx.de, andreas@kemnade.info, kernel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20241101135406.47836-1-festevam@gmail.com>
 <20241101135406.47836-2-festevam@gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241101135406.47836-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074547_842193_5BF1039E 
X-CRM114-Status: GOOD (  18.33  )
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

On 01.11.24 14:54, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> 
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
> 
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.
> 
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> Changes since v3:
> - None.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index ad0cca562463..72e509bc975b 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -23,14 +23,18 @@ properties:
>            - fsl,imx93-lcdif
>        - items:
>            - enum:
> -              - fsl,imx6sl-lcdif
> -              - fsl,imx6sll-lcdif
>                - fsl,imx6ul-lcdif
>                - fsl,imx7d-lcdif
>                - fsl,imx8mm-lcdif
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sl-lcdif
> +              - fsl,imx6sll-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
>        - items:
>            - enum:
>                - fsl,imx6sx-lcdif


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

