Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAC0E6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=havzK/SwF0OREzHRiv691TKr+k8MMceBKF0LuOOygAE=; b=YEnCqr6cxtXTqTnDmE3kx07K/Y
	mV5sfV3dYUesMUTSQ1uN08wL7OZh2iBiuX0D9zUqL+8x7WW4s4BaeE3zUv01sxgi0d/mbIIoX9quU
	0brcocJslguoRnoOz76yUj3qx6usHt35jovHKZwIxqzQb1dmz8Z8742DHUADSz82yGD8ETWiEsszC
	GUPETyvtMXAmM5ofX6nWWkOvwt0vLGQf5LLTXEV4VkF6GROkU0Q2CzIqZI+/m7Ya/xf2itm10Vo86
	pkdFU+5g9LznNEE9dX3HlCf7LBaq6ipcfFhpOXa00CUFWffcrOXzuR6vfPo6CnjGpuj9pbaS1xsxK
	3ZLUKLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzkH-0000000EtQU-29Th;
	Tue, 23 Dec 2025 10:36:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzkE-0000000EtQ1-2Ybh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=havzK/SwF0OREzHRiv691TKr+k8MMceBKF0LuOOygAE=; b=aZLauevLcwMG/dS6u3X7JjCQ3D
	HuNgnIbUxXzfYaLmd4Tpc/2qGNVx/XpFkh7MT/c0ALJF8vlsufhUVxT1LmponF6eHjliWP57PiuMY
	sFY4/9T97AFGLzfZJPzKGd6JuQJP2BRr6vY3MYRLl8DU9Biy2icAyl0WjOKZ1ORlgPcA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vXzjw-000HuJ-IF; Tue, 23 Dec 2025 11:35:40 +0100
Date: Tue, 23 Dec 2025 11:35:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <1e21f828-1b06-492d-bfcd-ab5721621e8a@lunn.ch>
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
 <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch>
 <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
 <35f3eba9-5ec4-4cba-8a64-fb521dc65b79@lunn.ch>
 <CAF7HswN0hhJQ-gmE59cKTuPyzrs1A3rM8Xw+Z8i3_AsHRiNcug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF7HswN0hhJQ-gmE59cKTuPyzrs1A3rM8Xw+Z8i3_AsHRiNcug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_023558_650981_9021DA0E 
X-CRM114-Status: GOOD (  11.72  )
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

> > What make/model of switch is it? Is it unmanaged, or does it use SPI
> > or I2C for management?

> The switch is connected via RMII to the MAC and is managed over MDIO.

O.K. What make/model?

> On our board, MDIO is not wired directly to the processor; instead, we
> use a USB-to-MPSSE bridge (FT2232) to toggle the MDIO signals for
> switch management.

I have to push back on you using a closed source user space driver,
given that i help maintain the Ethernet switch drivers...

I know there have been attempts to get GPIO support added for FT2232,
but i don't think any got as far as mainline. That is probably the
only part you are missing. You can describe USB devices in DT. So you
should be able to describe such a GPIO controller. You can then
instantiate an virtual,mdio-gpio driver to give you an MDIO bus. And
then add nodes for the switch using DSA.

     Andrew

