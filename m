Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E9CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KAN/TL0PYijvGqP9Y/30zrHPi/CEWhklinOLwIY8Ws=; b=rWCjjxHobgXZZAKwEtBZ9nHLNF
	vbfHIsfrs7Rg9Ge3P9dxEee4cKXYg38LkqzhaN/pq68JVja2ME2R22q3ElhnGIhqLX6VwfkwAmrMB
	yi6IAFe/6TfzXQYyn9lLq15QOp/Q9CyllneKCagjqHeesawIa0iC6AaCaTsDegBAVIbOZnS4MtxNd
	4oDTYyITJ4rfeOuAy/rVY6X8/n04Iv3W2LWW7UVuAfBV3B7VVz9483H5NEt6a1S8Z0M6o8LR4Oexe
	YxMVf2inOLzXiDGtBdT4IgjL8d7av0OGsP/XGRMSnf79OuU8uBMu6hUyVYn8prUVD3AGVPREufdw6
	XvGwup6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAFH-00000002gjY-0jOH;
	Mon, 17 Mar 2025 13:11:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAD8-00000002gPS-41UR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5KAN/TL0PYijvGqP9Y/30zrHPi/CEWhklinOLwIY8Ws=; b=A4E4xZ/XcQNU1dNttR8vxdIB3a
	G8tZgnwP5mdeK9G06uuDMoRIhp0sey4w4eB9vB4WlX3MPdCdy/vlZixCQh6m6oNGI1tolR2Wdjp+z
	OHmy/9ZTzpRQjgO8XmJB534lYIUycJTgaiVuWdhuNM9qm+LJkvTqQmcdTYW22NszkbCA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuACv-0068Qc-Mz; Mon, 17 Mar 2025 14:08:41 +0100
Date: Mon, 17 Mar 2025 14:08:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, ratbert@faraday-tech.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Subject: Re: [net-next 2/4] ARM: dts: ast2600-evb: add default RGMII delay
Message-ID: <5db47dea-7d90-45a1-85a1-1f4f5edd3567@lunn.ch>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-3-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317025922.1526937-3-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_060855_019889_308BE822 
X-CRM114-Status: UNSURE (   5.60  )
X-CRM114-Notice: Please train this message.
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

> @@ -147,6 +153,9 @@ &mac2 {
>  	phy-mode = "rgmii";
>  	phy-handle = <&ethphy2>;
>  
> +	tx-internal-delay-ps = <8>;
> +	rx-internal-delay-ps = <4>;
> +

Ideally you want:

	phy-mode = "rgmii-id";
	tx-internal-delay-ps = <0>;
	rx-internal-delay-ps = <0>;

Since 'rgmii-id' correctly describes the hardware.

	Andrew

