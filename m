Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6DDCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ay/pqQVPXIWWJwlc0dUtX0HqvnadfJAa4MdZo4NoSxQ=; b=RkpcRM5r7GGPMY49lWagPKZDyR
	B/is8ptvUaGSp8H5U1ho86w1D6gfrJgAP9cR5dEDqGuk8Yn8193XQadMXuNcltbLOw1uEpeCqlana
	LUNlVkT3vJSJLOmOdtSuXvZ6T5nb1PyctvWKaXD70DQpzlE1vTh/sS00T2pybvact2/oSPXFX/equ
	Ky70ZFD1YtONq+zkzFNf2riSrDRL5+En9RkRqgSNVNZmNsEdNw12FXYvknGkdNsJiaxFMJcLV9N5G
	Y7HwZPPpeB7LRHbPAFXSNnuOzsPrxjf8MMlew0mdUM3M0bumPO7yG/dtikPyL4/7wI6CoWz4CxYVl
	gpzCvS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhn8-00000009iqj-3ygl;
	Thu, 11 Jun 2026 15:58:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhn6-00000009iqF-2xEU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 15:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ay/pqQVPXIWWJwlc0dUtX0HqvnadfJAa4MdZo4NoSxQ=; b=JRkhRdRdI0wAxV9i/GI3MUsimw
	F3Cg3voANNES7YJ1k6gON4AJlMtNR4Ds8s0nIiMWucrk1D7jy8YmKMLCgbboRMhr2NcIsxDQZCBz5
	oTSqbzoUYWapEF0r+AozWSd7i5OLQKpQ6ICokxgULZ8LCwi/5eadBTiBVYxg6vuY5GaQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wXhmv-007BRy-7p; Thu, 11 Jun 2026 17:57:49 +0200
Date: Thu, 11 Jun 2026 17:57:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
 <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_085800_764685_A039474E 
X-CRM114-Status: UNSURE (   7.91  )
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

> +	/* Marvell 88E6393X EEPROM */
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +	};

How is this on both a host I2C bus, and the switches I2C bus? Are you
using multi-master? Is there a GPIO to hold the switch in reset while
the host access the EEPROM?

      Andrew

