Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C4CCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L75aBSsCGpBryRml4FN363qW1z8PZx29ZjzFOlFMwSw=; b=ZkzbW9rECI2rd9ZNR46FAfOSK6
	YmGXGAh0BqZ6rIZ5TiC5oyickHt5U0PA6nRBVZa4aRpAHFgiC69OBPfKbRG68MfIYhFvcUG0J00wh
	Lx2jx+IErbvfq+2MqWb6Lnp1U0j0c1UADGquRAAijT5fM/+w+gv1pEOnM+UeaR70Tye76/pDTKUd6
	Aq9ditIzMj0BuOz4SEJtQ71+Z+Cpe9mLHMa2Cj/zeLBoRcob4f3Rc4/eX3g65MRAb56YfMh+IAdIS
	Ns5w/BXgg8gugy0EWwLhoUb79wmSGymJIfZliGhPlGt26+9h/H98ilR6vOVBLPGTbJXtKHnMVuRjE
	Go0VQHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdoG-00000008ia8-33l4;
	Thu, 25 Jun 2026 06:43:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdoF-00000008iZv-10Z5;
	Thu, 25 Jun 2026 06:43:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3682B60218;
	Thu, 25 Jun 2026 06:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC6A1F000E9;
	Thu, 25 Jun 2026 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782369813;
	bh=L75aBSsCGpBryRml4FN363qW1z8PZx29ZjzFOlFMwSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L5u/UClwtiDhr17ilKFgEfTZ2MMjqkM08fRr4vse7c7eWk9w8wRKVi+QjH0rJBJoG
	 DTPv6CdQYFmK49eIhsSmj2YI+FWrrClAGY5ssliz0L4fqU1v/EY8WZkbboi0SbSPM1
	 a1gMJmnxb6UkuAY2SmEKTTg0f5Xsm5i9kRBOepU3oBrjWQu7+iNpcfuLDVm2LJ7r5k
	 JVOqGWfGckjV+boyeLoUNI9KRoMppggrQ6ZSfwfhZuIfPTt/ZD4jiqaw6+oZSQYaGF
	 8UPf28Z+snwLYheykEggC8ZYf71r7VC9CGF3YmkbhXlHN+LVpt2LHLz7cWKJo40BAf
	 hzV1dwhpQfPOg==
Date: Thu, 25 Jun 2026 08:43:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Message-ID: <20260625-lean-debonair-anteater-c22f83@quoll>
References: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
 <20260619-feature-mipi-csi-dphy-4k60-v2-2-323356c2cc2e@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619-feature-mipi-csi-dphy-4k60-v2-2-323356c2cc2e@wolfvision.net>
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

On Fri, Jun 19, 2026 at 11:13:40AM +0200, Gerald Loacker wrote:
> Add support for the optional rockchip,clk-lane-phase device tree property
> to allow board-specific tuning of the clock lane sampling phase for
> improved signal integrity across supported data rates.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> ---
>  .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 03950b3cad08c..010950a8a8856 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -56,6 +56,15 @@ properties:
>      description:
>        Some additional phy settings are access through GRF regs.
>  
> +  rockchip,clk-lane-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7

Missing default here. If default is unknown, explain that in commit msg.

Best regards,
Krzysztof


