Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233C9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 08:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vj3xyb9NcZOXnm5Z7C3pdz8V9bLlICf/vzmp/zZdUjY=; b=KE3tcp4003Mcd+T/whG7gc+LOH
	KKa+Mp6YHCBCXEJElsJ7g7c7GwQvu/nwsIfVNaue2UwjIgzwgqAm4LTTHZyeIhR20mr/7JIXV2m1F
	lydzBM5JgXz41bjTrdgMA5TOmvCjr1BiskCy1bW+03MolFGP2QXFsbeI9Cnuh6F+TSKdABDZ6EB2i
	nmxR2uxs2TaRI5dg8dtTMebTEQFQHSABNpbOo7D4oJoqGEBdyxYne9kFLA+7bfCF0WPC96BrkFv//
	x+CvtQJWn47pBRY6MRUbGacZPzw6JGuMLf5cZ1xyzaMXJWZ1qGm8L6z+kGxKcsARBz+Zntw3OoZ2G
	lLHnY2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoKf-0000000BEUW-49oS;
	Thu, 09 Jan 2025 08:56:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoJR-0000000BEI1-1nVt;
	Thu, 09 Jan 2025 08:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1218F5C5A3A;
	Thu,  9 Jan 2025 08:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D48C4CED2;
	Thu,  9 Jan 2025 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736412883;
	bh=LombH1FD70xGrzs2x51pntDQW6o2Z1wYpa9hFitkHlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpzT/UaHrYznnPqZq03T5+rn1MsO3ikIHjM++A+fSpNYpveoizqxWcg1FM7AARFy+
	 uFTDL9ym1zgSHu1Go5E0lNhq+YjNmAVRRAwQ5bHn+/EvsjxrQdaInuFa5FA815DPST
	 12BQgzy84zAw308jBjHtERr+wafzu9ujZLlmrfuNpRlwtJRl2KrtrYAaGW2R5VMMYR
	 zPiSQLoN3HLnQt0dnqdhL/8MAhj5MR27OPBFch0W76lnS9enoxZEPcRt7z+h5eVd0U
	 v0HmSl+a49k/GhFBnUAd475JIsgqZUGKDYHOIjpCYgqbo/fRMfxorrloywtbUx/zAC
	 Pw9Qiqf64Lifg==
Date: Thu, 9 Jan 2025 09:54:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	algea.cao@rock-chips.com, kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 13/20] dt-bindings: display: rockchip: analogix-dp:
 Add support for RK3588
Message-ID: <gmwmnjc4pzyzzstyozlfcdaw2ntfxg6ixofio2j746hmixhblc@sjbcvwcgitmy>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-14-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-14-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_005445_513390_C95CEA4B 
X-CRM114-Status: GOOD (  17.47  )
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

On Thu, Jan 09, 2025 at 11:27:18AM +0800, Damon Ding wrote:
> Compared with RK3288/RK3399, the HBR2 link rate support is the main
> improvement of RK3588 eDP TX controller, and there are also two
> independent eDP display interfaces on RK3588 Soc.
> 
> The newly added 'apb' reset is to ensure the APB bus of eDP controller
> works well on the RK3588 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the main defferences of the RK3588 eDP and the previous versions
>   in commit message
> 
> Changes in v3:
> - Expand the property clock-names, resets and reset-names
> 
> Changes in v4:
> - Remove 'spdif' clock which added in v3
> - Add the comment of newly added 'apb' reset in commit message
> 
> Changes in v5:
> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 37 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index eaf4e67e232e..3cdea9e63522 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -15,6 +15,7 @@ properties:
>      enum:
>        - rockchip,rk3288-dp
>        - rockchip,rk3399-edp
> +      - rockchip,rk3588-edp
>  
>    clocks:
>      minItems: 2
> @@ -30,12 +31,6 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> -  resets:
> -    maxItems: 1
> -
> -  reset-names:
> -    const: dp

Widest constraints are always here. You only needed to add allOf.

https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml

Best regards,
Krzysztof


