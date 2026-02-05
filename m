Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3D0EC1EB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiGoBkEnV90MVWjY4YdaHWKIlAoMwCWJG9iOnM9l0eI=; b=t77TyKxsFi673w5E6Pf2Zr0Je6
	HwaKylp5d2Da9/m61D9a/roNON6xllYmNqL4IF1CnB1usEfMbaO7bpvDSui7mhsBKcGPAN/cKvvn6
	jLlGo8Wp7MxIS/8sH+XJY+OPV4AteLA6QWnLKsyXqLES8SWv0V9by+jMOgSTwPtNNBFSVEc5Y4Y7P
	Ju2uohxwvX9tCAQcgf1IkZuHFT/ZsVB1qdPvVtABtWXsCemKdgI7ATaFxd7bm3FcjvoTcOv4zsgUX
	CoBQkv5YAEr6iRInpx8Bho3Ke4eVwk5lYtIeCxzEI8VEKxMx8uCYIOQr/8XqSUs4bn0DV4afGofd5
	biG55Xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzSR-00000009x7T-31TA;
	Thu, 05 Feb 2026 13:31:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzSQ-00000009x6i-0rkN;
	Thu, 05 Feb 2026 13:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E70B60010;
	Thu,  5 Feb 2026 13:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD79C4CEF7;
	Thu,  5 Feb 2026 13:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298300;
	bh=AUQFfU1fkfkYPuW5V8T6xoRa8uZPnGIai8orsPwhtOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6eYmqV7WCmThEk7wZK3ZffIxf7rs/+OjSNoi+Fqwrb8lUVp8teCejpP7msvpLvAC
	 4im2YokdR2XeIVsdFhKS1AMFgnaIUEqaqEgAAlGFXaVd+WDqO2Y/XlvNY/GjsWgBnE
	 cJlxzesSJytLbOvjG0uVxaiRaFTcllpsD70oqQ3RrXAOjzXFeHRLwCVwe3LWlZwL+U
	 AMdJNOZqkoYM4tVUhoblnUENgUYy1Ql1+RUyRKPKItRDopgGlDABE21jldTeh9W6//
	 hr30x04VDIuYazXVMRJWmckA+1f3sKHc2sn5/BdAXrVKHgVKcUDxSM1cHzF1VxyhBQ
	 UONJYSp0vSOhw==
Date: Thu, 5 Feb 2026 14:31:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, alchark@gmail.com, 
	andrzej.hajda@intel.com, conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
	airlied@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, Laurent.pinchart@ideasonboard.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	nicolas.frattaroli@collabora.com, robh@kernel.org, rfoss@kernel.org, hjc@rock-chips.com, 
	sebastian.reichel@collabora.com, simona@ffwll.ch, tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: rockchip: Add rk3576
 DisplayPort
Message-ID: <20260205-shrewd-honeybee-of-diversity-f3e9c6@quoll>
References: <20260201081338.407999-1-andyshrk@163.com>
 <20260201081338.407999-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260201081338.407999-2-andyshrk@163.com>
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

On Sun, Feb 01, 2026 at 04:13:27PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The DisplayPort found on RK3576 is very similar to that of RK3588,
> but work in dual pixel mode. And itself does not depend on the I2S
> clock or the SPDIF clock when transmit audio.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Remove unnecessary maxItems
> 
>  .../display/rockchip/rockchip,dw-dp.yaml      | 27 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> index 6345f0132d43..8a5299755abf 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> @@ -27,13 +27,11 @@ description: |
>    * Pixel clock up to 594MHz
>    * I2S, SPDIF audio interface
>  
> -allOf:
> -  - $ref: /schemas/sound/dai-common.yaml#
> -
>  properties:
>    compatible:
>      enum:
>        - rockchip,rk3588-dp
> +      - rockchip,rk3576-dp

Wrongly orderd. 76 < 88.

Best regards,
Krzysztof


