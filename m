Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72348E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3YibXlXnh2nxnKraQDFOv5AxvjsQSovo3m91FxIX/E=; b=LdjKGDD5lGhagHpWd12/BsNMXN
	j/V7onSpT2vxW4tFes+48eFWd0ImyhNPTTUHX32B5eyw3PL19undFmtF1R/JoLSKwwqYWfAgl8enn
	FphjnJFCTtXLeFQ90bSGbPm5x+GqePiyL5Y7Xzov1qcBA+bkIHEB9bJVTegI45zlffP9QJxLqSq7G
	FsrcEqs6ENYVrhwDuxhqy4dEM0HOjf8e1BgVyRsT0h/OB9cvwZoErSCOf3wMEWPBiUOB5dfFsV5kS
	CVLnV3iC4Jlq2YSdsWtxnsF3eNCLHI89OiZP30VZ8zdIeLQ0gw77o7VUXvbH9+UVOuimKlhm7Ccs8
	Ht4D5m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAKZ-00000004g5k-36MV;
	Fri, 13 Dec 2024 18:24:03 +0000
Received: from [185.11.138.130] (helo=gloria.sntech.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAJU-00000004g1H-3kC4;
	Fri, 13 Dec 2024 18:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i3YibXlXnh2nxnKraQDFOv5AxvjsQSovo3m91FxIX/E=; b=EcCr8kT5LaBT0fWsCrzlHiDjVM
	wMpYf4dYNpORW0wp2+AlVVBHRZYQrQdLli0jqD5dCV0mCDe9pdbRssQasOALVpAkkX9S82rGvk6Mv
	P3jTVRsraO0MdM0uHxBZ6l3iUNckAA9J1XG3ubEx63BeffX6bGu05/bPSZzD+V7c/eZKHq/3WfP+R
	5RZqWzvdEvDavL7l59FVJmdzO0e0C8fOe1RW5moZErd4uY25TAK6EtzwelXWhYyFW/jyRNM0H8zKr
	GZMk0lSsr5o1X4dYTb+7nZYQZzSydDPM3NnVmd//vHXfdEpIlfyP5cLrfkY20N/BZ/aNRI9bTCWKX
	qPKb6DUg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tMAJR-0008Ao-8N; Fri, 13 Dec 2024 19:22:53 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Shimrra Shai <shimrrashai@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org,
 Shimrra Shai <shimrrashai@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
Date: Fri, 13 Dec 2024 19:22:52 +0100
Message-ID: <1908542.tdWV9SEqCh@diego>
In-Reply-To: <20241213180855.16472-3-shimrrashai@gmail.com>
References: <20241213180855.16472-1-shimrrashai@gmail.com>
 <20241213180855.16472-3-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_102256_959561_B8192815 
X-CRM114-Status: GOOD (  17.35  )
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

Hi,

Am Freitag, 13. Dezember 2024, 19:08:55 CET schrieb Shimrra Shai:
> Document the compatibles for the new board.
> 
> Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 753199a12..9ee96acdc 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -190,6 +190,11 @@ properties:
>            - const: firefly,firefly-rk3399
>            - const: rockchip,rk3399
>  
> +      - description: Firefly ITX-3588J
> +        items:
> +          - const: firefly,itx-3588j
> +          - const: rockchip,rk3588
> +

looking at the product-page, this is not _one_ complete board. Instead
it seems to be a system-on-module + baseboard design.

It looks like it uses the Core-3588J system-on-module [0].

We already have a number of those in the binding file to take as example
on how to structure that. For example FriendlyElec CM3588-based boards .

So you could do

      - description: Firefly Core-3588J-based boards
        items:
          - enum:
              - firefly,itx-3588j
          - const: firefly,core-rk3588j
          - const: rockchip,rk3588


Thanks
Heiko



[0] https://en.t-firefly.com/product/core/core3588j



