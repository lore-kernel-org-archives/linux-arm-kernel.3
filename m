Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89486CF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPvR/r68xJxempih5qCSwRPdfLnqKnHfpkIQfMN1UAQ=; b=bnzwMB7K8UQNUv/9hY2F4GLzgr
	ESPIIpbq96xutk01JvpZnPRKMo4yJS4/V6wt9x0SI7S2jEl2xpZ03TWLEDplwX7VzfFCslI2YyuQ1
	SkSCI5TctlJvaIZ7Prop+mGgEcJEksSdb5TWtANtEL83lj7RBNrtEVfXxuHBCqHgcwH8V7giW+LTE
	+Z/4Q5QUURKYXJdUE6wahe4jfKiHKqV7v5D9yKAQbED7jPdF2vA7rlZuZN4KjRCATT4Y6Ekc0LPHk
	B78leteP11S2e+uYb0pbwgkFyxkjBLX68lMheTbCTAP+5glbFRVJy/jLMd5dQEreGN2yaJ42/KmIV
	dfdxSzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8GL-0000000751n-0hRA;
	Thu, 20 Nov 2025 17:16:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8GK-0000000751Q-0Zma
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46F89601E3;
	Thu, 20 Nov 2025 17:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA93BC4CEF1;
	Thu, 20 Nov 2025 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658963;
	bh=qSfOFD+42f1IICxdofg+0sJjXxgykQIN2e/Hg34usak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb+5A4KuBIguT5VutFWGsjF3qZyiSAtQLddvB4rr4iqqRsqL4a9IA9pr/sxiHuCCQ
	 tbaW1XCpdnnbtFTkV0qDmRr5rClXW03bu76YEIvl56psKpKhy3YK4DSFxjFC8QpcPn
	 ZJ7Bwy5svKP/j1SYGAFd5I/U7xH4Ms9d6tlttZnq4bBjnqiaXiUPfqXwINV+5Sq60I
	 RmE/OBrlsAdAAHJyCLS3V7v3ZnEpw+j+eLEYC0+/Ep/4g2BX5fErXGos8AH4m5xd0V
	 OVYbgUH3CfkqtmnRLcYDZJgiMRCTM5RYRdJQWVR9axKBykIlQWor2ZTUYpAPmpr/NR
	 bqeeX3kEDl0uw==
Date: Thu, 20 Nov 2025 11:16:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Christian Eggers <ceggers@arri.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/4] dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard
 v1 and v2
Message-ID: <176365896117.1563647.15336573113314132301.robh@kernel.org>
References: <20251118121513.88352-1-marex@nabladev.com>
 <20251118121513.88352-3-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118121513.88352-3-marex@nabladev.com>
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


On Tue, 18 Nov 2025 13:13:12 +0100, Marek Vasut wrote:
> Document ifm i.MX8MN VHIP4 EvalBoard v1 and v2 reference design binding.
> This system exists in two generations, v1 and v2, which share a lot of
> commonality. The boards come with either single gigabit ethernet or an
> KSZ8794 fast-ethernet switch, boot from eMMC, and offer CAN interfaces
> via Microchip MCP25xx SPI CAN controllers, UART, and USB host. The GPU
> is not available in the SoC populated on these devices.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christian Eggers <ceggers@arri.de>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Markus Heidelberg <m.heidelberg@cab.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


