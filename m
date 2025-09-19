Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF6ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 01:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHqNzBq4yeNhZ0HdWOZVEemDdiXukRj8SR6GX9nPKJU=; b=WCYi6yVbf0JCr7qaLvaVIXfTJD
	+qbuVOJXAM3Lt2YJW2ZXblYED1uL6nlcjOPEGUJSqXHOZvw7jTjk1/ZSflIRqZcYdX7E3laAum5CV
	o2mCaqspLubUjPx7qPrFgru0m5ulGMJjQhfDL3582HSALQhrq3PXihM5DAQsEegzsfvaIsg8bMSKr
	TkWyScl+Ez7s+V2oGe3cc17zEUwP25pPgUVy/vY4k0hB+mQXjJoS8e1DWoQan1wHjDmrH8vpYNUwO
	V6mDeXRZp4XXTc9+N3WvTrnW6wFyyOa38+WKd6V61CkxJAvYnwpxysiqBzajdqycGr87RciFzez1R
	LwNKTfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzQ6D-00000001cCy-1Fd7;
	Fri, 19 Sep 2025 01:39:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzQ6A-00000001cCb-0hCj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 01:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vHqNzBq4yeNhZ0HdWOZVEemDdiXukRj8SR6GX9nPKJU=; b=vLbyscUKRqRX26JCm76EeKpREM
	IjUcX2kfnSBg/N2JDRUTKr4bnjXdSlMLnBBaabwO73++LyvhvAw+dmiZhNlxpPGUIVGWbw8YITdhy
	zMt72x83bup2sW3J0Cm/BAXnyvOHWy6U2pe8OBgw6Y+o33H4Ky9g/hcYyFKgs435gFTs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzQ5w-008tPH-6h; Fri, 19 Sep 2025 03:39:28 +0200
Date: Fri, 19 Sep 2025 03:39:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
Message-ID: <ebf28e23-1ee1-456c-8cfd-ee5c02effeeb@lunn.ch>
References: <20250918-msx1_devicetree-v1-0-18dc07e02118@nvidia.com>
 <20250918-msx1_devicetree-v1-2-18dc07e02118@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-msx1_devicetree-v1-2-18dc07e02118@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_183942_208528_B1DCDFAB 
X-CRM114-Status: UNSURE (   8.63  )
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

> +// bootloader takes care of proper mac delays for now.
> +// phy-mode is here to prevent breakage once the aspeed
> +// mac driver is fixed.
> +&mac0 {
> +	phy-mode = "rgmii-id";

Just for my understanding, by "bootloader takes care of proper mac
delays for now" you mean you have a 'hacked' bootloader which no
longer adds delays, unlike the stock aspeed bootloader which does add
delays? Because otherwise, i don't see how rgmii-id will work.

> +	phy-handle = <&ethphy3>;
> +	max-speed = <1000>;

RGMII cannot do more than 1G, so max-speed is pointless.

	Andrew

