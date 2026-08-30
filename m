Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945D8C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvp1pXNe5TqeRLtSD0qiAJjH/t/R2XXpNq+2z1rCEXU=; b=Ri3U68yauywZSaDm3Ss2MBR9fT
	T37B1V/fvM/E5z/T8wp8ZNnXzLQ8y7Rb4mfcdLa9eEWF0VEYXX8C06O8huxhzCz981CI09ZRMeiyo
	/l0RhPAob2ODNsNcmXU9acSxN6C1EgxMzNn9Mtf3PK64FBZwm2sVHExPUpvr4H8uEAoHBRUSBrA9+
	T8ePyVUYY5IlcMY21IdbotlUOntAHlNyu+wSRBK/1KxOwHfPqtg7i61VHyLpA47GIQHBcB8AEQ3SU
	sEuUIQG17YJhvb7bR0DLbU9fwbBby9SsOlGjQxAFUDlnElbrP0vHi9rEpicFKrpJSzVnIsnMEmMXC
	C1wosxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m4D-000000084hf-1OMn;
	Sun, 30 Aug 2026 20:23:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m4A-000000084h8-1Dx6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fvp1pXNe5TqeRLtSD0qiAJjH/t/R2XXpNq+2z1rCEXU=; b=Vjh/aTjJEGC3nFUNrV6JDgufiv
	vaTbt6Pkv5qks/+2yHr3qWO9ssIQ9iRuffyV90OaMvgiW0ifnYe2Pg7a4F03VTx/uWY9qVZHKixg0
	NV7N/++3Qslszxy654Zlsr/GEnlZhbA2RDY2mHOUyIYOH0Om434kTC0LeTFiMNnsdvrA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x0m3l-00254S-3T; Sun, 30 Aug 2026 22:23:21 +0200
Date: Sun, 30 Aug 2026 22:23:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <d60f234e-1b9e-44cc-9bad-da79e794fe44@lunn.ch>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_132346_334086_790ACE8F 
X-CRM114-Status: GOOD (  10.78  )
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

On Sun, Aug 30, 2026 at 11:50:34PM +0530, Prasanth Kumar Padarthi wrote:
> Add device tree support for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> The series adds the board compatible and describes the BMC memory,
> SPI NOR flash layout, UART console, and MAC0 connected to an
> RTL8211F Ethernet PHY.
> 
> The MAC0 RGMII timing configuration was validated on B650D4U
> hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
> received no valid packets and accumulated RX CRC errors. With
> "rgmii-rxid", a 5000-packet test completed with 0% packet loss and
> no RX CRC errors. "rgmii-id" was also tested successfully, but the
> additional TX delay is not required, so "rgmii-rxid" is retained.

Please take a read of:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Does the PCB have 2ns of delay for TX, but notR RX?

     Andrew

