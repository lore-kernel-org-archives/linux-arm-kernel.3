Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE73C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNrC5rlHKCOH5xusMQXkhUiFivWWVVsm7aCuKKAQMf0=; b=w4CSw2gbHEAfI9SDSSaOe5XQ9b
	IY5fv02OViMRwYMBmlbIRCMHcez7Md8PMlUQMI+DsKNvUcEVr6mmY6+84LCM3ToAH/5EsKHy1GWGY
	9Q0W4+Z5xS5xXrWwQy3rJqHkj/6fEX1dYrVhziJ1jyD2rnImBqDn3e8x+wFm1QcFRJJuevKrKPuUj
	SOS+dYKiirXgyu5bZmcCpADpPYEFm2O6DVQRGHM02QzJus5Z8QjJ+P5lLiGSstWVcOYkSVznaaCZH
	HCVOs7VWIOefr7dY8pJNOoZv2BARPibvyBn/orHXYvF2hyWcbf06Mvk9q/OdaetzkB7bJ7u2rd45G
	w/JhUXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyEPL-0000000E6Mk-2iqw;
	Fri, 28 Mar 2025 18:26:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyENP-0000000E67d-1N0X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 18:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RNrC5rlHKCOH5xusMQXkhUiFivWWVVsm7aCuKKAQMf0=; b=OzPQhm5AKHHFbL1GlosMauqtz2
	3z0uXkAILxQYLzqyEiqX8zwyAUS/V5b5rE/mcuMowZWgSZv0na/yOy9FR8PwDajs+MZGBqxJcPN9V
	xvNWYI1Ph7Kwx22NJPwyt2kryIe10BJuo3gc+NFeT/sDA0Ip2LDMsVKwSAQfg72D+8EI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tyEN0-007Ntl-B8; Fri, 28 Mar 2025 19:23:54 +0100
Date: Fri, 28 Mar 2025 19:23:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <45c6cb9d-b329-4b4c-a480-08110a546fb6@lunn.ch>
References: <20250328133544.4149716-1-lukma@denx.de>
 <20250328133544.4149716-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328133544.4149716-2-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_112419_365467_D4897BE4 
X-CRM114-Status: UNSURE (   8.21  )
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

> +                ethphy0: ethernet-phy@0 {
> +                        reg = <0>;
> +                        smsc,disable-energy-detect;
> +                        /* Both PHYs (i.e. 0,1) have the same, single GPIO, */
> +                        /* line to handle both, their interrupts (AND'ed) */
> +                        interrupt-parent = <&gpio4>;
> +                        interrupts = <13 IRQ_TYPE_EDGE_FALLING>;

Shared interrupts cannot be edge. They are level, so that either can
hold the interrupt active until it is cleared.

Also, PHY interrupts in general are level, because there are multiple
interrupt sources within the PHY, and you need to clear them all
before the interrupt is released.

	Andrew

