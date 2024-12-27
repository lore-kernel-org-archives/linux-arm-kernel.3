Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB5EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 09:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/+CIqg/CUo0VxNvFxQ8Y1Up/GneeJJ+mO/CkN2ZV8c=; b=b0RSD2lnX/XJQ9GkwH2QZFDTy+
	Kd6m+XbT30vMqAmth4ExGcKTMAbKsuaHvyxDk4RswgLSGHqO3I+UrDXvGkvpMdU5S1q2kVvkgspyO
	e6RRo0PHAB4UWsAuRxEVqeqWKVwpGvkXWVa3SxVuSsHA8992DeicpIbSWODEoblAHk97HtBufAiKd
	NmcOtzfAgJ5QdxfRY0gRScT8ra9hHHWIRpaSgHciBmeMQ//GAF73lU3YTdQRy70ywM+DoFasYhfKX
	KXWRsXo98PeDJyDMxgfrpVOW3N4E+kLVLXccO37Z0TxHD8ErZthwu6Td/fzZKctmOqvfNO60jEWye
	Mh0wcjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6Cy-0000000HRVF-1f8Y;
	Fri, 27 Dec 2024 09:00:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6Aw-0000000HQy4-3G0M;
	Fri, 27 Dec 2024 08:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BF12A41377;
	Fri, 27 Dec 2024 08:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290CCC4CED0;
	Fri, 27 Dec 2024 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735289909;
	bh=KWMos2seUO4wodgxGzGoi9Slnj20nfEtA0FL5awPNbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KclY7O/q7tB23uWCBoKsyLOFXRuS+0KzOGCZPrAwAxCf6dDNwRlZSo+x0Q0SzegHg
	 16B9aZsqjnrNJ1Lv/V7BN12xFtU1TBZVwaCywHpXfOS+en5aefdsFinB3lWPY4WgPT
	 sWOAEwzbLP2F26gfp3hJAFg7DUNshlCL3hjEax/DuYRZqg5f4bd6Yf0OBC65Ed9bXi
	 H8YdDSwwn96IppLHjQats/i8Z2szP4mVM+Wyzf2g+OCQGGkbjKiW3E3MtphhPnnLZu
	 0v2wRft79H15UKBwz4p4PeuQOyMOn5meb0CfXC7mGk/Jm06IvIe9aTu11sSqZyS5HB
	 0NdbtIEf9qEGA==
Date: Fri, 27 Dec 2024 09:58:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, David Wu <david.wu@rock-chips.com>, 
	Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: Add support for rk3562 dwmac
Message-ID: <rfkjixkwira6lko62qpl5mlnwq5swzbqtaxwdjoavdt4as6uxb@wqa5er4dtl3n>
References: <20241224094124.3816698-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094124.3816698-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_005830_891068_25BF5B60 
X-CRM114-Status: GOOD (  15.17  )
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

On Tue, Dec 24, 2024 at 05:41:22PM +0800, Kever Yang wrote:
> Add a rockchip,rk3562-gmac compatible for supporting the 2 gmac
> devices on the rk3562.

Usual comments... we see what you did here. No need to repeat it in
commit msg.

> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index f8a576611d6c..02b7d9e78c40 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -24,6 +24,7 @@ select:
>            - rockchip,rk3366-gmac
>            - rockchip,rk3368-gmac
>            - rockchip,rk3399-gmac
> +          - rockchip,rk3562-gmac
>            - rockchip,rk3568-gmac
>            - rockchip,rk3576-gmac
>            - rockchip,rk3588-gmac
> @@ -49,9 +50,11 @@ properties:
>                - rockchip,rk3366-gmac
>                - rockchip,rk3368-gmac
>                - rockchip,rk3399-gmac
> +              - rockchip,rk3562-gmac
>                - rockchip,rv1108-gmac
>        - items:
>            - enum:
> +              - rockchip,rk3562-gmac
>                - rockchip,rk3568-gmac
>                - rockchip,rk3576-gmac
>                - rockchip,rk3588-gmac
> @@ -59,7 +62,7 @@ properties:
>            - const: snps,dwmac-4.20a
>  
>    clocks:
> -    minItems: 5
> +    minItems: 4

So all devices now can have 4 clocks? No, constrain all variants.

Best regards,
Krzysztof


