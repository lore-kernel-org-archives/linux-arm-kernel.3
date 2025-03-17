Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B214C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 12:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjV/I2fEfxjcoP8gAnydAdTVwP1+scv9m0uCGjJEH5Y=; b=SB0375VOEIzC5DYPJDR022HA0U
	Wk/JQ3vr4mztnTi0DyZAkBDZJpis6IXcsoNbtgklFhUOWAwFR2g7q6V42rObw9vDYoffFQDIrEB04
	UBY2p7J1RnYAMa1rRHk1dErAp9NovnSjxSTOfntaEq7gzwBezgFoTHBBZxfsmh3kwoH3sfJHo9saO
	0DT0q48tuIFtgb7O4ICMTIgA+WRA4Is6H7MMzsB6xki+FAo6Ywi+K/gpMIPClxxXGoemh5Ic52K8o
	fcvWgnjL9LNriOVjdCUdbjkQM+QN5nlZ/qlmgOU39wINeVWdOMjPK5PsV8y/NnkH4kfmmdSREH4/Y
	OYfaiKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA1L-00000002dzl-3vmj;
	Mon, 17 Mar 2025 12:56:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9q4-00000002c6T-28ct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 12:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zjV/I2fEfxjcoP8gAnydAdTVwP1+scv9m0uCGjJEH5Y=; b=uwTmUe6wsrJ41nfKAKTp0Yu0hf
	CfH6FmTXxj4xWQt3NWyGIJxsrJHrc6CvrNQngk8V2Tu7/bmgNxWES97qeznElbW5UQ3RepjVLvL9x
	rN8PEO2jFnMmc8/43/rpWwfg0j7BNOoZQgNYIqGM7OHdQBOgbtgly58cwIThnaMwI318=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tu9pd-00680C-0H; Mon, 17 Mar 2025 13:44:37 +0100
Date: Mon, 17 Mar 2025 13:44:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, ratbert@faraday-tech.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Subject: Re: [net-next 3/4] dt-bindings: net: ftgmac100: add rgmii delay
 properties
Message-ID: <27927166-d73b-4837-90a9-ed15661b0a6e@lunn.ch>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-4-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317025922.1526937-4-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054504_561823_D6CC1249 
X-CRM114-Status: GOOD (  15.04  )
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

> In Aspeed desgin, the RGMII delay is a number of ps as unit to
> set delay, do not use one ps as unit. The values are different
> from each MAC. So, here describes the property values
> as index to configure corresponding scu register.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/net/faraday,ftgmac100.yaml          | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index 55d6a8379025..c5904aa84e05 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -66,6 +66,20 @@ properties:
>      type: boolean
>      deprecated: true
>  
> +  rx-internal-delay-ps:
> +    description:
> +       Setting this property to a non-zero number sets the RX internal delay
> +       for the MAC. Use this property value as a index not a ps unit to
> +       configure the corresponding delay register field. And the index range is
> +       0 to 63.

You have to use picoseconds here. As with all DT binding, you use SI
units, and the driver then converts them to whatever value you need to
poke into the register.
	
    Andrew

---
pw-bot: cr

