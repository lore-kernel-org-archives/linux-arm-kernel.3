Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A17C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaqP67BMNYN7LC3R6Za31vMQCwrdPvTZaPLg+kYHYg0=; b=CaBx6V/K1pvkRsdCdgLukopKbi
	gV1Gv15ZUnBaHDEnpheq00AhwzwQoMAMalIzUAtWd4+W6P71IBVrdAuB2MVjht5y0ZM5I503XCf2B
	F88YHmo1cnNUxD8JL1nM3Y/GpIZGPOzbBjFZkbEuVBLMgTsCBwnOjy/3RkeM2zXQ00BGFoJYR2eRH
	exXU4uLKtqmeWITiHFJ5DKRLWaNnklZuPIPxG55Wk4gjpHfp88P4yLmrbNL1P2yZ8pCqEItV1ZLk5
	4wx7tl+7SMC8a5dDgPXJWKJQpPHcCKHpREwVRWQB3ocPF9MUHJoOGI8/n/22oqYasE5rRa7xmN6NF
	cLFdvAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrPK-00000006oEg-3oks;
	Mon, 05 May 2025 08:42:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr9w-00000006mSx-0YAL;
	Mon, 05 May 2025 08:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CaqP67BMNYN7LC3R6Za31vMQCwrdPvTZaPLg+kYHYg0=; b=CDZVROZnK5s3N3ZD5m2+gPI0rb
	IpJO40oDZQTV2yVohzoCyzs/A8zlfHNuDX3F/virOmlQIWRaApvQOO8eZ0dr7SS59z9NCkKqKGB7l
	9RMGf1sLQ/aXCJZnoVQrqcJxPDrO01NzpTHEWSOPbGiL1w2eVJchzFyuWYlynNL32YC4cKdm+R9cO
	2BXFP2ZEmUrm2Jkqj9hLXN+mP3Hy8Z4iJUpCXxmAdLxZiX3lnN9trAGM3pnLFTlkRIdfkoCmUSlKH
	I/HYZZ9obtnBf6L9CzqrxgRYc4CFd0iCBaeKnCdtCrmQi7dBqd/srhcgIE0NKa7OXar84TI8OHLCL
	T/WnCB/w==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBr9g-0001Ho-Rb; Mon, 05 May 2025 10:26:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>
Subject: Re: [PATCH 0/2] Add phy+vcc supply to NanoPi R5S and Q64-B
Date: Mon,  5 May 2025 10:26:16 +0200
Message-ID: <174643357079.1204535.15682445178976713220.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503152917.138648-1-didi.debian@cknow.org>
References: <20250503152917.138648-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_012644_166750_43F90562 
X-CRM114-Status: GOOD (  10.18  )
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


On Sat, 03 May 2025 17:22:17 +0200, Diederik de Haas wrote:
> Testing on my NanoPi R5S and Quartz64 Model B brought some more issues
> with power supplies to light, so fix them as well.
> 
> Diederik de Haas (2):
>   arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
>   arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
      commit: fdc68be8a8acbea9630c3bca560b7a1cf3a952e2
[2/2] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b
      commit: ec79aee752c6b5c7695cd82a57a8a9249d09316d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

