Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A289CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6YDdtHPOQ0QM/ukuUizW2BlWatbxzkryEuSg2DMrkc=; b=17Ox//0lT7/dff6Oemz1xnY9jt
	6sOGiHfb11SB7Xxl6U2DBb8iLAtRp/VCzU7jRdbbF+Qww0eMjaD/8loFdDszRmkHE82INYWX6Q4dl
	bNn7RyqygugYBVxtS81v5L3ofk+qa8BbgQHyq4qUgFCJ/dDahj8YDqoaLrtipeGk5UM0X/rqoipHQ
	/BkyO8Gxs3fDWmfZZZOpEImmS4oZ5ZcQ/8mM0K4VpwmL6WRnyxWYcbyK3IimrApZiDCLZoaf2vFDj
	yb74lg8Hyztnr7gzCehB+RJC0bz2wJSB6wcVwavq4x6L/UOMgIfaD2OQYbyykyAgqbszMABuPPx3S
	315sXTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETVq-00000004IDy-0gYw;
	Thu, 30 Oct 2025 14:20:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETVp-00000004IDe-0VoW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47AF560459;
	Thu, 30 Oct 2025 14:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D34BC4CEF8;
	Thu, 30 Oct 2025 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761834024;
	bh=IOjpice0XflkTw5OxJ3W9Im5BDF5lTP8In6VcflTIf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bEUB7J2WpYpsh0vERTwfbwbWUiQlNCuKnYmYOW94MwWPcnEC2gm25g0hazsVJfY1A
	 CrWmn2SjFcQD2tPMWfqR7Je3bl51jgNL2JWcSFPbq/7+gFBTyp7nqulJT1X1dfLpiG
	 xoJW9sXlEHnruHHPMKOZVXtGYex35Ncz3UfAu+xHO/vTjj4fKFZZFl2MeT6X0o8Zdu
	 aQ5MdaAwetMGeGYYUyrEzJ5Gw2wWR5nswmXLStH03K2KlCWFDsaiUOSfnsyqGN0Bz/
	 iljIAyJnHzwEjv1axZspsRvI8fXgTRi7KECUYLBiin+/KnqdDo+K2WAckPvvueB+rK
	 IlD+XMxMk+Rvw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
References: <20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com>
Subject: Re: (subset) [PATCH v3 0/6] arm64: dts: freescale: add support for
 the GOcontroll Moduline IV/Mini
Message-Id: <176183402126.59922.4908449264520857093.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 14:20:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
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

On Thu, 30 Oct 2025 07:35:36 +0100, Maud Spierings wrote:
> Add initial support for the Moduline IV and Moduline Mini embedded
> controllers.
> 
> These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
> features an imx8mm SoC.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/6] regulator: bd718x7: Fix voltages scaled by resistor divider
      commit: 47a0925ee4bd2689f0aef4dbd67dd46442fe1ca2

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


