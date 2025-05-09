Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C233C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIcKZHCAukp5Tc8ogLnA+hESpUvqKiScaTQ3cUe/lcY=; b=UkNKmUlSsxL5bQngM4aWv/O7n2
	5Rl6mzZ3NStHC7c6z5IP2MLihDOf0fLHOEEktUTyrpQnH54bDDGfoHoSsndRWx3C4HPRMVW5f7n/X
	SMmqjXThaOqKCNCOTE5tppiVVJfZ/oEwum/7n61l29gHCQiCKN91BEr0atlvrs9VSLnz9YabCVDjh
	L7Wq0aGQ62wvLtX3nnjANly5NGbfZDukt/aZy+ZG9KpuW5UhpcBWw4ngCUbbCNu07SWXh94F30iS4
	+uBqRph+xDTxAVdZWDj+zr/6nDhePMeUgEjm3CG/6c1GO/+TA8ek30NKzF0bx/DrzYdb/sjxgn1mX
	RcyzS/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGrJ-00000002Zlo-108C;
	Fri, 09 May 2025 06:05:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGpH-00000002ZYC-2b7G;
	Fri, 09 May 2025 06:03:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E211A4C5EA;
	Fri,  9 May 2025 06:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51685C4CEE4;
	Fri,  9 May 2025 06:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746770593;
	bh=miqYtWyTKqalmWH/MGZunXZc53zAHSRNBQvWm45NGQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDvfscBnFjzX5lYFVRWG6HqIvO2BmUHXP4zFLn5QBcuK2I4fgvV0Gqf+PjThAc0cx
	 dtRc+LWiQv87umLgJ78pVfk0qpIROY64IG+qnWyNx4HlqTEQnUO+EyibIMB4bo/jOW
	 RuM27JQIdkhpEXtKDmJot+11r9jRUXeM2f1Odv1r6JQTWkW/Xh/sdFnzlo68WpO92H
	 Ro4xSyi7MCUWh2ikYungCMBqbZJaM0v6HxtY7MGie6Fz4Uv3r3VkcFOECk19h4lGKG
	 eUeq4ceJoisr4sYDZ/6e3W8WD8FG20XVrGBoIUFSSG1rWws+U2kT4gc0cN7Xn01ztv
	 ZrhXtKYGV+a5A==
Date: Fri, 9 May 2025 08:03:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Shresth Prasad <shresthprasad7@gmail.com>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <20250509-secret-smart-kangaroo-fd3b58@kuoka>
References: <20250509004121.36058-2-ziyao@disroot.org>
 <20250509004121.36058-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509004121.36058-4-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_230315_733239_2958CB9D 
X-CRM114-Status: GOOD (  13.46  )
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

On Fri, May 09, 2025 at 12:41:19AM GMT, Yao Zi wrote:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---

Eh, no...

>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> index 888e6b2aac5a..bd064754e537 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - rockchip,rk3528-naneng-combphy
>        - rockchip,rk3562-naneng-combphy
>        - rockchip,rk3568-naneng-combphy
>        - rockchip,rk3576-naneng-combphy
> @@ -102,7 +103,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-naneng-combphy
> +            enum:
> +             - rockchip,rk3528-naneng-combphy

Still not tested. Neither v1 nor v2 was ever tested.

Best regards,
Krzysztof


