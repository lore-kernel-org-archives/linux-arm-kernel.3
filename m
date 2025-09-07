Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF47CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ji25TAJ+CkOc4BFFBfmuUes4Dhw2qf2txXdK9T+i+4w=; b=cA+hCJsfClPUCKrOO0NBzvaWZD
	4g9rzKGaxOox9OQVHA3M0x1xR5vS8IvBSSTNFZ8nkFG7F/B94K1iSnLpnwmfLXLpSF0kwYYhJ8fO/
	ikyNvGlmZMnvEDcD5dw7RuM36qMABerD1mNAyQrcYh1RX9OA0G+YmE62XN6LYWKuxX/h5XizFzIBp
	RaPgKIXJ5BByaX6gwFcHACNC83Xpidi2dJ/BKZ55ibc9Qau2zaW4CbYIEDIKgYpBv6jT/qSH2m/ai
	5KmjoB6dRMrLTmePTZlzOztf3PDxqVJFxd0YcsATOEAel2fcii5ID5TohcSkzDPInwFQilOHRz0K8
	Z5Fb2wkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBUX-0000000AMih-1sFW;
	Sun, 07 Sep 2025 09:15:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBRo-0000000AM1R-2DVM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 09:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D8CB601F6;
	Sun,  7 Sep 2025 09:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A54C4CEF0;
	Sun,  7 Sep 2025 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757236351;
	bh=mfGSVCyqkFfhc9bRNihF8aTujKJxsawJCfMEkmaqVJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojIDPb2ZIBmvtvGTbN/hags6A2eFZ9ypaCQhQMLtpHLmRaCAi3qwER218gM4IPmFp
	 hLNGCO4Rm2RssSlPwjK1FhWljoCBDUOi90NAHaWi+0Dri7pC14nq8zrl4gIypuQXUM
	 FPOZS4vWGNM3+7/lhrBneaiamVQgi45WVJB38N40S9Nsg6tHPkwWs94ICXxpLTpvpA
	 lsKtiqJH7BKTjpnoiAXjABHMLiiGTWUgnk3iUPn5Ca3LBTYQ2meIzbrC5AeL8NCGfQ
	 VF7Vgf69FbZd7pUXUgS2UhaOHMjcADb4A6/l4VisQoscCZxUb+l/7ZgtnVp6OEd4qJ
	 koheN36AO2oAg==
Date: Sun, 7 Sep 2025 11:12:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/4] clk: samsung: exynos990: Add PERIC0 and PERIC1
 clock support
Message-ID: <20250907-provocative-roaring-butterfly-cfaccf@kuoka>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
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

On Thu, Sep 04, 2025 at 02:07:13PM +0000, Denzeel Oliva wrote:
> Add clock controller support for Peripheral Connectivity 0 and 1 blocks.
> These provide clocks for USI, I2C and UART peripherals.
> 
> Some clocks need to be marked as critical to prevent system hang when
> disabled.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos990.c | 1152 +++++++++++++++++++++++++++++++++++
>  1 file changed, 1152 insertions(+)
> 

CHECK: Alignment should match open parenthesis


Best regards,
Krzysztof


