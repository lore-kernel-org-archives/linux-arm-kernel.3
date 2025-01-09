Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21989E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Hc9m1dPBDPuWb47dArImrMSzilYfkcFH6qpnwe202U=; b=Z2FujQIaikBuaECVSHwig4XLhL
	rVoUFul66shiQ4Cz/My9tWVbxJsHO5+Io4TrFUepJt46u9RBF+7h8ALtqXFDr9odWAttWoPWZHdNG
	GS6PkfUcRGVWDhtm3mxcWAmCNNBaPmhrYRNVTgIVpP0g2D0onxzAIR1fL74vQ/MzW9FyG+6QnUZcB
	JAEd0EUW+FEuUPM3ArXWkdbqPVozEO5j039LL2rmPTO5ZjnkBOTdK8IHAhdYkFY4yKD6TRVKC+z/k
	v+OyqPgpabTozIjPEi3BSvFfOv/uhGwnDHeRR0k3sGQBddsQXaMcM+BD5gqZdwuxL09Qgqtm8HmWR
	T1eoNuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1Zi-0000000DWMB-0Oq0;
	Thu, 09 Jan 2025 23:04:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1YU-0000000DWBO-2goF;
	Thu, 09 Jan 2025 23:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2Hc9m1dPBDPuWb47dArImrMSzilYfkcFH6qpnwe202U=; b=oBB+UDtlo9fsDTebtDxQhn7Nwm
	VKSxQCiJa5SPi0oW7hlItnioj/0wI8JwrcvxDaLtvGdFsFHWCb5KOmX7ClMseKRNv7Wz63nrRA0aH
	v9GacM01qGUr/QxcjQwfkp7Y7XLFORZnvt2BMrkKHhn5lE/NjizZY/zciikJcplKNCH4Gqb2jW4Js
	9g+Wf9Q5SPYl6g4p07DZfTvBgM7q6lxACDf5rVl4z3IB41nRugDEzZGKSptD3xK+Y0sPEXwJFlmHs
	MAoEso/qR+dr0XXBcvPh3vi+gcLHCzPFip6DsShz/68IY+aH7PGIcl28OYAG94aKMU+1YdvSfcUr1
	UagzyiLQ==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW1YT-0005pB-Aj; Fri, 10 Jan 2025 00:03:09 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Shimrra Shai <shimrrashai@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 Shimrra Shai <shimrrashai@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
Date: Fri, 10 Jan 2025 00:03:08 +0100
Message-ID: <2999810.o0KrE1Onz3@diego>
In-Reply-To: <20241216214152.58387-2-shimrrashai@gmail.com>
References: <20241216214152.58387-1-shimrrashai@gmail.com>
 <20241216214152.58387-2-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_150310_683073_FA911FDF 
X-CRM114-Status: GOOD (  15.31  )
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

Am Montag, 16. Dezember 2024, 22:41:51 CET schrieb Shimrra Shai:
> Document board compatible bindings.
> 
> Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 753199a12..fc7ee86e2 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -167,6 +167,13 @@ properties:
>            - const: engicam,px30-core
>            - const: rockchip,px30
>  
> +      - description: Firefly Core-3588J-based boards
> +        items:
> +          - enum:
> +              - firefly,itx-3588j
> +          - const: firefly,core-3588j
> +          - const: rockchip,rk3588
> +
>        - description: Firefly Core-PX30-JD4 on MB-JD4-PX30 baseboard
>          items:
>            - const: firefly,px30-jd4-core-mb
> 

In v3 [0] the board dt-binding got an

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

so Krzysztof already noted, please carry those forward into new versions.


[0] https://lore.kernel.org/linux-arm-kernel/x7y24y3bkbj5fzx5pdprjr5umg6egxsy2xscfbj3xgzgzubvdk@ppncjiqoekk7/



