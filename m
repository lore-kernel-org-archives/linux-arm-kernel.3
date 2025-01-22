Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A65C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Lq9Kjm6oaTW/kq2gUN7bQx6esqNXtu313ztE2IMpXU=; b=xuDsAejCLfiQc/R0ioBL5NuEn7
	kv0tb72/DkzU85bfKHGecMyRsQrgDxMDRKej9ZZESoM2WS30AxDTGhC89wzrdoQY/GA8Bf0MCQgY0
	d7STflnKL25ly++lTPg2eIeo9QJU4F095ulUoJbkBAAyPrjDWYGMQXTTlU+U2WoDbVF0zLZhJmydH
	qpbwwW+pOSCBZU3kBuIxNZDhFN5AjUn5PunMNNYESKdSN02OImXClaEICFtXLZO1A3QMggRrEeIkK
	m/sXerpDIQ0s7fAGARN48aUM6qw8cLV7NSjnV3zbHbZcXDTgpfM7ELdOZcfbqLPKIIy+uDZGVuj9T
	xFTjszHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taViJ-00000009f8w-0gOL;
	Wed, 22 Jan 2025 08:03:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVh1-00000009ewv-0qOu;
	Wed, 22 Jan 2025 08:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13B1B5C5CC9;
	Wed, 22 Jan 2025 08:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65541C4CED6;
	Wed, 22 Jan 2025 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737532950;
	bh=XspACQ/SeIuejKutebYI6GMThqDAj/TizHr7BbFXO7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/kZPNcSjiI/Ky3ZvFc/16EujczsfY9jiKFmxPVKYqXHbRZ9VdwGIhcIGF/CZ4PhP
	 9C/JEFht/idis5hcpSGhoFjEaQPUxG5fPMHhkvJoLBae+iwtUu9O0EZeOWDNb0QIFW
	 UFwvx5sSQt+CrtvwCNRwwjTaTPmZY6McNxNDNuKmbhbrFAUTkciATTqzTHHFN117/p
	 GM75R50CvKz2W5JNtmuRgTJ+4TAL3AYiwvcoXsRiC2J9rlYiQK0Qi2vwDfzt3+4yyA
	 vC9W1V9ppB9MiBcuz5GF2hcNCHP5e0zy+00nlCaKWr8yjK0ulqXfGxok5gQFFYJTXQ
	 AOPAU878L6Z6w==
Date: Wed, 22 Jan 2025 09:02:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v12 10/13] dt-bindings: display: vop2: describe
 constraint SoC by SoC
Message-ID: <20250122-turquoise-condor-of-temperance-b8dfea@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103254.2528004-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121103254.2528004-11-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_000231_323418_5AD9349B 
X-CRM114-Status: GOOD (  20.11  )
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

On Tue, Jan 21, 2025 at 06:32:47PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> As more SoCs variants are introduced, each SoC brings its own
> unique set of constraints, describe this constraints SoC by
> SoC will make things easier for adding new variant.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 

> Changes in v12:
> - Only change the description method for existing SoC.
> 
> Changes in v11:
> - Remove redundant min/maxItems constraint
> 
> Changes in v10:
> - Move interrupt-names back to top level
> - Add constraint of interrupts for all platform
> - Add constraint for all grf phandles
> - Reorder some properties
> 
> Changes in v9:
> - Drop 'vop-' prefix of interrupt-names.
> - Add blank line between DT properties
> - Remove list interrupt-names in top level
> 
> Changes in v8:
> - Fix dt_binding_check errors
> - ordered by soc name
> - Link to the previous version:
>   https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u
> 
> Changes in v4:
> - describe constraint SOC by SOC, as interrupts of rk3576 is very
>   different from others
> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> 
> Changes in v3:
> - ordered by soc name
> - Add description for newly added interrupt
> 
> Changes in v2:
> - Add dt bindings
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 44 +++++++++++++------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 2531726af306..f23939e67fd0 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -14,6 +14,7 @@ description:
>  maintainers:
>    - Sandy Huang <hjc@rock-chips.com>
>    - Heiko Stuebner <heiko@sntech.de>
> +  - Andy Yan <andyshrk@163.com>
>  
>  properties:
>    compatible:
> @@ -120,43 +121,58 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-vop
> +            enum:
> +              - rockchip,rk3566-vop
> +              - rockchip,rk3568-vop
>      then:
>        properties:
>          clocks:
> -          minItems: 7
> +          minItems: 5

I don't see any changes comparing to original binding. At least not for
clocks.

> +
>          clock-names:
> -          minItems: 7
> +          minItems: 5
> +
> +        interrupts:
> +          maxItems: 1

This is useless and not explained.

Best regards,
Krzysztof


