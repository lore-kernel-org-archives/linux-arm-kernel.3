Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39EAC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AekzSPGBth5emf9W8MMPPGH/AY7iv/rs/Urm2hfXkCI=; b=gZmUHI9MkxuoGGWfM7H3h2okQz
	TJy7UT9Nt3rIys6PwDNccG7cRz6lNIz7cmMz44o+fGDHxFQOiLbwSLS/6SqoudoZPRxpCKjGffFLK
	GOAaez5lmQBPkIn5xaLncm07VyBuk25TayVIm3RshbEVzD7Jnd6jk9H+j+Qw3hFt7miHfZsTw01W9
	PihqCaw8spEd3U1iHIz+WsQTS6r+4GAS8ZWCN/XSzA8evVaan/Ej2Pe4zxeicTBjd6ijWWmf9x09c
	56tGmvGm02BcWHKxUP+jSEjulyK0hpCRsN2KTOiABVFCp0tvcs30jKfr2k/VKzvzLx1dckZGDyVzR
	G9zmnSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmej3-0000000F2Sa-10l1;
	Mon, 24 Feb 2025 20:06:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmegA-0000000F23R-1WFy;
	Mon, 24 Feb 2025 20:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A15046112C;
	Mon, 24 Feb 2025 20:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD12C4CED6;
	Mon, 24 Feb 2025 20:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740427429;
	bh=q+d7nm16qN8obUZdl22kTIu5V70Mi/RYYzCCy6bqBeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qreTVj6NyKUm6lrRKJbd3QXAxIqqOAJWW8G16C5zFxWhZCQDN1BM6OAGYPLK8+CyZ
	 1FRGrGG5N7qqtX5xzjmsQYb8/ojIngs7HVgz2F6fXoXPi0coG24ncjg578qVp1tL6V
	 CTsoZeST5a0x5h1xMyu0fuWWkWEkOVvIpp9G9PaHC2W3yNb8M4ibhsIUNMKB5dojV4
	 kmpAIrzQk1gIPOzxo1dJ7Pkv4QD1dpfdlV/bNRrqNEEHL5Kd+g3HFabCw85n+SVN0q
	 sIX/kHXEUh1r4I/KgO/yF9HVqbfplwRbkd+TsnyVKxb+IupTJ0hZjpXP1SlA2uRG7l
	 pefph794JXEvA==
Date: Mon, 24 Feb 2025 14:03:47 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org,
	cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
	yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: rockchip: Add schema for
 RK3588 DPTX Controller
Message-ID: <20250224200347.GA4011821-robh@kernel.org>
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250223113036.74252-2-andyshrk@163.com>
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

On Sun, Feb 23, 2025 at 07:30:24PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX
> controller. And this DPTX controller need share a USBDP PHY with
> the USB 3.0 OTG controller during operation.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
>  .../display/rockchip/rockchip,dw-dp.yaml      | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> new file mode 100644
> index 000000000000..b48af8c3e68b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DW DisplayPort Transmitter
> +
> +maintainers:
> +  - Andy Yan <andy.yan@rock-chips.com>
> +
> +description: |
> +  The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX controller
> +  which is compliant with the DisplayPort Specification Version 1.4 with the
> +  following features:
> +
> +  * DisplayPort 1.4a
> +  * Main Link: 1/2/4 lanes
> +  * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> +  * AUX channel 1Mbps
> +  * Single Stream Transport(SST)
> +  * Multistream Transport (MST)
> +  *Type-C support (alternate mode)

???   ^

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

