Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033FEC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2DxYtrFEQMjTZ9KR1ITVyVPbljGfrE2mQwTdKzGoro=; b=D0A3l2rxwo9ieNB2Tfjz+DAjge
	ZtC+yvNrBIa10VPjJIOZHksP+pMd80bG/5hPcYRjXPSH+GR0E9LwUth+PFwX5N87i58ezZZ8rHfFI
	LhN0u5gJLCwZ+vG+odwbXKqE89bFW0CP2NrE35mlFbgXcyjHEgtqsjb+zDH1K5L56UPvIi+OIUgs2
	4xjgSJZ58/pDZfxh4SWjLIGW9m8wbeXvp00xfnblnobDWlA+sp3qYNlzEjFdaOsq40CYv3vNK5l8N
	bVyo6r7KVCIWvHOYNIC+J6AdvbjsR73P1yyLOfRBXMMh9ux8spfwCydGMRknmUwKNVGG3bIc7ZMkP
	Z/u/uyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvG2-0000000A46j-2If3;
	Fri, 28 Feb 2025 07:58:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvES-0000000A3qR-1ScZ;
	Fri, 28 Feb 2025 07:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K2DxYtrFEQMjTZ9KR1ITVyVPbljGfrE2mQwTdKzGoro=; b=EGnzNvCvw4UH/TphnAmDwE9mzE
	rYAtRafiSW6oVrs59LUi471G87bZdrYb4cW/v2MDVDGBmMagF380jsXKhdZUwfQaAknECv02r333n
	Ok8sfAoNnboHLQL4BaBXXOb9bLfVVaSuUOoxS4Lc1DtFL5KZDLghJ4xbodw/u4NLvOMBojnjW3/e+
	r8HWDgfd7m6ijH/DPcFbJEd0UG278d7YMtTrVMJ7UouqnWurT9R1/tdku4vK1LRoYfAb0+YlvoLtN
	zuS7ayWojRliSu6AVwKncoQriZfMWxD+RYMtl9pvznFk9LJHyq/9ptYDLmkP52DcKD5TGynYAApmI
	+LGSylVw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnvEO-0007ax-AG; Fri, 28 Feb 2025 08:56:24 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Steven Liu <steven.liu@rock-chips.com>
Subject: Re: [PATCH 3/7] pinctrl: rockchip: Add support for RK3528
Date: Fri, 28 Feb 2025 08:56:23 +0100
Message-ID: <5140210.a9HWlOh95j@diego>
In-Reply-To: <20250228064024.3200000-4-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_235628_389021_C0CE0E36 
X-CRM114-Status: UNSURE (   9.81  )
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

Am Freitag, 28. Februar 2025, 07:40:09 MEZ schrieb Jonas Karlman:
> From: Steven Liu <steven.liu@rock-chips.com>
> 
> Add gpio and pinctrl support for the 5 GPIO banks on RK3528.
> 
> Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Thankfully the iomux settings follow pretty stanard ways on the rk3528,
so all looks good

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




