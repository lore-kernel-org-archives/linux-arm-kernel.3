Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF97FC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60oYgzAqshuD6yLOKdWI/2Zup0hrKz6aeKRaimHYHAU=; b=vSm0/N+bz5DUVOna1O855mPhR/
	1TVOwNxI5thg2WSZAlp78DfKcLHCGSb0rbmllijmxOLkUXq3kgKh0SE/2gSjk6LWJKqIoymLsDb74
	ukOf+2nyJ2uSvQx+IxdfQVMd4JBtLxRUa4NtTD2abtTkqhNpbm8XejDr6JggktyECV3gsiiIrHIdT
	vdh3zkZmWxvdkoNjmYgUyla7Ca/snIDBiXZYhf/QyBx4gLum3ynjcW+r3xyIPHAKa7XeAY+3vaa+y
	HQdk+Se24/XGZuzS16L+oaQUk7aiH0jNqKPBj6HILjWWHcCF+bdJ6syATaU33Ill/zLpJzDxR96J8
	FyzKsrvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHO4k-0000000DBUs-3Sq0;
	Tue, 20 May 2025 14:36:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNzA-0000000DANG-032t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=60oYgzAqshuD6yLOKdWI/2Zup0hrKz6aeKRaimHYHAU=; b=b1+f6y/qH2058NF2o/xrWpwO2L
	8MoTZG0nKc3MTgGQfRLBEdPRafkGWEK3ijxCQ9bcpbumoeiNLv86XQr9TWXw/ZqLfeeD6OQBg83P1
	CaOiweBnQ5dCVPAv5On3ryybfKlhWBMlvWfjvQ0OfkUjmAvZBizf7FXaqJj3BJ71oYsM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uHNz0-00D8Jc-Gt; Tue, 20 May 2025 16:30:18 +0200
Date: Tue, 20 May 2025 16:30:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [net 0/4] net: ftgmac100: Add SoC reset support for RMII mode
Message-ID: <cfb44996-ad63-43cd-bbc5-07f70939d019@lunn.ch>
References: <20250520092848.531070-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520092848.531070-1-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_073028_045552_AA52EE16 
X-CRM114-Status: GOOD (  11.25  )
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

On Tue, May 20, 2025 at 05:28:44PM +0800, Jacky Chou wrote:
> This patch series adds support for an optional reset line to the
> ftgmac100 ethernet controller, as used on Aspeed SoCs. On these SoCs,
> the internal MAC reset is not sufficient to reset the RMII interface.
> By providing a SoC-level reset via the device tree "resets" property,
> the driver can properly reset both the MAC and RMII logic, ensuring
> correct operation in RMII mode.

What tree is this for? You have net in the subject, but no Fixes:
tags?

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

	Andrew

