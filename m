Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A45CC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=841zC2Csr85cTavsucPR9yszjss8BCSvwiJmornsOZ4=; b=rSaRMBKuxp8AVgyLpJHTiB6wGB
	Nix1RMJ7Ab1ba6BCbbfut8M0WFRZZajjEK86rO59Ie7K2ztwNjlNSQ90e1oROUtqTJsw/78dW7Svk
	aPtoAEGcLqF7szIUemKuUzSzGGFIBV6e/kyVMfzGpMMuozFCheiGbF3pmcNirsxA6xdOz1xzf52MK
	oordCehwatGUqoeijBxeU2rqXkttTqw3d8uKnnFX7Bt6VEZARi83B64L9MFgttpDr+OdSI4992nkN
	PwdMAtOdvTy/s9vq/b4D25ByxE7r6YIkmgnuZjgYxRntJ8nrLSI+B0p4CSCADtaEvShxo9HLidonO
	adQcYe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezbZ-000000087UA-3VSK;
	Thu, 24 Jul 2025 17:19:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueyE5-00000007vja-1OrP;
	Thu, 24 Jul 2025 15:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=841zC2Csr85cTavsucPR9yszjss8BCSvwiJmornsOZ4=; b=dipFsxOLF+O/7PNONN9fA+tmfI
	r0/k1NhJR56ETFx7iQNjhzYFKwuZY70M8OWlq8vE4SVINnqQfqQK3xeRjp695GEIjkT69sMhR0ljG
	baoKhaI4VDTne5f/s6cXGs0jQ+e2ANtioX1VshDhrut4dAfhOOWfqFEQNebN1s+aQQdw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ueyE0-002mMX-Op; Thu, 24 Jul 2025 17:51:16 +0200
Date: Thu, 24 Jul 2025 17:51:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: rockchip: use MAC TX delay for ROCK 4D
Message-ID: <f22243f5-759a-4ff2-8d14-6edb49d87c52@lunn.ch>
References: <20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_085121_381624_358410A8 
X-CRM114-Status: GOOD (  10.75  )
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

>  &gmac0 {
>  	clock_in_out = "output";
>  	phy-handle = <&rgmii_phy0>;
> -	phy-mode = "rgmii-id";
> +	phy-mode = "rgmii-rxid";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&eth0m0_miim
>  		     &eth0m0_tx_bus2
> @@ -246,6 +246,8 @@ &eth0m0_rgmii_clk
>  		     &eth0m0_rgmii_bus
>  		     &ethm0_clk0_25m_out>;
>  	status = "okay";
> +	tx_delay = <0x20>;
> +	rx_delay = <0x00>;

What does 0x20 mean? Is it less than 2ns, or greater than 2ns?

Have you tried "rgmii-id" and small values for tx_delay? If the
hardware needs 2.1ns, for example, the MAC could add 0.1ns and the PHY
adds the default 2ns. That would allow you to conform to the DT
binding.

What PHY is this? Have you looked it you can control the delays the
PHY adds? If you actually need a delay of 1.9ns, maybe the PHY can be
configured to do this? That would also allow you to conform to the DT
binding.

	Andrew

