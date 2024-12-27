Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8486DE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGF3GbDMK2vYUgKAzQGJZKGE4fT5sHY8wXVzXFnODsQ=; b=H8hPLKzlFdPVLT3kURsYgPkuvS
	KmYplYhI8hWo/VA+UrERWd/JFp2FWaEHO5c9BuxOxLaJ6Xuog/n9JZU00UbQquMv84rDM4zWe0mwN
	JMV1tFzVjF/VcqDU/OUCPuPeJrHqd5NvUDaFqo9+MH4R0zFaXBBQqLi3Q1bHH+Zt7tYGVg2wBQUpV
	oLEPkzEEnT/Mkx0OBMIrCcLyikw0bSpM8LPvvCa1snUwYC2bp48sPA/bjEuBssZXqs6DT7QMhAmvr
	JznqnuQqqSGhe99nqmjUxYhfecxOaYjStBXI7apYlTBEytvPpTW6yDfJl0FJ/sYv2qV5vwB4vzlUZ
	n7JuP4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR69N-0000000HQeq-3xI4;
	Fri, 27 Dec 2024 08:56:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR684-0000000HQR2-0zEg;
	Fri, 27 Dec 2024 08:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96AF4A41302;
	Fri, 27 Dec 2024 08:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC94C4CED0;
	Fri, 27 Dec 2024 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735289731;
	bh=tIr3Bw7GISihWLQBUVLaTqGB+HTC9NniLcfir5D2zis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVDPfKVLwxD2I1eDq3ldOGEuYb49ANjWZAsaURvBcNrUS9fbOs0m70/8VdShjWbQI
	 76hl3smVOzTQdS7FUl6AAbdzwZThaU4uFKuVKUUTyDQnYoBglwfHjmJirWyKAvj98V
	 Pt09MZ2SF1d8DXboa8BXI4o0C9y8Gd7xNQOGIRBtWAXExWBzLn4T6KxgalWqLcBJn/
	 nsbTaHzXqHcRBVmBSiHev5bIbTrkTwvfiZlEhfZVsf9Dmo08tAu0RWPUWYTCSsIg/a
	 Zc/x0pcUz03Sp89Wu+sKM0BRk4l7izjnprC1b5atX3HFSA5UUJAhrGblcPwhiDQVfO
	 c7CGaGef886Lw==
Date: Fri, 27 Dec 2024 09:55:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, cristian.ciocaltea@collabora.com, 
	detlev.casanova@collabora.com, krzk+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] dt-bindings: phy: add rk3576 hdptx phy
Message-ID: <gkx4rmkwhngqsn5wotp3mdk6nn4oydrzgkfwhansd6j5ap5pek@rowfnww34rsd>
References: <20241224091919.267698-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224091919.267698-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_005532_347595_C521C5FC 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Dec 24, 2024 at 05:19:13PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The HDPTX PHY on rk3576 is compatible with it on
> rk3588.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Add compatible for it.

"Add compatible for the HDPTX PHY on rk3576, which is fully compatible
with foo bar."

One sentence.

> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
> index 84fe59dbcf48..364db2049ce2 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
> @@ -11,8 +11,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - rockchip,rk3588-hdptx-phy
> +    oneOf:
> +      - const: rockchip,rk3588-hdptx-phy
> +      - items:

Why items?

> +          - enum:

Why enum?

> +              - rockchip,rk3576-hdptx-phy

So that's just enum with previous entry... but you said compatible, yet
nothing is here. Test your patches - DTS will fail on this. Driver as
well (assuming you expressed properly compatibility).

Best regards,
Krzysztof


