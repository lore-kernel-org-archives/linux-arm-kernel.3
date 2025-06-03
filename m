Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4CEC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTrgU+1AMH8ppDvhBBziD30T8+V1scNAGU4VvZ9oUo8=; b=mpt3T+J4ntUYhv0yj6wq22HeXy
	sCvssEXwo2kuDhvKx0Fk4hpN09I67f3UZ4XrKUq14Nd7weJJNJD6IbJsaUc5aYgk4ITvaf95fL7yK
	JzKLJlc2PxdOpTuLVXo5onW0SlUYcHufKGwP8CIoHIPhFWeSe+XP168BicFqh+mDyR6VEJ472DK9U
	NI9TNdSeN6uxrH57WuK0ZFmFT8OyqYxIRwWj5wctCExPSnhib3g8QeZrZ489DBC0KtzvCxJOF6TT5
	dHdCl9fgj/wowaHcYYOiHBayAPPoRF/9Ndf8nLwFD3rt/wVsdNuW9UZBKU0auCOooQo5cS/LRr9gh
	zxCfg/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZU6-0000000BuPj-4BHj;
	Tue, 03 Jun 2025 21:47:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZRv-0000000BtxZ-12pu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 21:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MTrgU+1AMH8ppDvhBBziD30T8+V1scNAGU4VvZ9oUo8=; b=nliAvRAXIFg3vXZcbWDKYDOZTF
	+ICpkfgM1AmA6ULQ0px1RarDvIXCHCZufR/PninsH6nwPz5vU2DDUIePV1+eu7HwHNkBjCERsx+Qo
	IXYc9PQlnqs6r8z9zNuvd+4GY2M99Abc5cYz0r4Cvhuta7uNmrBHGY9xvF91daqBy6j8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMZRf-00Ec3N-Ta; Tue, 03 Jun 2025 23:45:19 +0200
Date: Tue, 3 Jun 2025 23:45:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200
 UT3.0b platform BMC
Message-ID: <dbcdeb49-7118-4517-b965-af580164722b@lunn.ch>
References: <20250603203241.727401-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603203241.727401-1-donalds@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_144535_284251_2B1515E4 
X-CRM114-Status: UNSURE (   6.81  )
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

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-rxid";

Does the PCB have an extra long transmit clock line?

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

You probably want 'rgmii-id' here.

> +	max-speed = <1000>;

RGMII has a maximum speed of 1G, so this is pointless.

	Andrew

