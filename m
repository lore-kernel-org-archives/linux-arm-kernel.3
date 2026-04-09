Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE97E98FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVBq9I32wjd5Ilt6dTkAOT6ab0TEUzTAeqRtcnHP2r4=; b=b20xZVSUUF3asqSLIPbaQL7H3c
	XEKwRcKb1Wg559uOPTIr9rFyFnsw4LlOkh7NJANubnvW3YJ44K7XeT80h6RxElLvgV44Bi7QTsamO
	AbryPr8GYnWjhuDeb0MYTsqA7iCjy5prAly4D9L15sjDm9FqhVMXgVClj58oBkRJmLmrzByu1QYgi
	2547HPJLdH/TLER9yCMLxYyM5xcXR+rJug9bnJjnGDQXMnhKT02CzJJX1i5+Gk5m4DI3nyJVN375R
	6yoUIMCAtGjIuKC+2xbl91e1uoB37ad10pKLS26WofU/IyIh5vjWj87NyVEnljx8kre+PEcrn48eE
	5Tq5MPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApYI-0000000AXGr-29pa;
	Thu, 09 Apr 2026 13:36:10 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApY7-0000000AX9r-2z2l;
	Thu, 09 Apr 2026 13:36:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wApY2-0000000022P-3G0v;
	Thu, 09 Apr 2026 13:35:54 +0000
Date: Thu, 9 Apr 2026 14:35:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: mediatek: mt7988a-bpi-r4pro: update
 gpio-leds
Message-ID: <aderMs16WpR9yPMe@makrotopia.org>
References: <20260409131754.121737-1-linux@fw-web.de>
 <20260409131754.121737-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409131754.121737-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_063607_936566_021AE663 
X-CRM114-Status: GOOD (  14.67  )
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

On Thu, Apr 09, 2026 at 03:17:50PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> On the official case the red LED is named ERR, the blue LED is named ACT.​​​​​​​​​​​​​​​​
> Reflect these labels in function and set them default off.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> index 759f608d1081..7f770a76775a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> @@ -61,14 +61,16 @@ gpio-leds {
>  
>  		led_red: sys-led-red {
>  			color = <LED_COLOR_ID_RED>;
> +			function = LED_FUNCTION_FAULT;
>  			gpios = <&pca9555 15 GPIO_ACTIVE_HIGH>;
> -			default-state = "on";
> +			default-state = "off";

Just drop 'default-state' entirely from both nodes.

>  		};
>  
>  		led_blue: sys-led-blue {
>  			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_ACTIVITY;
>  			gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
> -			default-state = "on";
> +			default-state = "off";
>  		};
>  	};
>  
> -- 
> 2.43.0
> 

