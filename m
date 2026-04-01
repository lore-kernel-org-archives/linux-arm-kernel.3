Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DCAD35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdzbCT4MvQu2UJrbXTBr/kQGOfZEL/wlR5Wrm8JW9Zc=; b=eS1uef7ezX3Vmm/F95uEG71WQx
	4MeBbYf12UPym8McDa/E7QFNNTlxLrc3J81AUKR8N5gYOF18ZJxkAsWIlcV7R4LaY5h5MeoIp/i2z
	U+p27Kgi5Bd69Yn8xjHpKjgteW0olNxdsZEPEiv5aF6yCuWJ6Uk99zShiJlF8xaMVQ9lO8JGYtO5v
	3VfXqvrTPBbaEQ7zA6aTwqSlXlwSdtGRorozlqvPRaKSDL58UwtAZZTgtnlTFXN16wJk8CLXhHlmI
	ER9y0CHGMBaRNnTvAY3Foptf2zhki0ztxEj/IgWdKaORj7iKTwhUTwOv/LG8jkzrZuE163sVQi0/2
	9d5kOqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u8I-0000000ElEs-03OC;
	Wed, 01 Apr 2026 11:53:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u8F-0000000ElBs-30p0;
	Wed, 01 Apr 2026 11:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rdzbCT4MvQu2UJrbXTBr/kQGOfZEL/wlR5Wrm8JW9Zc=; b=f2c71K2W8jkpY+jkLY+hls0LiW
	pf11a6nSF1WZDYF7YjZJfkQc1G7xDd8yhU/nM3iQsidCuqi43Dwn+udHP2Z7ILLjfh8e/hopSisqx
	xhcVRYCxs06whhqqA+zk5SdiNyYmjYND3iW+5dFjBgyFMixWZ8X2NZPx9BxtfY3/oPUI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7u7o-00ELSY-WA; Wed, 01 Apr 2026 13:52:45 +0200
Date: Wed, 1 Apr 2026 13:52:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
Message-ID: <b733883d-e515-4946-a81f-d1a595985e01@lunn.ch>
References: <20260401010707.2584962-1-dennis@ausil.us>
 <20260401010707.2584962-3-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401010707.2584962-3-dennis@ausil.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_045311_759365_1D2650DA 
X-CRM114-Status: UNSURE (   7.38  )
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

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-rxid";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names = "default";
> +	tx_delay = <0x42>;

phy-mode = "rgmii-rxid" means the PCB provides the 2ns delay for
TX. This is unlikely to be correct. Please try "rgmii-id" and delete
the tx_delay.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

    Andrew

---
pw-bot: cr

