Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A59CEF8FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCkRlVCdINVX/d0GrTkissonHJsJ6vqzbdscW2/sp8Q=; b=OwEmwBy+VvLomKkBqC7sHiioUZ
	1N7q9DBCx58A6Kta/Fs1klczdnnHgfNfcUcpQydZ19CiBA94ONi9+eBSKP7BKREx8eACR4dDC7soE
	BRz5XGbD5MORfynzMqjjdh9kBsHb6yOlaXIpWd1L8d+FKMbZ2DWW8gbNZM2rnFdFyWQcBoPeqQ42V
	hQmfEwsAdrTHOtj7eA/ne9uhIue5NPF2jxtVosYcmONqtzejh2kXLoeat1mgzU/eHoQkRUo9sXy01
	LztWaaHBJ67z24QaK2vgaj0qUkzyJ9v6xWrawFNgYH7wG0qXm0GA3UudEPJ24WrZExn3XsW6FYbl0
	pGWVqefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnI1-0000000HPE5-38LL;
	Wed, 04 Mar 2026 14:33:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnHz-0000000HPCZ-1Xym;
	Wed, 04 Mar 2026 14:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tCkRlVCdINVX/d0GrTkissonHJsJ6vqzbdscW2/sp8Q=; b=nAynHu0Bl5xKTKARpi8Dn2cZE2
	rYKN+DMGgatHHukuueqjfSGvZIhAPDm/7fIPY+8E1D3JUUqDHXoMNatsBl4N8W5XTWuvNjYuqjm8h
	HVoc30sq+CjN+2wiK4IBiPfkTDAtvSomAtpjRXb9fnKz6laIFT8jtIaBi6Sb9+m33Rpk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vxnHW-00A78i-ME; Wed, 04 Mar 2026 15:32:58 +0100
Date: Wed, 4 Mar 2026 15:32:58 +0100
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
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
Message-ID: <0f76019c-78d3-4daa-b709-bab61f9537b5@lunn.ch>
References: <20260304025521.210377-1-dennis@ausil.us>
 <20260304025521.210377-3-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304025521.210377-3-dennis@ausil.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_063327_408436_B68A1B5B 
X-CRM114-Status: UNSURE (   7.42  )
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

I know you are just moving things around, but please try rgmii-id...

> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	pinctrl-names = "default";
> +	tx_delay = <0x42>;

and remove the delay.

    Andrew

