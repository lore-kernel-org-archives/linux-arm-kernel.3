Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C8FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 02:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkxgYxTNqu7mP4kOu/Y9O91wYDA4EffVDU8j+3XGFac=; b=Kxg/tBZNRCB5Ax/xtvodTxEaMn
	KDdppZhFK2XA+G0srmthmC/j2F7uUrCRS4TJ/51A/hvXo1m/S10xGXvnHTDPh4W1TznRFzdub4O+t
	P7+Du0LNd49L06py33yoNDCkDBKgzgWZARkFxjhu3MhEV1d3SEQB6dl3AqLcRgY4jB+xmqbufnXvt
	1bIu766DSWlj1P60GA+RY+YgXEq573xQKq4LnQUMmzKyvxPigGxAI0FsFLB1X4vZ4JsK0PsUr8SQq
	Qi4U6CsqqoYNllZEhb9b1F2l7GhPDxQNoM825+m92kVRp6oIHj2gqn3hjkc9MKJffrSiBkby1oT45
	9s+07dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uznTA-00000004YkR-2rnh;
	Sat, 20 Sep 2025 02:37:00 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uznT7-00000004Yjv-2UZx;
	Sat, 20 Sep 2025 02:36:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uznT2-000000006vy-29eO;
	Sat, 20 Sep 2025 02:36:52 +0000
Date: Sat, 20 Sep 2025 03:36:49 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: bryan@bryanhinton.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	krzk+dt@kernel.org, matthias.bgg@gmail.com, robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set
 console UART to 115200
Message-ID: <aM4TQc32cNYY-wLA@pidgin.makrotopia.org>
References: <20250920000619.2643457-1-bryan@bryanhinton.com>
 <20250920000619.2643457-3-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920000619.2643457-3-bryan@bryanhinton.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_193657_637074_1A871A14 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Sep 19, 2025 at 07:06:12PM -0500, bryan@bryanhinton.com wrote:
> Use the new uart0 label for the console and make the speed explicit by
> adding current-speed = <115200>. This keeps the DTS OS-agnostic: no
> bootargs or distribution-specific properties are added.
> 
> Verification: Boot-tested with mainline Image+DTB via U-Boot on OpenWrt
> One (MT7981B). Serial console active at 115200 baud, and DTB decompile
> confirms serial0 alias and stdout-path set correctly.
> 
> Signed-off-by: Bryan Hinton <bryan@bryanhinton.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

See comment below
> ---
>  .../arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> index 4f6cbb491287..1d2c3a21019c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> @@ -8,8 +8,21 @@ / {
>  	compatible = "openwrt,one", "mediatek,mt7981b";
>  	model = "OpenWrt One";
>  
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
>  	memory@40000000 {
>  		reg = <0 0x40000000 0 0x40000000>;
>  		device_type = "memory";
>  	};
>  };
> +
> +&uart0 {
> +	status = "okay";
> +	current-speed = <115200>; /* 0x1c200 */

The comment with the hex value should be removed. There is no need for it.

> +};
> -- 
> 2.51.0
> 
> 

