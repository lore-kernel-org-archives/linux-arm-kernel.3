Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22E4C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKdkdDPyvZ62ZrXaZVj0Vvds1rdLEKKjzjPorufxHRk=; b=PPv4vezVAccItLg/9numjrcC1q
	QoPeXFDQZkVwJWtAjbmvpeb21dilWhXA+5YxAkgYvvaGle+G15/tzjri6/2FImuwfbpPR+7ybvUcA
	i4lu842TxYFMlfbBMG+Ur0ACFjufuSPMH/QaxbrYg6HzM0IBNvvJzCIJ3GPzlUTLulxekY7H2zs8h
	rfrGaTMStGNYkhtOOFMOEDt1sd8GiGpzD+tvWlOgxuhBeMcaJ3UuElYx/iTntNHBuQyAyDJiNhWXi
	Z1WvC1mcWQdr5dT15u+4Um5qjMntasu0XM2px16iZfQRAVZeVF2+espbZz5Pts6pfQOuFGxNpQZ/O
	9iwNffmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB3Z-00000005x9Z-2ZnR;
	Tue, 08 Jul 2025 16:20:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAXa-00000005rlB-3t98;
	Tue, 08 Jul 2025 15:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36B225C5A07;
	Tue,  8 Jul 2025 15:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1F2C4CEF6;
	Tue,  8 Jul 2025 15:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751989649;
	bh=9FILRncBVkMcWlg7bphOJ6WLT1i1sMQ9/aj0fvNpAZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpHqpEe4OJt3bSjV0GUV+OV+vE84DzupQmimawIBkC7W8Q3987d9H0T+FmyqDObRl
	 qaJk7QZyhb7Qrh10gnyUhjRCAnJ5asunOFgJdKK0ypjqL7oi65ly6g4FYaRRWFIpBS
	 NuPGe4Kc0IAJzpoIRoIkmAHTxZJ3BcTJMQz2mqNhr7BjtaNGWICFOghXQA3Togbjj0
	 1IsYpFiaeTjTiLA3LXY3hRwJCzXt7BIK8YyRG8/ja13u7CJWQYCxgzzG+DCDUxurFL
	 2kKot4Hd5hJRA1+p745XmCkLo4s7X4KvupJiK6AZz9ZMD9aNP+Y/X5t0p83WdFfYIG
	 NWS+0uhXE9iog==
Date: Tue, 8 Jul 2025 10:47:28 -0500
From: Rob Herring <robh@kernel.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/10] dt-bindings: display: rockchip,dw-mipi-dsi:
 Drop address/size cells
Message-ID: <20250708154728.GA401802-robh@kernel.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
 <20250629123840.34948-4-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629123840.34948-4-didi.debian@cknow.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_084731_048293_1880D203 
X-CRM114-Status: GOOD (  22.29  )
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

On Sun, Jun 29, 2025 at 02:34:44PM +0200, Diederik de Haas wrote:
> When the dw-mipi-dsi binding was initially added in commit
> a20d86e7f964 ("Documentation: dt-bindings: Add bindings for rk3288 DW MIPI DSI driver")
> the #address-cells and #size-cells were added as required properties.
> 
> When the binding was converted to yaml format in commit
> 0dac2102cf6b ("dt-bindings: display: rockchip: convert dw_mipi_dsi_rockchip.txt to yaml")
> those properties were demoted to optional and removed from the binding
> example.
> 
> As for the compatibles:
> - rockchip,px30-mipi-dsi      removed in this patch set
> - rockchip,rk3128-mipi-dsi    never used
> - rockchip,rk3288-mipi-dsi    added (invalid); later removed [1]
> - rockchip,rk3399-mipi-dsi    removed in this patch set
> - rockchip,rk3568-mipi-dsi    never used
> - rockchip,rv1126-mipi-dsi    proposed (invalid); never accepted [2]
> 
> [1] 282e2e078ba5 ("ARM: dts: rockchip: Remove #address/#size-cells from rk3288 mipi_dsi")
> [2] https://lore.kernel.org/all/20230731110012.2913742-12-jagan@edgeble.ai/
> 
> The #address-cells and #size-cells are useful (and required) in the
> ports node and for panel(s), but those properties are declared in their
> schemas already. Now that there are no remaining users, remove these
> properties from the Rockchip specific extensions of the Synopsys
> DesignWare MIPI DSI host controller.

The change is fine, but your reasoning is flawed. These properties are 
used if you define DSI devices on the "DSI bus" where the address of the 
child devices are the DSI virtual channel. Often though that's just 0 
and not really used, so you don't need it. 

The change is fine because these properties are defined in 
dsi-controller.yaml, so specifying them here is redundant.

> 
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> ---
>  .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml     | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
> index ccd71c5324af..0881e82deb11 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
> @@ -58,12 +58,6 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> -  "#address-cells":
> -    const: 1
> -
> -  "#size-cells":
> -    const: 0
> -
>  required:
>    - compatible
>    - clocks
> -- 
> 2.50.0
> 

