Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C436C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 21:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWDA3nMj2EHfkq6SD127AGQ72zRJ2OTCvKDtzxbe+AA=; b=gc0SO3K/sVCDnWrs4xO5lV2sup
	vyhQc+wzevAXekn5Bn1ifNV1e4kDstvOrFQcsusQhcNdNrxeb6/S/815llRsdhRYe4HVgcBtleyoy
	FfKNKx8gQH2+Rl17SZRyf4kHLm/i16/6rSUQ21l3p/e+ScwUWvRSun7vniLBFIFEdgOY0SkmnP5oN
	ThZn1fl5lndMP7YZ77xFv0lsJ5UJxUPR1Owr6ZXXn/oi3sK8JHtTPNF+lO5XcfoM0nEZGH77EZte+
	dCF/thunoywriS3RgNOUFp6oD1D5qAKA0UuLFnBCnuOBAnIXyUXedGrTKtjp7FU3vTKCHiWiUVG1t
	GeudE4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXTt-0000000G9F1-01mC;
	Thu, 16 Jan 2025 21:32:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXQE-0000000G8jR-33qr;
	Thu, 16 Jan 2025 21:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 446A15C5E6C;
	Thu, 16 Jan 2025 21:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972C1C4CED6;
	Thu, 16 Jan 2025 21:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062941;
	bh=LWDA3nMj2EHfkq6SD127AGQ72zRJ2OTCvKDtzxbe+AA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uBFBq0i4I3Olgey8oxTCEmpGq2OZpFuOaYkuDr9S3WnbYSihbJ34oVvWXtlK0kdaw
	 IRCrsQs6Gmc+1RfNW/9huNhW4Q+Ry5ycm+YAJtrfv9MBXO7EqIOx1/Y+VZlJLO90YA
	 aQbDsH1uxVMB9+cP2n5+gYCKv3zhix7f9IxZ3SX/9CdhKyfW/l2Tciptg3E0IahOdY
	 V1TIG45Bn/Q06XBYs88AvMo/Koq3mmkrZDEB1hzqzzex3IppxVKlCN1SbI/c2vmUXs
	 r+9ybwn1KdZd8wicGr5Z/qk0Ga7GI91kYv7qUvIbxHgaxgPQ7PT6B+AcUAYiliZKfR
	 NRmm1CELGMj0Q==
Message-ID: <d0914d3deb933860937fce48805536cc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 3/5] clk: bcm: rpi: Enable minimize for all firmware clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:28:59 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_132902_839093_05A3F923 
X-CRM114-Status: UNSURE (   5.92  )
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

Quoting Dave Stevenson (2025-01-16 08:24:10)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> There isn't a reason not to minimise the clocks, and it saves
> some power.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next

