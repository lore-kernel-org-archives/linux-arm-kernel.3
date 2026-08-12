Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CF3C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwZHukbqLv7BHqS0JF9Z6TGHh6LoMK09HeqSBe948E0=; b=jMYBbf1rcozxhk1AP/PC4Gj99y
	PoUXORkpzGeX3GTRP6e2nfMChOlgvkds4McLMWnySC35nLcCkMjBqPtyFGDtLndxFTrNodG1L+b7N
	QCEOZQ8xk6IS2PrJGoxzPqiPlZXO9WZQKdBEUBWnylE+Wh/llwoUuMAw5EBNYtdyshnhzniJEb7xN
	qWjFyCzSX6MDVseVRmVSQP0Htff0fFD0dmDFFzxlfjQUEPQfjO1eBFxTdzisZ3Xo91IidWSYIwu7D
	Sr1zQwTcu8gyGrOJe+6XzTIMFkyglZwMaxmvuCk+N7ZLSDpJQvUXrBWe4EXBpsZRG7kMOeJHOfucW
	oRSGIe0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGsr-0000000H4L7-3ckg;
	Wed, 12 Aug 2026 21:53:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGsp-0000000H4KS-0HsD;
	Wed, 12 Aug 2026 21:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RwZHukbqLv7BHqS0JF9Z6TGHh6LoMK09HeqSBe948E0=; b=FtawfCMarRQisIuojPvxU6cEHB
	6K3HFmxxNtgbjeavOzneNPWx3BEqpxR24sQ5BmSqS8beNlOJao6fXnt2Bhmx36xzwNNuRdSOEp12+
	VMewNvBWyr6iAQ8FoXhRILQJo4JguHdE3+GJJauDwh3HLP68EePTG20MzuRR9gK+jQKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wuGsZ-00HKYZ-UH; Wed, 12 Aug 2026 23:52:55 +0200
Date: Wed, 12 Aug 2026 23:52:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Radxa E54C
Message-ID: <6248f137-ff98-4d3e-9ca6-f94741533686@lunn.ch>
References: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
 <20260808080018.1492239-3-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808080018.1492239-3-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_145311_104545_92270D72 
X-CRM114-Status: UNSURE (   7.37  )
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
> +	phy-mode = "rgmii-id";


> +			ethernet-port@6 {
> +				reg = <6>;
> +				ethernet = <&gmac1>;
> +				phy-mode = "rgmii-id";
> +				rx-internal-delay-ps = <2000>;
> +				tx-internal-delay-ps = <2000>;

Both the MAC and the switch are using rgmii-id? How does that work?

	Andrew

