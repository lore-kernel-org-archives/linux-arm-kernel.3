Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24136CD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN5cF9FfUHPKvDb8aV6drtJueLYpFhksDGO4gMde+Uc=; b=hpCBoCLintbbzKSPZ/ktO/uHwN
	42G7mzn1Sq+9ZV+9R177LQk2YWfT2DPcPf1Xv60bmof3vhAnWOOBRPJlJXYuxljMwEkpcLb/aqWse
	WJFzGX5smxnnSjVnFuu8HonFNNDDvCcxHoQGxH8PqvwojMAfZDn/ZpNVdZ4DJGHNz03iN4ks5dTQh
	XdrXqszRl3iWkErVS6BIezSr8amP2AAjR3MUDEAntHsFahs+hTW3o0DweHu/AM/pFZd6WKdUxLhGl
	aetH2qFk1BngYvgRG6lbTG25rAYtpqWLq4jmEzeMmFmxlsibByE2ev3TZYTg9fie1Ak2rABUfKxPu
	xvNllQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgNY-0000000BEZ4-25pM;
	Thu, 13 Nov 2025 23:05:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgND-0000000BENC-11cE;
	Thu, 13 Nov 2025 23:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WN5cF9FfUHPKvDb8aV6drtJueLYpFhksDGO4gMde+Uc=; b=T03wEzNrLEfPYBTydTmxBT+3P2
	UrC5GS8r6y98DardAmaDWydby/FX8iRJU9G0urYgq14asy6W4Qq2mXBl2cSSXnZcvse7KAZ5NCtfE
	41UB4H11HVrOznrrGZ3xPkBuhruw7KX5miSCQna/3zhe5Jc3izKqtVap5ci/peKnbGE+j7lceih9Z
	HeHf9Xkj26QuSRWzTtps0hj/iv5lyJ5LTGNiNGq72kOrbxtErQBW7nzsqChFW+SFLX9w74oJFiBbU
	yAKrO65D/h4hIGm4bxEe9w4lUEBN3qCOAKJ19ChqTsL5gClgoBd5zXphwb24ZGYeczJYcSn80nh+i
	p8IcRZrA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfVB-00000001Ioh-3NgP;
	Thu, 13 Nov 2025 22:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WN5cF9FfUHPKvDb8aV6drtJueLYpFhksDGO4gMde+Uc=; b=1QDDyPT4hXRtyvX1ewgI9vGiQ0
	3fpccFN30IKPBDbxXF7d41Vko4ckEk3nsRCCwqUWxlztX3/GEmehr3JXeOZQ2Z6UOC5pp5fXGXp+Y
	Fm9YRF7k5UdVszkbm4bkMWv2x7mdRjBfFzWSZwF88RJELSMMRUt81FHMKbpvxWIpjQDLEo3uqDRh/
	B3nSOjsogUwR2geA+COF8uEjmLTwQ/qjQ0mnXDMeoPWZN3nQxjE6kxwPVSv1CAYS0R2AT4xjb0Bxk
	WQ0KOPMqE78N/YNnIM46KqnMAUMxd2nbZpSVio3LPNF5yrt+dQadV8iuvhy96gji+2FMtPLhq7yRy
	zC1rm73Q==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJgMj-0005bo-Kv; Fri, 14 Nov 2025 00:04:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: drop reset from rk3576 i2c9 node
Date: Fri, 14 Nov 2025 00:04:20 +0100
Message-ID: <176307502905.495066.14409715879346224898.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251101140101.302229-1-amadeus@jmu.edu.cn>
References: <20251101140101.302229-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_220922_329953_E776FE24 
X-CRM114-Status: UNSURE (   9.92  )
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


On Sat, 01 Nov 2025 22:01:01 +0800, Chukun Pan wrote:
> The reset property is not part of the binding, so drop it.
> It is also not used by the driver, so it was likely copied
> from some vendor-kernel node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: drop reset from rk3576 i2c9 node
      commit: 264152a97edf9f1b7ed5372e4033e46108e41422

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

