Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF7BC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsA6KKXBssJ1iIcKLlTRguM4ORKS/1udB7qIaUjE/R0=; b=FfKWO87JZM/ymeyp/4zU1GSC+h
	4K+MUwqwI+EJJxV0Xk3FtizC3iPE41EFseK5WaK7xDzKcHsTnxDYgbbMvinNi8CNjqTYEG5686tEP
	OMFP1baN7dBja7tbkBBfR0//QWLi0V4lUCtL/1uMSarP1nevnNW4iyH6XguE+qPVAmhqpwlWM9SpE
	QZLbHV5ySh4thRM8hMZK6tIoBQZe/uPNR3jmrrPXCMVzbc3UN6dC81Lvq0yvHad3OCuM0p/YonX+x
	jDKGN8NGklrqc0xPPsiATsS6cFKRmpBJO+nmR00UXX5D0/DeDBwaiaFVCKm8Y8IWkm+ZzVAHluX+t
	LVJaDIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOema-00000004a2Q-2WOc;
	Mon, 09 Jun 2025 15:51:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeFD-00000004UhU-3y4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZsA6KKXBssJ1iIcKLlTRguM4ORKS/1udB7qIaUjE/R0=; b=lYjyQ3vLi2ZFLQCqgjX2vvYXlm
	KZTL1Dnq2GZ9aiM4ulxWXsHnMxdYaaFsDzbvTuReyMl3a0Ss2vKiHYjHHbklnkHbU4J1Cq3y//cbF
	73xkHyzkON5CFtNs4p0w27GbLNXEYTk0jp6tvuOYhboBgdWPkd3opByLKbzI8/nKpu/8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uOeF6-00FA1Y-OG; Mon, 09 Jun 2025 17:16:56 +0200
Date: Mon, 9 Jun 2025 17:16:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
Message-ID: <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609140643.26270-1-stefano.radaelli21@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_081703_993575_2C45EC17 
X-CRM114-Status: UNSURE (   9.72  )
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

On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> MDIO bus at address 4.

> +		ethphy0: ethernet-phy@4 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <4>;
> +			at803x,eee-disabled;
> +			eee-broken-1000t;

The commit message says it is a Maxlinear. So at803x vendor properties
are not relevant here.

    Andrew

