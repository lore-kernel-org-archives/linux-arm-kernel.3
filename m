Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E96AC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSYx9ZZUYMAPeym+Mt5kiHPv2+BGUb/x9Q5bfeD9cUE=; b=P/ZOO5kbqqeWoycL0qoO5idXHa
	pUtiN3JfFRxTTmkJAYL8L9Pep9diV4G6JGHOPtT2s9BiaLQvpOjnt22X/3SJlKXbCA07lWsr/wQV3
	auw+W/q3uqVeQxnEK8ekltdyoSaftIooeAgTLAKEFtA0Eak7w9hVjitihTqC6SAIo0R/CYUf07gD8
	tGQrHZIESk2eg/QDW0BBMubP04oDbt1C/94OBzoaV1DN0iGGo/n8L8wPwM4kBsl9u2CPIqWl4PCiW
	MpC+SW15ZVkHlMcLIGgMswR7Zz6wrfAD2aiTQu2D8Aatjj5uEFR5bANbc1HAHzgie6oL/2Jh1qEM/
	KhH160CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvYz-00000002ydg-1UJ0;
	Fri, 14 Aug 2026 17:19:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvYy-00000002ydQ-1pQj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:19:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C51C6400F8;
	Fri, 14 Aug 2026 17:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431451F000E9;
	Fri, 14 Aug 2026 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786727963;
	bh=KSYx9ZZUYMAPeym+Mt5kiHPv2+BGUb/x9Q5bfeD9cUE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=C2nLD+Hx0UoK86yumknAXU4BZ9ECT/oifGe3aNgkCw5FxuXt5MzhiXTQFwFOdmzU2
	 i5vC/0NOFw/d9ITN2r7p60FZR9XqDesqDdo3BLJHSIl1MJ/4gRq5Qnez7gdCyZQ538
	 2tpqv1up1ne9ohDfq8m9pXp5aNcIqptN3euzpvFhMxtVByd9OXvYLFItw6wCtUCyNB
	 RPb5jPZW549TDvGL+WoQ+IAUW2KMD5HxFKz0IrHQUK033ZhMWpdyD8dNHEWhApyc94
	 1Bjs78VZ410BVyVYp4Bo7Q+EPnLEBYq9OCb6SZXyZOE1YHqFfedgE0cTtfvdBUs794
	 VxFatYe9xc/Mw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260812-allwinner-a733-spi-support-v2-1-937bff0fa78e@baylibre.com>
References: <20260812-allwinner-a733-spi-support-v2-1-937bff0fa78e@baylibre.com>
Subject: Re: [PATCH v2] spi: dt-bindings: sun6i: Add compatibles for A733's
 SPI controllers
Message-Id: <178671194118.152149.7100117207191275264.b4-ty@b4>
Date: Fri, 14 Aug 2026 13:52:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bNQQkYakACPfetut/Hrnd5fReIktWvuG7g8ZN9UEy0E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqf04WV38MYa+TjkgnEVdm4OLNbjANLf1XeaHY/
 rqHkWpcIiKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan9OFgAKCRAk1otyXVSH
 0PrcCACBvJ+H1tmJSIBWPSR2CJHK34Rn8M3B6C3H5/a4oFZhJorHkNmXZMykTGbuMmcRajKySLz
 bcZ4z/yknUVJLJ1tsTSBBQuLMiyYZ/7Lkbz0hiBzYuKyNQtvVa5LOQd5ofI1Kxnyz0oW77E/Kr5
 Rsh/9gHCJfkYLCBvEgqf+IDR7OzJyNmzxk/NQmJiNUtxldO4C5E7bZO9AZSVg9uIgcLsRgZpugW
 4hLAtUVdByY6YichGEtt6vdGuVXPDDPsdYgkbRNaVTkYHwHWeUxSUD/8ly7+NkEEVsXM3mB1I43
 8w6+YzSRcYwvcyQkWtEOjhLFSe1KKTBs4b68a1SB+7y8oo4G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Wed, 12 Aug 2026 23:02:02 +0200, Jerome Brunet wrote:
> spi: dt-bindings: sun6i: Add compatibles for A733's SPI controllers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] spi: dt-bindings: sun6i: Add compatibles for A733's SPI controllers
      https://git.kernel.org/broonie/spi/c/122970a4a6f3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


