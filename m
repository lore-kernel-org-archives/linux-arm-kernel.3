Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6612CFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLyZOwcrQQEQKVT+Q7DXMuOhuMMLw8pvyi5FmPDO1tQ=; b=l/spdy4eJKdtyMEQ4Os635rewV
	K9IGY9Q4Gi5NI1P+38p0hV+EZuX2eN3+a3tkDlVyMbZEDOaYtSI0Zf4lLeHIJDpktLj6JQVOvcwCo
	/j/kBbaei7FuVC75/fLQwvHlnjnsSZxesN4Lfz3/dIGnvLhmSTK9W8Ek1UVSZMfaStS+EvY3WTlv1
	poNV2Po2Tpr3K4ayijTBi3nShpjrZt9eX9wdQVEgdx20fIKW7PEbxZUd2gwl8ScsLEfq05/W+6fHc
	9e3/a0vvymawQ8DFTklwSuA0b7i7D3EYSlxk7ajb3+4jkrovTeF3FgGI5XvxV4eUWH4/cJ0EUjsxg
	S8ue0GiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zKn-0000000EGiA-3et8;
	Mon, 04 Nov 2024 15:49:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zHX-0000000EFyr-3KKV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:46:21 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1t7zHM-0007wV-Fl; Mon, 04 Nov 2024 16:46:08 +0100
Message-ID: <2d950234-b71f-4879-86f9-e36086914e88@pengutronix.de>
Date: Mon, 4 Nov 2024 16:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: marex@denx.de, andreas@kemnade.info, kernel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20241101135406.47836-1-festevam@gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074619_871899_B67EF2B8 
X-CRM114-Status: GOOD (  18.07  )
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
> imx6sx.dtsi has the following lcdif entries:
> 
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This causes the following dt-schema warning:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> 'fsl,imx6sx-lcdif' fallback.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> Changes since v3:
> - Also update the example.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 8e3a98aeec32..aa3204b6aff9 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -19,7 +19,6 @@ properties:
>        - enum:
>            - fsl,imx23-lcdif
>            - fsl,imx28-lcdif
> -          - fsl,imx6sx-lcdif
>            - fsl,imx8mp-lcdif
>            - fsl,imx93-lcdif
>        - items:
> @@ -32,6 +31,10 @@ properties:
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
>  
>    reg:
>      maxItems: 1
> @@ -182,7 +185,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      display-controller@2220000 {
> -        compatible = "fsl,imx6sx-lcdif";
> +        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
>          reg = <0x02220000 0x4000>;
>          interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

