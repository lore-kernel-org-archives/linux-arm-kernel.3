Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54B2CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu0aDdw2yCaFAqkxdtah8DUDl9FQjS2LgWWADairsGw=; b=Y5aSN1RpV4v8F+clh8ek/GqxmH
	6Gl4wvB8OpRenb9ksUfH7033gThBzE+6OPODG6ZLu3ielEpFl7tmplkXe7HdgyEAhBnX2/i+4kRBh
	Bm6Vqpsr1dYaoSFmTMSbwArpU6biQflR2GxCoMc8MH64//rJomjFoAB5rL18Zo2Slw/D3YBMuY/ly
	qNO4tg95BNQn5wcjxlwNUgxRl+KxefnqSpqW1uC5TnjnC1TUTv2ghL7ae90Y4iodgRbm6HFdTDnI4
	D3gn8IE3fmGxO8QDYghlncCjOOe6C3DA+Hbq4CCsFHQ2gBgT64eTnm/bJzKUuWcDuA9PMeS+Oog2C
	zwGWtnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yA-00000008rDf-2OLC;
	Tue, 09 Sep 2025 17:17:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxVg-000000075Gn-1snj;
	Tue, 09 Sep 2025 12:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gu0aDdw2yCaFAqkxdtah8DUDl9FQjS2LgWWADairsGw=; b=DnNXlQ0+zLuyTXLWphWT9DDau3
	mFybIqE4+Vg2jII/qlncvNiqjALvYnZ00ul56WRWZBy4z5AOPKXHxqeK/UaMZUjOSvskGnV6ylGhF
	iPnkYynjB9HIAbmJplOVSA2X0OQL8vYd+luuhrEIKj3/9W43L1OC1e7FXloV/tgGajrE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvxVQ-007nOT-18; Tue, 09 Sep 2025 14:31:28 +0200
Date: Tue, 9 Sep 2025 14:31:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kaison Deng <dkx@t-chip.com.cn>
Cc: Rob Herring <robh@kernel.org>, Jimmy Hon <honyuenkwun@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add devicetree for the
 ROC-RK3588-RT
Message-ID: <307a76a6-cc92-44a1-9ac0-97005bf51b4b@lunn.ch>
References: <cover.1757322046.git.dkx@t-chip.com.cn>
 <42ae6d16ed9162582e7b03cbad661a7950c0db55.1757322046.git.dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42ae6d16ed9162582e7b03cbad661a7950c0db55.1757322046.git.dkx@t-chip.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_053144_485213_4513980E 
X-CRM114-Status: UNSURE (   8.66  )
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

> - 2x Gigabit Ethernet, 1x 2.5G Ethernet

I actually only see the 2x 1G. Is the 2.5G not supported yet?

> +&gmac0 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy0>;
> +	phy-mode = "rgmii-rxid";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus>;
> +	tx_delay = <0x47>;

What happened about my comment that "rgmii-rxid" is probably wrong?

If you think it is correct, you should reply with a
justification. Maybe PCB is very odd? In which case, a comment would
be good to explain who it is odd.

	Andrew

