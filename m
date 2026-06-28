Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdaTmsRuUwlAr3UAk7TqOg1bWsvPp5lljQQumQI6/0A=; b=BCcS3tux6w/iMHayA7AUUEtwbF
	WdmV4ap3rclTWTmuQ5N9g4YwJ6KDPFIpOgSPhyGWxLatFii4B2F0p+6UWvwfOp3b6G4G2bfxe578K
	obvcY4ewzfWV2y3JV78jzgcrfOfow0xIJUZ0vpXWroZc2EmePK8xb93Rx30ZvRjAg180AHGWaJxX1
	LBpZ3ZeuVjTf8y0ZePT1jvwojHwBQIAkI2HCkQLisI4aQl1vCuqWqH2bbejimUenS6s9ybolNCc5u
	mYs8j5qoZqcVavm0GE/4OvKcD2Z3ZOgsxB9dcSy+XAWzlT5xI2cA97YIHfyaN2nVHTL/R6Ymtc4WW
	4a6+ouMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduwi-0000000DJBy-1ddg;
	Sun, 28 Jun 2026 19:13:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduwf-0000000DJB6-3uBL;
	Sun, 28 Jun 2026 19:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZdaTmsRuUwlAr3UAk7TqOg1bWsvPp5lljQQumQI6/0A=; b=o8vyMWwPbG74igvWIsnM00asfz
	WD+MMBbFUyATcL8lGW3uE5VnB9CrP4qqkDPyFvXL1wdi3v08JifaWOEMCEN5VVLKSEgY+hCGloJqs
	8Of91hPQFGhzBqbgqOJZ38mepZ9Av9D7Pz3C0zN8jbqsRqeUDf4FgVSvIfmL9OrB3tMWWocPfi/zO
	1ezD960yhDJ7Nx3sBiejGpEDVA3QVpU60rWUzzx32X/Rm5QuTznbfS8RMfJfTdqs26AB2cBpEV5b6
	M528rX6lP1tRWSVhjIR0voiJ8He81MuzzZWgcnZk1p9+JOnhxY+Gz85JyGV7vD+k5BIjzyZTuBdU5
	vAObhV7w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	stable@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: fix emmc reset polarity on px30-cobra
Date: Sun, 28 Jun 2026 21:13:25 +0200
Message-ID: <178267399837.3089434.7647542691250454782.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609081728.30616-2-jakobunt@gmail.com>
References: <20260609081728.30616-2-jakobunt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_121334_069058_80417CE4 
X-CRM114-Status: GOOD (  10.38  )
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


On Tue, 09 Jun 2026 10:17:25 +0200, Jakob Unterwurzacher wrote:
> Technically, the reset signal is active low - it's called RST_n after all.
> 
> But it is ignored completely unless RST_n_FUNCTION=1 (byte 162 in extcsd)
> is set in the emmc. It is 0 per default.
> 
> For emmcs that have RST_n_FUNCTION=1 we failed like this:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix emmc reset polarity on px30-cobra
      commit: 85babf47515e2adf266dcc3be9804e31f752083e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

